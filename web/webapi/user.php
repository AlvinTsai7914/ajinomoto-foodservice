<?php

require_once 'tools.php';

//使用者登入POST
function User_LOGIN($dbconnect, $args, $fileData, &$resultData, &$programguid) {
    $programguid = null;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["account", "password"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $account = $data['account'];  //帳號
    $password = $data['password'];  //密碼
    //密碼加密
    $encrypt_PSW = EncryptString($password);

    //檢查帳號、密碼是否正確
    $query = "SELECT `id`, `status` from user WHERE account='$account' AND password='$encrypt_PSW'";
    if ($result = $dbconnect->query($query)) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $id = $r["id"];
            $status = $r["status"];
        }

        if ($result->num_rows != 1)
            return E_ACCOUNTORPASSWORDERROR;    //帳號或密碼錯誤

        if ($status != 0)//檢查帳號狀態
            return E_USERACCOUNTNOTACTIVE;  //帳號未啟用

        $query = "SELECT user_id, token from login_user WHERE user_id='$id'";
        if ($result = $dbconnect->query($query)) {
            $token = Create_Guid();
            if ($result->num_rows <= 0) {//沒有login
                $query = "INSERT INTO `login_user`(`user_id`, `token`) VALUES ('$id', '$token');";
                if (!$dbconnect->query($query))
                    throw new Exception($dbconnect->error);
            } else if ($result->num_rows == 1) {//有login
                $r = mysqli_fetch_array($result, MYSQLI_ASSOC);
                if ($r["user_id"] <= 2) {//使用者編號2以內，可以重複登入
                    $token = $r["token"];
                } else {
                    $query = "UPDATE `login_user` SET `token`='$token' WHERE user_id='$id'";
                    if (!$dbconnect->query($query))
                        throw new Exception($dbconnect->error);
                }
            } else //多筆login，錯誤
                return E_UNKNOWNERROR;

            UserUpdateLastLoginDataByID($dbconnect, $id);
            $resultData = array("token" => $token);
        } else
            throw new Exception($dbconnect->error);
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//使用者登出POST
function User_LOGOUT($dbconnect, $token, &$resultData, &$programguid) {
    $programguid = null;

    $resultCode = E_SUCCESS;
    $resultData = null;

    //刪除loginuser資料
    $query = "DELETE FROM `login_user` WHERE token='$token'";
    if ($dbconnect->query($query))
        $resultCode = E_SUCCESS;
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//查詢使用者GET
function User_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "6FFF9949-02F4-5E92-C56C-27817E4C8A63";
    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    //組合查詢字串
    $query = UserGetBaseQueryString();
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
            $resultData[] = UserBuildQueryResultData($dbconnect, $r);
        }
    } else {
        throw new Exception($dbconnect->error);
    }

    return $resultCode;
}

//新增使用者POST
function User_INSERT($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = "6DFCB35F-2D2B-76A3-5E86-4DEB4923AC16";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "account", "password", "phone", "email", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $name = $data['name'];
    $account = $data['account'];
    $password = $data['password'];
    $phone = $data['phone'];
    $email = $data['email'];
    $status = $data['status'];
    $remark = $data['remark'];

    //密碼加密
    $password = EncryptString($password);

    //檢查帳號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "user", "account", $account))
        return E_USERACCOUNTALREADYEXISTS;

    $query = "INSERT INTO `user`(`name`, `account`, `password`, `phone`, `email`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$name', '$account', '$password', '$phone', '$email', '$status', '$remark', '$loginid', '$loginid');";

    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改使用者PUT
function User_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "6D9B8D25-1E4F-0055-95D4-5735AF276A5B";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    if (!isset($args[0]))   //id
        return E_INPUTPARAMETERERROR;

    //檢查輸入參數
    $keys = ["name", "phone", "email", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];
    $name = $data['name'];
    $phone = $data['phone'];
    $email = $data['email'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查使用者編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "user", "id", $id) == false)
        return E_USERIDNOTFOUND;

    $query = "UPDATE `user` SET `name`='$name',`phone`='$phone',`email`='$email',`email`='$email',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除使用者DELETE
