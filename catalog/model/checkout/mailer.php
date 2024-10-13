<?php
class ModelCheckoutMailer extends Model {
	public function getInfoDescription($id){
		return $this->db->query("SELECT * FROM `" . DB_PREFIX . "information_description` WHERE language_id = 1 AND information_id = '" . (int)$id . "'")->row;
	}

	public function getAllPncOrder(){
		$allOrders = $this->db->query("SELECT * from oc_order where order_status_id = 0 AND pnc_email = 0 AND is_admin_order = 0 AND date_added < NOW() - INTERVAL 10 MINUTE AND date(date_added) >= '2022-05-27'")->rows;
		$data = array();
		foreach ($allOrders as $alorder) {
			$this->db->query("UPDATE oc_order SET pnc_email = 1 WHERE order_id = '".$alorder['order_id']."'");
			$alorder['products'] = $this->db->query("SELECT *, op.quantity qun from oc_order_product op inner join oc_product p on op.product_id = p.product_id where op.order_id = '".$alorder['order_id']."'")->rows;
			$total = $this->db->query("SELECT * from oc_order_total where order_id = '".$alorder['order_id']."'")->rows;
			foreach ($total as $key => $value) {
				$alorder['totalData'][$value['code']] = $value['value'];
			}
			$data[] = $alorder;
		}
		return $data;
	}

	public function getAllFollowup(){
		$allOrders = $this->db->query("select f.id, f.order_total total, f.customer_email email, f.session_id, f.customer_name, c.quantity, pd.name, p.price, p.image from oc_followup f inner join oc_cart c on f.session_id = c.session_id inner join oc_product p on c.product_id = p.product_id inner join oc_product_description pd on p.product_id = pd.product_id where f.status = 1 and f.reminder_mail = 0 AND date(f.date_added) >= '2022-05-27'")->rows;
		$data = array();
		foreach ($allOrders as $allOrder) {
			$allOrder['price'] = round($allOrder['price']);
			$data[$allOrder['id']][] = $allOrder;
		}

		foreach ($data as $key => $value) {
			$this->db->query("UPDATE oc_followup SET reminder_mail = 1 WHERE id = '".$key."'");
		}
		return $data;
	}
}
?>