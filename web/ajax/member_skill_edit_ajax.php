<?php

require_once '../setting/config.php';
require_once '../setting/webapi.php';
require_once '../setting/tools.php';
require_once '../_func.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST')
    die();

if (IsMemberLogin() == false)
    die();

$sResult = false;
$msg = "System error 000";

if ($_POST["higi_id"] > 0 && $_POST["type"] != null) {
    $type = $_POST["type"];
    $result = true;
    $message = "Successful";
    $request = array("higi_id" => $_POST["higi_id"]);
    //新增/刪除登入會員招客秘笈
    $url = WEBAPI_MEMBER_LOGINMEMBERHIGI;
    if (CallAPI($type, $url, $_SESSION['MEMBER_ACCESSTOKEN'], json_encode($request), $resultMessage, $resultData) != 200) {
        $result = false;
        $message = $errorinfo;
    }
    $echoData = array("result" => $result, "message" => $resultMessage, "resultData" => $resultData);
    echo json_encode($echoData, JSON_UNESCAPED_UNICODE);
} else {
    die('{"result":false,"message":"未指定招客秘笈編號"}');
}



