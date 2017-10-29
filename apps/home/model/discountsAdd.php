<?php
namespace apps\home\model;
use core\lib\model;
class discountsAdd extends model{
  public $table = 'discounts_add';

  /**
   * 读取单条记录
   */
  public function getRow($openid){
    return $this->get($this->table,'*',['openid'=>$openid]);
  }

  /**
   * 写入数据
   */
  public function add($data){
    $this->insert($this->table,$data);
    return $this->id();
  }

  /**
   * 更新数据
   */
  public function save($openid,$data){
    $res = $this->update($this->table,$data,['openid'=>$openid]);
    return $res->rowCount();
  }

  /**
   * 读取优惠额度
   */
  public function getCoupon($openid){
    return $this->get($this->table,'money_coupon',['openid'=>$openid]);
  }


}

