<?php
App::uses('AppController', 'Controller');
class PostsController extends AppController {
    public function beforeFilter() {
        parent::beforeFilter();
    }
    public function add() {
        if ($this->request->is('post')) {
            //Added this line
            $this->request->data['Post']['user_id'] = $this->Auth->user('id');
            if ($this->Post->save($this->request->data)) {
                $this->Session->setFlash(__('Your post has been saved.'));
                return $this->redirect(array('action' => 'index'));
            }
        }
        exit;
    }
    public function index(){
        
    }
    function mana(){
        echo __LINE__;exit;
    }
    public function isAuthorized($user) {
        echo __LINE__;exit;
        // All registered users can add posts
        if ($this->action === 'add') {
            return true;
        }

        // The owner of a post can edit and delete it
        if (in_array($this->action, array('edit', 'delete'))) {
            $postId = (int) $this->request->params['pass'][0];
            if ($this->Post->isOwnedBy($postId, $user['id'])) {
                return true;
            }
        }

        return parent::isAuthorized($user);
    }
    public function edit(){
        
    }

}
