<?php

require_once 'tools.php';

//查詢程式類別GET
function Program_Category_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "A5E214B8-215C-7102-CFA5-30856A548C6A";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = ProgramCategoryGetBaseQueryString();
    $query = $query . " AND status <= 1";

    if (isset($args[0]) && $args[0] != 0) {
        $id = $args[0];
        $query = $query . " AND id='$id'";
    }

    if (isset($request["query"]))
        $query = $query . " AND " . $request["query"];

    if (isset($request["order"]))
        $query = $query . " ORDER BY " . $request["order"];

    $result = $dbconnect->query($query);
    if ($result) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $resultData[] = ProgramCategoryBuildQueryResultData($r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增程式類別POST
function Program_Category_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "250038B2-9B2A-8B92-FEDB-031694588D3F";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $name = $data['name'];    //名稱
    $status = $data['status'];      //狀態：0：啟用，其他：停用
    $remark = $data['remark'];   //備註

    $query = "INSERT INTO `program_category`(`name`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$name', '$status', '$remark', '$loginid', '$loginid');";
    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改程式類別PUT
function Program_Category_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "D4AA0838-8D01-A7CB-D35A-E21221C1AA64";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    $name = $data['name'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查程式類別編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "program_category", "id", $id) == false)
        return E_PROGRAMCATEGORYIDNOTFOUND;

    $query = "UPDATE `program_category` SET `name`='$name',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除程式類別DELETE
function Program_Category_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "619CA968-41B5-A481-4EFE-D3C60A5A6CFD";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    //檢查程式類別編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "program_category", "id", $id) == false)
        return E_PROGRAMCATEGORYIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `program_category` SET `status`= 2,`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢程式類別基本QueryString
function ProgramCategoryGetBaseQueryString() {
    return "SELECT `id`, `name`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `program_category_view` WHERE 1";
}

//建立查詢程式類別回傳資料
function ProgramCategoryBuildQueryResultData($array) {
    return array("id" => $array["id"],
        "name" => $array["name"],
        "status" => $array['status'],
        "remark" => $array['remark'],
        "c_time" => $array['c_time'],
        "c_user_id" => $array['c_user_id'],
        "c_user_name" => $array['c_user_name'],
        "u_time" => $array['u_time'],
        "u_user_id" => $array['u_user_id'],
        "u_user_name" => $array['u_user_name']);
}

?>