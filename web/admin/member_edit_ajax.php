<?php

require '_admin_config.php';
no_permission_json();

$member_id = request_num("member_id");
$account = request_str("account");
$password = request_str("password");
$name = request_str("name");
$gender = request_num("gender");
$phone = request_str("phone");
$restaurant_name = request_str("restaurant_name");
$restaurant_area_id = request_num("restaurant_area_id");
$restaurant_type = request_str("restaurant_type");
$status = request_num("status");
$remark = request_str("remark");

if ($member_id == '')
    die('{"sResult":false,"msg":"會員編號錯誤"}');

if ($account == '')
    die('{"sResult":false,"msg":"帳號錯誤"}');

$data = array("account" => $account,
    "password" => $password,
    "name" => $name,
    "gender" => $gender,
    "birthday" => "",
    "phone" => $phone,
    "restaurant_name" => $restaurant_name,
    "restaurant_area_id" => $restaurant_area_id,
    "restaurant_type" => $restaurant_type,
    "status" => $status,
    "remark" => $remark);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_MEMBER;
$method = "POST";
if ($member_id != 0) {
    $url = $url . "/" . $member_id;
    $method = "PUT";
    $data = array("name" => $name,
        "gender" => $gender,
        "birthday" => $birthday,
        "phone" => $phone,
        "restaurant_name" => $restaurant_name,
        "restaurant_area_id" => $restaurant_area_id,
        "restaurant_type" => $restaurant_type,
        "status" => $status,
        "remark" => $remark);
}

$sResult = false;
$msg = "未知的錯誤";
$resultData = null;

$result = CallAPI($method, $url, $_SESSION["accesstoken"], $jsondata, $msg, $resultData);
if ($result == 200) {
    $sResult = true;
    $msg = "Successful";
}

$rows = array("sResult" => $sResult, "msg" => $msg);
echo json_encode($rows, JSON_UNESCAPED_UNICODE);
