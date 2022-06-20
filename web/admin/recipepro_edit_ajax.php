<?php

require '_admin_config.php';
no_permission_json();

$recipepro_id = request_num("recipepro_id");
$name = request_str("name");
$pic_url = request_str("pic_url");
$pic_alt = request_str("pic_alt");
$feature = request_str("feature");
$tags = request_arr("tags");
$tags = implode(",", $tags);
$price = request_str("price");
$type_string = request_str("type");
$style = request_str("style");
$product_ids = request_arr("product_ids");
sort($product_ids);
$product_ids = implode(",", $product_ids);
$material_weight = request_str("material_weight");
$nutrition = request_str("nutrition");
$member_only = request_num("member_only");
$visitor = request_num("visitor");
$list_order = request_num("list_order");
$status = request_num("status");
$remark = request_str("remark");

$upload_image_string = request_str("upload_image_string");
$filename_extension = preg_replace('/^.*\.([^.]+)$/D', '$1', $pic_url);

if ($recipepro_id == '')
    die('{"sResult":false,"msg":"專業食譜編號錯誤"}');

if ($name == '')
    die('{"sResult":false,"msg":"專業食譜名稱錯誤"}');

if ($product_ids == '')
    die('{"sResult":false,"msg":"使用商品錯誤"}');

if ($upload_image_string != '') {
    $path = $_SERVER['DOCUMENT_ROOT'] . BASE_PATH . REPICEPRO_UPLOAD_PATH;
    $path = iconv("UTF-8", "BIG5", $path);
    $filename = time() . '.' . $filename_extension;
    $pic_url = REPICEPRO_UPLOAD_PATH . $filename;
    list($type, $upload_image_string) = explode(';', $upload_image_string);
    list(, $upload_image_string) = explode(',', $upload_image_string);
    $upload_image_string = base64_decode($upload_image_string);
    if (file_put_contents($path . $filename, $upload_image_string) == false)
        die('{"sResult":false,"msg":"檔案儲存失敗"}');
}

$data = array("name" => $name,
    "pic_url" => $pic_url,
    "pic_alt" => $pic_alt,
    "feature" => $feature,
    "tags" => $tags,
    "price" => $price,
    "type" => $type_string,
    "style" => $style,
    "product_ids" => $product_ids,
    "material_weight" => $material_weight,
    "nutrition" => $nutrition,
    "member_only" => $member_only,
    "visitor" => $visitor,
    "list_order" => $list_order,
    "status" => $status,
    "remark" => $remark);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);

$url = WEBAPI_RECIPEPRO;
$method = "POST";
if ($recipepro_id != 0) {
    $url = $url . "/" . $recipepro_id;
    $method = "PUT";
}

$sResult = false;
$msg = "未知的錯誤";
$resultData = null;

