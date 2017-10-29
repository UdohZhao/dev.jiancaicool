<?php
namespace apps\home\model;
use core\lib\model;
class wechatUser extends model{
  public $table = 'wechat_user';

  /**
   *  统计单条记录
   */
  public function getcRow($openid){
    return $this->count($this->table,['openid'=>$openid]);
  }

  /**
   * 写入数据表
   */
  public function add($data){
    $this->insert($this->table,$data);
    return $this->id();
  }


}

