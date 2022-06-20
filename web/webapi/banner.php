<?php

require_once 'tools.php';

//查詢首頁bannerGET
function Banner_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "C4EF960E-E09C-F712-544C-CC0F2BB16F55";

    //檢查操作權限
    $loginid = 0;
    if ($accesstoken != null)
        if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
            return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = BannerGetBaseQueryString();
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
            $resultData[] = BannerBuildQueryResultData($accesstoken, $r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增首頁bannerPOST
function Banner_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "21F54643-5E83-5F76-A9A9-3025D9709A41";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "pic_url", "pic_alt", "link", "blank", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $name = $data['name'];
    $pic_url = $data['pic_url'];
    $pic_alt = $data['pic_alt'];
    $link = $data['link'];
    $blank = $data['blank'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    $query = "INSERT INTO `banner`(`name`, `pic_url`, `pic_alt`, `link`, `blank`, `list_order`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$name', '$pic_url', '$pic_alt', '$link', '$blank', '$list_order', '$status', '$remark', '$loginid', '$loginid');";

    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改首頁bannerPUT
function Banner_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "1D4F4DEF-9119-1F6A-E74A-ECBA1A01E7B0";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "pic_url", "pic_alt", "link", "blank", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    $name = $data['name'];
    $pic_url = $data['pic_url'];
    $pic_alt = $data['pic_alt'];
    $link = $data['link'];
    $blank = $data['blank'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查首頁banner編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "banner", "id", $id) == false)
        return E_BANNERIDNOTFOUND;

    $query = "UPDATE `banner` SET `name`='$name',`pic_url`='$pic_url',`pic_alt`='$pic_alt',`link`='$link',`blank`='$blank',`list_order`='$list_order',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query)) {
        $resultData = array("id" => $id);
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除首頁bannerDELETE
function Banner_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "9F20BA8A-0769-FB07-129C-155B5352C8B5";

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
    if (CheckDataExistByFieldValue($dbconnect, "banner", "id", $id) == false)
        return E_BANNERIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `banner` SET `status`= 2 ,`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢首頁Banner基本QueryString
function BannerGetBaseQueryString() {
    return "SELECT `id`, `name`, `pic_url`, `pic_alt`, `link`, `blank`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `banner_view` WHERE 1";
}

//建立查詢首頁Banner回傳資料
function BannerBuildQueryResultData($accesstoken, $array) {
    if ($accesstoken != null) {
        return array("id" => $array["id"],
            "name" => $array["name"],
            "pic_url" => $array['pic_url'],
            "pic_alt" => $array['pic_alt'],
            "link" => $array['link'],
            "blank" => $array['blank'],
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
            "blank" => $array['blank'],
            "list_order" => $array['list_order']);
    }
}

?>