$result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
if ($result == 200) {
    //刪除專業食譜內容
    $recipepro_id = $resultData['id'];
    $method = "DELETE";
    $url = WEBAPI_RECIPPRODETAIL . "/" . $recipepro_id;
    $result = CallAPI($method, $url, $_SESSION['accesstoken'], null, $msg, $resultData);

    //新增材料
    $food_names_array = request_arr("food_names");
    $food_contents_array = request_arr("food_contents");

    foreach ($food_names_array as $key => $item) {
        $food_names_array[$key] = str_replace(",", "，", $item);
        $food_contents_array[$key] = str_replace(",", "，", $food_contents_array[$key]);
    }

    for ($i = 0; $i < count($food_names_array); $i++) {
        for ($j = 0; $j < count($food_names_array[$i]); $j++) {
            if ($food_names_array[$i][$j] == "") {
                array_splice($food_names_array[$i], $j, 1);
                array_splice($food_contents_array[$i], $j, 1);
            }
        }
    }

    for ($i = 0; $i < count($food_names_array); $i++) {
        $names = implode(",", $food_names_array[$i]);
        $contents = implode(",", $food_contents_array[$i]);
        if ($names != "") {
            $data = array(
                "recipepro_id" => $recipepro_id,
                "class" => 1,
                "names" => $names,
                "contents" => $contents,
                "links" => "",
                "blanks" => "",
                "list_order" => $i);

            $jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);
            $method = "POST";
            $url = WEBAPI_RECIPPRODETAIL;
            $result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
            if ($result != 200)
                die('{"sResult":false, "msg":"材料新增失敗"}');
        }
    }

    //新增調味料
    $sauce_names_array = request_arr("sauce_names");
    $sauce_contents_array = request_arr("sauce_contents");
    $sauce_links_array = request_arr("sauce_links");
    $sauce_blanks_array = request_arr("sauce_blanks");

    foreach ($sauce_names_array as $key => $item) {
        $sauce_names_array[$key] = str_replace(",", "，", $item);
        $sauce_contents_array[$key] = str_replace(",", "，", $sauce_contents_array[$key]);
        $sauce_links_array[$key] = str_replace(",", "，", $sauce_links_array[$key]);
        $sauce_blanks_array[$key] = str_replace(",", "，", $sauce_blanks_array[$key]);
    }

    for ($i = 0; $i < count($sauce_names_array); $i++) {
        for ($j = 0; $j < count($sauce_names_array[$i]); $j++) {
            if ($sauce_names_array[$i][$j] == "") {
                array_splice($sauce_names_array[$i], $j, 1);
                array_splice($sauce_contents_array[$i], $j, 1);
                array_splice($sauce_links_array[$i], $j, 1);
                array_splice($sauce_blanks_array[$i], $j, 1);
            }
        }
    }

    for ($i = 0; $i < count($sauce_names_array); $i++) {
        $names = implode(",", $sauce_names_array[$i]);
        $contents = implode(",", $sauce_contents_array[$i]);
        $links = implode(",", $sauce_links_array[$i]);
        $blanks = implode(",", $sauce_blanks_array[$i]);
        if ($names != "") {
            $data = array(
                "recipepro_id" => $recipepro_id,
                "class" => 2,
                "names" => $names,
                "contents" => $contents,
                "links" => $links,
                "blanks" => $blanks,
                "list_order" => $i);

            $jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);
            $method = "POST";
            $url = WEBAPI_RECIPPRODETAIL;
            $result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
            if ($result != 200)
                die('{"sResult":false, "msg":"調味料新增失敗"}');
        }
    }

    //新增料理方法
    $step_names_array = request_arr("step_names");
    $step_blanks_array = request_arr("step_blanks");

    foreach ($step_names_array as $key => $item) {
        $step_names_array[$key] = str_replace(",", "，", $item);
        $step_blanks_array[$key] = str_replace(",", "，", $step_blanks_array[$key]);
    }

    for ($i = 0; $i < count($step_names_array); $i++) {
        if ($step_names_array[$i] == "") {
            array_splice($step_names_array, $i, 1);
            array_splice($step_blanks_array, $i, 1);
        }
    }

    for ($i = 0; $i < count($step_names_array); $i++) {
        if ($step_names_array[$i] != "") {
            $data = array(
                "recipepro_id" => $recipepro_id,
                "class" => 3,
                "names" => $step_names_array[$i],
                "contents" => "",
                "links" => "",
                "blanks" => $step_blanks_array[$i],
                "list_order" => $i);
            $jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);
            $method = "POST";
            $url = WEBAPI_RECIPPRODETAIL;
            $result = CallAPI($method, $url, $_SESSION['accesstoken'], $jsondata, $msg, $resultData);
            if ($result != 200)
                die('{"sResult":false, "msg":"料理方法新增失敗"}');
        }
    }
    $sResult = true;
    $msg = "Successful";
}

$rows = array("sResult" => $sResult, "msg" => $msg);
echo json_encode($rows, JSON_UNESCAPED_UNICODE);
