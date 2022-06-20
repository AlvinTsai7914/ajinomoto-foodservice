<?php

require_once '../setting/config.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST')
    die();

$filename = $_SERVER['DOCUMENT_ROOT'] . BASE_PATH . "/ajax/_member-terms_content.php";

$msg = file_get_contents($filename);

$rows = array("sResult" => true, "msg" => $msg);
echo json_encode($rows, JSON_UNESCAPED_UNICODE);
