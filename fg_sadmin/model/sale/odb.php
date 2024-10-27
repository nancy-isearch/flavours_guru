<?php
class ModelSaleOdb extends Model {
	
	public function editOdb($id, $data) {

		$this->db->query("INSERT INTO " . DB_PREFIX . "odb_comment SET comment = '" . $data['comment'] . "', status = '" . $data['status'] . "', odb_id = '" . $id . "', added_by = '".$this->user->getId()."', date_added = NOW()");
		$this->db->query("UPDATE ".DB_PREFIX."odb set status = '" . $data['status'] . "' WHERE id = '" . $id . "'");
		return true;
	}

	public function getOdb($id) {
		$query = $this->db->query("SELECT oc.*, od.status odstatus, od.id oid, od.created_by odcreated_by FROM oc_order oc left join oc_odb od ON oc.order_id = od.order_id WHERE od.id = '" . (int)$id . "' ");
		return $query->row;
	}

	public function getOdbComments($id) {
		$query = $this->db->query("select * from ".DB_PREFIX."odb_comment WHERE odb_id = '" . (int)$id . "' ");
		return $query->rows;
	}

	public function getOrdersForOdb(){
		$sql = "SELECT oc.*, od.status odstatus, od.id oid FROM oc_order oc left join oc_odb od ON oc.order_id = od.order_id WHERE oc.date_forshipping BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND  DATE_SUB(CURDATE(), INTERVAL 1 YEAR) + INTERVAL 3 DAY ";

		$tmp = false;
		if (!empty($data['customer_name'])) {
			$sql .= " AND oc.payment_firstname LIKE '%" . $this->db->escape($data['customer_name']) . "%'";
			$tmp = true;
		}

		if (!empty($data['customer_email'])) {
			$sql .= " AND oc.payment_email LIKE '%" . $this->db->escape($data['customer_email']) . "%'";
			$tmp = true;
		}

		if (!empty($data['customer_phone'])) {
			$sql .= " AND oc.payment_mobile LIKE '%" . $this->db->escape($data['customer_phone']) . "%'";
			$tmp = true;
		}
		if($tmp){
			if (!empty($data['status'])) {
				$sql .= " AND od.status = '" . $this->db->escape($data['status']) . "'";
			}	
		} else {
			if (!empty($data['status'])) {
				$sql .= " AND od.status = '" . $this->db->escape($data['status']) . "'";
			} else {
				$sql .= " AND (od.id is null OR od.status NOT IN ('2','5','7', '8', '10', '11', '12', '13', '14', '15', '16', '20'))";
			}
		}

		if($this->user->getGroupId() && ($this->user->getGroupId() == 16 || $this->user->getGroupId() == 19 || $this->user->getGroupId() == 20)){
			$sql .= " AND (created_by = 0 OR created_by = '".$this->user->getId()."') ";
		}

		//$sql .= " GROUP BY id";
		
		$sort_data = array(
			'name',
			'state',
			'country',
			'pincode',
			'status'
		);

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " ORDER BY oc.order_id DESC";
		} else {
			$sql .= " ORDER BY oc.order_id ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);
		return	$query->rows;
	}

	public function getTotalOdb($data = array()) 
	{
		$sql = "SELECT COUNT(DISTINCT oc.order_id) AS total FROM oc_order oc left join oc_odb od ON oc.order_id = od.order_id WHERE oc.date_forshipping BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND  DATE_SUB(CURDATE(), INTERVAL 1 YEAR) + INTERVAL 3 DAY ";
		
		$tmp = false;
		if (!empty($data['customer_name'])) {
			$sql .= " AND oc.payment_firstname LIKE '%" . $this->db->escape($data['customer_name']) . "%'";
			$tmp = true;
		}

		if (!empty($data['customer_email'])) {
			$sql .= " AND oc.payment_email LIKE '%" . $this->db->escape($data['customer_email']) . "%'";
			$tmp = true;
		}

		if (!empty($data['customer_phone'])) {
			$sql .= " AND oc.payment_mobile LIKE '%" . $this->db->escape($data['customer_phone']) . "%'";
			$tmp = true;
		}
		if($tmp){
			if (!empty($data['status'])) {
				$sql .= " AND od.status = '" . $this->db->escape($data['status']) . "'";
			}	
		} else {
			if (!empty($data['status'])) {
				$sql .= " AND od.status = '" . $this->db->escape($data['status']) . "'";
			} else {
				$sql .= " AND (od.id is null OR od.status NOT IN ('2','5','7', '8', '10', '11', '12', '13', '14', '15', '16', '20'))";
			}
		}

		if($this->user->getGroupId() && ($this->user->getGroupId() == 16 || $this->user->getGroupId() == 19 || $this->user->getGroupId() == 20)){
			$sql .= " AND (od.created_by = 0 OR od.created_by = '".$this->user->getId()."') ";
		}
		//echo $sql; die();
		$query = $this->db->query($sql);
		return $query->row['total'];
	}

	public function csvdata($data){
		$date = date('Y-m-d',strtotime('-15 days'));
		$sql = "SELECT *, f.order_id mainid, f.date_added fdate_added, fc.date_added cdate_added, f.pnc_status fstatus, fc.added_by caddedby FROM oc_order f LEFT JOIN oc_pnc_comment fc on f.order_id = fc.order_id where f.order_status_id = 0 ";

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(f.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(f.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$sql .= " ORDER BY fc.id asc";
		//echo $sql; die();
		$query = $this->db->query($sql);
		$rows = $query->rows;
		$data = array();
		foreach ($rows as $key => $value) {
			$data[$value['mainid']] = $value; 
		}
		return $data;
	}

	public function adminusers(){
		$sql = "SELECT * FROM oc_user";
		$query = $this->db->query($sql);
		$rows = $query->rows;
		$data = array();
		foreach ($rows as $row) {
			$data[$row['user_id']] = $row['username'];
		}
		return $data;
	}

	public function selfAssign($id){
		$this->db->query("INSERT INTO " . DB_PREFIX . "odb SET status = 1, order_id = '" . $id . "', created_by = '".$this->user->getId()."', created_at = NOW()");
		return true;
	}
}
