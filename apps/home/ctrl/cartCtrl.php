<?php
namespace apps\home\ctrl;
use apps\home\model\cart;
use apps\home\model\goods;
use apps\home\model\goodsCover;
use apps\home\model\discountsAdd;
class cartCtrl extends baseCtrl{
  public $db;
  public $gdb;
  public $gcodb;
  public $dadb;
  public $openid;
  public $id;
  // 构造方法
  public function _auto(){
    $this->db = new cart();
    $this->gdb = new goods();
    $this->gcodb = new goodsCover();
    $this->dadb = new discountsAdd();
    $this->openid = isset($_GET['openid']) ? $_GET['openid'] : '';
    $this->id = isset($_GET['id']) ? intval($_GET['id']) : 0;
  }

  // 添加商品到购物车
  public function add(){
    // Post
    if (IS_POST === true) {
      // data
      $data = $this->getData();
      // 防止重复添加
      $id = $this->db->getId($data['openid'],$data['specification'],$_POST['gid']);
      if ($id) {
        echo J(R(401,'请勿重复添加 :('));
        die;
      }
      // 写入数据表
      $res = $this->db->add($data);
      if ($res) {
        echo J(R(200,'是否立即前往购物车结算？ :)',array('cid'=>$res)));
        die;
      } else {
        echo J(R(400,'请尝试关闭小程序后重新进入 :(',false));
        die;
      }
    }
  }

  // 初始化数据
  private function getData(){
    $data = array();
    $data['gid'] = $_POST['gid'];
    $data['openid'] = $_POST['openid'];
    $data['specification'] = $_POST['specification'];
    $data['gmodel'] = $_POST['gmodel'];
    $data['quantity'] = $_POST['quantity'];
    $data['isdelivery'] = $_POST['isdelivery'];
    $data['isinstallation'] = $_POST['isinstallation'];
    $data['total_money'] = 0;
    $data['ctime'] = time();
    return $data;
  }

  // 购物车列表数据
  public function index(){
    // Get
    if (IS_GET === true) {
      // 读取购物车数据
      $data['cData'] = $this->db->getAll($this->openid);
      if (!$data) {
        echo J(R(400,'',false));
        die;
      }
      // 读取商品数据
      foreach ($data['cData'] AS $k => $v) {
        $data['cData'][$k]['gData'] = $this->gdb->getInfo($v['gid']);
        // 是否送货／安装？
        if ($data['cData'][$k]['isdelivery'] == 1) {
          $data['cData'][$k]['gData']['promotion_price'] = bcadd($data['cData'][$k]['gData']['promotion_price'], $data['cData'][$k]['gData']['delivery_expense'], 2);
        }
        if ($data['cData'][$k]['isinstallation'] == 1) {
          $data['cData'][$k]['gData']['promotion_price'] = bcadd($data['cData'][$k]['gData']['promotion_price'], $data['cData'][$k]['gData']['installation_expense'], 2);
        }
        $data['cData'][$k]['gData']['img_path'] = $this->gcodb->getCover($v['gid']);
        $data['cData'][$k]['selected'] = true;
      }
      // 读取用户优惠额度
      $data['coupon'] = $this->dadb->getCoupon($this->openid);

      echo J(R(200,'',$data));
      die;

    }
  }

  // 删除
  public function del(){
    // Get
    if (IS_GET === true) {
      $res = $this->db->del($this->openid,$this->id);
      if ($res) {
        echo J(R(200,'受影响的操作 :)'));
        die;
      } else {
        echo J(R(400,'请尝试关闭小程序后重新进入 :)'));
        die;
      }
    }
  }

}