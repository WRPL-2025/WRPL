-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2022 at 09:50 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13
-- Comment out or remove the following line as it's invalid in PostgreSQL

-- START TRANSACTION;

-- SET
--   time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

--
-- Database: `anycademy`
--
-- Commenting out database creation to avoid error if database already exists
-- CREATE DATABASE anycademy;
-- USE anycademy;

-- --------------------------------------------------------
--
-- Table structure for table `admin`
--
CREATE TABLE admin (
  id int NOT NULL,
  username varchar(255) NOT NULL,
  password text NOT NULL
);

--
-- Dumping data for table `admin`
--
INSERT INTO
  admin (id, username, password)
VALUES
  (
    1,
    'admin@gmail.com',
    '$2y$10$rmBnmFdpbtw4DatgAogaf.uAJp.EYQs8koJ.I7ThwspQw7SVYo3ce'
  );

-- --------------------------------------------------------
--
-- Table structure for table `assigned_orders`
--
CREATE TABLE assigned_orders (
  id int NOT NULL,
  od_id int NOT NULL,
  dv_id int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `business_type`
--
CREATE TABLE business_type (
  id int NOT NULL,
  type varchar(255) NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `cart`
--
CREATE TABLE cart (
  id int NOT NULL,
  u_id int NOT NULL,
  total float DEFAULT 0,
  is_applied int DEFAULT 0,
  promo float DEFAULT 0,
  is_add_w int DEFAULT 0,
  wl_amt float DEFAULT 0,
  final_amt float DEFAULT 0,
  ship_fee int DEFAULT 0,
  belonging_city int DEFAULT 0
);

-- --------------------------------------------------------
--
-- Table structure for table `cart_detail`
--
CREATE TABLE cart_detail (
  id int NOT NULL,
  cart_id int NOT NULL,
  p_id int NOT NULL,
  qty int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `categories`
--
CREATE TABLE categories (
  id int NOT NULL,
  category varchar(255) NOT NULL,
  status int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `city`
--
CREATE TABLE city (
  id int NOT NULL,
  s_id int NOT NULL,
  c_id int NOT NULL,
  city_name varchar(255) NOT NULL
);

-- ---------------------------------------------------------
--
-- Table structure for table `cnfrm_delivery`
--
CREATE TABLE cnfrm_delivery (
  id int NOT NULL,
  od_id int NOT NULL,
  dv_id int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `cnfrm_undelivery`
--
CREATE TABLE cnfrm_undelivery (
  id int NOT NULL,
  od_id int NOT NULL,
  dv_id int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `commission`
--
CREATE TABLE commission (
  id int NOT NULL,
  scat_id int NOT NULL,
  com float NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `country`
--
CREATE TABLE country (
  id int NOT NULL,
  cntry_name varchar(255) NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `dc`
--
CREATE TABLE dc (
  id int NOT NULL,
  dc float NOT NULL,
  pc float NOT NULL
);

-- --------------------------------------------------------
--
-- Dumping data for table `dc`
--
INSERT INTO
  dc (id, dc, pc)
VALUES
  (1, 0, 0);

--
-- Table structure for table `delivery_boy`
--
CREATE TABLE delivery_boy (
  id int NOT NULL,
  dv_name varchar(255) NOT NULL,
  dv_username varchar(255) NOT NULL,
  dv_password text NOT NULL,
  dv_email varchar(255) NOT NULL,
  dv_mobile varchar(255) NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `dv_time`
--
CREATE TABLE dv_time (
  id int NOT NULL,
  from_time varchar(100) NOT NULL,
  tto varchar(100) NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `filter`
--
CREATE TABLE filter (
  id int NOT NULL,
  subcat_id int NOT NULL,
  filter varchar(255) NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `isue`
--
CREATE TABLE isue (
  id int NOT NULL,
  oid int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `ofd`
--
CREATE TABLE ofd (
  id int NOT NULL,
  od_id int NOT NULL,
  dv_id int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `orders`
--
CREATE TABLE orders (
  id int NOT NULL,
  o_id text NOT NULL,
  u_id int NOT NULL,
  ad_id int DEFAULT 0,
  dv_date varchar(255) DEFAULT '',
  dv_time varchar(255) DEFAULT '',
  payment_type int DEFAULT 0,
  payment_status int DEFAULT 0,
  order_status int DEFAULT 0,
  mihpayid varchar(255) DEFAULT '',
  txnid varchar(255) DEFAULT '',
  payu_status varchar(255) DEFAULT '',
  total_amt float DEFAULT 0,
  ship_fee_order float DEFAULT 0,
  final_val float DEFAULT 0,
  isnew int DEFAULT 0,
  delivered_by int DEFAULT 0,
  u_cnfrm int DEFAULT 0,
  ptu int DEFAULT 0,
  udvc int DEFAULT 0,
  is_p_app int DEFAULT 0,
  is_w_ap int DEFAULT 0,
  prmo float DEFAULT 0,
  wlmt float DEFAULT 0
);

-- --------------------------------------------------------
--
-- Table structure for table `order_detail`
--
CREATE TABLE order_detail (
  id int NOT NULL,
  oid int NOT NULL,
  p_id int NOT NULL,
  qty int NOT NULL,
  hover int DEFAULT 0,
  rcvd int DEFAULT 0,
  delivered_qty int DEFAULT 0
);

-- --------------------------------------------------------
--
-- Table structure for table `order_status`
--
CREATE TABLE order_status (
  id int NOT NULL,
  o_status varchar(255) NOT NULL
);

--
-- Dumping data for table `order_status`
--
INSERT INTO
  order_status (id, o_status)
VALUES
  (1, 'Placing'),
  (2, 'Placed'),
  (3, 'Assigned'),
  (4, 'Out for delivery'),
  (5, 'Delivered'),
  (6, 'Undelivered'),
  (7, 'Issue');

-- --------------------------------------------------------
--
-- Table structure for table `order_stlmnt`
--
CREATE TABLE order_stlmnt (
  id int NOT NULL,
  oid int NOT NULL,
  sid int NOT NULL,
  val float DEFAULT 0,
  sc float DEFAULT 0
);

-- --------------------------------------------------------
--
-- Table structure for table `order_time`
--
DROP TABLE IF EXISTS order_time;
CREATE TABLE order_time (
  id int NOT NULL,
  oid int NOT NULL,
  o_status int NOT NULL,
  added_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------
--
-- Table structure for table `pin`
--
CREATE TABLE pin (
  id int NOT NULL,
  c_id int NOT NULL,
  s_id int NOT NULL,
  cn_id int NOT NULL,
  pincode varchar(255) NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `product`
--
CREATE TABLE product (
  id int NOT NULL,
  cat_id int NOT NULL,
  scat_id int NOT NULL,
  product_name varchar(255) NOT NULL,
  img1 varchar(255) NOT NULL,
  img2 varchar(255) NOT NULL,
  img3 varchar(255) NOT NULL,
  img4 varchar(255) NOT NULL,
  price float NOT NULL,
  sell_price float NOT NULL,
  fa float NOT NULL,
  shrt_desc text NOT NULL,
  description text NOT NULL,
  qty int NOT NULL,
  disclaimer text NOT NULL,
  isappp int NOT NULL,
  isnew int NOT NULL,
  bs int NOT NULL,
  status int NOT NULL,
  added_by int NOT NULL,
  belonging_city int NOT NULL,
  tax float NOT NULL,
  sku varchar(255) NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `product_ad_on`
--
CREATE TABLE product_ad_on (
  id int NOT NULL,
  pid int NOT NULL,
  added_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP 
);

-- --------------------------------------------------------
--
-- Table structure for table `promo`
--
CREATE TABLE promo (
  id int NOT NULL,
  code varchar(60) NOT NULL,
  dis float NOT NULL,
  minbal float NOT NULL,
  scat int NOT NULL,
  adb int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `p_filter`
--
CREATE TABLE p_filter (
  id int NOT NULL,
  pid int NOT NULL,
  fid int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `p_reject`
--
CREATE TABLE p_reject (
  id int NOT NULL,
  product_id int NOT NULL,
  cause text NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `p_sfilter`
--
CREATE TABLE p_sfilter (
  id int NOT NULL,
  pid int NOT NULL,
  sfid int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `rejection`
--
CREATE TABLE rejection (
  id int NOT NULL,
  s_id int NOT NULL,
  reason text NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `sellers`
--
CREATE TABLE sellers (
  id int NOT NULL,
  email varchar(255) DEFAULT '',
  password text NOT NULL,
  mobile varchar(50) DEFAULT '',
  f_name varchar(255) DEFAULT '',
  address varchar(255) DEFAULT '',
  tob int DEFAULT 0,
  country int DEFAULT 0,
  state int DEFAULT 0,
  city int DEFAULT 0,
  pin int DEFAULT 0,
  b_name varchar(255) DEFAULT '',
  b_crft varchar(255) DEFAULT '',
  is_gst int DEFAULT 0,
  gst_id varchar(255) DEFAULT '',
  gst_crft varchar(255) DEFAULT '',
  acc_num varchar(255) DEFAULT '',
  acc_holder varchar(255) DEFAULT '',
  ifsc varchar(255) DEFAULT '',
  bank varchar(255) DEFAULT '',
  branch varchar(255) DEFAULT '',
  isapp int DEFAULT 0,
  is_new int NOT NULL,
  is_cp int DEFAULT 0,
  adhar varchar(255) DEFAULT '',
  pan varchar(255) DEFAULT '',
  status int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `seller_wallet`
--
CREATE TABLE seller_wallet (
  id int NOT NULL,
  seller_id int NOT NULL,
  ballance float NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `seller_w_msg`
--
CREATE TABLE seller_w_msg (
  id int NOT NULL,
  s_id int NOT NULL,
  cod int NOT NULL,
  msg text NOT NULL,
  balance float NOT NULL,
  added_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  is_new int NOT NULL DEFAULT 0
);

-- --------------------------------------------------------
--
-- Table structure for table `state`
--
CREATE TABLE state (
  id int NOT NULL,
  c_id int NOT NULL,
  state_name varchar(255) NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `subcategories`
--
CREATE TABLE subcategories (
  id int NOT NULL,
  cat_id int NOT NULL,
  subcat varchar(255) NOT NULL,
  status int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `sub_filter`
--
CREATE TABLE sub_filter (
  id int NOT NULL,
  filter_id int NOT NULL,
  subfilter varchar(255) NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE users (
  id int NOT NULL,
  email varchar(255) DEFAULT '',
  password text DEFAULT '',
  mobile varchar(255) DEFAULT '',
  name varchar(255) DEFAULT '',
  m_vfd int DEFAULT 0,
  e_vfd int DEFAULT 0,
  status int DEFAULT 0
);

-- --------------------------------------------------------
--
-- Table structure for table `user_address`
--
CREATE TABLE user_address (
  id int NOT NULL,
  uid int NOT NULL,
  type_ad varchar(255) NOT NULL,
  user_name varchar(255) NOT NULL,
  user_mobile varchar(255) NOT NULL,
  user_city int NOT NULL,
  user_add varchar(255) NOT NULL,
  user_pin varchar(255) NOT NULL,
  user_local varchar(255) NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `user_wallet`
--
CREATE TABLE user_wallet (
  id int NOT NULL,
  user_id int NOT NULL,
  ballance float NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `user_w_msg`
--
CREATE TABLE user_w_msg (
  id int NOT NULL,
  u_id int NOT NULL,
  cod int NOT NULL,
  msg text NOT NULL,
  balance float NOT NULL,
  added_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  is_new int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `wishlist`
--
CREATE TABLE wishlist (
  id int NOT NULL,
  u_id int NOT NULL,
  p_id int NOT NULL
);

-- --------------------------------------------------------
--
-- Table structure for table `witdraw_req`
--
CREATE TABLE witdraw_req (
  id int NOT NULL,
  s_id int NOT NULL,
  amount_w float NOT NULL,
  amount_r float NOT NULL,
  isnew int NOT NULL DEFAULT 0
);

--
-- Indexes for dumped tables
--
--
-- Indexes for table `admin`
--
ALTER TABLE
  admin
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `assigned_orders`
--
ALTER TABLE
  assigned_orders
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `business_type`
--
ALTER TABLE
  business_type
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `cart`
--
ALTER TABLE
  cart
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `cart_detail`
--
ALTER TABLE
  cart_detail
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `categories`
--
ALTER TABLE
  categories
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `city`
--
ALTER TABLE
  city
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `cnfrm_delivery`
--
ALTER TABLE
  cnfrm_delivery
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `cnfrm_undelivery`
--
ALTER TABLE
  cnfrm_undelivery
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `commission`
--
ALTER TABLE
  commission
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `country`
--
ALTER TABLE
  country
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `dc`
--
ALTER TABLE
  dc
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `delivery_boy`
--
ALTER TABLE
  delivery_boy
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `dv_time`
--
ALTER TABLE
  dv_time
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `filter`
--
ALTER TABLE
  filter
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `isue`
--
ALTER TABLE
  isue
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `ofd`
--
ALTER TABLE
  ofd
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `orders`
--
ALTER TABLE
  orders
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `order_detail`
--
ALTER TABLE
  order_detail
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `order_status`
--
ALTER TABLE
  order_status
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `order_stlmnt`
--
ALTER TABLE
  order_stlmnt
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `order_time`
--
ALTER TABLE
  order_time
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `pin`
--
ALTER TABLE
  pin
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `product`
--
ALTER TABLE
  product
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `product_ad_on`
--
ALTER TABLE
  product_ad_on
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `promo`
--
ALTER TABLE
  promo
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `p_filter`
--
ALTER TABLE
  p_filter
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `p_reject`
--
ALTER TABLE
  p_reject
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `p_sfilter`
--
ALTER TABLE
  p_sfilter
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `rejection`
--
ALTER TABLE
  rejection
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `sellers`
--
ALTER TABLE
  sellers
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `seller_wallet`
--
ALTER TABLE
  seller_wallet
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `seller_w_msg`
--
ALTER TABLE
  seller_w_msg
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `state`
--
ALTER TABLE
  state
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `subcategories`
--
ALTER TABLE
  subcategories
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `sub_filter`
--
ALTER TABLE
  sub_filter
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `users`
--
ALTER TABLE
  users
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `user_address`
--
ALTER TABLE
  user_address
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `user_wallet`
--
ALTER TABLE
  user_wallet
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `user_w_msg`
--
ALTER TABLE
  user_w_msg
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `wishlist`
--
ALTER TABLE
  wishlist
ADD
  PRIMARY KEY (id);

--
-- Indexes for table `witdraw_req`
--
ALTER TABLE
  witdraw_req
ADD
  PRIMARY KEY (id);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE admin
ALTER COLUMN id SET NOT NULL;

CREATE SEQUENCE IF NOT EXISTS admin_id_seq START WITH 1;
ALTER SEQUENCE admin_id_seq RESTART WITH 2;

-- Corrected sequences creation block:
CREATE SEQUENCE IF NOT EXISTS admin_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS assigned_orders_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS business_type_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS cart_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS cart_detail_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS categories_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS city_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS cnfrm_delivery_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS cnfrm_undelivery_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS commission_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS country_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS dc_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS delivery_boy_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS dv_time_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS filter_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS isue_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS ofd_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS orders_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS order_detail_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS order_status_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS order_stlmnt_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS order_time_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS pin_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS product_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS product_ad_on_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS promo_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS p_filter_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS p_reject_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS p_sfilter_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS rejection_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS sellers_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS seller_wallet_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS seller_w_msg_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS state_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS subcategories_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS sub_filter_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS users_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS user_address_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS user_wallet_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS user_w_msg_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS wishlist_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS witdraw_req_id_seq START WITH 1;

--
-- AUTO_INCREMENT for table `assigned_orders`
--
ALTER TABLE assigned_orders 
ALTER COLUMN id SET NOT NULL;

-- Add the missing sequence before setting the DEFAULT value:
CREATE SEQUENCE IF NOT EXISTS assigned_orders_id_seq START WITH 1;

ALTER TABLE assigned_orders 
ALTER COLUMN id SET DEFAULT nextval('assigned_orders_id_seq');

-- AUTO_INCREMENT for table `business_type`
ALTER TABLE business_type ALTER COLUMN id SET NOT NULL;
ALTER TABLE business_type ALTER COLUMN id SET DEFAULT nextval('business_type_id_seq');

-- AUTO_INCREMENT for table `cart`
ALTER TABLE cart ALTER COLUMN id SET NOT NULL;
ALTER TABLE cart ALTER COLUMN id SET DEFAULT nextval('cart_id_seq');

-- AUTO_INCREMENT for table `cart_detail`
ALTER TABLE cart_detail ALTER COLUMN id SET NOT NULL;
ALTER TABLE cart_detail ALTER COLUMN id SET DEFAULT nextval('cart_detail_id_seq');

-- AUTO_INCREMENT for table `categories`
ALTER TABLE categories ALTER COLUMN id SET NOT NULL;
ALTER TABLE categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq');

-- AUTO_INCREMENT for table `city`
ALTER TABLE city ALTER COLUMN id SET NOT NULL;
ALTER TABLE city ALTER COLUMN id SET DEFAULT nextval('city_id_seq');

-- AUTO_INCREMENT for table `cnfrm_delivery`
ALTER TABLE cnfrm_delivery ALTER COLUMN id SET NOT NULL;
ALTER TABLE cnfrm_delivery ALTER COLUMN id SET DEFAULT nextval('cnfrm_delivery_id_seq');

-- AUTO_INCREMENT for table `cnfrm_undelivery`
ALTER TABLE cnfrm_undelivery ALTER COLUMN id SET NOT NULL;
ALTER TABLE cnfrm_undelivery ALTER COLUMN id SET DEFAULT nextval('cnfrm_undelivery_id_seq');

-- AUTO_INCREMENT for table `commission`
ALTER TABLE commission ALTER COLUMN id SET NOT NULL;
ALTER TABLE commission ALTER COLUMN id SET DEFAULT nextval('commission_id_seq');

-- AUTO_INCREMENT for table `country`
ALTER TABLE country ALTER COLUMN id SET NOT NULL;
ALTER TABLE country ALTER COLUMN id SET DEFAULT nextval('country_id_seq');

-- AUTO_INCREMENT for table `dc`
ALTER TABLE dc ALTER COLUMN id SET NOT NULL;
ALTER TABLE dc ALTER COLUMN id SET DEFAULT nextval('dc_id_seq');

-- AUTO_INCREMENT for table `delivery_boy`
ALTER TABLE delivery_boy ALTER COLUMN id SET NOT NULL;
ALTER TABLE delivery_boy ALTER COLUMN id SET DEFAULT nextval('delivery_boy_id_seq');

-- AUTO_INCREMENT for table `dv_time`
ALTER TABLE dv_time ALTER COLUMN id SET NOT NULL;
ALTER TABLE dv_time ALTER COLUMN id SET DEFAULT nextval('dv_time_id_seq');

-- AUTO_INCREMENT for table `filter`
ALTER TABLE filter ALTER COLUMN id SET NOT NULL;
ALTER TABLE filter ALTER COLUMN id SET DEFAULT nextval('filter_id_seq');

-- AUTO_INCREMENT for table `isue`
ALTER TABLE isue ALTER COLUMN id SET NOT NULL;
ALTER TABLE isue ALTER COLUMN id SET DEFAULT nextval('isue_id_seq');

-- AUTO_INCREMENT for table `ofd`
ALTER TABLE ofd ALTER COLUMN id SET NOT NULL;
ALTER TABLE ofd ALTER COLUMN id SET DEFAULT nextval('ofd_id_seq');

-- AUTO_INCREMENT for table `orders`
ALTER TABLE orders ALTER COLUMN id SET NOT NULL;
ALTER TABLE orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq');

-- AUTO_INCREMENT for table `order_detail`
ALTER TABLE order_detail ALTER COLUMN id SET NOT NULL;
ALTER TABLE order_detail ALTER COLUMN id SET DEFAULT nextval('order_detail_id_seq');

-- AUTO_INCREMENT for table `order_status`
ALTER TABLE order_status ALTER COLUMN id SET NOT NULL;
ALTER TABLE order_status ALTER COLUMN id SET DEFAULT nextval('order_status_id_seq');

-- Set AUTO_INCREMENT value for `order_status`
ALTER SEQUENCE order_status_id_seq RESTART WITH 8;

-- AUTO_INCREMENT for table `order_stlmnt`
ALTER TABLE order_stlmnt ALTER COLUMN id SET NOT NULL;
ALTER TABLE order_stlmnt ALTER COLUMN id SET DEFAULT nextval('order_stlmnt_id_seq');

-- AUTO_INCREMENT for table `order_time`
ALTER TABLE order_time ALTER COLUMN id SET NOT NULL;
ALTER TABLE order_time ALTER COLUMN id SET DEFAULT nextval('order_time_id_seq');

-- AUTO_INCREMENT for table `pin`
ALTER TABLE pin ALTER COLUMN id SET NOT NULL;
ALTER TABLE pin ALTER COLUMN id SET DEFAULT nextval('pin_id_seq');

-- AUTO_INCREMENT for table `product`
ALTER TABLE product ALTER COLUMN id SET NOT NULL;
ALTER TABLE product ALTER COLUMN id SET DEFAULT nextval('product_id_seq');

-- AUTO_INCREMENT for table `product_ad_on`
ALTER TABLE product_ad_on ALTER COLUMN id SET NOT NULL;
ALTER TABLE product_ad_on ALTER COLUMN id SET DEFAULT nextval('product_ad_on_id_seq');

-- AUTO_INCREMENT for table `promo`
ALTER TABLE promo ALTER COLUMN id SET NOT NULL;
ALTER TABLE promo ALTER COLUMN id SET DEFAULT nextval('promo_id_seq');

-- AUTO_INCREMENT for table `p_filter`
ALTER TABLE p_filter ALTER COLUMN id SET NOT NULL;
ALTER TABLE p_filter ALTER COLUMN id SET DEFAULT nextval('p_filter_id_seq');

-- AUTO_INCREMENT for table `p_reject`
ALTER TABLE p_reject ALTER COLUMN id SET NOT NULL;
ALTER TABLE p_reject ALTER COLUMN id SET DEFAULT nextval('p_reject_id_seq');

-- AUTO_INCREMENT for table `p_sfilter`
ALTER TABLE p_sfilter ALTER COLUMN id SET NOT NULL;
ALTER TABLE p_sfilter ALTER COLUMN id SET DEFAULT nextval('p_sfilter_id_seq');

-- AUTO_INCREMENT for table `rejection`
ALTER TABLE rejection ALTER COLUMN id SET NOT NULL;
ALTER TABLE rejection ALTER COLUMN id SET DEFAULT nextval('rejection_id_seq');

-- AUTO_INCREMENT for table `sellers`
ALTER TABLE sellers ALTER COLUMN id SET NOT NULL;
ALTER TABLE sellers ALTER COLUMN id SET DEFAULT nextval('sellers_id_seq');

-- AUTO_INCREMENT for table `seller_wallet`
ALTER TABLE seller_wallet ALTER COLUMN id SET NOT NULL;
ALTER TABLE seller_wallet ALTER COLUMN id SET DEFAULT nextval('seller_wallet_id_seq');

-- AUTO_INCREMENT for table `seller_w_msg`
ALTER TABLE seller_w_msg ALTER COLUMN id SET NOT NULL;
ALTER TABLE seller_w_msg ALTER COLUMN id SET DEFAULT nextval('seller_w_msg_id_seq');

-- AUTO_INCREMENT for table `state`
ALTER TABLE state ALTER COLUMN id SET NOT NULL;
ALTER TABLE state ALTER COLUMN id SET DEFAULT nextval('state_id_seq');

-- AUTO_INCREMENT for table `subcategories`
ALTER TABLE subcategories ALTER COLUMN id SET NOT NULL;
ALTER TABLE subcategories ALTER COLUMN id SET DEFAULT nextval('subcategories_id_seq');

-- AUTO_INCREMENT for table `sub_filter`
ALTER TABLE sub_filter ALTER COLUMN id SET NOT NULL;
ALTER TABLE sub_filter ALTER COLUMN id SET DEFAULT nextval('sub_filter_id_seq');

-- AUTO_INCREMENT for table `users`
ALTER TABLE users ALTER COLUMN id SET NOT NULL;
ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq');

-- AUTO_INCREMENT for table `user_address`
ALTER TABLE user_address ALTER COLUMN id SET NOT NULL;
ALTER TABLE user_address ALTER COLUMN id SET DEFAULT nextval('user_address_id_seq');

-- AUTO_INCREMENT for table `user_wallet`
ALTER TABLE user_wallet ALTER COLUMN id SET NOT NULL;
ALTER TABLE user_wallet ALTER COLUMN id SET DEFAULT nextval('user_wallet_id_seq');

-- AUTO_INCREMENT for table `user_w_msg`
ALTER TABLE user_w_msg ALTER COLUMN id SET NOT NULL;
ALTER TABLE user_w_msg ALTER COLUMN id SET DEFAULT nextval('user_w_msg_id_seq');

-- AUTO_INCREMENT for table `wishlist`
ALTER TABLE wishlist ALTER COLUMN id SET NOT NULL;
ALTER TABLE wishlist ALTER COLUMN id SET DEFAULT nextval('wishlist_id_seq');

-- AUTO_INCREMENT for table `witdraw_req`
ALTER TABLE witdraw_req ALTER COLUMN id SET NOT NULL;
ALTER TABLE witdraw_req ALTER COLUMN id SET DEFAULT nextval('witdraw_req_id_seq');

-- COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;