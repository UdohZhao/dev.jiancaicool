<?php
namespace apps\home\ctrl;
use apps\home\model\goodsCategory;
use apps\home\model\goods;
use apps\home\model\goodsCover;
use apps\home\model\publicity;
use apps\home\model\indentGoods;
class mainCtrl extends baseCtrl{
  public $type;
  public $pid;
  public $gcdb;
  public $gdb;
  public $gcodb;
  public $gcid;
  public $pdb;
  public $igdb;
  // 构造方法
  public function _auto(){
    $this->type = isset($_GET['type']) ? intval($_GET['type']) : 0;
    $this->pid = isset($_GET['pid']) ? intval($_GET['pid']) : 0;
    $this->gcid = isset($_GET['gcid']) ? intval($_GET['gcid']) : 0;
    $this->gcdb = new goodsCategory();
    $this->gdb = new goods();
    $this->gcodb = new goodsCover();
    $this->pdb = new publicity();
    $this->igdb = new indentGoods();
  }

  // 请求数据
  public function getData(){
    // Get
    if (IS_GET === true) {
      // 请求商品分类数据
      $data['gcData'] = $this->gcdb->getAll($this->type,$this->pid);
      $gcAll = array();
      $gcAll['id'] = 0;
      $gcAll['icon_path'] = '/dist/images/icon/gc-all.png';
      $gcAll['cname'] = '全部';
      $gcAll['sort'] = 0;
      $gcAll['type'] = 0;
      array_unshift($data['gcData'], $gcAll);
      // 请求全部商品数据
      $data['gData'] = $this->gdb->getAll($this->type);
      if ($data['gData']) {
        $data['gCount'] = count($data['gData']);
        foreach ($data['gData'] AS $k => $v) {
          // 请求相关商品封面图片
          $data['gData'][$k]['img_path'] = $this->gcodb->getCover($v['id']);
          // 请求相关商品销量
          $data['gData'][$k]['igData']['count'] = $this->igdb->getgCorrelation($v['id']);
        }
        // 请求banner
        $data['banner'] = $this->pdb->getBanner();
      } else {
        $data['gData'] = false;
      }
      ###
      echo J(R(200,'受影响的操作 :)',$data));
      die;
    }

  }

  // 请求普通商品数据
  public function getCorrelation(){
    // Get
    if (IS_GET === true) {
      $data = array();
      // gcid 为 0 表示请求全部商品
      if ($this->gcid == 0) {
        $data['gData'] = $this->gdb->getAll($this->type);
      } else {
        $data['gData'] = $this->gdb->getCorrelation($this->gcid);
      }
      if ($data['gData']) {
        $data['gCount'] = count($data['gData']);
        // 请求相关商品封面图片
        foreach ($data['gData'] AS $k => $v) {
          $data['gData'][$k]['img_path'] = $this->gcodb->getCover($v['id']);
          // 请求相关商品销量
          $data['gData'][$k]['igData']['count'] = $this->igdb->getgCorrelation($v['id']);
        }
      } else {
        $data['gData'] = false;
      }
      // 返回请求结果集
      echo J(R(200,'',$data));
      die;
    }

  }

  /**
   * 请求是否有下级
   */
  public function getPidCount(){
    // Get
    if (IS_GET === true) {
      $data = $this->gcdb->getPidCount($this->gcid);
      echo J(R(200,'',$data));
      die;
    }
  }



}