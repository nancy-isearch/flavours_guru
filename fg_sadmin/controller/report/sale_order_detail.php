<?php
class ControllerReportSaleOrderDetail extends Controller {
	public function index() {
		$this->load->language('report/sale_order');

		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->get['filter_date_start'])) {
			$filter_date_start = $this->request->get['filter_date_start'];
		} else {
			$filter_date_start = date('Y-m-d', strtotime("- 1 day"));
		}

		if (isset($this->request->get['filter_date_end'])) {
			$filter_date_end = $this->request->get['filter_date_end'];
		} else {
			$filter_date_end = date('Y-m-d', strtotime("+ 1 day"));
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Order Detail',
			'href' => $this->url->link('report/sale_order_detail', 'token=' . $this->session->data['token'] . $url, true)
		);

		$this->load->model('report/sale');

		$data['orders'] = array();

		$filter_data = array(
			'filter_date_start'	     => $filter_date_start,
			'filter_date_end'	     => $filter_date_end,
			'start'                  => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                  => $this->config->get('config_limit_admin')
		);

		$order_total = $this->model_report_sale->getTotalOrdersDetail($filter_data);

		$results = $this->model_report_sale->getOrdersDetail($filter_data);

		foreach ($results as $result) {
			$data['orders'][] = array(
				'name' => $result['name'],
				'sku' => $result['sku'],
				'quantity' => $result['quantity'],
				'price' => $this->currency->format($result['price'], $this->config->get('config_currency')),
				'tax' => $this->currency->format($result['tax'], $this->config->get('config_currency')),
				'afterGst' => $this->currency->format($result['afterGst'], $this->config->get('config_currency')),
				'total' => $this->currency->format($result['total'], $this->config->get('config_currency')),
				'pp' => $this->currency->format($result['pp'], $this->config->get('config_currency')),
				'pp_total' => $this->currency->format($result['pp_total'], $this->config->get('config_currency')),
				'status' => $result['status'],
				'vendor' => $result['vendor'],
				'date' => $result['date'],
				'time' => $result['time'],
				'ddate' => $result['ddate'],
				'dtype' => $result['dtype'],
				'shipping_postcode' => $result['shipping_postcode'],
				'dcity' => $result['dcity'],
				'payment_method' => $result['payment_method'],
				'dtime' => $result['dtime'],
				'cname' => $result['firstname'].' '.$result['lastname'],
				'telephone' => $result['telephone'],
				'timeadded' => $result['timeadded'],
				'dateadded' => $result['dateadded'],
				'order_id' => $result['order_id'],
				'added_by' => $result['added_by'],
				'is_admin_order' => $result['is_admin_order'],
				'transaction_id' => $result['transaction_id'],
				'boy' => $result['boy'],
				'processing' => $result['processing']
			);
		}

		$data['heading_title'] = 'Order Detail';

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_all_status'] = $this->language->get('text_all_status');

		$data['column_date_start'] = $this->language->get('column_date_start');
		$data['column_date_end'] = $this->language->get('column_date_end');
		$data['column_orders'] = $this->language->get('column_orders');
		$data['column_products'] = $this->language->get('column_products');
		$data['column_tax'] = $this->language->get('column_tax');
		$data['column_total'] = $this->language->get('column_total');

		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_group'] = $this->language->get('entry_group');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];

		$url = '';

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}

		$pagination = new Pagination();
		$pagination->total = $order_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('report/sale_order_detail', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($order_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($order_total - $this->config->get('config_limit_admin'))) ? $order_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $order_total, ceil($order_total / $this->config->get('config_limit_admin')));

		$data['filter_date_start'] = $filter_date_start;
		$data['filter_date_end'] = $filter_date_end;
		$data['filter_group'] = $filter_group;
		$data['filter_order_status_id'] = $filter_order_status_id;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('report/sale_order_detail', $data));
	}

	public function downloadcsv(){
		$filter_data = $this->request->post;
		$this->load->model('report/sale');
		$results = $this->model_report_sale->getOrdersDetail($filter_data);
		$orders = array();
		foreach ($results as $result) {
			$orders[] = array(
				'dateadded' => $result['dateadded'],
				'timeadded' => $result['timeadded'],
				'order_id' => $result['order_id'],
				'cname' => $result['firstname'].' '.$result['lastname'],
				'telephone' => $result['telephone'],
				'ddate' => $result['ddate'],
				'dtime' => $result['dtime'],
				'dtype' => $result['dtype'],
				'shipping_postcode' => $result['shipping_postcode'],
				'dcity' => $result['dcity'],
				'payment_method' => $result['payment_method'],
				'transaction_id' => $result['transaction_id'],
				'name' => $result['name'],
				'weight' => $result['weight'],
				'sku' => $result['sku'],
				'quantity' => $result['quantity'],
				'price' => $result['price'],
				'tax' => $result['tax'],
				'unit_discount' => $result['unit_discount'],
				'afterGst' => $result['afterGst'],
				'total' => round($result['total']),
				'overall_discount' => $result['overall_discount'],
				'pp' => $result['pp'],
				'pp_total' => !empty($result['pp_total']) ? $result['pp_total'] : '',
				'status' => $result['status'],
				'vendor' => $result['vendor'],
				'delivered' => $result['delivered'],
				'date' => $result['date'],
				'time' => $result['time'],
				'is_admin_order' => ($result['is_admin_order'] == 1) ? 'Yes' : 'No',
				'added_by' => $result['added_by'],
				'boy' => $result['boy'],
				'processing' => $result['processing'],
			);
		}

		header('Content-Type: text/csv; charset=utf-8');
		header('Content-Disposition: attachment; filename=order_details_'.date("d-m-Y").'.csv');
		$output = fopen('php://output', 'w');
		fputcsv($output, array('Date Added', 'Time Added', 'Order No.', 'Customer Name', 'Contact Number', 'Delivery Date', 'Timeslot', 'Shipping Type', 'Delivery Pin', 'Delivery City', 'Payment Mode', 'Transaction ID', 'Product Name', 'Product Weight', 'SKU', 'Quantity', 'Unit Price', 'GST', 'Product Unit Discount', 'Total Amount After GST', 'Total Order Amount', 'Overall Discount', 'PP', 'Order Total PP', 'Status', 'Vendor', 'Delivered?', 'Delivered Date', 'Delivered Time', 'Added by Backend?', 'Added By', 'Delivery Boy', 'Processed By'));
		if (count($orders) > 0) {
		    foreach ($orders as $al) {
		        fputcsv($output, $al);
		    }
		}
	}


	public function downloaddeliveredordercsv(){
		$filter_data = $this->request->post;
		$this->load->model('report/sale');
		$results = $this->model_report_sale->getOrdersDetailDelivered($filter_data);
		$orders = array();
		foreach ($results as $result) {
			$orders[] = array(
				'dateadded' => $result['dateadded'],
				'timeadded' => $result['timeadded'],
				'order_id' => $result['order_id'],
				'cname' => $result['firstname'].' '.$result['lastname'],
				'telephone' => $result['telephone'],
				'ddate' => $result['ddate'],
				'dtime' => $result['dtime'],
				'dtype' => $result['dtype'],
				'shipping_postcode' => $result['shipping_postcode'],
				'dcity' => $result['dcity'],
				'payment_method' => $result['payment_method'],
				'transaction_id' => $result['transaction_id'],
				'name' => $result['name'],
				'weight' => $result['weight'],
				'sku' => $result['sku'],
				'quantity' => $result['quantity'],
				'price' => $result['price'],
				'tax' => $result['tax'],
				'overall_discount' => $result['overall_discount'],
				'total' => round($result['total']),
				'pp' => $result['pp'],
				'status' => $result['status'],
				'vendor' => $result['vendor'],
				'date' => $result['date'],
				'time' => $result['time'],
				'is_admin_order' => ($result['is_admin_order'] == 1) ? 'Yes' : 'No',
				'added_by' => $result['added_by'],
				'boy' => $result['boy'],
				'processing' => $result['processing'],
				'delivered_at' => date('d/m/Y H:s', strtotime($result['delivered_at'])),
			);
		}

		header('Content-Type: text/csv; charset=utf-8');
		header('Content-Disposition: attachment; filename=order_details_'.date("d-m-Y").'.csv');
		$output = fopen('php://output', 'w');
		fputcsv($output, array('Date Added', 'Time Added', 'Order No.', 'Customer Name', 'Contact Number', 'Delivery Date', 'Timeslot', 'Shipping Type', 'Delivery Pin', 'Delivery City', 'Payment Mode', 'Transaction ID', 'Product Name', 'Weight', 'SKU', 'Quantity', 'Unit Price', 'GST', 'Overall Discount', 'Total Order Amount', 'PP', 'Status', 'Vendor', 'Delivered Date', 'Delivered Time', 'Added by Backend?', 'Added By', 'Delivery Boy', 'Delivered By', 'Delivered At'));
		if (count($orders) > 0) {
		    foreach ($orders as $al) {
		        fputcsv($output, $al);
		    }
		}
	}
}