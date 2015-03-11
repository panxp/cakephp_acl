<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
App::uses('AppModel', 'Model');
App::uses('AuthComponent', 'Controller/Component');

class User extends AppModel {

// other code.
    public $belongsTo = array('Group');
    // public $actsAs = array('Acl' => array('type' => 'requester'));
    public $actsAs = array('Acl' => array('type' => 'requester', 'enabled' => false));

    public function beforeSave($options = array()) {
        $this->data['User']['password'] = AuthComponent::password(
                        $this->data['User']['password']
        );
        return true;
    }

    public function parentNode() {
        if (!$this->id && empty($this->data)) {
            return null;
        }
        if (isset($this->data['User']['group_id'])) {
            $groupId = $this->data['User']['group_id'];
        } else {
            $groupId = $this->field('group_id');
        }
        if (!$groupId) {
            return null;
        } else {
            return array('Group' => array('id' => $groupId));
        }
    }

    public function bindNode($user) {
        return array('model' => 'Group', 'foreign_key' => $user['User']['group_id']);
    }

}

?>
