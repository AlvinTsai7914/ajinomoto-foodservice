<?php

require_once 'tools.php';

//查詢品牌GET
function Brand_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "945FE94B-0244-E364-1ED7-29C92CCEF5EE";

    //檢查操作權限
    $loginid = 0;
    if ($accesstoken != null)
        if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
            return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = BrandGetBaseQueryString();
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
            $resultData[] = BrandBuildQueryResultData($accesstoken, $r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增品牌POST
function Brand_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "75E08067-7FF0-6F95-A92D-8414959CB94A";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "pic_url", "pic_alt", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $name = $data['name'];
    $pic_url = $data['pic_url'];
    $pic_alt = $data['pic_alt'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    $query = "INSERT INTO `brand`(`name`, `pic_url`, `pic_alt`, `list_order`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$name', '$pic_url', '$pic_alt', '$list_order', '$status', '$remark', '$loginid', '$loginid');";

    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改品牌PUT
function Brand_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "408142A8-9687-65E0-0C38-6D89E7044945";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "pic_url", "pic_alt", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    $name = $data['name'];
    $pic_url = $data['pic_url'];
    $pic_alt = $data['pic_alt'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查品牌編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "brand", "id", $id) == false)
        return E_BRANDIDNOTFOUND;

    $query = "UPDATE `brand` SET `name`='$name',`pic_url`='$pic_url',`pic_alt`='$pic_alt',`list_order`='$list_order',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query)) {
        $resultData = array("id" => $id);
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除品牌DELETE
function Brand_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "3671F6BB-8C9D-C906-D30C-9F119C3BE1AE";

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
    if (CheckDataExistByFieldValue($dbconnect, "brand", "id", $id) == false)
        return E_BRANDIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `brand` SET `status`= 2 ,`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢角色基本QueryString
function BrandGetBaseQueryString() {
    return "SELECT `id`, `name`, `pic_url`, `pic_alt`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `brand_view` WHERE 1";
}

//建立查詢使用者回傳資料
function BrandBuildQueryResultData($accesstoken, $array) {
    if ($accesstoken != null) {
        return array("id" => $array["id"],
            "name" => $array["name"],
            "pic_url" => $array['pic_url'],
            "pic_alt" => $array['pic_alt'],
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
            "list_order" => $array['list_order']);
    }
}

?>
