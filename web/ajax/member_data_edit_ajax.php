<?php

require_once '../setting/config.php';
require_once '../setting/webapi.php';
require_once '../setting/tools.php';
require_once '../_func.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST')
    die();

if (IsMemberLogin() == false)
    die();

$name = request_str("name");
$gender = request_num("gender");
$birthday = "";
$phone = request_str("phone");
$restaurant_name = request_str("restaurant_name");
$restaurant_area_id = request_num("restaurant_area_id");
$restaurant_type = request_str("restaurant_type");

$data = array("name" => $name,
    "gender" => $gender,
    "birthday" => $birthday,
    "phone" => $phone,
    "restaurant_name" => $restaurant_name,
    "restaurant_area_id" => $restaurant_area_id,
    "restaurant_type" => $restaurant_type);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_MEMBER_LOGINMEMBERDATA;
$method = "PUT";

$sResult = false;
$msg = UI_UNKNOW_ERROR;
$resultData = null;

$result = CallAPI($method, $url, $_SESSION["MEMBER_ACCESSTOKEN"], $jsondata, $msg, $resultData);
if ($result == 200) {
    $sResult = true;
    $msg = "Successful";

    $_SESSION["MEMBER_NAME"] = $name;
    $_SESSION["MEMBER_PHONE"] = $phone;
    $_SESSION["MEMBER_EMAIL"] = $email;
}

$rows = array("sResult" => $sResult, "msg" => $msg);
echo json_encode($rows, JSON_UNESCAPED_UNICODE);
