<?php

require '_admin_config.php';
no_permission_json();

$product_id = request_num("product_id");
$brand_id = request_num("brand_id");
$name = request_str("name");
$tag = request_str("tag");
$content = request_str("content");
$tips = request_str("tips");
$information = request_str("information");
$mark = request_str("mark");
$list_order = request_num("list_order");
$status = request_num("status");
$remark = request_str("remark");

if ($product_id == '')
    die('{"sResult":false,"msg":"商品編號錯誤"}');

if ($name == '')
    die('{"sResult":false,"msg":"商品名稱錯誤"}');

//新增圖片
$pic_url_array = request_arr("pic_url");
$pic_alt_array = request_arr("pic_alt");
$upload_image_string_array = request_arr("upload_image_string");

for ($i = 0; $i < count($upload_image_string_array); $i++) {
    if ($upload_image_string_array[$i] != '') {
        $filename_extension = preg_replace('/^.*\.([^.]+)$/D', '$1', $pic_url_array[$i]);
        $path = $_SERVER['DOCUMENT_ROOT'] . BASE_PATH . PRODUCT_UPLOAD_PATH;
        $path = iconv("UTF-8", "BIG5", $path);
        $filename = time() . '.' . $filename_extension;
        $pic_url_array[$i] = PRODUCT_UPLOAD_PATH . $filename;
        list($type, $upload_image_string_array[$i]) = explode(';', $upload_image_string_array[$i]);
        list(, $upload_image_string_array[$i]) = explode(',', $upload_image_string_array[$i]);
        $upload_image_string_array[$i] = base64_decode($upload_image_string_array[$i]);
        if (file_put_contents($path . $filename, $upload_image_string_array[$i]) == false)
            die('{"sResult":false,"msg":"檔案儲存失敗"}');
        sleep(1);
    }
}

for ($i = 0; $i < count($pic_url_array); $i++) {
    if ($pic_url_array[$i] == "") {
        unset($pic_url_array[$i]);
        unset($pic_alt_array[$i]);
    }
}

$pic_urls = implode(",", $pic_url_array);
$pic_alts = implode(",", $pic_alt_array);

$data = array(
    "brand_id" => $brand_id,
    "name" => $name,
    "pic_urls" => $pic_urls,
    "pic_alts" => $pic_alts,
    "tag" => $tag,
    "content" => $content,
    "tips" => $tips,
    "information" => $information,
    "mark" => $mark,
    "list_order" => $list_order,
    "status" => $status,
    "remark" => $remark);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_PRODUCT;
$method = "POST";
if ($product_id != 0) {
    $url = $url . "/" . $product_id;
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
