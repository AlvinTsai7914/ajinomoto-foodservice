<?php

require '_admin_config.php';
no_permission_json();

$name = request_str("name");
$email = request_str("email");
$phone = request_str("phone");

if ($name == '')
    die('{"sResult":false,"msg":"使用者姓名錯誤"}');

$data = array("name" => $name,
    "email" => $email,
    "phone" => $phone);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_USER_LoginUserData;
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
