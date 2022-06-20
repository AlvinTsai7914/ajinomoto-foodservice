<?php

require_once '../setting/config.php';
require_once '../setting/webapi.php';
require_once '../setting/tools.php';
require_once '../_func.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST')
    die();

$account = request_str("account");
$password = request_str("password");
$name = request_str("name");
$gender = request_str("gender");
$birthday = "";
$phone = request_str("phone");
$restaurant_name = request_str("restaurant_name");
$restaurant_area_id = request_num("restaurant_area_id");
$restaurant_type = request_str("restaurant_type");
$status = 1;
$remark = "";

if ($account == "" || $password == "" || $name == "" || $gender == "" || $phone == "" || $restaurant_name == "" || $restaurant_area_id == "" || $restaurant_type == "")
    die('{"sResult":false,"msg":"' . "資料填寫不完整" . '"}');

//伺服器登入
$servertoken = WebServerLogin(API_ACCOUNT, API_PASSWORD);

//註冊會員
$data = array("account" => $account,
    "password" => $password,
    "name" => $name,
    "gender" => $gender,
    "birthday" => $birthday,
    "phone" => $phone,
    "restaurant_name" => $restaurant_name,
    "restaurant_area_id" => $restaurant_area_id,
    "restaurant_type" => $restaurant_type,
    "status" => $status,
    "remark" => $remark);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_MEMBER;
$method = "POST";

$sResult = false;
$resultMessage = "未知的錯誤";
$resultData = null;

if (CallAPI($method, $url, $servertoken, $jsondata, $resultMessage, $resultData) == 200) {
    $sResult = true;
    $resultMessage = "Successful";
}

//伺服器登出
WebServerLogout($servertoken);

//註冊成功發送Email
if ($sResult == true) {
    if (SendMemberAccountVerificationMail($account, $resultData['id'], $resultData['verification']) == true)
        $resultMessage = "會員註冊成功，請至註冊信箱收取帳號啟用信件，謝謝!";
    else
        $resultMessage = "會員註冊成功，但帳號啟用信件發送失敗，請與客服人員聯繫，我們將儘快為您處理，謝謝!";
}

$echoData = array("result" => $sResult, "msg" => $resultMessage);
echo json_encode($echoData, JSON_UNESCAPED_UNICODE);
