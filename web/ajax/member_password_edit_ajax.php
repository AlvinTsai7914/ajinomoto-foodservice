<?php

require_once '../setting/config.php';
require_once '../setting/webapi.php';
require_once '../setting/tools.php';
require_once '../_func.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST')
    die();

if (IsMemberLogin() == false)
    die();

$old_password = request_str("old_password");
$new_password = request_str("new_password");

$data = array("old_password" => $old_password,
    "new_password" => $new_password);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_MEMBER_LOGINMEMBERPASSWORD;
$method = "PUT";

$sResult = false;
$msg = UI_UNKNOW_ERROR;
$resultData = null;

$result = CallAPI($method, $url, $_SESSION["MEMBER_ACCESSTOKEN"], $jsondata, $msg, $resultData);
if ($result == 200) {
    $sResult = true;
    $msg = "Successful";
}

$rows = array("sResult" => $sResult, "msg" => $msg);
echo json_encode($rows, JSON_UNESCAPED_UNICODE);
