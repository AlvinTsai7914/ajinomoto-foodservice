<?php

require_once 'tools.php';

//查詢廣告GET
function Ad_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "AAD3DC2F-2697-579E-2279-C946F4E19075";

    //檢查操作權限
    $loginid = 0;
    if ($accesstoken != null)
        if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
            return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = AdGetBaseQueryString();
    if ($accesstoken != null)
        $query = $query . " AND status <= 1";
    else
        $query = $query . " AND status <= 0";

    if (isset($args[0]) && $args[0] != 0) {
        $id = $args[0];
        $query = $query . " AND id='$id'";
    }

    if (isset($request["query"]))
        $query = $query . " AND " . $request["query"];

    if (isset($request["order"]))
        $query = $query . " ORDER BY " . $request["order"];
    else
        $query = $query . " ORDER BY list_order";

    $result = $dbconnect->query($query);
    if ($result) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $resultData[] = AdBuildQueryResultData($accesstoken, $r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增廣告POST
function Ad_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "A5C5804F-6813-1A0E-5193-8B2ACF517148";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "pic_url", "pic_alt", "link", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $name = $data['name'];
    $pic_url = $data['pic_url'];
    $pic_alt = $data['pic_alt'];
    $link = $data['link'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    $query = "INSERT INTO `ad`(`name`, `pic_url`, `pic_alt`, `link`, `list_order`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$name', '$pic_url', '$pic_alt', '$link', '$list_order', '$status', '$remark', '$loginid', '$loginid');";

    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改廣告PUT
function Ad_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "0B70E48C-EE2A-3AE1-BD01-7E121A08FD2B";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "pic_url", "pic_alt", "link", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    $name = $data['name'];
    $pic_url = $data['pic_url'];
    $pic_alt = $data['pic_alt'];
    $link = $data['link'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查廣告編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "ad", "id", $id) == false)
        return E_ADIDNOTFOUND;

    $query = "UPDATE `ad` SET `name`='$name',`pic_url`='$pic_url',`pic_alt`='$pic_alt',`link`='$link',`list_order`='$list_order',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query)) {
        $resultData = array("id" => $id);
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除廣告DELETE
function Ad_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "2724E724-53A2-7409-28AF-76A33C981DA7";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    //檢查帳號是否存在
    if (CheckDataExistByFieldValue($dbconnect, "ad", "id", $id) == false)
        return E_ADIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `ad` SET `status`= 2 ,`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢廣告基本QueryString
function AdGetBaseQueryString() {
    return "SELECT `id`, `name`, `pic_url`, `pic_alt`, `link`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `ad_view` WHERE 1";
}

//建立查詢廣告回傳資料
function AdBuildQueryResultData($accesstoken, $array) {
    if ($accesstoken != null) {
        return array("id" => $array["id"],
            "name" => $array["name"],
            "pic_url" => $array['pic_url'],
            "pic_alt" => $array['pic_alt'],
            "link" => $array['link'],
            "list_order" => $array['list_order'],
            "status" => $array['status'],
            "remark" => $array['remark'],
            "c_time" => $array['c_time'],
            "c_user_id" => $array['c_user_id'],
            "c_user_name" => $array['c_user_name'],
            "u_time" => $array['u_time'],
            "u_user_id" => $array['u_user_id'],
            "u_user_name" => $array['u_user_name']);
    } else {
        return array("id" => $array["id"],
            "name" => $array["name"],
            "pic_url" => $array['pic_url'],
            "pic_alt" => $array['pic_alt'],
            "link" => $array['link'],
            "list_order" => $array['list_order']);
    }
}

?>
