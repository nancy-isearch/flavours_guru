<?php
class ModelSalePnc extends Model {
	
	public function editPnc($id, $data) {

		$this->db->query("INSERT INTO " . DB_PREFIX . "pnc_comment SET comment = '" . $data['comment'] . "', status = '" . $data['status'] . "', order_id = '" . $id . "', added_by = '".$this->user->getId()."', date_added = NOW()");
		$this->db->query("UPDATE ".DB_PREFIX."order set pnc_status = '" . $data['status'] . "' WHERE order_id = '" . $id . "'");
		return true;
	}

	public function getPnc($id) {
		$query = $this->db->query("select * from ".DB_PREFIX."order WHERE order_id = '" . (int)$id . "' ");
		return $query->row;
	}

	public function getPncComments($id) {
		$query = $this->db->query("select * from ".DB_PREFIX."pnc_comment WHERE order_id = '" . (int)$id . "' ");
		return $query->rows;
	}

	public function getPncs($data = array()) {
		
		$sql = "select * from ".DB_PREFIX."order WHERE order_id > 0 AND order_status_id = 0 AND date(date_added) > '2022-04-12'";
		$tmp = false;
		if (!empty($data['customer_name'])) {
			$sql .= " AND payment_firstname LIKE '%" . $this->db->escape($data['customer_name']) . "%'";
			$tmp = true;
		}

		if (!empty($data['customer_email'])) {
			$sql .= " AND payment_email LIKE '%" . $this->db->escape($data['customer_email']) . "%'";
			$tmp = true;
		}

		if (!empty($data['customer_phone'])) {
			$sql .= " AND payment_mobile LIKE '%" . $this->db->escape($data['customer_phone']) . "%'";
			$tmp = true;
		}
		if($tmp){
			if (!empty($data['status'])) {
				$sql .= " AND pnc_status = '" . $this->db->escape($data['status']) . "'";
			}	
		} else {
			if (!empty($data['status'])) {
				$sql .= " AND pnc_status = '" . $this->db->escape($data['status']) . "'";
			} else {
				$sql .= " AND pnc_status NOT IN ('2','5','7', '8', '10', '11', '12', '13', '14', '15', '16', '20')";
			}
		}

		if($this->user->getGroupId() && ($this->user->getGroupId() == 16 || $this->user->getGroupId() == 19 || $this->user->getGroupId() == 20)){
			$sql .= " AND (assigned_to = 0 OR assigned_to = '".$this->user->getId()."') ";
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
			$sql .= " ORDER BY order_id DESC";
		} else {
			$sql .= " ORDER BY order_id ASC";
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
		//echo $sql; die();
		$query = $this->db->query($sql);
		return	$query->rows;
		
	}


	public function getTotalPnc($data = array()) 
	{
		$sql = "SELECT COUNT(DISTINCT order_id) AS total FROM " . DB_PREFIX . "order WHERE order_id > 0 AND order_status_id = 0 AND date(date_added) > '2022-04-12' ";
		
		$tmp = false;
		if (!empty($data['customer_name'])) {
			$sql .= " AND payment_firstname LIKE '%" . $this->db->escape($data['customer_name']) . "%'";
			$tmp = true;
		}

		if (!empty($data['customer_email'])) {
			$sql .= " AND payment_email LIKE '%" . $this->db->escape($data['customer_email']) . "%'";
			$tmp = true;
		}

		if (!empty($data['customer_phone'])) {
			$sql .= " AND payment_mobile LIKE '%" . $this->db->escape($data['customer_phone']) . "%'";
			$tmp = true;
		}
		if($tmp){
			if (!empty($data['status'])) {
				$sql .= " AND pnc_status = '" . $this->db->escape($data['status']) . "'";
			}	
		} else {
			if (!empty($data['status'])) {
				$sql .= " AND pnc_status = '" . $this->db->escape($data['status']) . "'";
			} else {
				$sql .= " AND pnc_status NOT IN ('2','5','7', '8', '10', '11', '12', '13', '14', '15', '16', '20')";
			}
		}

		if($this->user->getGroupId() && ($this->user->getGroupId() == 16 || $this->user->getGroupId() == 19 || $this->user->getGroupId() == 20)){
			$sql .= " AND (assigned_to = 0 OR assigned_to = '".$this->user->getId()."') ";
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
		$this->db->query("UPDATE ".DB_PREFIX."order set assigned_to = '" . $this->user->getId() . "' WHERE order_id = '" . $id . "'");
	}
}
