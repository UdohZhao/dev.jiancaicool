-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: 112.74.46.113:3306
-- Generation Time: 2017-10-04 03:00:45
-- 服务器版本： 5.7.17
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jnpet`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '后台用户表主键id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `ctime` int(10) UNSIGNED NOT NULL COMMENT '时间',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态？0>正常，1>冻结',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '类型？0>超级管理员，普通管理员'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin_user`
--

INSERT INTO `admin_user` (`id`, `username`, `password`, `ctime`, `status`, `type`) VALUES
(1, '济南壹家堂宠物', 'aef484683fc283db3c98551d67ffe218', 1502252022, 0, 0),
(2, '重庆存己科技', 'aef484683fc283db3c98551d67ffe218', 1502252148, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cart`
--

CREATE TABLE `cart` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '购物车表主键id',
  `gid` int(11) UNSIGNED NOT NULL COMMENT '关联商品表主键id',
  `openid` varchar(64) NOT NULL COMMENT '唯一标识，openid',
  `specification` varchar(50) NOT NULL COMMENT '商品规格',
  `quantity` tinyint(3) UNSIGNED NOT NULL COMMENT '购买数量',
  `ctime` int(10) UNSIGNED NOT NULL COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cart`
--

INSERT INTO `cart` (`id`, `gid`, `openid`, `specification`, `quantity`, `ctime`) VALUES
(125, 26, 'o4Tr_0GU9D3tiN4gZ4U-SauL28cw', '2500g', 1, 1505204329);

-- --------------------------------------------------------

--
-- 表的结构 `discount_coupon`
--

CREATE TABLE `discount_coupon` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '优惠券表主键id',
  `show_language` varchar(50) NOT NULL COMMENT '展示语',
  `iprice` smallint(5) UNSIGNED NOT NULL COMMENT '订单价格',
  `price` smallint(5) UNSIGNED NOT NULL COMMENT '优惠价格',
  `sort` tinyint(3) UNSIGNED NOT NULL COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

CREATE TABLE `goods` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '商品表主键id',
  `gcid` int(11) UNSIGNED NOT NULL COMMENT '关联商品类别表主键id',
  `cname` varchar(255) NOT NULL COMMENT '商品名称',
  `tips` varchar(255) NOT NULL COMMENT '小贴士',
  `original_price` decimal(14,2) UNSIGNED NOT NULL COMMENT '原价',
  `promotion_price` decimal(14,2) UNSIGNED NOT NULL COMMENT '促销价',
  `inventory` int(10) UNSIGNED NOT NULL COMMENT '库存',
  `content` mediumtext NOT NULL COMMENT '详情',
  `ctime` int(10) UNSIGNED NOT NULL COMMENT '时间',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '类型？0>普通商品，1>拼团商品',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态？0>上架，1>下架'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`id`, `gcid`, `cname`, `tips`, `original_price`, `promotion_price`, `inventory`, `content`, `ctime`, `type`, `status`) VALUES
(26, 17, '鸡肉糙米天然鲜肉半湿狗粮  12.9元/500克', '鸡肉糙米天然鲜肉半湿狗粮，250克/袋，6.45元/袋250克 原价18.9元/500 现价12.90元/500克，邮费6元，满2500克（5斤）包邮', '9.45', '6.45', 999, '<p><img src=\"/ueditor/php/upload/image/20170906/1504674325715960.gif\" title=\"1504674325715960.gif\" alt=\"鸡肉湿粮_01.gif\"/><img src=\"/ueditor/php/upload/image/20170906/1504674333813943.gif\" title=\"1504674333813943.gif\" alt=\"鸡肉湿粮_02.gif\"/><img src=\"/ueditor/php/upload/image/20170906/1504674342794816.gif\" title=\"1504674342794816.gif\" alt=\"鸡肉湿粮_03.gif\"/><img src=\"/ueditor/php/upload/image/20170906/1504674352275752.gif\" title=\"1504674352275752.gif\" alt=\"鸡肉湿粮_04.gif\"/><img src=\"/ueditor/php/upload/image/20170906/1504674363348387.gif\" title=\"1504674363348387.gif\" alt=\"鸡肉湿粮_05.gif\"/><img src=\"/ueditor/php/upload/image/20170906/1504674373339388.gif\" title=\"1504674373339388.gif\" alt=\"鸡肉湿粮_06.gif\"/><img src=\"/ueditor/php/upload/image/20170906/1504674381803711.gif\" title=\"1504674381803711.gif\" alt=\"鸡肉湿粮_07.gif\"/><img src=\"/ueditor/php/upload/image/20170906/1504674391842470.gif\" title=\"1504674391842470.gif\" alt=\"鸡肉湿粮_08.gif\"/><img src=\"/ueditor/php/upload/image/20170906/1504674417159675.gif\" title=\"1504674417159675.gif\" alt=\"鸡肉湿粮_11.gif\"/><img src=\"/ueditor/php/upload/image/20170906/1504674410333219.gif\" title=\"1504674410333219.gif\" alt=\"鸡肉湿粮_10.gif\"/><img src=\"/ueditor/php/upload/image/20170906/1504674441944751.gif\" title=\"1504674441944751.gif\" alt=\"鸡肉湿粮_13.gif\"/><img src=\"/ueditor/php/upload/image/20170906/1504674453699065.gif\" title=\"1504674453699065.gif\" alt=\"鸡肉湿粮_14.gif\"/></p>', 1506478755, 0, 0),
(28, 17, '牛肉湿粮   37.9元/500克', '牛肉湿粮，  250克/袋，18.95元/袋250克 37.9元/500克。邮费6元，满2500克（5斤）包邮。', '18.95', '18.95', 999, '<p><img src=\"/ueditor/php/upload/image/20170903/1504451663805044.gif\" title=\"1504451663805044.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504451663692071.gif\" title=\"1504451663692071.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504451663693503.gif\" title=\"1504451663693503.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504451663729763.gif\" title=\"1504451663729763.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504451663171995.gif\" title=\"1504451663171995.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504451663455935.gif\" title=\"1504451663455935.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504451663294552.gif\" title=\"1504451663294552.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504451663134881.gif\" title=\"1504451663134881.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504451663358298.gif\" title=\"1504451663358298.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504451664754237.gif\" title=\"1504451664754237.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504451664688977.gif\" title=\"1504451664688977.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504451664638210.gif\" title=\"1504451664638210.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504451664164841.gif\" title=\"1504451664164841.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504451664555079.gif\" title=\"1504451664555079.gif\"/></p><p><br/></p>', 1506477946, 0, 0),
(29, 17, '三文鱼湿粮 25.8元/500克', '三文鱼湿粮，250克/袋，12.9元/袋250克 25.8元/500克。邮费6元，满2500克（5斤）包邮。', '12.90', '12.90', 999, '<p><img src=\"/ueditor/php/upload/image/20170903/1504452879266628.gif\" title=\"1504452879266628.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504452879413134.gif\" title=\"1504452879413134.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504452880154205.gif\" title=\"1504452880154205.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504452880329659.gif\" title=\"1504452880329659.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504452880393016.gif\" title=\"1504452880393016.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504452880723000.gif\" title=\"1504452880723000.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504452880930629.gif\" title=\"1504452880930629.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504452880285936.gif\" title=\"1504452880285936.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504452880704055.gif\" title=\"1504452880704055.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504452880858671.gif\" title=\"1504452880858671.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504452880611424.gif\" title=\"1504452880611424.gif\"/></p><p><img src=\"/ueditor/php/upload/image/20170903/1504452880124718.gif\" title=\"1504452880124718.gif\"/></p><p><br/></p>', 1506477906, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `goods_category`
--

CREATE TABLE `goods_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '商品类别表主键id',
  `cname` varchar(25) NOT NULL COMMENT '类别名称',
  `sort` tinyint(3) UNSIGNED NOT NULL COMMENT '排序',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '类型？0>普通，1>拼团'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `goods_category`
--

INSERT INTO `goods_category` (`id`, `cname`, `sort`, `type`) VALUES
(10, '狗粮', 1, 1),
(11, '宠物罐头', 2, 1),
(12, '宠物营养品', 3, 1),
(17, '狗粮', 1, 0),
(19, '宠物罐头', 2, 0),
(20, '宠物营养品', 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `goods_cover`
--

CREATE TABLE `goods_cover` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '商品封面表主键id',
  `gid` int(11) UNSIGNED NOT NULL COMMENT '关联商品表主键id',
  `img_path` varchar(255) NOT NULL COMMENT '图片路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `goods_cover`
--

INSERT INTO `goods_cover` (`id`, `gid`, `img_path`) VALUES
(59, 26, '/admin/uploads/2017-09-01/20170901081755_331.jpg'),
(60, 26, '/admin/uploads/2017-09-01/20170901081755_670.jpg'),
(61, 26, '/admin/uploads/2017-09-01/20170901081755_976.jpg'),
(65, 28, '/admin/uploads/2017-09-03/20170903231825_769.jpg'),
(66, 28, '/admin/uploads/2017-09-03/20170903231825_559.jpg'),
(67, 28, '/admin/uploads/2017-09-03/20170903231825_767.jpg'),
(68, 29, '/admin/uploads/2017-09-03/20170903233633_284.jpg'),
(69, 29, '/admin/uploads/2017-09-03/20170903233633_814.jpg'),
(70, 29, '/admin/uploads/2017-09-03/20170903233633_539.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `goods_estimate`
--

CREATE TABLE `goods_estimate` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '商品评价表主键id',
  `gid` int(11) UNSIGNED NOT NULL COMMENT '商品表主键id',
  `specification` varchar(50) NOT NULL COMMENT '商品规格',
  `openid` varchar(64) NOT NULL COMMENT '唯一标识，openid',
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `avatarurl` varchar(255) NOT NULL COMMENT '头像',
  `estimate` varchar(255) NOT NULL COMMENT '评价',
  `ctime` int(10) UNSIGNED NOT NULL COMMENT '时间',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态？0>好评，1>中评，2>差评'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `goods_estimate`
--

INSERT INTO `goods_estimate` (`id`, `gid`, `specification`, `openid`, `nickname`, `avatarurl`, `estimate`, `ctime`, `status`) VALUES
(1, 21, '保质期3个月以上', 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '同人于野', 'https://wx.qlogo.cn/mmopen/2j1ZbNKQ5AkWWkCPF294dcbibGKlicM27ct1Pkdrp4LickDic1ibU6HLEB5gPBQYT4Ry6iaxD59ic4vvzxl79OSAm19q8kVO0Orgf38/0', '撒撒水啦～', 1503993695, 0),
(2, 22, '暂无', 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '同人于野', 'https://wx.qlogo.cn/mmopen/2j1ZbNKQ5AkWWkCPF294dcbibGKlicM27ct1Pkdrp4LickDic1ibU6HLEB5gPBQYT4Ry6iaxD59ic4vvzxl79OSAm19q8kVO0Orgf38/0', '越过山丘虽然已白了头～', 1503999876, 1),
(3, 23, '保质期6个月以上', 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '同人于野', 'https://wx.qlogo.cn/mmopen/2j1ZbNKQ5AkWWkCPF294dcbibGKlicM27ct1Pkdrp4LickDic1ibU6HLEB5gPBQYT4Ry6iaxD59ic4vvzxl79OSAm19q8kVO0Orgf38/0', '还未如愿见着不朽就把自己先搞丢？！', 1503999962, 2),
(4, 21, '保质期12个月以上', 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '同人于野', 'https://wx.qlogo.cn/mmopen/2j1ZbNKQ5AkWWkCPF294dcbibGKlicM27ct1Pkdrp4LickDic1ibU6HLEB5gPBQYT4Ry6iaxD59ic4vvzxl79OSAm19q8kVO0Orgf38/0', '越过山丘才发现无人守候～', 1504000045, 0),
(5, 21, '保质期3个月以上', 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '同人于野', 'https://wx.qlogo.cn/mmopen/2j1ZbNKQ5AkWWkCPF294dcbibGKlicM27ct1Pkdrp4LickDic1ibU6HLEB5gPBQYT4Ry6iaxD59ic4vvzxl79OSAm19q8kVO0Orgf38/0', '可我坚信光明就在远方。', 1504002546, 0),
(6, 21, '保质期3个月以上', 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '同人于野', 'https://wx.qlogo.cn/mmopen/2j1ZbNKQ5AkWWkCPF294dcbibGKlicM27ct1Pkdrp4LickDic1ibU6HLEB5gPBQYT4Ry6iaxD59ic4vvzxl79OSAm19q8kVO0Orgf38/0', '可我坚信光明就在远方。', 1504002546, 0),
(7, 23, '保质期3个月以上', 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '同人于野', 'https://wx.qlogo.cn/mmopen/2j1ZbNKQ5AkWWkCPF294dcbibGKlicM27ct1Pkdrp4LickDic1ibU6HLEB5gPBQYT4Ry6iaxD59ic4vvzxl79OSAm19q8kVO0Orgf38/0', '一路的迷惘追随着我的脚步。', 1504002808, 1),
(8, 28, '250g/袋', 'o4Tr_0Dar0yemgpUybB1Qyv-Tt30', '看客', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epWn2WHDgGTLErRrp2diaNNicUe0XOz5dQx9wqnMpkpu3TIod7ah7JicV7sYaFGnY3mJiacicxXZDypxPw/0', '行，很好', 1504490694, 0);

-- --------------------------------------------------------

--
-- 表的结构 `goods_specification`
--

CREATE TABLE `goods_specification` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '商品规格表主键id',
  `gid` int(11) UNSIGNED NOT NULL COMMENT '关联商品表主键id',
  `cname` varchar(50) NOT NULL COMMENT '名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `goods_specification`
--

INSERT INTO `goods_specification` (`id`, `gid`, `cname`) VALUES
(85, 28, '250克'),
(90, 26, '250g/袋'),
(91, 29, '250g/袋');

-- --------------------------------------------------------

--
-- 表的结构 `group_goods`
--

CREATE TABLE `group_goods` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '拼团商品表主键id',
  `gid` int(11) UNSIGNED NOT NULL COMMENT '关联商品表主键id',
  `quantity` tinyint(3) UNSIGNED NOT NULL COMMENT '拼团人数',
  `start_time` int(10) UNSIGNED NOT NULL COMMENT '开始时间',
  `end_time` int(10) UNSIGNED NOT NULL COMMENT '结束时间',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '类型？0>未激活订单，1>已激活订单',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态？0>进行中，1>结束'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `group_join`
--

CREATE TABLE `group_join` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '拼团加入表主键id',
  `ggid` int(11) UNSIGNED NOT NULL COMMENT '拼团加入表主键id',
  `openid` varchar(64) NOT NULL COMMENT '唯一标识，openid',
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `avatarurl` varchar(255) NOT NULL COMMENT '头像',
  `ctime` int(10) UNSIGNED NOT NULL COMMENT '加入时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `group_join`
--

INSERT INTO `group_join` (`id`, `ggid`, `openid`, `nickname`, `avatarurl`, `ctime`) VALUES
(31, 14, 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '同人于野', 'https://wx.qlogo.cn/mmopen/2j1ZbNKQ5AkWWkCPF294dcbibGKlicM27ct1Pkdrp4LickDic1ibU6HLEB5gPBQYT4Ry6iaxD59ic4vvzxl79OSAm19q8kVO0Orgf38/0', 1503930758);

-- --------------------------------------------------------

--
-- 表的结构 `indent`
--

CREATE TABLE `indent` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '订单表主键id',
  `ggid` int(11) UNSIGNED NOT NULL COMMENT '关联拼团商品表主键id',
  `openid` varchar(64) NOT NULL COMMENT '唯一标识，openid',
  `inumber` varchar(64) NOT NULL COMMENT '订单编号',
  `total_money` decimal(14,2) UNSIGNED NOT NULL COMMENT '总金额',
  `remarks` varchar(255) NOT NULL COMMENT '买家留言',
  `ctime` int(10) UNSIGNED NOT NULL COMMENT '创建时间',
  `ptime` int(10) UNSIGNED NOT NULL COMMENT '付款时间',
  `stime` int(10) UNSIGNED NOT NULL COMMENT '发货时间',
  `transportation` varchar(64) NOT NULL COMMENT '承运来源',
  `transport_number` varchar(64) NOT NULL COMMENT '运单编号',
  `itype` tinyint(1) UNSIGNED NOT NULL COMMENT '订单类型？0>普通，1>拼团',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '类型？0>待付款，1>待发货，2>待收货，3>待评价，4>售后服务',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态？0>待完善，1>正常，2>取消订单，3>订单超时，4>申请退款，5>退款失败，6>退款成功'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `indent`
--

INSERT INTO `indent` (`id`, `ggid`, `openid`, `inumber`, `total_money`, `remarks`, `ctime`, `ptime`, `stime`, `transportation`, `transport_number`, `itype`, `type`, `status`) VALUES
(9, 14, 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '2017082854545356', '0.01', '指定顺丰速递。', 1503930758, 1503930803, 1503930901, '', '', 1, 3, 1),
(14, 0, 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '2017082810048495', '0.01', '223', 1503933661, 1503933794, 1503933864, '', '', 0, 4, 5),
(15, 0, 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '2017082957989755', '0.03', '指定顺丰速递。', 1503999337, 1503999425, 1503999458, '', '', 0, 4, 1),
(16, 0, 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '2017082910110050', '0.01', '指定顺丰速递。', 1504002414, 1504002439, 1504002479, '', '', 0, 4, 1),
(17, 0, 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '2017082954995310', '0.01', '1', 1504002726, 1504002742, 1504002756, '', '', 0, 4, 1),
(18, 0, 'o4Tr_0Dar0yemgpUybB1Qyv-Tt30', '2017090448531021', '29.80', 'undefined', 1504488256, 1504488888, 1504490095, '', '', 0, 4, 6),
(20, 0, 'o4Tr_0Dar0yemgpUybB1Qyv-Tt30', '2017090450100535', '11.90', '商家', 1504489970, 1504490143, 1504490984, '', '', 0, 4, 6),
(21, 0, 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '2017090553975497', '0.01', '指定顺丰速递。', 1504540853, 1504540889, 1504540911, '', '', 0, 3, 1),
(22, 0, 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '2017090549975749', '0.01', '1', 1504595617, 1504595637, 0, '', '', 0, 1, 1),
(23, 0, 'o4Tr_0Dar0yemgpUybB1Qyv-Tt30', '2017090510255975', '0.01', 'undefined', 1504598015, 1504598044, 1504598229, '', '', 0, 4, 6),
(24, 0, 'o4Tr_0LlxLIjwk5SYv8SmuA0GvXQ', '2017091157100102', '59.50', '', 1505113017, 0, 0, '', '', 0, 0, 0),
(25, 0, 'o4Tr_0PTrJF2yQisgZXJo4eVpHd4', '2017091253504897', '59.50', '', 1505219621, 0, 0, '', '', 0, 0, 0),
(26, 0, 'o4Tr_0HY_VArXeeKs9g6Z_hCfpyE', '2017091710149489', '59.50', '', 1505640750, 0, 0, '', '', 0, 0, 0),
(27, 0, 'o4Tr_0NHbYtiDADaJromp2mtAT28', '2017091910155101', '178.50', 'undefined', 1505791742, 0, 0, '', '', 0, 0, 1),
(28, 0, 'o4Tr_0Dar0yemgpUybB1Qyv-Tt30', '2017092748519799', '18.95', '', 1506479232, 0, 0, '', '', 0, 0, 2),
(29, 0, 'o4Tr_0Dar0yemgpUybB1Qyv-Tt30', '2017092710098102', '6.45', '', 1506480125, 0, 0, '', '', 0, 0, 2),
(30, 0, 'o4Tr_0Dar0yemgpUybB1Qyv-Tt30', '2017092756535099', '64.50', 'undefined', 1506480504, 0, 0, '', '', 0, 0, 3),
(31, 0, 'o4Tr_0MsGRL__EEYFotsrYBj4UGY', '2017092797975450', '6.45', '1', 1506492250, 0, 0, '', '', 0, 0, 1),
(32, 0, 'o4Tr_0Dar0yemgpUybB1Qyv-Tt30', '2017092710050101', '6.45', 'undefined', 1506505325, 0, 0, '', '', 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `indent_goods`
--

CREATE TABLE `indent_goods` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '订单商品表主键id',
  `iid` int(11) UNSIGNED NOT NULL COMMENT '关联订单表主键id',
  `gid` int(11) UNSIGNED NOT NULL COMMENT '关联商品表主键id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_specification` varchar(25) NOT NULL COMMENT '商品规格',
  `goods_price` decimal(14,2) UNSIGNED NOT NULL COMMENT '商品价格',
  `quantity` tinyint(3) UNSIGNED NOT NULL COMMENT '购买数量',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态？0>未评价，1>已评价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `indent_goods`
--

INSERT INTO `indent_goods` (`id`, `iid`, `gid`, `goods_name`, `goods_specification`, `goods_price`, `quantity`, `status`) VALUES
(9, 9, 20, '冻干南极磷虾干虾银龙地图血鹦鹉鱼饲料罗汉发财热带鱼粮增色鱼食', '0.8L', '0.01', 1, 0),
(14, 14, 21, '波奇网宠物猫粮法国皇家幼猫猫粮猫咪粮K36 400g英短幼猫粮猫饲料', '保质期3个月以上', '0.01', 1, 1),
(15, 15, 22, '耐吉斯幼猫粮鱼肉味1.36kg天然进口猫食饲料1-4个月奶糕猫咪主粮', '暂无', '0.01', 1, 1),
(16, 15, 23, '珍爱多 美毛老猫猫食成年猫粮天然粮成猫猫饭去毛球猫饲料 1.4kg', '保质期6个月以上', '0.01', 1, 1),
(17, 15, 21, '波奇网宠物猫粮法国皇家幼猫猫粮猫咪粮K36 400g英短幼猫粮猫饲料', '保质期12个月以上', '0.01', 1, 1),
(18, 16, 21, '波奇网宠物猫粮法国皇家幼猫猫粮猫咪粮K36 400g英短幼猫粮猫饲料', '保质期3个月以上', '0.01', 1, 1),
(19, 17, 23, '珍爱多 美毛老猫猫食成年猫粮天然粮成猫猫饭去毛球猫饲料 1.4kg', '保质期3个月以上', '0.01', 1, 1),
(20, 18, 28, '牛肉湿粮', '250g/袋', '17.90', 1, 1),
(21, 18, 26, '鸡肉糙米天然鲜肉半湿狗粮', '250g/袋', '11.90', 1, 0),
(23, 20, 26, '鸡肉糙米天然鲜肉半湿狗粮', '250g/袋', '11.90', 1, 0),
(24, 21, 29, '三文鱼湿粮', '2500g', '0.01', 1, 0),
(25, 22, 29, '三文鱼湿粮', '2500g', '0.01', 1, 0),
(26, 23, 29, '三文鱼湿粮', '2500g', '0.01', 1, 0),
(27, 24, 26, '鸡肉糙米天然鲜肉半湿狗粮  11.9元/500克', '2500g', '59.50', 1, 0),
(28, 25, 26, '鸡肉糙米天然鲜肉半湿狗粮  11.9元/500克', '2500g', '59.50', 1, 0),
(29, 26, 26, '鸡肉糙米天然鲜肉半湿狗粮  11.9元/500克', '2500g', '59.50', 1, 0),
(30, 27, 26, '鸡肉糙米天然鲜肉半湿狗粮  11.9元/500克', '2500g', '59.50', 3, 0),
(31, 28, 28, '牛肉湿粮   37.9元/500克', '250克', '18.95', 1, 0),
(32, 29, 26, '鸡肉糙米天然鲜肉半湿狗粮  12.9元/500克', '250g/袋', '6.45', 1, 0),
(33, 30, 26, '鸡肉糙米天然鲜肉半湿狗粮  12.9元/500克', '250g/袋', '6.45', 10, 0),
(34, 31, 26, '鸡肉糙米天然鲜肉半湿狗粮  12.9元/500克', '250g/袋', '6.45', 1, 0),
(35, 32, 26, '鸡肉糙米天然鲜肉半湿狗粮  12.9元/500克', '250g/袋', '6.45', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `indent_take_delivery`
--

CREATE TABLE `indent_take_delivery` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '订单收货表主键id',
  `iid` int(11) UNSIGNED NOT NULL COMMENT '关联订单表主键id',
  `contacts` varchar(25) NOT NULL COMMENT '联系人',
  `phone` char(11) NOT NULL COMMENT '手机号码',
  `address` varchar(255) NOT NULL COMMENT '详细地址',
  `postal_code` varchar(25) NOT NULL COMMENT '邮政编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `indent_take_delivery`
--

INSERT INTO `indent_take_delivery` (`id`, `iid`, `contacts`, `phone`, `address`, `postal_code`) VALUES
(58, 9, '赵存己', '18423031898', '重庆市重庆市江北区大石坝东原D7四号写字楼', '400000'),
(63, 14, '张三', '18888888888', '广东省广州市天河区某巷某号', '510000'),
(64, 15, '张三', '18888888888', '广东省广州市天河区某巷某号', '510000'),
(65, 16, '赵存己', '18423031898', '重庆市重庆市江北区大石坝东原D7四号写字楼', '400000'),
(66, 17, '赵存己', '18423031898', '重庆市重庆市江北区大石坝东原D7四号写字楼', '400000'),
(67, 18, '韩文涛', '13065056137', '山东省济南市市中区纬一路478号', '250001'),
(69, 20, '韩文涛', '13065056137', '山东省济南市市中区纬一路478号', '250001'),
(70, 21, '赵存己', '18423031898', '重庆市重庆市江北区大石坝东原D7四号写字楼', '400000'),
(71, 22, '赵存己', '18423031898', '重庆市重庆市江北区大石坝东原D7四号写字楼', '400000'),
(72, 23, '韩文涛', '13065056137', '山东省济南市市中区纬一路478号', '250001'),
(73, 27, '测试', '18888888888', '北京市北京市东城区东长安街天安门', '100010'),
(74, 29, '韩文涛', '13065056137', '山东省济南市市中区纬一路478号', '250001'),
(75, 30, '韩文涛', '13065056137', '山东省济南市市中区纬一路478号', '250001'),
(76, 31, '赵存己', '18423031898', '重庆市重庆市江北区大石坝东原D7四号写字楼', '400000'),
(77, 32, '韩文涛', '13065056137', '山东省济南市市中区纬一路478号', '250001');

-- --------------------------------------------------------

--
-- 表的结构 `publicity`
--

CREATE TABLE `publicity` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '宣传表主键id',
  `img_path` varchar(255) NOT NULL COMMENT '图片路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `discount_coupon`
--
ALTER TABLE `discount_coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gcid` (`gcid`);

--
-- Indexes for table `goods_category`
--
ALTER TABLE `goods_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goods_cover`
--
ALTER TABLE `goods_cover`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `goods_estimate`
--
ALTER TABLE `goods_estimate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `goods_specification`
--
ALTER TABLE `goods_specification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `group_goods`
--
ALTER TABLE `group_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `group_join`
--
ALTER TABLE `group_join`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ggid` (`ggid`);

--
-- Indexes for table `indent`
--
ALTER TABLE `indent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ggid` (`ggid`);

--
-- Indexes for table `indent_goods`
--
ALTER TABLE `indent_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iid` (`iid`),
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `indent_take_delivery`
--
ALTER TABLE `indent_take_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iid` (`iid`);

--
-- Indexes for table `publicity`
--
ALTER TABLE `publicity`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '后台用户表主键id', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '购物车表主键id', AUTO_INCREMENT=137;
--
-- 使用表AUTO_INCREMENT `discount_coupon`
--
ALTER TABLE `discount_coupon`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '优惠券表主键id', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品表主键id', AUTO_INCREMENT=30;
--
-- 使用表AUTO_INCREMENT `goods_category`
--
ALTER TABLE `goods_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品类别表主键id', AUTO_INCREMENT=22;
--
-- 使用表AUTO_INCREMENT `goods_cover`
--
ALTER TABLE `goods_cover`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品封面表主键id', AUTO_INCREMENT=71;
--
-- 使用表AUTO_INCREMENT `goods_estimate`
--
ALTER TABLE `goods_estimate`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品评价表主键id', AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `goods_specification`
--
ALTER TABLE `goods_specification`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品规格表主键id', AUTO_INCREMENT=92;
--
-- 使用表AUTO_INCREMENT `group_goods`
--
ALTER TABLE `group_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '拼团商品表主键id', AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `group_join`
--
ALTER TABLE `group_join`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '拼团加入表主键id', AUTO_INCREMENT=37;
--
-- 使用表AUTO_INCREMENT `indent`
--
ALTER TABLE `indent`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单表主键id', AUTO_INCREMENT=33;
--
-- 使用表AUTO_INCREMENT `indent_goods`
--
ALTER TABLE `indent_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单商品表主键id', AUTO_INCREMENT=36;
--
-- 使用表AUTO_INCREMENT `indent_take_delivery`
--
ALTER TABLE `indent_take_delivery`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单收货表主键id', AUTO_INCREMENT=78;
--
-- 使用表AUTO_INCREMENT `publicity`
--
ALTER TABLE `publicity`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '宣传表主键id', AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
