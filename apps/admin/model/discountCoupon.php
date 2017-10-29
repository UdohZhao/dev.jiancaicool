<?php
namespace apps\admin\model;
use core\lib\model;
class discountCoupon extends model{
  public $table = 'discount_coupon';
  /**
   * 写入数据表
   */
  public function add($data){
    $this->insert($this->table,$data);
    return $this->id();
  }

  /**
   * 读取全部数据
   */
  public function getAll(){
    // sql
    $sql = "
        SELECT
                *
        FROM
                `$this->table`
        ORDER BY
                sort ASC
    ";
    return $this->query($sql)->fetchAll();
  }

  /**
   * 删除数据
   */
  public function del($id){
    $res = $this->delete($this->table,['id'=>$id]);
    return $res->rowCount();
  }

  /**
   * 读取单条记录
   */
  public function getRow(){
    return $this->get($this->table,'*');
  }

  /**
   * 更新数据
   */
  public function save($id,$data){
    $res = $this->update($this->table,$data,['id'=>$id]);
    return $res->rowCount();
  }

}