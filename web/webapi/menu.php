<?php

require_once 'tools.php';

//查詢選單GET
function Menu_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "89996F46-3820-BC89-DA21-8E8BC161B73B";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = MenuGetBaseQueryString();
    $query = $query . " AND status <= 1";

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
            $resultData[] = MenuBuildQueryResultData($r);
        }
    } else {
        throw new Exception($dbconnect->error);
    }

    return $resultCode;
}

//新增選單POST
function Menu_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "6D2FDBFF-8429-ADF4-95F8-E947C9563093";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["parent_id", "name", "url", "icon", "program_ids", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $parent_id = $data['parent_id'];
    $name = $data['name'];
    $url = $data['url'];
    $icon = $data['icon'];
    $program_ids = $data['program_ids'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    $query = "INSERT INTO `menu`(`parent_id`, `name`, `url`, `icon`, `program_ids`, `list_order`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$parent_id', '$name','$url','$icon','$program_ids','$list_order','$status','$remark', '$list_order', '$loginid');";

    if ($dbconnect->query($query)) {
        $resultData[] = array("id" => $dbconnect->insert_id);
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改選單PUT
function Menu_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "C02A5FF9-CAA4-2A9C-1983-600EA55E0D64";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["parent_id", "name", "url", "icon", "program_ids", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    $parent_id = $data['parent_id'];
    $name = $data['name'];
    $url = $data['url'];
    $icon = $data['icon'];
    $program_ids = $data['program_ids'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查選單是否合法
    if (MenuCheckRule($dbconnect, $id, $parent_id) == false)
        return E_MENURULEERROR;

    //檢查選單編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "menu", "id", $id) == false)
        return E_MENUIDNOTFOUND;

    $query = "UPDATE `menu` SET `parent_id`='$parent_id',`name`='$name',`url`='$url', `icon`='$icon',`program_ids`='$program_ids',`list_order`='$list_order',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE id='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除選單DELETE
function Menu_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "8CADB2EF-4B10-6FD4-E521-7B8E62C43483";
    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    //檢查選單編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "menu", "id", $id) == false)
        return E_MENUIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `menu` SET `status`=2,`u_user_id`='$loginid' WHERE id='$id'";

    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//查詢選單規則是否正確
function MenuCheckRule($dbconnect, $id, $parent_id) {
    if (empty($parent_id) || $parent_id == 0)
        return true;
    else if ($id == $parent_id)
        return false;
    else {
        $query = "SELECT id, parent_id from menu WHERE ID='$parent_id'";
        if ($result = $dbconnect->query($query)) {
            while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                if ($r["parent_id"] == $id)
                    return false;
                else
                    return MenuCheckRule($dbconnect, $id, $r["parent_id"]);
            }
        } else
            return false;
    }
}

//取得查詢選單基本QueryString
function MenuGetBaseQueryString() {
    return "SELECT `id`, `parent_id`, `parent_name`, `name`, `url`, `icon`, `program_ids`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `menu_view` WHERE 1";
}

//建立查詢選單回傳資料
function MenuBuildQueryResultData($array) {
    return array("id" => $array["id"],
        "parent_id" => $array["parent_id"],
        "parent_name" => $array["parent_name"],
        "name" => $array["name"],
        "url" => $array["url"],
        "icon" => $array["icon"],
        "program_ids" => $array["program_ids"],
        "list_order" => $array['list_order'],
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