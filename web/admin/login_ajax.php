<?php

require '_admin_config.php';

$user_account = request_str("user_account");
$user_password = request_str("user_password");
$checkcode = request_str("checkcode");

$checknum = $_SESSION['checknum'];

if ($checkcode == "" || $checknum == null || $checknum == "" || $checkcode != $checknum) {
    $echoData = array("result" => false, "msg" => "驗證碼錯誤");
    echo json_encode($echoData, JSON_UNESCAPED_UNICODE);
    exit();
}

unset($_SESSION['accesstoken']); //清除accesstoken

$result = false;
$resultMessage = "Bad Request";
$resultData = "無法取得Access Token";
if (isset($user_account) && isset($user_password)) {
    //取得輸入的帳號及密碼
    $request = array("account" => $user_account, "password" => $user_password);
    //登入取得AccessToken
    if (CallAPI('POST', WEBAPI_USER_Login, null, json_encode($request), $resultMessage, $resultData) == 200) {
        if (array_key_exists('token', $resultData)) {
            $_SESSION['accesstoken'] = $resultData['token'];
            if (CallAPI('GET', WEBAPI_USER_LoginUserData, $_SESSION['accesstoken'], NULL, $resultMessage, $resultData) == 200 && count($resultData) == 1) {
                $_SESSION['loginusername'] = $resultData[0]["name"];
                $_SESSION['loginip'] = $resultData[0]["last_login_ip"];
                $_SESSION['logintime'] = $resultData[0]["last_login_time"];
                $_SESSION['loginuserrole'] = $resultData[0]["roles"][0];
                $result = true;
            } else {
                $resultMessage = "無法取得使用者資料";
            }
        } else
            $resultMessage = "無法取得Access Token";
    }
} else
    $resultMessage = "系統錯誤";

if ($result == false) {
    unset($_SESSION['accesstoken']);
    unset($_SESSION['loginusername']);
    unset($_SESSION['loginip']);
    unset($_SESSION['logintime']);
    unset($_SESSION['loginuserrole']);
}

$echoData = array("result" => $result, "msg" => $resultMessage);
echo json_encode($echoData, JSON_UNESCAPED_UNICODE);
?>