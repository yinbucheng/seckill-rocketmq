CREATE TABLE if not exists  t_seckill_product (
  id int primary key auto_increment,
  gmt_create datetime NOT NULL DEFAULT now(),
  gmt_update datetime NOT NULL DEFAULT now(),
  prod_id varchar(225) NOT NULL DEFAULT '-1' COMMENT '商品id',
  prod_name varchar(50) NOT NULL DEFAULT '-1' COMMENT '商品名称',
  prod_status int NOT NULL DEFAULT '0' COMMENT '商品状态,0-上架，1-下架',
  prod_stock int NOT NULL DEFAULT '0' COMMENT '商品库存',
  prod_price DECIMAL(10, 3) NOT NULL DEFAULT  '0.000' COMMENT '商品售价',
  version int NOT NULL DEFAULT '0' COMMENT '更新版本号'
);

CREATE TABLE if not exists `t_seckill_order` (
  id int primary key auto_increment,
  gmt_create datetime NOT NULL DEFAULT now(),
  gmt_update datetime NOT NULL DEFAULT now(),
  record_status tinyint NOT NULL DEFAULT '0' COMMENT '记录状态 0 正常 1 已删除',
  order_id varchar(225) NOT NULL DEFAULT '-1' COMMENT '代理商订单号',
  order_status tinyint NOT NULL DEFAULT '1' COMMENT '订单状态，1 初始化 2 处理中 3 失败 0 成功',
  user_phoneno varchar(50) NOT NULL DEFAULT '-1' COMMENT '用户手机号',
  prod_id varchar(225) NOT NULL DEFAULT '-1' COMMENT '商品id',
  prod_name varchar(50) NOT NULL DEFAULT '-1' COMMENT '商品名称',
  charge_money decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '交易金额',
  charge_time datetime DEFAULT NULL COMMENT '订单下单时间',
  finish_time datetime DEFAULT NULL COMMENT '订单结束时间'
);