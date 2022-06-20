<?php

require_once '../setting/config.php';
require_once '../setting/webapi.php';
require_once '../setting/tools.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST')
    die();

$member_account = request_str("account");
if ($member_account == "")
    die('{"sResult":false,"msg":"帳號錯誤"}');

//伺服器登入
$servertoken = WebServerLogin(API_ACCOUNT, API_PASSWORD);

//查詢會員
$sResult = false;
$resultMessage = "未知的錯誤";
$resultData = null;
$querystring = "account='" . $member_account . "'";
$url = WEBAPI_MEMBER . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, $servertoken, null, $resultMessage, $resultData) == 200) {
    if (count($resultData) == 1) {
        $sResult = true;
        $resultMessage = "Successful";
    } else {
        $sResult = false;
        $resultMessage = "無此帳號資料";
    }
}
//伺服器登出
WebServerLogout($servertoken);

//註冊成功發送Email
if ($sResult == true) {
    if ($resultData[0]['status'] == 1) {
        if (SendMemberAccountVerificationMail($member_account, $resultData[0]['id'], $resultData[0]['verification']) == true)
            $resultMessage = "帳號驗證信發送成功";
        else
            $resultMessage = "帳號驗證信發送失敗";
    } else
        $resultMessage = "此帳號不需要驗證";
}

$echoData = array("result" => $sResult, "msg" => $resultMessage);
echo json_encode($echoData, JSON_UNESCAPED_UNICODE);
