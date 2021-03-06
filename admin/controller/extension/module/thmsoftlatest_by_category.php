<?php
class ControllerExtensionModuleThmsoftlatestbycategory  extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/thmsoftlatest_by_category');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		$this->load->model('extension/module');
		$this->load->model('catalog/category');
		$this->load->model('extension/module/thmsoftlatest_by_category');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('thmsoftlatest_by_category', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}
			
			$this->cache->delete('product');

			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_category_name1'] = $this->language->get('entry_category_name1');
		$data['entry_category_name2'] = $this->language->get('entry_category_name2');
		$data['entry_category_name3'] = $this->language->get('entry_category_name3');
		$data['entry_category_name4'] = $this->language->get('entry_category_name4');
		//$data['entry_category_name5'] = $this->language->get('entry_category_name5');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		
		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}
		
		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/thmsoftlatest_by_category', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/thmsoftlatest_by_category', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);			
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/thmsoftlatest_by_category', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/thmsoftlatest_by_category', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}
		
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
						
		if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$data['limit'] = $module_info['limit'];
		} else {
			$data['limit'] = 5;
		}	

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = 200;
		}	
			
		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = 200;
		}		
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

	    if (isset($this->request->post['category_name1'])) {
			$data['category_name1'] = $this->request->post['category_name1'];
		} elseif (!empty($module_info)) {
			$data['category_name1'] = $module_info['category_name1'];
		} else {
			$data['category_name1'] = $this->model_extension_module_thmsoftlatest_by_category->getthmsoftlatestActiveCategories(array());
		}

		if (isset($this->request->post['category_name2'])) {
			$data['category_name2'] = $this->request->post['category_name2'];
		} elseif (!empty($module_info)) {
			$data['category_name2'] = $module_info['category_name2'];
		} else {
			$data['category_name2'] = $this->model_extension_module_thmsoftlatest_by_category->getthmsoftlatestActiveCategories(array());
		}

		if (isset($this->request->post['category_name3'])) {
			$data['category_name3'] = $this->request->post['category_name3'];
		} elseif (!empty($module_info)) {
			$data['category_name3'] = $module_info['category_name3'];
		} else {
			$data['category_name3'] = $this->model_extension_module_thmsoftlatest_by_category->getthmsoftlatestActiveCategories(array());
		}

		if (isset($this->request->post['category_name4'])) {
			$data['category_name4'] = $this->request->post['category_name4'];
		} elseif (!empty($module_info)) {
			$data['category_name4'] = $module_info['category_name4'];
		} else {
			$data['category_name4'] = $this->model_extension_module_thmsoftlatest_by_category->getthmsoftlatestActiveCategories(array());
		}

		// if (isset($this->request->post['category_name5'])) {
		// 	$data['category_name5'] = $this->request->post['category_name5'];
		// } elseif (!empty($module_info)) {
		// 	$data['category_name5'] = $module_info['category_name5'];
		// } else {
		// 	$data['category_name5'] = $this->model_module_thmsoftlatest_by_category->getthmsoftlatestActiveCategories(array());
		// }		

		if (isset($this->request->post['thmsoftlatest_by_category_module'])) {
			$data['modules'] = $this->request->post['thmsoftlatest_by_category_module'];
		} elseif ($this->config->get('thmsoftlatest_by_category_module')) { 
			$data['modules'] = $this->config->get('thmsoftlatest_by_category_module');
		}				
				
		$this->load->model('design/layout');
		
		//$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->load->model('catalog/category');
		$this->load->model('extension/module/thmsoftlatest_by_category');
		
		$data['categories'] = array();
		$data['categories'] = $this->model_extension_module_thmsoftlatest_by_category->getthmsoftlatestActiveCategories(array());
		




		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('extension/module/thmsoftlatest_by_category', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/thmsoftlatest_by_category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		if (!$this->request->post['width']) {
			$this->error['width'] = $this->language->get('error_width');
		}
		
		if (!$this->request->post['height']) {
			$this->error['height'] = $this->language->get('error_height');
		}

		return !$this->error;
	}
}
?>