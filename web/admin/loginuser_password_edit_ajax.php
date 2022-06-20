<?php

require '_admin_config.php';
no_permission_json();

$old_password = request_str("old_password");
$new_password = request_str("new_password");

$data = array("old_password" => $old_password,
    "new_password" => $new_password);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_USER_LoginUserPassword;
$method = "PUT";

$sResult = false;
$msg = "未知的錯誤";
$resultData = null;

$result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
if ($result == 200) {
    $user_id = $resultData['id'];
    $sResult = true;
    $msg = "Successful";
}

$rows = array("sResult" => $sResult, "msg" => $msg);
echo json_encode($rows, JSON_UNESCAPED_UNICODE);
