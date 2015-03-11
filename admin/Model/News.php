<?php

App::uses('AppModel', 'Model');

class News extends AppModel {
    public $primaryKey = 'id';
    public $name = 'News';
    function getData() {
        return $this->find('first');
    }

}

