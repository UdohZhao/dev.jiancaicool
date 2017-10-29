<?php
namespace apps\home\ctrl;
use apps\home\model\discountsAdd;
class discountsAddCtrl extends baseCtrl{
  public $db;
  public $openid;
  // 构造方法
  public function _auto(){
    $this->db = new discountsAdd();
    $this->openid = isset($_POST['openid']) ? $_POST['openid'] : '';
  }

  /**
   * 累加优惠券额度
   */
  public function add(){
    // data
    $data = $this->getData();
    // 读取单条记录
    $res = $this->db->getRow($this->openid);
    if ($res) {
      // 更新数据
      $data['money_coupon'] = bcadd($res['money_coupon'], $data['money_coupon'], 2);
      $res = $this->db->save($this->openid,$data);
    } else {
      // 写入数据
      $res = $this->db->add($data);
    }
    // if
    if ($res) {
      echo J(R(0,'受影响的操作 :)',true));
      die;
    } else {
      echo J(R(1,'领取优惠券失败 :(',false));
      die;
    }

  }

  /**
   * 初始化数据
   */
  private function getData(){
    $data['money_coupon'] = isset($_POST['price']) ? $_POST['price'] : 0;
    $data['openid'] = $this->openid;
    return $data;
  }

  /**
   * 累计额度
   */
  public function getCoupon(){
    // Post
    if (IS_POST === true) {
      $data = $this->db->getCoupon($this->openid);
      if (!$data) {
        $data = '0.00';
      }
      echo J(R(0,'受影响的操作 :)',$data));
      die;
    }
  }


}