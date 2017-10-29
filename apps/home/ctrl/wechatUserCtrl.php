<?php
namespace apps\home\ctrl;
use apps\home\model\wechatUser;
use apps\home\model\discountCoupon;
class wechatUserCtrl extends baseCtrl{
  public $db;
  public $dcdb;
  // 构造方法
  public function _auto(){
    $this->db = new wechatUser();
    $this->dcdb = new discountCoupon();
  }

  /**
   * 添加微信新用户
   */
  public function add(){
    // Post
    if (IS_POST === true) {
      // openid
      $openid = isset($_POST['openid']) ? $_POST['openid'] : '';
      if ($openid) {
        $res = $this->db->getcRow($openid);
        if (!$res) {
          $res = $this->db->add(array('openid'=>$openid));
          if ($res) {
            // 优惠券
            $dcData = $this->dcdb->getRow();
            echo J(R(0,'受影响的操作 :)',$dcData));
            die;
          } else {
            echo J(R(1,'请尝试刷新页面后重试 :(',false));
            die;
          }
        } else {
            echo J(R(3,'老用户 :(',false));
            die;
        }
      } else {
        echo J(R(2,'无法获取身份标识 :(',false));
        die;
      }
    }
  }

}