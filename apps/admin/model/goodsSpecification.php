<?php
namespace apps\admin\model;
use core\lib\model;
class goodsSpecification extends model{
  public $table = 'goods_specification';
  /**
   * 写入数据表
   */
  public function add($gid,$cname,$type){
    $this->insert($this->table,array('gid'=>$gid,'cname'=>$cname,'type'=>$type));
    return $this->id();
  }

  /**
   * 读取相关数据
   */
  public function getCorrelation($gid,$type){
    return $this->select($this->table,'*',['gid'=>$gid,'type'=>$type]);
  }

  /**
   * 删除数据
   */
  public function del($id){
    $res = $this->delete($this->table,['id'=>$id]);
    return $res->rowCount();
  }

  /**
   * 删除相关数据
   */
  public function delCorrelation($gid,$type){
    $res = $this->delete($this->table,['gid'=>$gid,'type'=>$type]);
    return $res->rowCount();
  }

  /**
   * 删除相关数据
   */
  public function delCAll($gid){
    $res = $this->delete($this->table,['gid'=>$gid]);
    return $res->rowCount();
  }

}