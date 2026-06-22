<?php
class ModelSaleFollowup extends Model {
	
	public function editFollowup($id, $data) {

		$this->db->query("INSERT INTO " . DB_PREFIX . "followup_comment SET comment = '" . $data['comment'] . "', status = '" . $data['status'] . "', oc_followup_id = '" . $id . "', added_by = '".$this->user->getId()."', date_added = NOW()");
		$this->db->query("UPDATE ".DB_PREFIX."followup set status = '" . $data['status'] . "' WHERE id = '" . $id . "'");
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
		$sql = "select * from ".DB_PREFIX."followup ";
		
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
			$sql .= " WHERE status NOT IN ('2','5','7', '8', '10', '11', '12', '13', '14', '15', '16', '20')";
		}

		if($this->user->getGroupId() && ($this->user->getGroupId() == 18 || $this->user->getGroupId() == 19)){
			$sql .= " AND type = 'customize' AND (assigned_to = 0 OR assigned_to is null OR assigned_to = '".$this->user->getId()."') ";
		}

		if($this->user->getGroupId() && ($this->user->getGroupId() == 17 || $this->user->getGroupId() == 20)){
			$sql .= " AND type = 'followup' AND (assigned_to = 0 OR assigned_to is null OR assigned_to = '".$this->user->getId()."') ";
		}

		if($this->user->getGroupId() && ($this->user->getGroupId() == 21)){
			$sql .= " AND (assigned_to = 0 OR assigned_to is null assigned_to = '".$this->user->getId()."') ";
		}

		$sql .= "  AND TIMESTAMPDIFF(MINUTE, date_added, now()) > 5 ";
		
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

	public function getProductsFromSession($session_id){
		$query = $this->db->query("select pd.name, c.shipping_info from oc_cart c inner join oc_product p on c.product_id = p.product_id inner join oc_product_description pd on p.product_id = pd.product_id where c.session_id = '".$session_id."' and p.product_addon_status = 0");
		$products = $query->rows;
		$pro = '';
		foreach ($products as $product) {
			$shipInfo = json_decode($product['shipping_info']);
			$pro .= $product['name'].'<br>'.date('d F Y', strtotime($shipInfo->{'Shipping Date'})).'<br><br>';
		}
		return $pro;
	}


	public function getTotalFollowups($data = array()) 
	{
		$sql = "SELECT COUNT(DISTINCT id) AS total FROM " . DB_PREFIX . "followup ";
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
			$sql .= " WHERE status NOT IN ('2','5','7', '8', '10', '11', '12', '13', '14', '15', '16', '20')";
		}

		if($this->user->getGroupId() && ($this->user->getGroupId() == 18 || $this->user->getGroupId() == 19)){
			$sql .= " AND type = 'customize' AND (assigned_to = 0 OR assigned_to is null OR assigned_to = '".$this->user->getId()."') ";
		}

		if($this->user->getGroupId() && ($this->user->getGroupId() == 17 || $this->user->getGroupId() == 20)){
			$sql .= " AND type = 'followup' AND (assigned_to = 0 OR assigned_to is null OR assigned_to = '".$this->user->getId()."') ";
		}

		if($this->user->getGroupId() && ($this->user->getGroupId() == 21)){
			$sql .= " AND (assigned_to = 0 OR assigned_to is null OR assigned_to = '".$this->user->getId()."') ";
		}

		$sql .= "  AND TIMESTAMPDIFF(MINUTE, date_added, now()) > 5 ";
		
		$query = $this->db->query($sql);
		return $query->row['total'];
	}

	public function csvdata($data){
		//$sql = "SELECT *, f.id mainid, f.date_added fdate_added, fc.date_added cdate_added, f.status fstatus, fc.added_by caddedby FROM oc_followup f LEFT JOIN oc_followup_comment fc on f.id = fc.oc_followup_id where f.status NOT IN ('2','5','7') order by fc.id asc";
		$date = date('Y-m-d',strtotime('-15 days'));
		$sql = "SELECT *, f.id mainid, f.date_added fdate_added, fc.date_added cdate_added, f.status fstatus, fc.added_by caddedby FROM oc_followup f LEFT JOIN oc_followup_comment fc on f.id = fc.oc_followup_id where f.id > 0 ";

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(f.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(f.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$sql .= " ORDER BY fc.id asc";

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
		$this->db->query("UPDATE ".DB_PREFIX."followup set assigned_to = '" . $this->user->getId() . "' WHERE id = '" . $id . "'");
	}

	public function getNotificationCount(){
		$sql = "SELECT count(1) cnt from oc_followup WHERE (assigned_to = 0  OR assigned_to is null) AND type = 'followup' AND date(date_added) > '2023-07-09' AND status NOT IN ('2','5','7', '8', '10', '11', '12', '13', '14', '15', '16', '20')";
		$query = $this->db->query($sql)->row;

		$sql1 = "SELECT count(1) cnt from oc_order WHERE (assigned_to = 0  OR assigned_to is null) AND order_status_id = 0 AND date(date_added) > '2023-07-09' AND pnc_status NOT IN ('2','5','7', '8', '10', '11', '12', '13', '14', '15', '16', '20')";
		$query1 = $this->db->query($sql1)->row;

		$sql2 = "SELECT count(1) cnt from oc_followup WHERE (assigned_to = 0  OR assigned_to is null) AND type = 'customize' AND date(date_added) > '2023-07-09' AND status NOT IN ('2','5','7', '8', '10', '11', '12', '13', '14', '15', '16', '20')";
		$query2 = $this->db->query($sql2)->row;
		return array('followup' => $query['cnt'], 'pnc' => $query1['cnt'], 'customize' => $query1['customize']);
	}
}
