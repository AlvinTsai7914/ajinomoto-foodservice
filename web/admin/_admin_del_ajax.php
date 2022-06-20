<?php

require '_admin_config.php';
no_permission_json();

$delete_url = request_str("delete_url");

if ($delete_url == "")
    die('{"sResult":false,"msg":"指定URL錯誤"}');

$sResult = false;
$msg = "";
$res = null;

$result = CallAPI('DELETE', $delete_url, $_SESSION['accesstoken'], null, $msg, $res);
if ($result == 200) {
    $sResult = true;
    $msg = "Successful";
}
$rows = array("sResult" => $sResult, "msg" => $msg);
echo json_encode($rows, JSON_UNESCAPED_UNICODE);
