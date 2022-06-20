<?php

require_once 'tools.php';

//查詢標籤GET
function Tag_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "D9970BAB-7ACD-E126-E48D-B3270BB03DCC";

    //檢查操作權限
    $loginid = 0;
    if ($accesstoken != null)
        if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
            return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = TagGetBaseQueryString();

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
            $resultData[] = TagBuildQueryResultData($accesstoken, $r);
        }
    } else {
        throw new Exception($dbconnect->error);
    }

    return $resultCode;
}

//新增標籤POST
function Tag_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "16DDD9DB-5AC0-1A8A-B434-9724289EBB58";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["category_id", "name", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $category_id = $data['category_id'];
    $name = $data['name'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查標籤類別編號是否存在
    if (CheckDataExistByFieldValue($dbconnect, "tag_category", "id", $category_id) == false)
        return E_TAGCATEGORYIDNOTFOUND;

    $query = "INSERT INTO `tag`(`category_id`, `name`, `list_order`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$category_id', '$name', '$list_order', '$status', '$remark', '$loginid', '$loginid');";
    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改標籤PUT
function Tag_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "62358D33-6D84-4775-F3AA-DF35DC485EA5";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["category_id", "name", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    $category_id = $data['category_id'];
    $name = $data['name'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查標籤類別編號是否存在
    if (CheckDataExistByFieldValue($dbconnect, "tag_category", "id", $category_id) == false)
        return E_TAGCATEGORYIDNOTFOUND;

    //檢查標籤編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "tag", "id", $id) == false)
        return E_TAGIDNOTFOUND;

    $query = "UPDATE `tag` SET `category_id`='$category_id',`name`='$name',`list_order`='$list_order',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE id='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除標籤DELETE
function Tag_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "BE30830D-2ADA-5E43-A4DB-522F3AE4B563";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    //檢查標籤編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "tag", "id", $id) == false)
        return E_TAGIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `tag` SET `status`=2,`u_user_id`='$loginid' WHERE id='$id'";

    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢標籤基本QueryString
function TagGetBaseQueryString() {
    return "SELECT `id`, `category_id`, `category_name`, `name`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `tag_view` WHERE 1";
}

//建立查詢標籤回傳資料
function TagBuildQueryResultData($accesstoken, $array) {
    if ($accesstoken != null) {
        return array("id" => $array["id"],
            "category_id" => $array["category_id"],
            "category_name" => $array["category_name"],
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
            "category_id" => $array["category_id"],
            "category_name" => $array["category_name"],
            "name" => $array["name"],
            "list_order" => $array["list_order"]);
    }
}

?>