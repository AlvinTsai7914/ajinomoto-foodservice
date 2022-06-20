<?php

require '_admin_config.php';
no_permission_json();

$tag_id = request_num("tag_id");
$category_id = request_str("category_id");
$name = request_str("name");
$list_order = request_num("list_order");
$status = request_num("status");
$remark = request_str("remark");

if ($tag_id == '')
    die('{"sResult":false,"msg":"標籤編號錯誤"}');

if ($name == '')
    die('{"sResult":false,"msg":"標籤名稱錯誤"}');

$data = array("category_id" => $category_id,
    "name" => $name,
    "list_order" => $list_order,
    "status" => $status,
    "remark" => $remark);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_TAG;
$method = "POST";
if ($tag_id != 0) {
    $url = $url . "/" . $tag_id;
    $method = "PUT";
}

$sResult = false;
$msg = "未知的錯誤";
$resultData = null;

$result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
if ($result == 200) {
    $sResult = true;
    $msg = "Successful";
}

$rows = array("sResult" => $sResult, "msg" => $msg);
echo json_encode($rows, JSON_UNESCAPED_UNICODE);
