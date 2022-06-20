<?php

require_once '../setting/config.php';
require_once '../setting/webapi.php';
require_once '../setting/tools.php';
require_once '../_func.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST')
    die();

$resultMessage = "";
$resultData = "";
$result = true;
if (IsMemberLogin()) {
    CallAPI('POST', WEBAPI_MEMBER_LOGOUT, $_SESSION["MEMBER_ACCESSTOKEN"], NULL, $resultMessage, $resultData);
}

unset($_SESSION["MEMBER_ID"]);
unset($_SESSION["MEMBER_ACCESSTOKEN"]);
unset($_SESSION["MEMBER_ACCOUNT"]);
unset($_SESSION["MEMBER_NAME"]);
unset($_SESSION["MEMBER_PHONE"]);
unset($_SESSION["MEMBER_EMAIL"]);

$echoData = array("result" => $result, "msg" => $resultMessage);

echo json_encode($echoData, JSON_UNESCAPED_UNICODE);
