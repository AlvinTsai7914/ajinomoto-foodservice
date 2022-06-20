<?php

require '_admin_config.php';
no_permission_json();

$picture_pic1url_array = request_arr("picture_pic1url");
$picture_pic1url_image_string_array = request_arr("picture_pic1url_image_string");
$picture_pic1alt_array = request_arr("picture_pic1alt");

$picture_pic_srcs_string_array = request_arr("picture_pic_srcs_string");
$picture_pic_srcs_image_string_array = request_arr("picture_pic_srcs_image_string");
$picture_pic_alts_array = request_arr("picture_pic_alts");

$product_id = request_num("product_id");
$category_id = request_num("category_id");
$name = request_str("name");
$pic1url = request_str("pic1url");
$pic1alt = request_str("pic1alt");
$content = request_str("content");
$newlisting = request_str("newlisting");
$list_order = request_num("list_order");
$status = request_num("status");
$remark = request_str("remark");

$pic_src_string = request_str("pic_src_string");
$filename_extension = preg_replace('/^.*\.([^.]+)$/D', '$1', $pic1url);

if ($product_id == '')
    die('{"sResult":false,"msg":"商品編號錯誤"}');

if ($name == '')
    die('{"sResult":false,"msg":"商品名稱錯誤"}');

if ($pic_src_string != '') {
    $path = $_SERVER['DOCUMENT_ROOT'] . BASE_PATH . UPLOAD_PATH;
    $path = iconv("UTF-8", "BIG5", $path);
    $filename = time() . '.' . $filename_extension;
    $pic1url = UPLOAD_PATH . $filename;
    list($type, $pic_src_string) = explode(';', $pic_src_string);
    list(, $pic_src_string) = explode(',', $pic_src_string);
    $pic_src_string = base64_decode($pic_src_string);
    if (file_put_contents($path . $filename, $pic_src_string) == false) {
        var_dump($filename);
        var_dump($pic_src_string);
        die('{"sResult":false,"msg":"檔案儲存失敗"}');
    }
}

$data = array(
    "category_id" => $category_id,
    "name" => $name,
    "pic1url" => $pic1url,
    "pic1alt" => $pic1alt,
    "content" => $content,
    "newlisting" => $newlisting,
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
    //刪除商品圖片
    $product_id = $resultData['id'];
    $method = "DELETE";
    $url = WEBAPI_PRODUCTPICTURE . "/" . $product_id;
    $result = CallAPI($method, $url, $_SESSION['accesstoken'], null, $msg, $resultData);

    $list_order = 0;
    foreach ($picture_pic1url_array as $key => $picture_pic1url) {
        if ($picture_pic1url_image_string_array[$key] != '') {
            $path = $_SERVER['DOCUMENT_ROOT'] . BASE_PATH . UPLOAD_PATH;
            $path = iconv("UTF-8", "BIG5", $path);
            $filename = time() . '.' . $filename_extension;
            $picture_pic1url_array[$key] = UPLOAD_PATH . $filename;
            list($type, $picture_pic1url_image_string_array[$key]) = explode(';', $picture_pic1url_image_string_array[$key]);
            list(, $picture_pic1url_image_string_array[$key]) = explode(',', $picture_pic1url_image_string_array[$key]);
            $picture_pic1url_image_string_array[$key] = base64_decode($picture_pic1url_image_string_array[$key]);
            if (file_put_contents($path . $filename, $picture_pic1url_image_string_array[$key]) == false)
                die('{"sResult":false,"msg":"檔案儲存失敗2"}');
            sleep(1);
        }

        $picture_pic_srcs_string = $picture_pic_srcs_string_array[$key];
        $picture_pic_srcs_image_string = $picture_pic_srcs_image_string_array[$key];
        $picture_pic_alts = $picture_pic_alts_array[$key];

        $pic_srcs = null;
        $pic_alts = null;

        foreach ($picture_pic_srcs_string as $key1 => $picture_pic_srcs) {
            if ($picture_pic_srcs_image_string[$key1] != '') {
                $path = $_SERVER['DOCUMENT_ROOT'] . BASE_PATH . UPLOAD_PATH;
                $path = iconv("UTF-8", "BIG5", $path);
                $filename = time() . '.' . $filename_extension;
                $picture_pic_srcs_string[$key1] = UPLOAD_PATH . $filename;
                list($type, $picture_pic_srcs_image_string[$key1]) = explode(';', $picture_pic_srcs_image_string[$key1]);
                list(, $picture_pic_srcs_image_string[$key1]) = explode(',', $picture_pic_srcs_image_string[$key1]);
                $picture_pic_srcs_image_string[$key1] = base64_decode($picture_pic_srcs_image_string[$key1]);
                if (file_put_contents($path . $filename, $picture_pic_srcs_image_string[$key1]) == false)
                    die('{"sResult":false,"msg":"檔案儲存失敗3"}');
                sleep(1);
            }
            $pic_srcs[] = $picture_pic_srcs_string[$key1];
            $pic_alts[] = str_replace(",", ".", $picture_pic_alts[$key1]);
        }
        $pic_srcs = implode(",", $pic_srcs);
        $pic_alts = implode(",", $pic_alts);
        $list_order = $list_order + 1;
        if ($picture_pic1url != "") {
            $data = array(
                "product_id" => $product_id,
                "pic1url" => $picture_pic1url_array[$key],
                "pic1alt" => $picture_pic1alt_array[$key],
                "pic_srcs" => $pic_srcs,
                "pic_alts" => $pic_alts,
                "list_order" => $list_order);
            $jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);
            $method = "POST";
            $url = WEBAPI_PRODUCTPICTURE;
            $result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
            if ($result != 200)
                die('{"sResult":false,"msg":"商品圖片新增失敗"}');
        }
    }

    $sResult = true;
    $msg = "Successful";
}

$rows = array("sResult" => $sResult, "msg" => $msg);
echo json_encode($rows, JSON_UNESCAPED_UNICODE);
