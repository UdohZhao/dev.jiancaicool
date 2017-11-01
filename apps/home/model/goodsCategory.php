<?php
namespace apps\home\model;
use core\lib\model;
class goodsCategory extends model{
  public $table = 'goods_category';
  /**
   * 读取全部数据
   */
  public function getAll($type,$pid){
    // sql
    $sql = "
        SELECT
                *
        FROM
                `$this->table`
        WHERE
                1 = 1
        AND
                type = '$type'
        AND
                pid = '$pid'
        ORDER BY
                sort ASC
    ";
    return $this->query($sql)->fetchAll();
  }

  /**
   * 统计pid数据
   */
  public function getPidCount($gcid)
  {
    return $this->count($this->table,['pid'=>$gcid]);
  }

}

