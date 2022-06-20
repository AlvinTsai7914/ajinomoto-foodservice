<?php

require '_admin_config.php';
no_permission_json();

$order_str = "";
$order_arr = request_arr("order");
$columns = request_arr("columns");
if (count($order_arr) > 0) {
    $order = $order_arr[0];
    $index = $order["column"];
    $field = $columns[$index]["data"];
    $order_str = "order=" . urlencode($field . " " . $order["dir"]);
}

$api = request_str("api");

$query_str = "";
$query = request_str("query");
if ($query != "") {
    $query = urldecode($query);
    $query_str = "?query=" . urlencode($query);
}

$draw = request_num("draw");

$start = request_num("start");

$length = request_num("length");

if ($order_str != "") {
    if ($query_str != "")
        $query_str = $query_str . "&" . $order_str;
    else
        $query_str = "?" . $order_str;
}

//查詢
$data = null;
$url = $api . $query_str;

if (CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $data) != 200)
    $data = null;

$recordsTotal = count($data);
if ($length > 0)
    $data = array_slice($data, $start, $length);

echo json_encode(array(
    "draw" => intval($draw),
    "recordsTotal" => intval($recordsTotal),
    "recordsFiltered" => intval($recordsTotal),
    "data" => $data,
        ), JSON_UNESCAPED_UNICODE);