function User_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "8154DEBC-7B54-0D07-EA5F-37DAE7DAC654";

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
    if (CheckDataExistByFieldValue($dbconnect, "user", "id", $id) == false)
        return E_USERIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `user` SET `status`= 2, `u_user_id`='$loginid' WHERE ID='$id'";

    if ($result = $dbconnect->query($query)) {
        //刪除loginuser資料
        $query = "DELETE FROM `loginuser` WHERE user_id='$id'";
        @$dbconnect->query($query);
        $resultData = array("id" => $id);
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改使用者密碼PUT
function User_SETPASSWORD($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "3CD3753F-6F16-C0A0-8E55-770D9556EBC0";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    if (!isset($args[0]))   //id
        return E_INPUTPARAMETERERROR;

    //檢查輸入參數
    $keys = ["password"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];
    $password = $data['password'];

    //密碼加密
    $password = EncryptString($password);

    //檢查使用者編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "user", "id", $id) == false)
        return E_USERIDNOTFOUND;

    $query = "UPDATE `user` SET `password`='$password', `u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//使用者註冊角色POST
function User_REGISTERROLE($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = "06A86144-ACF4-2137-EC3C-6CE54C2193B4";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["role_id", "user_id", "unregisterall"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $role_id = $data['role_id'];
    $user_id = $data['user_id'];
    $unregisterall = filter_var($data['unregisterall'], FILTER_VALIDATE_BOOLEAN);

    //檢查使用者編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "user", "id", $user_id) == false)
        return E_USERIDNOTFOUND;

    //檢查角色編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "role", "id", $role_id) == false)
        return E_ROLEIDNOTFOUND;

    if ($unregisterall == true) {
        $query = "DELETE FROM `role_user` WHERE user_id='$user_id'";
        if ($dbconnect->query($query))
            $resultCode = E_SUCCESS;
        else
            throw new Exception($dbconnect->error);
    }

    $query = "SELECT `role_id`, `user_id` FROM `role_user` WHERE role_id='$role_id' && user_id='$user_id' ";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows <= 0) {
            $query = "INSERT INTO `role_user`(`role_id`, `user_id`) VALUES ('$role_id', '$user_id');";
            if (!$dbconnect->query($query))
                throw new Exception($dbconnect->error);
        }
    } else
        throw new Exception($dbconnect->error);

    if ($resultCode == E_SUCCESS)
        $resultData = array("user_id" => $user_id, "role_id" => $role_id);

    return $resultCode;
}

//使用者註銷角色POST
function User_UNREGISTERROLE($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = "CF98E084-9C98-EA9E-50AE-61104878A87E";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["role_id", "user_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $role_id = $data['role_id'];
    $user_id = $data['user_id'];
    //檢查權限是否存在
    $query = "SELECT `role_id`, `user_id` FROM `role_user` WHERE role_id='$role_id' && user_id='$user_id'";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows > 0) {
            $query = "DELETE FROM `role_user` WHERE role_id='$role_id' && user_id='$user_id'";
            if ($dbconnect->query($query))
                $resultCode = E_SUCCESS;
            else
                throw new Exception($dbconnect->error);
        }

        if ($resultCode == E_SUCCESS) {
            $resultData = array("user_id" => $user_id, "role_id" => $role_id);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//使用者註銷所有角色POST
function User_UNREGISTERALLROLES($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = "4B72BE10-FF93-33E3-4A50-40C6BF424B20";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["user_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $user_id = $data['user_id'];
    //檢查權限是否存在
    $query = "SELECT `role_id`, `user_id` FROM `role_user` WHERE user_id='$user_id'";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows > 0) {
            $query = "DELETE FROM `role_user` WHERE user_id='$user_id'";
            if ($dbconnect->query($query))
                $resultCode = E_SUCCESS;
            else
                throw new Exception($dbconnect->error);
        }

        if ($resultCode == E_SUCCESS) {
            $resultData = array("user_id" => $user_id);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//查詢登入使用者資料
function User_GETLOGINUSERDATA($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "7B65FAEF-9154-1F99-D624-7A5A55A31E53";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    if (CheckDataExistByFieldValue($dbconnect, "user", "id", $loginid)) {
        $query = UserGetBaseQueryString();
        $query .= " AND id='$loginid' AND status < 1";

        $result = $dbconnect->query($query);
        if ($result) {
            while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                $resultData[] = UserBuildQueryResultData($dbconnect, $r);
            }
        } else
            throw new Exception($dbconnect->error);
    } else
        return E_USERIDNOTFOUND;

    return $resultCode;
}

//修改登入使用者資料
function User_SETLOGINUSERDATA($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "A5389CFC-FC0B-67A3-C5A0-79D11D487083";

    //檢查操作權限
    $loginid = 1;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "phone", "email"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $name = $data['name'];
    $phone = $data['phone'];
    $email = $data['email'];

    //檢查使用者編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "user", "id", $loginid) == false)
        return E_USERIDNOTFOUND;

    $query = "UPDATE `user` SET `name`='$name',`phone`='$phone',`email`='$email',`u_user_id`='$loginid' WHERE id='$loginid'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $loginid);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改登入使用者密碼
function User_SETLOGINUSERPASSWORD($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "713911BE-9C23-CAB9-30E7-4618C567DF5B";

    //檢查操作權限
    $loginid = 1;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["old_password", "new_password"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $old_password = $data['old_password'];
    $new_password = $data['new_password'];

    //密碼加密
    $new_password = EncryptString($new_password);
    $old_password = EncryptString($old_password);

    //檢查使用者編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "user", "id", $loginid) == false)
        return E_USERIDNOTFOUND;

    //檢查帳號、密碼是否正確
    $query = "SELECT `id` from user WHERE id='$loginid' AND password='$old_password'";
    if ($result = $dbconnect->query($query)) {
        if ($result->num_rows != 1)
            return E_OLDPASSWORDERROR;    //帳號或密碼錯誤
    } else
        throw new Exception($dbconnect->error);

    $query = "UPDATE `user` SET `password`='$new_password', `u_user_id`='$loginid' WHERE ID='$loginid'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $loginid);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//查詢登入使用者程式
function User_GETLOGINUSERPROGRAM($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "A7E8C8FA-964D-EA5B-2E00-B6BCD3554366";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    if (!CheckDataExistByFieldValue($dbconnect, "user", "id", $loginid))
        return E_USERIDNOTFOUND;

    $query = "SELECT `user_id`, `user_account`, `user_name`, `user_status`, `role_id`, `role_name`, `role_status`, `program_id`, `program_name`, `program_status`, `program_guid`, `program_remark`, `program_category_id`, `program_category_name`, `program_category_status` FROM `user_role_program_view` WHERE user_id='$loginid' AND program_status < 1 order by program_category_id,program_id";
    if ($result = $dbconnect->query($query)) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $resultData[] = array("id" => $r['program_id'],
                "category_id" => $r['program_category_id'],
                "category_name" => $r['program_category_name'],
                "name" => $r['program_name'],
                "guid" => $r['program_guid'],
                "remark" => $r['program_remark']);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//查詢登入使用者樹狀選單
function User_GETLOGINUSERMENUTREE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "820D1963-27A0-4D67-B430-F7E32CC7E08C";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    if (!CheckDataExistByFieldValue($dbconnect, "user", "id", $loginid))
        return E_USERIDNOTFOUND;

    $query = "SELECT `id`, `parent_id`, `name`, `url`, `icon`, `program_ids`,`remark` FROM `user_role_menu_view` WHERE user_id='$loginid' AND status < 1 order by list_order";
    if ($result = $dbconnect->query($query)) {
        $bufferData = null;
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $bufferData[] = array("id" => $r['id'],
                "parent_id" => $r['parent_id'],
                "name" => $r['name'],
                "url" => $r['url'],
                "icon" => $r['icon'],
                "program_ids" => $r['program_ids'],
                "remark" => $r['remark']);
        }
        $resultData = UserGetLoginUserMenuTree($bufferData, 0);
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢使用者基本QueryString
function UserGetBaseQueryString() {
    return "SELECT `id`, `account`, `name`, `email`, `phone`, `last_login_time`, `last_login_ip`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `user_view` WHERE 1";
}

//建立查詢使用者回傳資料
function UserBuildQueryResultData($dbconnect, $array) {
    $roles = UserGetRoles($dbconnect, $array["id"]);

    return array("id" => $array["id"],
        "account" => $array["account"],
        "name" => $array["name"],
        "email" => $array['email'],
        "phone" => $array['phone'],
        "last_login_time" => $array['last_login_time'],
        "last_login_ip" => $array['last_login_ip'],
        "status" => $array['status'],
        "remark" => $array['remark'],
        "c_time" => $array['c_time'],
        "c_user_id" => $array['c_user_id'],
        "c_user_name" => $array['c_user_name'],
        "u_time" => $array['u_time'],
        "u_user_id" => $array['u_user_id'],
        "u_user_name" => $array['u_user_name'],
        "roles" => $roles);
}

function UserGetRoles($dbconnect, $id) {
    $roles = array();
    $query = "SELECT `role_id` FROM `role_user` WHERE user_id='$id'";
    $result = $dbconnect->query($query);
    if ($result) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $roles[] = $r["role_id"];
        }
    }
    return $roles;
}

//修改使用者最後登入時間及IP
function UserUpdateLastLoginDataByID($dbconnect, $id) {
    $lastlogintime = GetCurrentDateTime();
    $ip = GetClientIP();
    $query = "UPDATE `user` SET last_login_time='$lastlogintime', last_login_ip='$ip' WHERE id='$id'";
    @$dbconnect->query($query);
}

//取得子選單陣列
function UserGetLoginUserMenuTree($menuarray, $menuparentid) {
    if ($menuarray == null)
        return null;
    $bufferData = null;
    foreach ($menuarray as $value) {
        if ($value["parent_id"] == $menuparentid) {
            $value["submenu"] = UserGetLoginUserMenuTree($menuarray, $value["id"]);
            $bufferData[] = $value;
        }
    }
    return $bufferData;
}

?>