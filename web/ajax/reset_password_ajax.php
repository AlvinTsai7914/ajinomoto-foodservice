<?php

require_once '../setting/config.php';
require_once '../setting/webapi.php';
require_once '../setting/tools.php';
require_once '../_func.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST')
    die();

$member_id = request_num("member_id");
$verification = request_str("verification");
$password = request_str("password");
if ($member_id == "")
    die('{"sResult":false,"msg":"會員編號錯誤"}');
if ($verification == "")
    die('{"sResult":false,"msg":"驗證資料錯誤"}');

//伺服器登入
$servertoken = WebServerLogin(API_ACCOUNT, API_PASSWORD);

//查詢會員帳號
$sResult = false;
$resultMessage = "未知的錯誤";
$members = null;
$querystring = "id='" . $member_id . "'";
$querystring .= " AND verification='" . $verification . "'";
$url = WEBAPI_MEMBER . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, $servertoken, null, $resultMessage, $members) == 200) {
    if (count($members) == 1) {
        $verification_flag = true;
    } else
        die('{"sResult":false,"msg":"驗證資料錯誤"}');
}

$data = array("password" => $password);
$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_MEMBER_PASSWORD . "/" . $member_id;
$method = "PUT";

$resultData = null;
$result = CallAPI($method, $url, $servertoken, $jsondata, $resultMessage, $resultData);
if ($result == 200) {
    $sResult = true;
    $msg = "Successful";
}

//伺服器登出
WebServerLogout($servertoken);

$rows = array("sResult" => $sResult, "msg" => $msg);
echo json_encode($rows, JSON_UNESCAPED_UNICODE);
