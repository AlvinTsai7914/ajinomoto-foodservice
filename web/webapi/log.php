<?php

require_once 'tools.php';

//查詢操作記錄GET
function Log_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "999E2E30-F65D-4DDA-D416-036813A8993B";
    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = LogGetBaseQueryString();

    if (isset($args[0]) && $args[0] != 0) {
        $id = $args[0];
        $query = $query . " AND id='$id'";
    }

    if (isset($request["query"]))
        $query = $query . " AND " . $request["query"];

    if (isset($request["order"]))
        $query = $query . " ORDER BY " . $request["order"];
    else
        $query = $query . " ORDER BY c_time";

    $result = $dbconnect->query($query);
    if ($result) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $resultData[] = LogBuildQueryResultData($r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢操作記錄基本QueryString
function LogGetBaseQueryString() {
    return "SELECT `id`, `user_id`, `user_account`, `user_name`, `ip`, `program_id`, `program_name`, `verb`, `args`, `file`, `resultCode`, `resultMessage`, `resultData`, `c_time` FROM `log_view` WHERE 1";
}

//建立查詢操作記錄回傳資料
function LogBuildQueryResultData($array) {
    return array("id" => $array["id"],
        "user_id" => $array["user_id"],
        "user_account" => $array["user_account"],
        "user_name" => $array["user_name"],
        "ip" => $array['ip'],
        "program_id" => $array['program_id'],
        "program_name" => $array['program_name'],
        "verb" => $array['verb'],
        "args" => $array['args'],
        "file" => $array['file'],
        "resultCode" => $array['resultCode'],
        "resultMessage" => $array['resultMessage'],
        "resultData" => $array['resultData'],
        "c_time" => $array['c_time']);
}

function AddLog($dbconnect, $accesstoken, $programguid, $method, $endpoint, $verb, $args, $file, $resultCode, $resultMessage, $resultData) {
    if ($endpoint == "log")
        return;
    date_default_timezone_set('Asia/Taipei');
    $user_id = 0;
    $r = GetUserIDByAccessToken($dbconnect, $accesstoken, $user_id);

    //檢查若角色編號為1：系統管理員時，不需要記錄Log
    //    $find = false;
    //    $role_ids = null;
    //    if (GetRoleIDByAccessToken($dbconnect, $accesstoken, $role_ids) == true) {
    //        foreach ($role_ids as $role_id) {
    //            if ($role_id != 1) {
    //                $find = true;
    //                break;
    //            }
    //        }
    //    } else
    //        return true;
    //
    //    if ($find == false)
    //        return true;

    $program_id = 0;
    GetProgramIDByGUID($dbconnect, $programguid, $program_id);

    //使用者登入時不記錄帳號、密碼資料
    if ($programguid == null)
        $file = "";

    $ip = GetClientIP();
    $args = json_encode($args, JSON_UNESCAPED_UNICODE);
    $file = json_encode($file, JSON_UNESCAPED_UNICODE);
    $resultData = json_encode($resultData, JSON_UNESCAPED_UNICODE);

    $query = "INSERT INTO `log`(`user_id`, `ip`, `program_id`, `method`, `endpoint`, `verb`, `args`, `file`, `resultCode`, `resultMessage`, `resultData`) "
            . "VALUES ('$user_id','$ip','$program_id','$method','$endpoint','$verb','$args','$file','$resultCode','$resultMessage','$resultData')";

    @$dbconnect->query($query);
}

?>