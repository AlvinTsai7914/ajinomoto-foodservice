<?php

require '_admin_config.php';
no_permission_json();

$user_id = request_num("user_id");
$account = request_str("account");
$password = request_str("password");
$name = request_str("name");
$email = request_str("email");
$phone = request_str("phone");
$status = request_num("status");
$remark = request_str("remark");
$roles = request_arr("roles");
$edit_password = request_str("edit_password");

if ($user_id == '')
    die('{"sResult":false,"msg":"使用者編號錯誤"}');

if ($name == '')
    die('{"sResult":false,"msg":"使用者姓名錯誤"}');

$data = array("account" => $account,
    "password" => $password,
    "name" => $name,
    "email" => $email,
    "phone" => $phone,
    "status" => $status,
    "remark" => $remark);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_USER;
$method = "POST";
if ($user_id != 0) {
    $url = $url . "/" . $user_id;
    $method = "PUT";
}

$sResult = false;
$msg = "未知的錯誤";
$resultData = null;

$result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
if ($result == 200) {
    $user_id = $resultData['id'];
    $first = true;
    foreach ($roles as $role) {
        $data = array("user_id" => $user_id,
            "role_id" => $role,
            "unregisterall" => $first);
        $jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);
        $url = WEBAPI_USER_RegisterRole;
        $method = "POST";
        $result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
        $first = false;
    }

    $sResult = true;
    $msg = "Successful";

    if (($user_id != 0) && $edit_password === "1" && !empty($password)) {
        //修改使用者密碼
        $data = array("password" => $password);
        $jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);
        $url = WEBAPI_USER_Password . "/" . $user_id;
        $method = "PUT";
        $result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
        if ($result == 200) {
            $sResult = true;
            $msg = "Successful";
        }
    }
}

$rows = array("sResult" => $sResult, "msg" => $msg);
echo json_encode($rows, JSON_UNESCAPED_UNICODE);
