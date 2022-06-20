<?php

require_once 'define.php';

//檢查程式執行權限
function CheckAccess($dbconnect, $token, $programguid, &$user_id) {
    if (!$dbconnect)
        return E_DBCONNECTERROR;

    //根據token，在loginuser中尋找userID
    $query = "SELECT `user_id` FROM `login_user` WHERE token='$token'";

    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows == 1) {
            if ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                //根據userID及programguid在useer_role_program_view尋找資料
                $user_id = $r['user_id'];
                if ($programguid == null)
                    return E_SUCCESS;

                $query = "SELECT `user_id` FROM `user_role_program_view` WHERE user_id='$user_id' && program_guid = '$programguid' && user_status = '0' && role_status = '0' && program_status = '0' && program_category_status = '0'";

                if ($result = $dbconnect->query($query)) {
                    if ($result->num_rows >= 1) {
                        return E_SUCCESS;
                    } else
                        return E_AUTHORITYNOTENOUGH;
                } else
                    return $dbconnect->error;
            } else
                return $dbconnect->error;
        } else
            return E_ACCESSTOKENERROR;
    } else
        return $dbconnect->error;
}

//根據AccessToken取得UserID
function GetUserIDByAccessToken($dbconnect, $token, &$user_id) {
    $query = "SELECT `user_id` FROM `login_user` WHERE token='$token'";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows == 1) {
            if ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                $user_id = $r['user_id'];
                return true;
            }
        }
    }
    return false;
}

//根據AccessToken取得RoleID
function GetRoleIDByAccessToken($dbconnect, $token, &$role_ids) {
    $user_id = 0;
    if (GetUserIDByAccessToken($dbconnect, $token, $user_id) == true) {
        $query = "SELECT `role_id` FROM `role_user` WHERE user_id='$user_id'";
        $result = $dbconnect->query($query);
        if ($result) {
            if ($result->num_rows >= 1) {
                while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                    $role_ids[] = $r['role_id'];
                }
                return true;
            } else
                return false;
        } else
            return false;
    } else
        return false;
}

//根據ProgramGUID取得ProgramID
function GetProgramIDByGUID($dbconnect, $programguid, &$program_id) {
    $query = "SELECT `id` FROM `program` WHERE guid='$programguid'";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows == 1) {
            if ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                $program_id = $r['id'];
                return true;
            }
        }
    }
    return false;
}

//取得目前日期時間
function GetCurrentDateTime() {
    date_default_timezone_set('Asia/Taipei');
    return date('Y-m-d H:i:s', time());
}

function GetDateString($datetime) {
    if ($datetime == "0000-00-00 00:00:00")
        return "0000-00-00";
    else
        return date("Y-m-d", strtotime($datetime));
}

//產生GUID
function Create_Guid() {
    $charid = strtoupper(md5(uniqid(mt_rand(), true)));
    $hyphen = chr(45); // "-"
    $uuid = substr($charid, 0, 8) . $hyphen
            . substr($charid, 8, 4) . $hyphen
            . substr($charid, 12, 4) . $hyphen
            . substr($charid, 16, 4) . $hyphen
            . substr($charid, 20, 12);
    return $uuid;
}

//查詢指定欄位的最大值
function FindFieldMaxValue($dbconnect, $table, $field) {
    $query = "SELECT MAX($field) from $table";
    if ($result = $dbconnect->query($query)) {
        $r = mysqli_fetch_array($result, MYSQLI_ASSOC);
        return $r["MAX($field)"];
    } else
        return 0;
}

//根據輸入欄位查詢資料是否存在
function CheckDataExistByFieldValue($dbconnect, $table, $field, $value) {
    $query = "SELECT $field from $table WHERE $field='$value'";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows > 0)
            return true;
        else
            return false;
    } else
        return false;
}

function CheckDataExistByFieldValue2($dbconnect, $table, $field1, $field2, $value1, $value2) {
    $query = "SELECT $field1 from $table WHERE $field1='$value1' AND $field2='$value2'";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows > 0)
            return true;
        else
            return false;
    } else
        return false;
}

//檢查陣列中是否包含所有指定的key
function CheckArrayKeys($array, $keys) {
    if ($array == null)
        return false;

    foreach ($keys as $key => $val) {
        if (!array_key_exists($val, $array))
            return false;
    }
    return true;
}

//字串加密
function EncryptString($str) {
    $encrypted = openssl_encrypt($str, 'aes-256-cbc', PASSWORK_KEY, OPENSSL_RAW_DATA, PASSWORK_IV);
    return base64_encode($encrypted);
}

//字串解密
function DecryptString($str) {
    return openssl_decrypt($str, 'aes-256-cbc', PASSWORK_KEY, OPENSSL_RAW_DATA, PASSWORK_IV);
}

function GetClientIP() {
    if (!empty($_SERVER["HTTP_CLIENT_IP"])) {
        $ip = $_SERVER["HTTP_CLIENT_IP"];
    } elseif (!empty($_SERVER["HTTP_X_FORWARDED_FOR"])) {
        $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
    } else {
        $ip = $_SERVER["REMOTE_ADDR"];
    }
    return $ip;
}

function GetRandomString($length = 32) {
    if (function_exists('openssl_random_pseudo_bytes')) {
        $bytes = openssl_random_pseudo_bytes($length * 2);
        if ($bytes === false)
            throw new RuntimeException('Unable to generate a random string');
        return substr(str_replace(['/', '+', '='], '', base64_encode($bytes)), 0, $length);
    }
    $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return substr(str_shuffle(str_repeat($pool, 5)), 0, $length);
}

?>