<?php
class ModelSaleTicket extends Model {
	
	public function editTicket($id, $data) {

		$this->db->query("INSERT INTO " . DB_PREFIX . "order_ticket_comment SET order_ticket_id = '" . $id . "', status = '" . $data['status'] . "', comment = '" . $data['comment'] . "', added_by = '".$this->user->getId()."', date_added = NOW()");
		$this->db->query("UPDATE ".DB_PREFIX."order_ticket set status = '" . $data['status'] . "', updated_by = '".$this->user->getId()."', updated_at = NOW() WHERE id = '" . $id . "'");
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

	public function getTicketDetailsForOrder($order_id) {
		$query = $this->db->query("select * from ".DB_PREFIX."order_ticket WHERE order_id = '" . (int)$order_id . "' ");
		$ticketDetails = $query->rows;
		$ticketComments = array();
		$adminUsers = array();
		$allData = array();
		if($ticketDetails){
			foreach ($ticketDetails as $key => $value) {
				$ticketComments = $this->db->query("select * from ".DB_PREFIX."order_ticket_comment WHERE order_ticket_id = '" . (int)$value['id'] . "' ")->rows;
				$allData[] = array("ticketDetails" => $value, "ticketComments" => $ticketComments);
			}
			
		}
		
		return $allData;
	}

	public function getTickets($data = array()) {
		$sql = "select *, oc.status cstatus, oc.created_at ccreated_at, oc.id cid from ".DB_PREFIX."order_ticket oc inner join oc_order o on oc.order_id = o.order_id WHERE oc.id > 0 ";

		if (!empty($data['status'])) {
			$sql .= " AND oc.status = '" . $this->db->escape($data['status']) . "'";
		} else {
			$sql .= " AND oc.status != 3";
		}

		if (!empty($data['issue_type'])) {
			$sql .= " AND oc.issue_type='" . $this->db->escape($data['issue_type']) . "'";
		}

		if($this->user->getGroupId() == 14){
			$sql .= " AND oc.created_by = '".$this->user->getId()."' ";
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
			$sql .= " ORDER BY oc.id DESC";
		} else {
			$sql .= " ORDER BY oc.id ASC";
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

		$data = $query->rows;

		$allTicketIds = [];
		foreach ($data as $a) {
			$allTicketIds[] = $a['cid'];
		}

		$sql = "SELECT * FROM " . DB_PREFIX . "order_ticket_comment WHERE order_ticket_id IN (".implode(",", $allTicketIds).") ";
		$comments = $this->db->query($sql)->rows;
		$allComments = [];
		foreach ($comments as $key => $value) {
			$allComments[$value["order_ticket_id"]][] = $value;
		}

		$finalData = [];
		foreach ($data as $a) {
			$a['comments'] = $allComments[$a['cid']];
			$finalData[] = $a;
		}

		return	$finalData;
		
	}


	public function getTotalTickets($data = array()) 
	{
		$sql = "SELECT COUNT(DISTINCT id) AS total FROM " . DB_PREFIX . "order_ticket oc inner join oc_order o on oc.order_id = o.order_id ";
		

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

	public function addOrderTicket($order_id, $issue_type, $issue_detail){
		$this->db->query("INSERT INTO `" . DB_PREFIX . "order_ticket` SET order_id = '" . $order_id . "', issue_type = '".$issue_type."', issue_detail = '".$issue_detail."', status=1, created_by = '".$this->user->getId()."', created_at=NOW()");
	}

	public function allTicketTypes(){
		return array('Product Not Available', 'Delay in Delivery', 'Broken in transit', 'Change in Design', 'Partial Delivery', 'Address wrong/ Incomplete', 'Image not received', 'Unable to contact Recipient', 'Recipient not available');
	}

	public function allTicketStatuses(){
		return array('1' => 'Open', '2' => 'In Progress', '3' => 'Close');
	}
}
