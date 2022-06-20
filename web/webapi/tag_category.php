<?php

require_once 'tools.php';

//查詢標籤類別GET
function Tag_Category_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "02AAAA8D-6C8D-F32D-CDC4-50A3DFE64C18";

    //檢查操作權限
    $loginid = 0;
    if ($accesstoken != null)
        if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
            return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = TagCategoryGetBaseQueryString();

    if ($accesstoken != null)
        $query = $query . " AND status <= 1";
    else
        $query = $query . " AND status <= 0";

    if (isset($args[0]) && $args[0] != 0) {
        $id = $args[0];
        $query = $query . " AND id='$id'";
    }

    if (isset($request["query"]))
        $query = $query . " AND (" . $request["query"] . ")";

    if (isset($request["order"]))
        $query = $query . " ORDER BY " . $request["order"];
    else
        $query = $query . " ORDER BY list_order";

    $result = $dbconnect->query($query);
    if ($result) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $resultData[] = TagCategoryBuildQueryResultData($accesstoken, $r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增標籤類別POST
function Tag_Category_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "19A3AB3B-619A-D8C7-FD86-0D421EFB48F4";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $name = $data['name'];    //名稱
    $list_order = $data['list_order'];    //名稱
    $status = $data['status'];      //狀態：0：啟用，其他：停用
    $remark = $data['remark'];   //備註

    $query = "INSERT INTO `tag_category`(`name`, `list_order`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$name', '$list_order', '$status', '$remark', '$loginid', '$loginid');";
    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改標籤類別PUT
function Tag_Category_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "C3AC8109-84A8-3E0E-D70B-B87528979F00";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    $name = $data['name'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查標籤類別編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "tag_category", "id", $id) == false)
        return E_TAGCATEGORYIDNOTFOUND;

    $query = "UPDATE `tag_category` SET `name`='$name',`list_order`='$list_order',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除標籤類別DELETE
function Tag_Category_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "87CBD553-3A55-6E01-0D43-711D5D7206B6";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    //檢查標籤類別編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "tag_category", "id", $id) == false)
        return E_TAGCATEGORYIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `tag_category` SET `status` = 2, `u_user_id` = '$loginid' WHERE ID = '$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢標籤類別基本QueryString
function TagCategoryGetBaseQueryString() {
    return "SELECT `id`, `name`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `tag_category_view` WHERE 1";
}

//建立查詢標籤類別回傳資料
function TagCategoryBuildQueryResultData($accesstoken, $array) {
    if ($accesstoken != null) {
        return array("id" => $array["id"],
            "name" => $array["name"],
            "list_order" => $array["list_order"],
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
            "list_order" => $array["list_order"]);
    }
}

?>