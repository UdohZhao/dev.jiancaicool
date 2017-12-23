-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-11-01 09:42:14
-- 服务器版本： 5.7.17
-- PHP Version: 7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jiancaicool`
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
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '类型？0>超级管理员，1>普通管理员'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin_user`
--

INSERT INTO `admin_user` (`id`, `username`, `password`, `ctime`, `status`, `type`) VALUES
(1, '重庆存己科技', 'aef484683fc283db3c98551d67ffe218', 1509246064, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cart`
--

CREATE TABLE `cart` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '购物车表主键id',
  `gid` int(11) UNSIGNED NOT NULL COMMENT '关联商品表主键id',
  `openid` varchar(64) NOT NULL COMMENT '唯一标识，openid',
  `specification` varchar(50) NOT NULL COMMENT '商品规格',
  `gmodel` varchar(50) NOT NULL COMMENT '商品型号',
  `quantity` tinyint(3) UNSIGNED NOT NULL COMMENT '购买数量',
  `isdelivery` tinyint(1) UNSIGNED NOT NULL COMMENT '送货上门？0>否，1>是',
  `isinstallation` tinyint(1) UNSIGNED NOT NULL COMMENT '上门安装？0>否，1>是',
  `total_money` decimal(14,2) UNSIGNED NOT NULL COMMENT '合计价格',
  `ctime` int(10) UNSIGNED NOT NULL COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `discounts_add`
--

CREATE TABLE `discounts_add` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '优惠额度累计表主键id',
  `openid` varchar(64) NOT NULL COMMENT '唯一标识，openid',
  `money_coupon` decimal(14,2) UNSIGNED NOT NULL COMMENT '优惠额度'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `discounts_add`
--

INSERT INTO `discounts_add` (`id`, `openid`, `money_coupon`) VALUES
(1, 'oIcMg0d7-_PvJlVVkp6rqz4p1kjg', '400.00');

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

--
-- 转存表中的数据 `discount_coupon`
--

INSERT INTO `discount_coupon` (`id`, `show_language`, `iprice`, `price`, `sort`) VALUES
(1, '代金券可用于商品抵扣', 1000, 100, 0);

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
  `delivery_expense` decimal(14,2) UNSIGNED NOT NULL COMMENT '送货费用',
  `installation_expense` decimal(14,2) UNSIGNED NOT NULL COMMENT '安装费用',
  `inventory` int(10) UNSIGNED NOT NULL COMMENT '库存',
  `content` varchar(20000) NOT NULL COMMENT '详情',
  `percentage` tinyint(2) UNSIGNED NOT NULL COMMENT '兑换百分比',
  `percentage_price` decimal(14,2) UNSIGNED NOT NULL COMMENT '兑换百分比价格',
  `ctime` int(10) UNSIGNED NOT NULL COMMENT '时间',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '类型？0>普通商品，1>拼团商品',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态？0>上架，1>下架'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`id`, `gcid`, `cname`, `tips`, `original_price`, `promotion_price`, `delivery_expense`, `installation_expense`, `inventory`, `content`, `percentage`, `percentage_price`, `ctime`, `type`, `status`) VALUES
(2, 7, '佛山 仿古墙砖卫生间厨房300x600釉面砖浴室瓷砖阳台客厅防滑地砖', '【优等品牌】佛山正品优等砖，淘品牌十大品牌,专注瓷砖行业十余年，值得信赖！！！ ', '46.00', '28.00', '5.00', '15.00', 999, '<p><img src=\"/ueditor/php/upload/image/20171030/1509358584908769.jpg\" title=\"1509358584908769.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171030/1509358584517296.jpg\" title=\"1509358584517296.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171030/1509358599223201.jpg\" title=\"1509358599223201.jpg\" alt=\"TB2PHlSa0mgF1Jjy0FaXXX5jpXa_!!3377480772.jpg\"/></p>', 10, '2.80', 1509358606, 0, 0),
(3, 8, '白色文化砖电视背景墙 文化石外墙砖别墅外墙瓷砖墙砖客厅仿古砖', '厂家直销 纹路自然 破损补发', '82.00', '55.00', '5.00', '15.00', 999, '<p><img src=\"/ueditor/php/upload/image/20171031/1509407816742626.jpg\" title=\"1509407816742626.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509407816693318.jpg\" title=\"1509407816693318.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509407816956096.jpg\" title=\"1509407816956096.jpg\"/></p><p><br/></p>', 10, '5.50', 1509407825, 0, 0),
(4, 9, '佛山金刚石地砖 地板砖客厅卧室防滑耐磨玻化砖全抛釉瓷砖800*800', '本店佛山工厂直销：客厅砖，卧室砖，厨卫砖等等，款式多多，品种多多', '32.00', '11.00', '5.00', '5.00', 999, '<p><img src=\"/ueditor/php/upload/image/20171031/1509408065146031.jpg\" title=\"1509408065146031.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509408065352082.jpg\" title=\"1509408065352082.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509408066443076.jpg\" title=\"1509408066443076.jpg\"/></p><p><br/></p>', 10, '1.10', 1509408074, 0, 0),
(5, 10, '玻璃马赛克镜面水晶瓷砖背景墙拼花卫生间墙贴背景墙砖游泳池KTV', '商家承诺：购买“送货入户”服务，如未履行服务最高可获得30000积分赔付', '58.00', '39.00', '5.00', '5.00', 999, '<p><img src=\"/ueditor/php/upload/image/20171031/1509408405536971.jpg\" title=\"1509408405536971.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509408405969798.jpg\" title=\"1509408405969798.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509408405809324.jpg\" title=\"1509408405809324.jpg\"/></p><p><br/></p>', 10, '3.90', 1509408411, 0, 0),
(6, 11, '纯白地角线墙贴pvc自粘防水踢脚线窗台门框翻新贴纸浴室瓷砖腰线', 'pvc自粘防水踢脚线', '15.00', '5.00', '15.00', '5.00', 999, '<p><img src=\"/ueditor/php/upload/image/20171031/1509408696318775.jpg\" title=\"1509408696318775.jpg\" alt=\"TB2zg1anstnpuFjSZFvXXbcTpXa_!!2006738748.jpg\"/></p>', 10, '0.50', 1509408702, 0, 0),
(7, 12, '佛山仿木地板瓷砖木纹砖仿实木地砖客厅卧室150X800防滑地板砖', '佛山优等瓷砖', '7.50', '7.00', '5.00', '5.00', 999, '<p><img src=\"/ueditor/php/upload/image/20171031/1509409920914098.jpg\" title=\"1509409920914098.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509409920627755.jpg\" title=\"1509409920627755.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509409920247105.jpg\" title=\"1509409920247105.jpg\"/></p><p><br/></p>', 10, '0.70', 1509409927, 0, 0),
(8, 13, 'TATA木门 99特权订金 实木复合室内门 卧室门房门全屋定制', '核销有效期到10月20日到11月14日', '100.00', '99.00', '5.00', '5.00', 999, '<p><img src=\"/ueditor/php/upload/image/20171031/1509410180211011.jpg\" title=\"1509410180211011.jpg\" alt=\"TB2zY8vcvBNTKJjSszeXXcu2VXa_!!826813153.jpg\"/></p>', 10, '9.90', 1509410184, 0, 0),
(9, 14, '包邮门套窗套垭口套线条保护移门口套实木免漆复合包边卧室房间', '允许最低误差为2厘米，我厂生产的产品为插口形门套，可以调节，如果误差过大，超过1厘米就需要取中间值.', '50.00', '20.00', '5.00', '5.00', 999, '<p><img src=\"/ueditor/php/upload/image/20171031/1509410327653446.jpg\" title=\"1509410327653446.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509410327437142.jpg\" title=\"1509410327437142.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509410327703637.jpg\" title=\"1509410327703637.jpg\"/></p><p><br/></p>', 10, '2.00', 1509410332, 0, 0),
(10, 15, '北京定做铝镁钛合金厨房推拉门 玻璃隔断门阳台推拉门卫生间定制', '本店所有产品都是量身定制的，使用环保的材质是家庭适用', '1000.00', '300.00', '5.00', '5.00', 999, '<p><img src=\"/ueditor/php/upload/image/20171031/1509410600623090.jpg\" title=\"1509410600623090.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509410600824185.jpg\" title=\"1509410600824185.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509410600425841.jpg\" title=\"1509410600425841.jpg\"/></p><p><br/></p>', 10, '30.00', 1509410605, 0, 0),
(11, 20, '雅心 北欧个性壁纸墙布简约现代客厅电视背景墙定制无缝墙纸壁布', '优质工艺 结实耐用 色彩绚丽 顺丰包邮', '198.00', '119.00', '5.00', '5.00', 999, '<p><img src=\"/ueditor/php/upload/image/20171031/1509410796524633.jpg\" title=\"1509410796524633.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509410797828773.jpg\" title=\"1509410797828773.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509410797655255.jpg\" title=\"1509410797655255.jpg\"/></p>', 10, '11.90', 1509410805, 0, 0),
(12, 21, '爱茜家亚麻墙布 现代简约客厅卧室纯色素色无纺热胶无缝壁布墙纸', '精密亚麻棉布 环保无纺底层 需6平方起拍', '50.00', '10.00', '5.00', '5.00', 999, '<p><img src=\"/ueditor/php/upload/image/20171031/1509411092802570.jpg\" title=\"1509411092802570.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509411092486850.jpg\" title=\"1509411092486850.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509411092353231.jpg\" title=\"1509411092353231.jpg\"/></p><p><br/></p>', 10, '1.00', 1509411096, 0, 0),
(13, 22, '米克汉高贝壳粉 金装贝纯内墙环保涂料 硅藻泥升级天花板吊顶包邮', '**本产品适用于滚涂、喷涂类平涂工艺。', '286.00', '230.00', '5.00', '5.00', 999, '<p><img src=\"/ueditor/php/upload/image/20171031/1509411340573379.jpg\" title=\"1509411340573379.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509411340453383.jpg\" title=\"1509411340453383.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171031/1509411340253036.jpg\" title=\"1509411340253036.jpg\"/></p><p><br/></p>', 10, '23.00', 1509411345, 0, 0),
(14, 27, '雅庭尚品非洲圆盘豆纯实木地板原木本色钢琴烤漆实木地板厂家直销', '湖州雅庭木业有限公司是一家专业生产木地板厂家', '0.02', '0.01', '0.01', '0.01', 999, '<p><img src=\"/ueditor/php/upload/image/20171101/1509502569157996.jpg\" title=\"1509502569157996.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171101/1509502569537579.jpg\" title=\"1509502569537579.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171101/1509502583913778.jpg\" title=\"1509502583913778.jpg\" alt=\"TB2HTkxc_AKL1JjSZFCXXXFspXa_!!832003415.jpg\"/></p>', 0, '0.00', 1509502589, 0, 0),
(15, 35, '金刚石瓷砖地砖800x800客厅釉砖磁砖全抛釉地砖防滑墙砖地板瓷砖', '防滑墙砖地板瓷砖', '0.02', '0.01', '0.01', '0.01', 999, '<p><img src=\"/ueditor/php/upload/image/20171101/1509507265143633.jpg\" title=\"1509507265143633.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171101/1509507265333353.jpg\" title=\"1509507265333353.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171101/1509507265561411.jpg\" title=\"1509507265561411.jpg\"/></p><p><br/></p>', 0, '0.00', 1509507271, 1, 0),
(16, 36, '厂家直销仿实木防水环保复古浮雕家用卧室强化复合地暖木地板12mm', '强化复合地暖木地板', '0.02', '0.01', '0.01', '0.01', 999, '<p><img src=\"/ueditor/php/upload/image/20171101/1509526731863277.jpg\" title=\"1509526731863277.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171101/1509526731244776.jpg\" title=\"1509526731244776.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171101/1509526731925621.jpg\" title=\"1509526731925621.jpg\"/></p><p><br/></p>', 0, '0.00', 1509526736, 1, 0),
(17, 37, '简约黏贴浴室镜子无框洗手间卫浴镜卫生间镜子壁挂镜子化妆镜欧式', '精致磨边 破损包赔 支持定制', '0.02', '0.01', '0.01', '0.01', 999, '<p><img src=\"/ueditor/php/upload/image/20171101/1509526926206647.jpg\" title=\"1509526926206647.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171101/1509526926844557.jpg\" title=\"1509526926844557.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20171101/1509526926908615.jpg\" title=\"1509526926908615.jpg\"/></p><p><br/></p>', 0, '0.00', 1509526930, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `goods_category`
--

CREATE TABLE `goods_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '商品类别表主键id',
  `pid` int(11) UNSIGNED NOT NULL COMMENT '父级id，0为顶级',
  `icon_path` varchar(255) NOT NULL COMMENT '图标路径',
  `cname` varchar(25) NOT NULL COMMENT '类别名称',
  `sort` tinyint(3) UNSIGNED NOT NULL COMMENT '排序',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '类型？0>普通，1>拼团'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `goods_category`
--

INSERT INTO `goods_category` (`id`, `pid`, `icon_path`, `cname`, `sort`, `type`) VALUES
(1, 0, '/admin/uploads/2017-10-29/20171029111954_227.png', '瓷砖', 1, 0),
(2, 0, '/admin/uploads/2017-10-29/20171029113604_303.png', '套装门', 2, 0),
(3, 0, '/admin/uploads/2017-10-29/20171029114020_268.png', '墙饰', 3, 0),
(4, 0, '/admin/uploads/2017-10-29/20171029114241_227.png', '木地板', 4, 0),
(5, 0, '/admin/uploads/2017-10-29/20171029114514_803.png', '卫浴', 5, 0),
(6, 0, '/admin/uploads/2017-10-29/20171029114705_531.png', '厨具', 6, 0),
(7, 1, '/admin/uploads/2017-10-30/20171030153623_301.png', '釉面砖', 1, 0),
(8, 1, '/admin/uploads/2017-10-30/20171030153759_774.png', '仿古砖', 2, 0),
(9, 1, '/admin/uploads/2017-10-30/20171030153817_643.png', '玻化砖', 3, 0),
(10, 1, '/admin/uploads/2017-10-30/20171030153837_683.png', '马赛克', 4, 0),
(11, 1, '/admin/uploads/2017-10-30/20171030153855_793.png', '腰线', 5, 0),
(12, 1, '/admin/uploads/2017-10-30/20171030153914_240.png', '仿木地板砖', 6, 0),
(13, 2, '/admin/uploads/2017-10-30/20171030154823_114.png', '木门', 1, 0),
(14, 2, '/admin/uploads/2017-10-30/20171030154842_670.png', '实木套线', 2, 0),
(15, 2, '/admin/uploads/2017-10-30/20171030154934_421.png', '合金门', 3, 0),
(16, 13, '/admin/uploads/2017-10-30/20171030155022_303.png', '复合实木', 1, 0),
(18, 13, '/admin/uploads/2017-10-30/20171030155128_820.png', '实木', 2, 0),
(19, 13, '/admin/uploads/2017-10-30/20171030155147_412.png', '原木', 3, 0),
(20, 3, '/admin/uploads/2017-10-30/20171030155237_748.png', '墙纸', 1, 0),
(21, 3, '/admin/uploads/2017-10-30/20171030155257_677.png', '墙布', 2, 0),
(22, 3, '/admin/uploads/2017-10-30/20171030155313_538.png', '硅藻泥', 3, 0),
(23, 21, '/admin/uploads/2017-10-30/20171030155335_713.png', '单色', 1, 0),
(24, 21, '/admin/uploads/2017-10-30/20171030155359_551.png', '双色', 2, 0),
(25, 4, '/admin/uploads/2017-10-30/20171030155508_427.png', '强化地板', 1, 0),
(26, 4, '/admin/uploads/2017-10-30/20171030155523_134.png', '多层实木地板', 2, 0),
(27, 4, '/admin/uploads/2017-10-30/20171030155539_697.png', '实木地板', 3, 0),
(28, 4, '/admin/uploads/2017-10-30/20171030155559_861.png', '实木踢脚线', 4, 0),
(29, 5, '/admin/uploads/2017-10-30/20171030155654_939.png', '浴室柜', 1, 0),
(30, 5, '/admin/uploads/2017-10-30/20171030155709_792.png', '花洒', 2, 0),
(31, 5, '/admin/uploads/2017-10-30/20171030155719_407.png', '马桶', 3, 0),
(32, 5, '/admin/uploads/2017-10-30/20171030155737_594.png', '蹲便器', 4, 0),
(33, 6, '/admin/uploads/2017-10-30/20171030161515_673.png', '洗菜盆', 1, 0),
(34, 6, '/admin/uploads/2017-10-30/20171030161615_768.png', '冷热龙头', 2, 0),
(35, 0, '/admin/uploads/2017-11-01/20171101113001_655.png', '瓷砖', 1, 1),
(36, 0, '/admin/uploads/2017-11-01/20171101113032_591.png', '木地板', 2, 1),
(37, 0, '/admin/uploads/2017-11-01/20171101113054_336.png', '卫浴', 3, 1);

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
(4, 2, '/admin/uploads/2017-10-30/20171030183257_617.jpg'),
(5, 2, '/admin/uploads/2017-10-30/20171030183257_738.jpg'),
(6, 2, '/admin/uploads/2017-10-30/20171030183257_717.jpg'),
(7, 3, '/admin/uploads/2017-10-31/20171031075816_201.jpg'),
(8, 3, '/admin/uploads/2017-10-31/20171031075816_354.jpg'),
(9, 3, '/admin/uploads/2017-10-31/20171031075816_697.jpg'),
(10, 4, '/admin/uploads/2017-10-31/20171031080432_942.jpg'),
(11, 4, '/admin/uploads/2017-10-31/20171031080432_640.jpg'),
(12, 4, '/admin/uploads/2017-10-31/20171031080432_474.jpg'),
(13, 5, '/admin/uploads/2017-10-31/20171031080759_696.jpg'),
(14, 5, '/admin/uploads/2017-10-31/20171031080759_452.jpg'),
(15, 5, '/admin/uploads/2017-10-31/20171031080759_895.jpg'),
(16, 6, '/admin/uploads/2017-10-31/20171031081316_407.jpg'),
(17, 6, '/admin/uploads/2017-10-31/20171031081316_995.jpg'),
(18, 6, '/admin/uploads/2017-10-31/20171031081316_929.jpg'),
(19, 7, '/admin/uploads/2017-10-31/20171031083258_682.jpg'),
(20, 7, '/admin/uploads/2017-10-31/20171031083258_735.jpg'),
(21, 7, '/admin/uploads/2017-10-31/20171031083258_865.jpg'),
(22, 8, '/admin/uploads/2017-10-31/20171031083719_540.jpg'),
(23, 8, '/admin/uploads/2017-10-31/20171031083719_503.jpg'),
(24, 8, '/admin/uploads/2017-10-31/20171031083719_304.jpg'),
(25, 9, '/admin/uploads/2017-10-31/20171031083942_412.jpg'),
(26, 9, '/admin/uploads/2017-10-31/20171031083942_579.png'),
(27, 9, '/admin/uploads/2017-10-31/20171031083942_491.jpg'),
(28, 10, '/admin/uploads/2017-10-31/20171031084429_269.jpg'),
(29, 10, '/admin/uploads/2017-10-31/20171031084429_706.jpg'),
(30, 10, '/admin/uploads/2017-10-31/20171031084429_885.jpg'),
(31, 11, '/admin/uploads/2017-10-31/20171031084902_331.jpg'),
(32, 11, '/admin/uploads/2017-10-31/20171031084902_339.jpg'),
(33, 11, '/admin/uploads/2017-10-31/20171031084902_546.jpg'),
(34, 12, '/admin/uploads/2017-10-31/20171031085337_938.jpg'),
(35, 12, '/admin/uploads/2017-10-31/20171031085337_667.jpg'),
(36, 12, '/admin/uploads/2017-10-31/20171031085337_250.jpg'),
(37, 13, '/admin/uploads/2017-10-31/20171031085643_251.jpg'),
(38, 13, '/admin/uploads/2017-10-31/20171031085643_796.jpg'),
(39, 13, '/admin/uploads/2017-10-31/20171031085643_674.jpg'),
(40, 14, '/admin/uploads/2017-11-01/20171101101722_101.jpg'),
(41, 14, '/admin/uploads/2017-11-01/20171101101722_966.jpg'),
(42, 14, '/admin/uploads/2017-11-01/20171101101722_928.jpg'),
(43, 15, '/admin/uploads/2017-11-01/20171101113521_686.jpg'),
(44, 15, '/admin/uploads/2017-11-01/20171101113521_326.jpg'),
(45, 15, '/admin/uploads/2017-11-01/20171101113521_746.jpg'),
(46, 16, '/admin/uploads/2017-11-01/20171101165937_713.jpg'),
(47, 16, '/admin/uploads/2017-11-01/20171101165937_460.jpg'),
(48, 16, '/admin/uploads/2017-11-01/20171101165937_711.jpg'),
(49, 17, '/admin/uploads/2017-11-01/20171101170301_512.jpg'),
(50, 17, '/admin/uploads/2017-11-01/20171101170301_360.jpg'),
(51, 17, '/admin/uploads/2017-11-01/20171101170301_846.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `goods_estimate`
--

CREATE TABLE `goods_estimate` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '商品评价表主键id',
  `gid` int(11) UNSIGNED NOT NULL COMMENT '商品表主键id',
  `specification` varchar(50) NOT NULL COMMENT '商品规格',
  `gmodel` varchar(50) NOT NULL COMMENT '商品型号',
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

INSERT INTO `goods_estimate` (`id`, `gid`, `specification`, `gmodel`, `openid`, `nickname`, `avatarurl`, `estimate`, `ctime`, `status`) VALUES
(2, 14, 'AAA', 'V1', 'oIcMg0d7-_PvJlVVkp6rqz4p1kjg', '同人于野', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ5exQKIhibFicL45hWPrfib4Fia1RfLOfAia0udTL4sI5OhuGhOYriaJtyY7Bkq9hqEDsvtlum0jjySZEg/0', '34455443', 1509506450, 0);

-- --------------------------------------------------------

--
-- 表的结构 `goods_specification`
--

CREATE TABLE `goods_specification` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '商品规格表主键id',
  `gid` int(11) UNSIGNED NOT NULL COMMENT '关联商品表主键id',
  `cname` varchar(50) NOT NULL COMMENT '名称',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '类型？0>规格，1>型号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `goods_specification`
--

INSERT INTO `goods_specification` (`id`, `gid`, `cname`, `type`) VALUES
(12, 1, '2323454', 1),
(13, 1, 'AAA', 0),
(14, 1, 'BBB', 0),
(15, 1, 'CCC', 0),
(16, 2, 'AAA', 0),
(17, 2, 'BBB', 0),
(18, 2, 'CCC', 0),
(19, 2, 'V1', 1),
(20, 2, 'V2', 1),
(21, 2, 'V3', 1),
(22, 3, 'AAA', 0),
(23, 3, 'BBB', 0),
(24, 3, 'CCC', 0),
(25, 3, 'V1', 1),
(26, 3, 'V2', 1),
(27, 3, 'V3', 1),
(28, 4, 'AAA', 0),
(29, 4, 'BBB', 0),
(30, 4, 'CCC', 0),
(31, 4, 'V1', 1),
(32, 4, 'V2', 1),
(33, 4, 'V3', 1),
(34, 5, 'AAA', 0),
(35, 5, 'BBB', 0),
(36, 5, 'CCC', 0),
(37, 5, 'V1', 1),
(38, 5, 'V2', 1),
(39, 5, 'V3', 1),
(40, 6, 'AAA', 0),
(41, 6, 'BBB', 0),
(42, 6, 'CCC', 0),
(43, 6, 'V1', 1),
(44, 6, 'V2', 1),
(45, 6, 'V3', 1),
(46, 7, 'AAA', 0),
(47, 7, 'BBB', 0),
(48, 7, 'CCC', 0),
(49, 7, 'V1', 1),
(50, 7, 'V2', 1),
(51, 7, 'V3', 1),
(52, 8, 'AAA', 0),
(53, 8, 'BBB', 0),
(54, 8, 'CCC', 0),
(55, 8, 'V1', 1),
(56, 8, 'V2', 1),
(57, 8, 'V3', 1),
(58, 9, 'AAA', 0),
(59, 9, 'BBB', 0),
(60, 9, 'CCC', 0),
(61, 9, 'V1', 1),
(62, 9, 'V2', 1),
(63, 9, 'V3', 1),
(64, 10, 'AAA', 0),
(65, 10, 'BBB', 0),
(66, 10, 'CCC', 0),
(67, 10, 'V1', 1),
(68, 10, 'V2', 1),
(69, 10, 'V3', 1),
(70, 11, 'AAA', 0),
(71, 11, 'BBB', 0),
(72, 11, 'CCC', 0),
(73, 11, 'V1', 1),
(74, 11, 'V2', 1),
(75, 11, 'V3', 1),
(76, 12, 'AAA', 0),
(77, 12, 'BBB', 0),
(78, 12, 'CCC', 0),
(79, 12, 'V1', 1),
(80, 12, 'V2', 1),
(81, 12, 'V3', 1),
(82, 13, 'AAA', 0),
(83, 13, 'BBB', 0),
(84, 13, 'CCC', 0),
(85, 13, 'V1', 1),
(86, 13, 'V2', 1),
(87, 13, 'V3', 1),
(88, 14, 'AAA', 0),
(89, 14, 'BBB', 0),
(90, 14, 'CCC', 0),
(91, 14, 'V1', 1),
(92, 14, 'V2', 1),
(93, 14, 'V3', 1),
(94, 15, 'AAA', 0),
(95, 15, 'BBB', 0),
(96, 15, 'CCC', 0),
(97, 15, 'V1', 1),
(98, 15, 'V2', 1),
(99, 15, 'V3', 1),
(100, 16, 'AAA', 0),
(101, 16, 'BBB', 0),
(102, 16, 'CCC', 0),
(103, 16, 'V1', 1),
(104, 16, 'V2', 1),
(105, 16, 'V3', 1),
(106, 17, 'AAA', 0),
(107, 17, 'BBB', 0),
(108, 17, 'CCC', 0),
(109, 17, 'V1', 1),
(110, 17, 'V2', 1),
(111, 17, 'V3', 1);

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

--
-- 转存表中的数据 `group_goods`
--

INSERT INTO `group_goods` (`id`, `gid`, `quantity`, `start_time`, `end_time`, `type`, `status`) VALUES
(1, 15, 2, 1509507300, 1510112100, 0, 0),
(2, 16, 2, 1509526740, 1510131540, 0, 0),
(3, 17, 2, 1509526980, 1510131780, 0, 0);

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
(4, 0, 'oIcMg0d7-_PvJlVVkp6rqz4p1kjg', '2017110156565297', '0.03', '111', 1509506136, 0, 1509506219, '', '', 0, 4, 1),
(5, 0, 'oIcMg0d7-_PvJlVVkp6rqz4p1kjg', '2017110155495754', '0.00', '', 1509509463, 0, 0, '', '', 0, 0, 2),
(6, 0, 'oIcMg0d7-_PvJlVVkp6rqz4p1kjg', '2017110155979752', '0.00', '12122', 1509519111, 0, 0, '', '', 0, 0, 3),
(7, 0, 'oIcMg0d7-_PvJlVVkp6rqz4p1kjg', '2017110110255485', '0.03', '4443', 1509519311, 0, 0, '', '', 0, 0, 3),
(8, 0, 'oIcMg0d7-_PvJlVVkp6rqz4p1kjg', '2017110157555455', '0.01', '212332', 1509521241, 0, 0, '', '', 0, 1, 1),
(9, 0, 'oIcMg0d7-_PvJlVVkp6rqz4p1kjg', '2017110110148975', '0.00', '3232323', 1509522238, 0, 0, '', '', 0, 0, 2),
(10, 0, 'oIcMg0d7-_PvJlVVkp6rqz4p1kjg', '2017110199991019', '0.04', '', 1509523564, 0, 0, '', '', 0, 0, 2),
(11, 0, 'oIcMg0d7-_PvJlVVkp6rqz4p1kjg', '2017110110248981', '0.04', '434343', 1509523871, 0, 0, '', '', 0, 0, 2),
(12, 0, 'oIcMg0d7-_PvJlVVkp6rqz4p1kjg', '2017110151555710', '0.06', '3232', 1509524611, 0, 0, '', '', 0, 0, 2),
(13, 0, 'oIcMg0d7-_PvJlVVkp6rqz4p1kjg', '2017110155485598', '0.04', '33', 1509524679, 0, 0, '', '', 0, 0, 2);

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
  `goods_model` varchar(25) NOT NULL COMMENT '商品型号',
  `goods_price` decimal(14,2) UNSIGNED NOT NULL COMMENT '商品价格',
  `quantity` tinyint(3) UNSIGNED NOT NULL COMMENT '购买数量',
  `isdelivery` tinyint(1) UNSIGNED NOT NULL COMMENT '送货上门？0>否，1>是',
  `isinstallation` tinyint(1) UNSIGNED NOT NULL COMMENT '上门安装？0>否，1>是',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态？0>未评价，1>已评价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `indent_goods`
--

INSERT INTO `indent_goods` (`id`, `iid`, `gid`, `goods_name`, `goods_specification`, `goods_model`, `goods_price`, `quantity`, `isdelivery`, `isinstallation`, `status`) VALUES
(6, 4, 14, '雅庭尚品非洲圆盘豆纯实木地板原木本色钢琴烤漆实木地板厂家直销', 'AAA', 'V1', '0.03', 1, 1, 1, 1),
(7, 5, 15, '金刚石瓷砖地砖800x800客厅釉砖磁砖全抛釉地砖防滑墙砖地板瓷砖', 'AAA', 'V1', '0.02', 1, 1, 1, 0),
(8, 6, 15, '金刚石瓷砖地砖800x800客厅釉砖磁砖全抛釉地砖防滑墙砖地板瓷砖', 'AAA', 'V1', '0.04', 1, 1, 1, 0),
(9, 7, 14, '雅庭尚品非洲圆盘豆纯实木地板原木本色钢琴烤漆实木地板厂家直销', 'AAA', 'V1', '0.03', 1, 1, 1, 0),
(10, 8, 14, '雅庭尚品非洲圆盘豆纯实木地板原木本色钢琴烤漆实木地板厂家直销', 'AAA', 'V1', '0.01', 1, 0, 0, 0),
(11, 9, 15, '金刚石瓷砖地砖800x800客厅釉砖磁砖全抛釉地砖防滑墙砖地板瓷砖', 'AAA', 'V1', '0.04', 1, 1, 1, 0),
(12, 10, 15, '金刚石瓷砖地砖800x800客厅釉砖磁砖全抛釉地砖防滑墙砖地板瓷砖', 'AAA', 'V1', '0.04', 2, 1, 1, 0),
(13, 11, 15, '金刚石瓷砖地砖800x800客厅釉砖磁砖全抛釉地砖防滑墙砖地板瓷砖', 'BBB', 'V1', '0.04', 1, 1, 1, 0),
(14, 12, 14, '雅庭尚品非洲圆盘豆纯实木地板原木本色钢琴烤漆实木地板厂家直销', 'AAA', 'V1', '0.03', 2, 1, 1, 0),
(15, 13, 15, '金刚石瓷砖地砖800x800客厅釉砖磁砖全抛釉地砖防滑墙砖地板瓷砖', 'AAA', 'V1', '0.04', 1, 1, 1, 0);

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
(1, 1, '张三', '020-8116788', '广东省广州市海珠区新港中路397号', '510000'),
(2, 2, '张三', '020-8116788', '广东省广州市海珠区新港中路397号', '510000'),
(3, 3, '张三', '020-8116788', '广东省广州市海珠区新港中路397号', '510000'),
(4, 4, '张三', '020-8116788', '广东省广州市海珠区新港中路397号', '510000'),
(5, 6, '张三', '020-8116788', '广东省广州市海珠区新港中路397号', '510000'),
(6, 7, '张三', '020-8116788', '广东省广州市海珠区新港中路397号', '510000'),
(7, 8, '张三', '020-8116788', '广东省广州市海珠区新港中路397号', '510000'),
(8, 9, '张三', '020-8116788', '广东省广州市海珠区新港中路397号', '510000'),
(9, 11, '张三', '020-8116788', '广东省广州市海珠区新港中路397号', '510000'),
(10, 12, '张三', '020-8116788', '广东省广州市海珠区新港中路397号', '510000'),
(11, 13, '张三', '020-8116788', '广东省广州市海珠区新港中路397号', '510000');

-- --------------------------------------------------------

--
-- 表的结构 `publicity`
--

CREATE TABLE `publicity` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '宣传表主键id',
  `img_path` varchar(255) NOT NULL COMMENT '图片路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wechat_user`
--

CREATE TABLE `wechat_user` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '微信用户表',
  `openid` varchar(64) NOT NULL COMMENT '唯一标识，openid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `wechat_user`
--

INSERT INTO `wechat_user` (`id`, `openid`) VALUES
(4, 'oIcMg0d7-_PvJlVVkp6rqz4p1kjg');

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
-- Indexes for table `discounts_add`
--
ALTER TABLE `discounts_add`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `wechat_user`
--
ALTER TABLE `wechat_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '后台用户表主键id', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '购物车表主键id', AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `discounts_add`
--
ALTER TABLE `discounts_add`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '优惠额度累计表主键id', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `discount_coupon`
--
ALTER TABLE `discount_coupon`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '优惠券表主键id', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品表主键id', AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `goods_category`
--
ALTER TABLE `goods_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品类别表主键id', AUTO_INCREMENT=38;

--
-- 使用表AUTO_INCREMENT `goods_cover`
--
ALTER TABLE `goods_cover`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品封面表主键id', AUTO_INCREMENT=52;

--
-- 使用表AUTO_INCREMENT `goods_estimate`
--
ALTER TABLE `goods_estimate`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品评价表主键id', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `goods_specification`
--
ALTER TABLE `goods_specification`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品规格表主键id', AUTO_INCREMENT=112;

--
-- 使用表AUTO_INCREMENT `group_goods`
--
ALTER TABLE `group_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '拼团商品表主键id', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `group_join`
--
ALTER TABLE `group_join`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '拼团加入表主键id', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `indent`
--
ALTER TABLE `indent`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单表主键id', AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `indent_goods`
--
ALTER TABLE `indent_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单商品表主键id', AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `indent_take_delivery`
--
ALTER TABLE `indent_take_delivery`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单收货表主键id', AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `publicity`
--
ALTER TABLE `publicity`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '宣传表主键id';

--
-- 使用表AUTO_INCREMENT `wechat_user`
--
ALTER TABLE `wechat_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信用户表', AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
