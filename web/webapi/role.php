<?php

require_once 'tools.php';
require_once 'program.php';
require_once 'menu.php';

//查詢角色GET
function Role_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "D9D0FB04-1171-CBFF-002F-1D02A7D01E5E";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $query = RoleGetBaseQueryString();
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
            $resultData[] = RoleBuildQueryResultData($r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增角色POST
function Role_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "2482DDDC-DCB3-C85E-B72D-DAE2330DCE30";

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

    $query = "INSERT INTO `role`(`name`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$name', '$status', '$remark', '$loginid', '$loginid');";

    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改角色PUT
function Role_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "F40D8A06-3D77-C197-CE61-25F7666AB056";

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

    //檢查角色編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "role", "id", $id) == false)
        return E_ROLEIDNOTFOUND;

    $query = "UPDATE `role` SET `name`='$name',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query)) {
        $resultData = array("id" => $id);
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除角色DELETE
function Role_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "E6BADA98-AA9D-8C83-5354-B1DF2A83CB92";

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
    if (CheckDataExistByFieldValue($dbconnect, "role", "id", $id) == false)
        return E_ROLEIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `role` SET `status`= 2 ,`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//角色註冊程式POST
function Role_REGISTERPROGRAM($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = "333CDC63-3438-A89A-005B-4610ED7D00C8";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["program_id", "role_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $program_id = $data['program_id'];
    $role_id = $data['role_id'];

    //檢查程式編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "program", "id", $program_id) == false)
        return E_PROGRAMIDNOTFOUND;

    //檢查角色編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "role", "id", $role_id) == false)
        return E_ROLEIDNOTFOUND;

    $query = "SELECT `role_id`, `program_id` FROM `role_program` WHERE program_id='$program_id' && role_id='$role_id' ";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows <= 0) {
            $query = "INSERT INTO `role_program`(`program_id`, `role_id`) VALUES ('$program_id','$role_id')";
            if (!$dbconnect->query($query))
                throw new Exception($dbconnect->error);
        }
    } else
        throw new Exception($dbconnect->error);

    if ($resultCode == E_SUCCESS)
        $resultData = array("role_id" => $role_id, "program_id" => $program_id);

    return $resultCode;
}

//角色註冊所有程式POST
function Role_REGISTERALLPROGRAMS($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = "C304430C-7147-57C7-88A4-FD082D94121E";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["role_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $role_id = $data['role_id'];

    //檢查角色編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "role", "id", $role_id) == false)
        return E_ROLEIDNOTFOUND;

    //取得所有程式
    $query = "SELECT  `id` FROM `program` WHERE 1";
    if ($result = $dbconnect->query($query)) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $program_id = $r["id"];
            $query = "INSERT INTO `role_program`(`program_id`, `role_id`) VALUES ('$program_id','$role_id')";
            $dbconnect->query($query);
        }
    }
    $resultData = array("role_id" => $role_id);
    return $resultCode;
}

//角色註銷程式POST
function Role_UNREGISTERPROGRAM($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = "A860C4A4-37AE-730D-5B70-C6BA27A5343D";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["program_id", "role_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $program_id = $data['program_id'];
    $role_id = $data['role_id'];

    //檢查權限是否存在
    $query = "SELECT `program_id`, `role_id` FROM `role_program` WHERE program_id='$program_id' && role_id='$role_id' ";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows > 0) {
            $query = "DELETE FROM `role_program` WHERE program_id='$program_id' && role_id='$role_id'";
            if (!$dbconnect->query($query))
                throw new Exception($dbconnect->error);
        }

        if ($resultCode == E_SUCCESS) {
            $resultData = array("program_id" => $program_id,
                "role_id" => $role_id);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//角色註銷所有程式POST
function Role_UNREGISTERALLPROGRAMS($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = "209D0448-9E99-50DA-056F-580D9130E829";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["role_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $role_id = $data['role_id'];

    //檢查權限是否存在
    $query = "SELECT `program_id`, `role_id` FROM `role_program` WHERE role_id='$role_id' ";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows > 0) {
            $query = "DELETE FROM `role_program` WHERE role_id='$role_id'";
            if (!$dbconnect->query($query))
                throw new Exception($dbconnect->error);
        }

        if ($resultCode == E_SUCCESS) {
            $resultData = array("role_id" => $role_id);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//查詢角色程式GET
function Role_GETROLEPROGRAM($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "1C273312-7AC3-CC8B-DC40-A704E9DCF5A5";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = "SELECT `role_id`, `role_name`, `role_status`, `id`, `category_id`, `category_name`, `name`, `guid`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `role_program_view` WHERE 1";
    $query = $query . " AND status <= 1";

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;


    $id = $args[0];
    $query = $query . " AND role_id='$id'";

    if (isset($request["query"]))
        $query = $query . " AND " . $request["query"];

    if (isset($request["order"]))
        $query = $query . " ORDER BY " . $request["order"];
    else
        $query = $query . " ORDER BY category_id, id";

    $result = $dbconnect->query($query);
    if ($result) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $resultData[] = ProgramBuildQueryResultData($r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//角色註冊選單POST
function Role_REGISTERMENU($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = "FA0100D2-EF87-0731-B345-0C0E347AEE91";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["menu_id", "role_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $menu_id = $data['menu_id'];
    $role_id = $data['role_id'];

    //檢查選單編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "menu", "id", $menu_id) == false)
        return E_MENUIDNOTFOUND;

    //檢查角色編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "role", "id", $role_id) == false)
        return E_ROLEIDNOTFOUND;

    $query = "SELECT `menu_id`, `role_id` FROM `role_menu` WHERE menu_id='$menu_id' && role_id='$role_id' ";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows <= 0) {
            $query = "INSERT INTO `role_menu`(`menu_id`, `role_id`) VALUES ('$menu_id','$role_id')";
            if (!$dbconnect->query($query))
                throw new Exception($dbconnect->error);
        }
    } else
        throw new Exception($dbconnect->error);

    if ($resultCode == E_SUCCESS)
        $resultData = array("role_id" => $role_id, "menu_id" => $menu_id);

    return $resultCode;
}

//角色註冊所有選單POST
function Role_REGISTERALLMENUS($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = "488846F4-CE7B-4334-2EB3-FA994E42CD86";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["role_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $role_id = $data['role_id'];

    //取得所有選單
    $query = "SELECT  `id` FROM `menu` WHERE 1";
    if ($result = $dbconnect->query($query)) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $menu_id = $r["id"];
            $query = "INSERT INTO `role_menu`(`menu_id`, `role_id`) VALUES ('$menu_id','$role_id')";
            $dbconnect->query($query);
        }
    }
    $resultData = array("role_id" => $role_id);

    return $resultCode;
}

//角色註銷選單POST
function Role_UNREGISTERMENU($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = "901C788A-BDEC-80F4-4971-B2D26154D253";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["menu_id", "role_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $menu_id = $data['menu_id'];
    $role_id = $data['role_id'];

    //檢查權限是否存在
    $query = "SELECT `menu_id`, `role_id` FROM `role_menu` WHERE menu_id='$menu_id' && role_id='$role_id' ";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows > 0) {
            $query = "DELETE FROM `role_menu` WHERE menu_id='$menu_id' && role_id='$role_id'";
            if (!$dbconnect->query($query))
                throw new Exception($dbconnect->error);
        }

        if ($resultCode == E_SUCCESS) {
            $resultData = array("menu_id" => $menu_id,
                "role_id" => $role_id);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//角色註銷所有選單POST
function Role_UNREGISTERALLMENUS($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = "6BF9D523-FEDE-E45D-677E-3FB9CA5BCA4A";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["role_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $role_id = $data['role_id'];

    //檢查選單是否存在
    $query = "SELECT `menu_id`, `role_id` FROM `role_menu` WHERE role_id='$role_id' ";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows > 0) {
            $query = "DELETE FROM `role_menu` WHERE role_id='$role_id'";
            if (!$dbconnect->query($query))
                throw new Exception($dbconnect->error);
        }

        if ($resultCode == E_SUCCESS) {
            $resultData = array("role_id" => $role_id);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//查詢角色選單GET
function Role_GETROLEMENU($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "5021F926-4DB1-D021-2BE7-5E562BE3423F";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = "SELECT `role_id`, `role_name`, `role_status`, `id`, `parent_id`, `parent_name`, `name`, `url`, `icon`, `program_ids`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `role_menu_view` WHERE 1";
    $query = $query . " AND status <= 1";

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];
    $query = $query . " AND role_id='$id'";

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
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢角色基本QueryString
function RoleGetBaseQueryString() {
    return "SELECT `id`, `name`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `role_view` WHERE 1";
}

//建立查詢使用者回傳資料
function RoleBuildQueryResultData($array) {
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
