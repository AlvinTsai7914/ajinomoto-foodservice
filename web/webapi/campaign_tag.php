<?php

require_once 'tools.php';

//查詢餐飲情報標籤GET
function Campaign_Tag_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "A6972072-86EA-090B-FD8F-49AB5EFC645E";

    //檢查操作權限
    $loginid = 0;
    if ($accesstoken != null)
        if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
            return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = NewsCategoryGetBaseQueryString();
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
            $resultData[] = NewsCategoryBuildQueryResultData($accesstoken, $r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增餐飲情報標籤POST
function Campaign_Tag_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "E25301FD-12E2-DE74-35FD-251E32F1FD25";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "color", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $name = $data['name'];
    $color = $data['color'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    $query = "INSERT INTO `campaign_tag`(`name`, `color`, `list_order`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$name', '$color', '$list_order', '$status', '$remark', '$loginid', '$loginid');";
    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改餐飲情報標籤PUT
function Campaign_Tag_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "4B01A5BD-A381-992A-2AB2-CB41783CCFDB";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "color", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    $name = $data['name'];
    $color = $data['color'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查餐飲情報標籤編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "campaign_tag", "id", $id) == false)
        return E_CAMPAIGNTAGIDNOTFOUND;

    $query = "UPDATE `campaign_tag` SET `name`='$name',`color`='$color',`list_order`='$list_order',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除餐飲情報標籤DELETE
function Campaign_Tag_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "88E18D70-0C95-996D-FBD7-2E14F6B225AF";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    //檢查餐飲情報標籤編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "campaign_tag", "id", $id) == false)
        return E_NEWSCATEGORYIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `campaign_tag` SET `status`= 2,`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢餐飲情報標籤基本QueryString
function NewsCategoryGetBaseQueryString() {
    return "SELECT `id`, `name`, `color`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `campaign_tag_view` WHERE 1";
}

//建立查詢餐飲情報標籤回傳資料
function NewsCategoryBuildQueryResultData($accesstoken, $array) {
    if ($accesstoken != null) {
        return array("id" => $array["id"],
            "name" => $array["name"],
            "color" => $array["color"],
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
            "color" => $array["color"],
            "list_order" => $array["list_order"]);
    }
}

?>