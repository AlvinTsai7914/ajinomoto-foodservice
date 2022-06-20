<?php

//檢查權限
function have_permission() {
    //檢查使用者是否登入
    if (!(isset($_SESSION['accesstoken'])) || $_SESSION['accesstoken'] == null) {//accesstoken不存在，沒有登入過
        return false;
    }

    //確認accesstoken有效
    $result = false;
    $resultMessage = "Bad Request";
    $resultData = null;
    if (CallAPI('GET', WEBAPI_USER_LoginUserData, $_SESSION['accesstoken'], null, $resultMessage, $resultData) != 200 || count($resultData) != 1)
        return false;

    //檢查使用者是否有進入此頁的權限
    return true;
}

//無權限導向登入頁面，login
function no_permission_gohome() {
    if (have_permission() == false) {
        redir("login.php");
    }
}

//無權限登出
function no_permission_json() {
    if (have_permission() == false) {
        die('{"sResult":false,"msg":"權限不足或逾時登出"}');
    }
}

?>