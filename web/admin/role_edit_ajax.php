<?php

require '_admin_config.php';
no_permission_json();

$role_id = request_num("role_id");
$name = request_str("name");
$status = request_num("status");
$remark = request_str("remark");
$menus = request_arr('menu');
$programs = request_arr('program');

if ($role_id == '')
    die('{"sResult":false,"msg":"角色編號錯誤"}');

if ($name == '')
    die('{"sResult":false,"msg":"角色名稱錯誤"}');

$data = array("name" => $name,
    "status" => $status,
    "remark" => $remark);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_ROLE;
$method = "POST";
if ($role_id != 0) {
    $url = $url . "/" . $role_id;
    $method = "PUT";
}

$sResult = false;
$msg = "未知的錯誤";
$resultData = null;

$result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
if ($result == 200) {
    $role_id = $resultData['id'];
    $data = array("role_id" => $role_id);
    $jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

    $method = "POST";

    //註銷所有程式
    $url = WEBAPI_ROLE_UnregisterAllPrograms;
    $result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);

    //註冊預設程式
    $defaultprograms = array(31, 32, 33, 34, 35);
    $url = WEBAPI_ROLE_RregisterProgram;
    foreach ($defaultprograms as $k => $r) {
        $data = array("role_id" => $role_id, "program_id" => $r);
        $jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);
        $result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
    }

    //註冊程式
    $url = WEBAPI_ROLE_RregisterProgram;
    foreach ($programs as $k => $r) {
        $data = array("role_id" => $role_id, "program_id" => $r);
        $jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);
        $result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
    }

    $result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);

    $method = "POST";
    //註銷所有選單
    $url = WEBAPI_ROLE_UnregisterAllMenu;
    $result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);

    //註冊選單
    $url = WEBAPI_ROLE_RregisterMenu;
    foreach ($menus as $k => $r) {
        $data = array("role_id" => $role_id, "menu_id" => $r);
        $jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);
        $result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
    }

    $sResult = true;
    $msg = "Successful";
}

$rows = array("sResult" => $sResult, "msg" => $msg);
echo json_encode($rows, JSON_UNESCAPED_UNICODE);
