<?php
class ModelSaleComplaint extends Model {
	
	public function editComplaint($id, $data) {

		$this->db->query("INSERT INTO " . DB_PREFIX . "order_complaint_history SET complaint_id = '" . $id . "', status = '" . $data['status'] . "', created_by = '".$this->user->getId()."', created_at = NOW()");
		$this->db->query("UPDATE ".DB_PREFIX."order_complaint set status = '" . $data['status'] . "', fault = '" . $data['fault'] . "', resolution = '" . $data['resolution'] . "' WHERE id = '" . $id . "'");
		return true;
	}

	public function getFollowup($id) {
		$query = $this->db->query("select * from ".DB_PREFIX."followup WHERE id = '" . (int)$id . "' ");
		return $query->row;
	}

	public function getFollowupComments($id) {
		$query = $this->db->query("select * from ".DB_PREFIX."followup_comment WHERE oc_followup_id = '" . (int)$id . "' ");
		return $query->rows;
	}

	public function getFollowups($data = array()) {
		$sql = "select *, oc.status cstatus, oc.created_at ccreated_at, oc.id cid from ".DB_PREFIX."order_complaint oc inner join oc_order o on oc.order_id = o.order_id";
		
		if (!empty($data['customer_name'])) {
			$sql .= " WHERE customer_name LIKE '%" . $this->db->escape($data['customer_name']) . "%'";
		}

		if (!empty($data['customer_email'])) {
			$sql .= " WHERE customer_email LIKE '%" . $this->db->escape($data['customer_email']) . "%'";
		}

		if (!empty($data['customer_phone'])) {
			$sql .= " WHERE customer_phone LIKE '%" . $this->db->escape($data['customer_phone']) . "%'";
		}

		if (!empty($data['status'])) {
			$sql .= " WHERE status LIKE '%" . $this->db->escape($data['status']) . "%'";
		} else {
			$sql .= " WHERE oc.status != 3";
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
			$sql .= " ORDER BY id DESC";
		} else {
			$sql .= " ORDER BY id ASC";
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


	public function getTotalFollowups($data = array()) 
	{
		$sql = "SELECT COUNT(DISTINCT id) AS total FROM " . DB_PREFIX . "order_complaint oc inner join oc_order o on oc.order_id = o.order_id ";
		if (!empty($data['filter_name'])) 
		{
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
		if (!empty($data['customer_name'])) {
			$sql .= " WHERE customer_name LIKE '%" . $this->db->escape($data['customer_name']) . "%'";
		}

		if (!empty($data['customer_email'])) {
			$sql .= " WHERE customer_email LIKE '%" . $this->db->escape($data['customer_email']) . "%'";
		}

		if (!empty($data['customer_phone'])) {
			$sql .= " WHERE customer_phone LIKE '%" . $this->db->escape($data['customer_phone']) . "%'";
		}

		if (!empty($data['status'])) {
			$sql .= " WHERE status LIKE '%" . $this->db->escape($data['status']) . "%'";
		} else {
			$sql .= " WHERE status != 3";
		}
		
		$query = $this->db->query($sql);
		return $query->row['total'];
	}

	public function csvdata($data){
		//$sql = "SELECT *, f.id mainid, f.date_added fdate_added, fc.date_added cdate_added, f.status fstatus, fc.added_by caddedby FROM oc_followup f LEFT JOIN oc_followup_comment fc on f.id = fc.oc_followup_id where f.status NOT IN ('2','5','7') order by fc.id asc";
		$date = date('Y-m-d',strtotime('-15 days'));
		$sql = "select *, oc.status cstatus, oc.created_at ccreated_at, oc.id cid, oc.id mainid from ".DB_PREFIX."order_complaint oc inner join oc_order o on oc.order_id = o.order_id where oc.id > 0 ";

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(oc.created_at) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(oc.created_at) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$sql .= " ORDER BY oc.id asc";

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
}
