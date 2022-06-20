<?php

require '_admin_config.php';
no_permission_json();

$higi_id = request_num("higi_id");
$name = request_str("name");
$content = request_str("content");
$description = request_str("description");
$recipepro_id = request_num("recipepro_id");
$product_id = request_num("product_id");
$tags = request_arr("tags");
$tags = implode(",", $tags);
$type_string = request_str("type");
$style = request_str("style");
$methods = request_arr("method_names");
$note = request_str("note");
$note_pic_url = request_str("note_pic_url");
$note_pic_alt = request_str("note_pic_alt");
$member_only = request_num("member_only");
$visitor = request_num("visitor");
$list_order = request_num("list_order");
$status = request_num("status");
$remark = request_str("remark");

foreach ($methods as $key => $item) {
    $methods[$key] = str_replace(",", "，", $item);
}
$methods = implode(",", $methods);

if ($higi_id == '')
    die('{"sResult":false,"msg":"品牌編號錯誤"}');

if ($name == '')
    die('{"sResult":false,"msg":"品牌名稱錯誤"}');

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

$note_upload_image_string = request_str("note_upload_image_string");
if ($note_upload_image_string != '') {
    sleep(1);
    $path = $_SERVER['DOCUMENT_ROOT'] . BASE_PATH . HIGI_UPLOAD_PATH;
    $path = iconv("UTF-8", "BIG5", $path);
    $filename = time() . '.' . $filename_extension;
    $note_pic_url = HIGI_UPLOAD_PATH . $filename;
    list($type, $note_upload_image_string) = explode(';', $note_upload_image_string);
    list(, $note_upload_image_string) = explode(',', $note_upload_image_string);
    $note_upload_image_string = base64_decode($note_upload_image_string);
    if (file_put_contents($path . $filename, $note_upload_image_string) == false)
        die('{"sResult":false,"msg":"檔案儲存失敗"}');
}

$data = array("name" => $name,
    "pic_url" => $pic_urls,
    "pic_alt" => $pic_alts,
    "content" => $content,
    "description" => $description,
    "recipepro_id" => $recipepro_id,
    "product_id" => $product_id,
    "tags" => $tags,
    "type" => $type_string,
    "style" => $style,
    "methods" => $methods,
    "note" => $note,
    "note_pic_url" => $note_pic_url,
    "note_pic_alt" => $note_pic_alt,
    "member_only" => $member_only,
    "visitor" => $visitor,
    "list_order" => $list_order,
    "status" => $status,
    "remark" => $remark);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_HIGI;
$method = "POST";
if ($higi_id != 0) {
    $url = $url . "/" . $higi_id;
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
