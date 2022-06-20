<?php

require_once '../setting/config.php';
require_once '../setting/webapi.php';
require_once '../setting/tools.php';
require_once '../_func.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST')
    die();

$member_account = request_str("account");
$member_password = request_str("password");
$checkcode = request_str("checkcode");
$front_checkcode = $_SESSION["FRONT_CHECKCODE"];
if ($checkcode == "" || $front_checkcode == null || $front_checkcode == "" || $checkcode != $front_checkcode) {
    $echoData = array("result" => false, "msg" => "驗證碼錯誤");
    echo json_encode($echoData, JSON_UNESCAPED_UNICODE);
    exit();
}

unset($_SESSION["MEMBER_ACCESSTOKEN"]); //清除accesstoken

$result = false;
$resultMessage = "Bad Request";
$resultData = "未知的錯誤";
if (isset($member_account) && isset($member_password)) {
    //取得輸入的帳號及密碼
    $request = array("account" => $member_account, "password" => $member_password);
    //登入取得AccessToken
    if (CallAPI('POST', WEBAPI_MEMBER_LOGIN, null, json_encode($request), $resultMessage, $resultData) == 200) {
        if (array_key_exists('token', $resultData)) {
            $_SESSION["MEMBER_ACCESSTOKEN"] = $resultData['token'];
            if (CallAPI('GET', WEBAPI_MEMBER_LOGINMEMBERDATA, $_SESSION["MEMBER_ACCESSTOKEN"], NULL, $resultMessage, $resultData) == 200 && count($resultData) == 1) {
                $_SESSION["MEMBER_ID"] = $resultData[0]["id"];
                $_SESSION["MEMBER_ACCOUNT"] = $resultData[0]["account"];
                $_SESSION["MEMBER_NAME"] = $resultData[0]["name"];
                $_SESSION["MEMBER_PHONE"] = $resultData[0]["phone"];
                $_SESSION["MEMBER_EMAIL"] = $resultData[0]["email"];
                $result = true;
            } else {
                $resultMessage = "查詢會員資料失敗";
            }
        } else
            $resultMessage = "權杖錯誤";
    }
} else
    $resultMessage = "未知的錯誤";

if ($result == false) {
    unset($_SESSION["MEMBER_ID"]);
    unset($_SESSION["MEMBER_ACCESSTOKEN"]);
    unset($_SESSION["MEMBER_ACCOUNT"]);
    unset($_SESSION["MEMBER_NAME"]);
    unset($_SESSION["MEMBER_PHONE"]);
    unset($_SESSION["MEMBER_EMAIL"]);
}

$echoData = array("result" => $result, "msg" => $resultMessage);
echo json_encode($echoData, JSON_UNESCAPED_UNICODE);
