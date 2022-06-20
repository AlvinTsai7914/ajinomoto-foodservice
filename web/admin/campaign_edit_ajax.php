<?php

require '_admin_config.php';
no_permission_json();

$campaign_id = request_num("campaign_id");
$tag_ids = request_arr("tag_ids");
$tag_ids = implode(",", $tag_ids);
$title = request_str("title");
$sub_title = request_str("sub_title");
$content = request_str("content");
$pic_url = request_str("pic_url");
$pic_alt = request_str("pic_alt");
$release_date = request_str("release_date");
$list_order = request_num("list_order");
$status = request_num("status");
$remark = request_str("remark");

$upload_image_string = request_str("upload_image_string");
$filename_extension = preg_replace('/^.*\.([^.]+)$/D', '$1', $pic_url);

if ($campaign_id == '')
    die('{"sResult":false,"msg":"餐飲情報編號錯誤"}');

if ($tag_ids == '')
    die('{"sResult":false,"msg":"餐飲情報類別錯誤"}');

if ($title == '')
    die('{"sResult":false,"msg":"餐飲情報主標題錯誤"}');

if ($upload_image_string != '') {
    $path = $_SERVER['DOCUMENT_ROOT'] . BASE_PATH . CAMPAIGN_UPLOAD_PATH;
    $path = iconv("UTF-8", "BIG5", $path);
    $filename = time() . '.' . $filename_extension;
    $pic_url = CAMPAIGN_UPLOAD_PATH . $filename;
    list($type, $upload_image_string) = explode(';', $upload_image_string);
    list(, $upload_image_string) = explode(',', $upload_image_string);
    $upload_image_string = base64_decode($upload_image_string);
    if (file_put_contents($path . $filename, $upload_image_string) == false)
        die('{"sResult":false,"msg":"檔案儲存失敗"}');
}

$data = array("tag_ids" => $tag_ids,
    "title" => $title,
    "sub_title" => $sub_title,
    "content" => $content,
    "pic_url" => $pic_url,
    "pic_alt" => $pic_alt,
    "release_date" => $release_date,
    "list_order" => $list_order,
    "status" => $status,
    "remark" => $remark);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_CAMPAIGN;
$method = "POST";
if ($campaign_id != 0) {
    $url = $url . "/" . $campaign_id;
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
