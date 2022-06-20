<?php

require_once '../setting/config.php';
require_once '../setting/webapi.php';
require_once '../setting/tools.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST')
    die();

$checkcode = request_str("checkcode");
$checknum = $_SESSION["FRONT_CHECKCODE"];
if ($checkcode == "" || $checknum == null || $checknum == "" || $checkcode != $checknum) {
    $echoData = array("result" => false, "msg" => "驗證碼錯誤");
    echo json_encode($echoData, JSON_UNESCAPED_UNICODE);
    exit();
}

$name = request_str("name");
$gender = request_str("gender");
$phone = request_str("phone");
$area_id = request_num("area_id");
$email = request_str("email");
$category = request_str("category");
$content = request_str("content");

$city_name = "未知";
$area_name = "未知";

//查詢縣市
$areas = null;
$url = WEBAPI_CITYAREA_FindArea . "?id=" . $area_id;
if (CallAPI('GET', $url, null, null, $resultMessage, $areas) == 200) {
    $city_name = $areas[0]["city_name"];
    $area_name = $areas[0]["area_name"];
}

$mail_content = "<p>To：管理者</p></br>";
$mail_content .= "<p>[表單內容]</p></br>";
$mail_content .= "<p>姓名：" . $name . " " . $gender . "</p></br>";
$mail_content .= "<p>聯絡電話：" . $phone . "</p></br>";
$mail_content .= "<p>地址：" . $city_name . " " . $area_name . "</p></br>";
$mail_content .= "<p>電子信箱：" . $email . "</p></br>";
$mail_content .= "<p>詢問類別：" . $category . "</p></br>";
$mail_content .= "<p>寶貴建議：" . $content . "</p></br>";

if (SMTPSentMail(RECIPIENT_MAIL, "", "", "您有一封來自[聯絡我們]的表單", "$mail_content", null, null, $errorinfo)) {
    $rows = array("sResult" => true, "msg" => "successed");
    echo json_encode($rows, JSON_UNESCAPED_UNICODE);
} else {
    $rows = array("sResult" => false, "msg" => $errorinfo);
    echo json_encode($rows, JSON_UNESCAPED_UNICODE);
}
