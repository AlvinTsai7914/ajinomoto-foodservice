<?php

//設定錯誤報告級別
error_reporting(E_ALL);

//更改php.ini的內容
ini_set('display_errors', '0');             # 0不顯示 1顯示
ini_set('display_startup_errors', '0');
ini_set("session.cookie_httponly", '1');

//時區設定
date_default_timezone_set("Asia/Taipei");

//設定內部文字編碼
mb_internal_encoding("UTF-8");

//設定session名稱
session_name("foodservice");

//開啟瀏覽器輸出緩衝區
ob_start();

//啟用session
session_start();

//向client發送原始的HTTP表頭
header("Content-type: text/html; charset=utf-8");

//SMTP設定
const SMTP_SSL = true;
const SMTP_HOST = "smtp.gmail.com";
const SMTP_PORT = "465";    //465
const SMTP_AUTH = true;
const SMTP_ID = "ksdeveloper405@gmail.com";
const SMTP_PW = "1234@abcd";
const SERVICE_NAME = "vic";
const SERVICE_MAIL = "ksdeveloper405@gmail.com";
const RECIPIENT_MAIL = 'vic@ks-design.com.tw,vicwu0717@gmail.com';
//開發
const API_ACCOUNT = "web_server";
const API_PASSWORD = "web_server@ks";
const API_SERVER = 'http://localhost:8087'; //WebAPI連線設定
const API_BASEURL = '/webapi';
const BASE_PATH = '';
const UPLOAD_PATH = '/uploads/';     //HTML編輯器檔案上傳路徑設定
const EDITOR_UPLOAD_PATH = '/uploads/editor/';     //HTML編輯器檔案上傳路徑設定
const BANNER_UPLOAD_PATH = '/uploads/banner/';     //首頁Banner檔案上傳路徑設定
const AD_UPLOAD_PATH = '/uploads/ad/';     //廣告檔案上傳路徑設定
const CAMPAIGN_UPLOAD_PATH = '/uploads/campaign/';     //餐飲情報檔案上傳路徑設定
const BRAND_UPLOAD_PATH = '/uploads/brand/';     //品牌檔案上傳路徑設定
const PRODUCT_UPLOAD_PATH = '/uploads/product/';     //商品檔案上傳路徑設定
const REPICEPRO_UPLOAD_PATH = '/uploads/repicepro/';     //專業食譜檔案上傳路徑設定
const HIGI_UPLOAD_PATH = '/uploads/higi/';     //招客秘笈檔案上傳路徑設定
//測試
//const API_ACCOUNT = "web_server";
//const API_PASSWORD = "web_server@ks";
//const API_SERVER = 'http://localhost:8087'; //WebAPI連線設定
//const API_BASEURL = '/webapi';
//const BASE_PATH = '';
//const UPLOAD_PATH = '/uploads/';     //HTML編輯器檔案上傳路徑設定
//const EDITOR_UPLOAD_PATH = '/uploads/editor/';     //HTML編輯器檔案上傳路徑設定
//const BANNER_UPLOAD_PATH = '/uploads/banner/';     //首頁Banner檔案上傳路徑設定
//const AD_UPLOAD_PATH = '/uploads/ad/';     //廣告檔案上傳路徑設定
//const CAMPAIGN_UPLOAD_PATH = '/uploads/campaign/';     //餐飲情報檔案上傳路徑設定
//const BRAND_UPLOAD_PATH = '/uploads/brand/';     //品牌檔案上傳路徑設定
//const PRODUCT_UPLOAD_PATH = '/uploads/product/';     //商品檔案上傳路徑設定
//const REPICEPRO_UPLOAD_PATH = '/uploads/repicepro/';     //專業食譜檔案上傳路徑設定
//const HIGI_UPLOAD_PATH = '/uploads/higi/';     //招客秘笈檔案上傳路徑設定

$sys_site_title = 'Foodservcie';
$sys_copyright = "Copyright © 2020 AJINOMOTO TAIWAN INC. All rights reserved.";
?>