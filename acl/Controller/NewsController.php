<?php
App::uses('AppController', 'Controller');
App::uses('News', 'Model');
class NewsController extends AppController {
    public $layout = 'news';
    public $uses = array('News');
    public $components = array();
  
    public function index() {
       // var_dump(get_class_methods($this->Content));exit;
        $data = $this->News->getData();
        print_r($data);
    }

}
