<?php

require_once 'tools.php';
require_once 'recipepro.php';
require_once 'higi.php';

//查詢會員
function Member_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "738343E4-E840-D20C-4DD2-279F63D55750";
    //檢查操作權限
    $loginid = 0;
    if (($resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    //組合查詢字串
    $query = MemberGetBaseQueryString();
    $query = $query . " AND status <= 2";

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
            $resultData[] = MemberBuildQueryResultData($dbconnect, $r);
        }
    } else {
        throw new Exception($dbconnect->error);
    }

    return $resultCode;
}

//新增會員
function Member_INSERT($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = "5C2C9FBB-3955-17D0-100E-C75905E3189D";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["account", "password", "name", "gender", "birthday", "phone", "restaurant_name", "restaurant_area_id", "restaurant_type", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $account = $data['account'];
    $password = EncryptString($data['password']);
    $verification = Create_Guid();
    $name = $data['name'];
    $gender = $data['gender'];
    $birthday = $data['birthday'];
    $phone = $data['phone'];
    $restaurant_name = $data['restaurant_name'];
    $restaurant_area_id = $data['restaurant_area_id'];
    $restaurant_type = $data['restaurant_type'];
    $status = $data['status'];
    $remark = $data['remark'];

    if ($name == "")
        $name = explode('@', $account)[0];

    //檢查帳號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "member", "account", $account))
        return E_MEMBERACCOUNTALREADYEXISTS;

    $query = "INSERT INTO `member`(`account`, `password`, `verification`, `name`, `gender`, `phone`, `restaurant_name`, `restaurant_area_id`, `restaurant_type`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$account', '$password', '$verification', '$name', '$gender', '$phone', '$restaurant_name', '$restaurant_area_id', '$restaurant_type', '$status', '$remark', '$loginid', '$loginid');";

    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id,
            "verification" => $verification,
        );
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改會員
function Member_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "0F0A5EF0-FF5A-A8F7-2671-7BFED240502B";
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
    $keys = ["name", "gender", "birthday", "phone", "restaurant_name", "restaurant_area_id", "restaurant_type", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    $name = $data['name'];
    $gender = $data['gender'];
    $birthday = $data['birthday'];
    $phone = $data['phone'];
    $restaurant_name = $data['restaurant_name'];
    $restaurant_area_id = $data['restaurant_area_id'];
    $restaurant_type = $data['restaurant_type'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查會員編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "member", "id", $id) == false)
        return E_MEMBERIDNOTFOUND;

    $query = "UPDATE `member` SET `name`='$name',`gender`='$gender',`phone`='$phone',`restaurant_name`='$restaurant_name',`restaurant_area_id`='$restaurant_area_id',`restaurant_type`='$restaurant_type',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE id='$id'";
    if ($dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改會員密碼
function Member_SETPASSWORD($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "F4E94E66-DDBC-8A33-0512-91B5AE8E1F80";

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

    $password = EncryptString($data['password']);
    $verification = Create_Guid();

    //檢查會員編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "member", "id", $id) == false)
        return E_MEMBERIDNOTFOUND;

    $query = "UPDATE `member` SET `verification`='$verification',`password`='$password',`u_user_id`='$loginid' WHERE id='$id'";

    if ($dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//啟用會員帳號
function Member_ENABLEACCOUNT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "A688416E-3372-1719-CCCB-BCB6BC657776";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["id", "verification"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $id = $data['id'];
    $verification = $data['verification'];

    //檢查會員編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "member", "id", $id) == false)
        return E_MEMBERIDNOTFOUND;

    $query = "SELECT status from member WHERE id='$id' AND verification='$verification'";
    $result = $dbconnect->query($query);
    if ($result) {
        if ($result->num_rows == 1) {
            $r = mysqli_fetch_array($result, MYSQLI_ASSOC);
            if ($r) {
                $member_status_id = $r['status'];
                if ($member_status_id == 1) {
                    $new_verification = Create_Guid();
                    $query = "UPDATE `member` SET `verification`='$new_verification',`status`='0' WHERE id='$id' AND verification='$verification'";
                    if ($dbconnect->query($query))
                        $resultData = array("id" => $id);
                    else
                        throw new Exception($dbconnect->error);
                } else
                    return E_MEMBERSTATUSERROR;
            } else
                return $dbconnect->error;
        } else
            return E_MEMBERVERIFICATION;
    } else
        return $dbconnect->error;

    return $resultCode;
}

//修改會員驗證碼
function Member_SETVERIFICATION($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "CE348E1D-774F-F85B-EDD4-494B6A4423DF";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    if (!isset($args[0]))   //id
        return E_INPUTPARAMETERERROR;

    $id = $args[0];
    $verification = Create_Guid();

    //檢查會員編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "member", "id", $id) == false)
        return E_MEMBERIDNOTFOUND;

    $query = "UPDATE `member` SET `verification`='$verification',`u_user_id`='$loginid' WHERE id='$id'";

    if ($dbconnect->query($query))
        $resultData = array("id" => $id, "verification" => $verification);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除會員
function Member_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "3A5DF0BA-5977-2D2F-5EAF-68B7543B98AF";

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
    if (CheckDataExistByFieldValue($dbconnect, "member", "id", $id) == false)
        return E_MEMBERIDNOTFOUND;

    //不做資料刪除，改將status設定為3
    $query = "UPDATE `member` SET `status`= 3,`u_user_id`='$loginid' WHERE ID='$id'";

    if ($dbconnect->query($query)) {
        //刪除loginmember資料
        $query = "DELETE FROM `login_member` WHERE member_id='$id'";
        try {
            $dbconnect->query($query);
        } catch (Exception $ex) {

        }
        $resultData = array("id" => $id);
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//會員登入
function Member_LOGIN($dbconnect, $args, $fileData, &$resultData, &$programguid) {
    $programguid = null;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["account", "password"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $account = $data['account'];  //帳號
    $password = EncryptString($data['password']);

    $query = "SELECT `id`, `status` from member WHERE account='$account' AND password='$password'";
    $result = $dbconnect->query($query);
    if ($result) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $id = $r["id"];
            $status_id = $r["status"];
        }

        if ($result->num_rows != 1)
            return E_ACCOUNTORPASSWORDERROR;    //帳號或密碼錯誤

        if ($status_id != 0)//檢查帳號狀態
            return E_MEMBERACCOUNTNOTACTIVE;  //帳號未啟用

        $query = "SELECT member_id from login_member WHERE member_id='$id'";
        $result = $dbconnect->query($query);
        if ($result) {
            $accesstoken = Create_Guid();
            if ($result->num_rows <= 0) {//沒有login
                $query = "INSERT INTO `login_member`(`member_id`, `token`) VALUES ('$id', '$accesstoken')";
                if (!$dbconnect->query($query))
                    throw new Exception($dbconnect->error);
            } else if ($result->num_rows == 1) {//有login
                $query = "UPDATE `login_member` SET `token`='$accesstoken' WHERE member_id='$id'";
                if (!$dbconnect->query($query))
                    throw new Exception($dbconnect->error);
            } else //多筆login，錯誤
                return E_UNKNOWNERROR;

            MemberUpdateLastLoginDataByID($dbconnect, $id);
            $resultData = array("token" => $accesstoken);
        } else
            throw new Exception($dbconnect->error);
    } else
        throw new Exception($dbconnect->error);
    return $resultCode;
}

//會員登出
function Member_LOGOUT($dbconnect, $accesstoken, &$resultData, &$programguid) {
    $programguid = null;

    $resultCode = E_SUCCESS;
    $resultData = null;

    //刪除loginmember資料
    $query = "DELETE FROM `login_member` WHERE token='$accesstoken'";
    if ($dbconnect->query($query))
        $resultCode = E_SUCCESS;
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//查詢登入會員資料
function Member_GET_LOGINMEMBERDATA($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = null;

    //取得會員編號
    $member_id = 0;
    if (( $resultCode = MemberGetIDByAccessToken($dbconnect, $accesstoken, $member_id)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    if (CheckDataExistByFieldValue($dbconnect, "member", "id", $member_id)) {
        $query = MemberGetBaseQueryString();
        $query .= " AND id='$member_id' AND status < 2";
        $result = $dbconnect->query($query);
        if ($result) {
            while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                $resultData[] = MemberBuildQueryResultData($dbconnect, $r);
            }
        } else
            throw new Exception($dbconnect->error);
    } else
        return E_MEMBERIDNOTFOUND;

    return $resultCode;
}

//修改登入會員資料
function Member_SETLOGINMEMBERDATA($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = null;

    //取得會員編號
    $member_id = 0;
    if (( $resultCode = MemberGetIDByAccessToken($dbconnect, $accesstoken, $member_id)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "gender", "birthday", "phone", "restaurant_name", "restaurant_area_id", "restaurant_type"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $name = $data['name'];
    $gender = $data['gender'];
    $birthday = $data['birthday'];
    $phone = $data['phone'];
    $restaurant_name = $data['restaurant_name'];
    $restaurant_area_id = $data['restaurant_area_id'];
    $restaurant_type = $data['restaurant_type'];

    //檢查會員編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "member", "id", $member_id) == false)
        return E_MEMBERIDNOTFOUND;

    $query = "UPDATE `member` SET `name`='$name',`gender`='$gender', `phone`='$phone',`restaurant_name`='$restaurant_name',`restaurant_area_id`='$restaurant_area_id',`restaurant_type`='$restaurant_type' WHERE id='$member_id'";

    if ($dbconnect->query($query))
        $resultData = array("id" => $member_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改登入會員密碼
function Member_SETLOGINMEMBERPASSWORD($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = null;

    //取得會員編號
    $member_id = 0;
    if (( $resultCode = MemberGetIDByAccessToken($dbconnect, $accesstoken, $member_id)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["old_password", "new_password"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $old_password = EncryptString($data['old_password']);
    $new_password = EncryptString($data['new_password']);

    //檢查會員編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "member", "id", $member_id) == false)
        return E_MEMBERIDNOTFOUND;

    //根據會員編號及舊密碼查詢會員資料
    $query = "SELECT `id` FROM `member` WHERE id = '$member_id' AND password='$old_password'";
    $result = $dbconnect->query($query);
    if ($result) {
        if ($result->num_rows != 1)
            return E_MEMBERPASSWORD;
    } else
        return E_MEMBERPASSWORD;

    $query = "UPDATE `member` SET `password`='$new_password' WHERE id ='$member_id'";
    if ($dbconnect->query($query))
        $resultData = array("id" => $member_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增登入會員專業食譜
function Member_ADDLOGINMEMBERRECIPEPRO($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = null;

    //取得會員編號
    $member_id = 0;
    if (( $resultCode = MemberGetIDByAccessToken($dbconnect, $accesstoken, $member_id)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["recipepro_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $recipepro_id = $data['recipepro_id'];

    //檢查會員編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "member", "id", $member_id) == false)
        return E_MEMBERIDNOTFOUND;

    //檢查專業食譜編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "recipepro", "id", $recipepro_id) == false)
        return E_RECIPEPROIDNOTFOUND;

    $query = "SELECT `member_id`, `recipepro_id` FROM `member_recipepro` WHERE member_id='$member_id' && recipepro_id='$recipepro_id' ";
    if ($result = $dbconnect->query($query)) {
        $r = mysqli_fetch_array($result, MYSQLI_ASSOC);
        if ($result->num_rows <= 0) {
            $query = "INSERT INTO `member_recipepro`(`member_id`, `recipepro_id`) VALUES ('$member_id', '$recipepro_id');";
            if ($dbconnect->query($query)) {
                $resultCode = E_SUCCESS;
            } else
                throw new Exception($dbconnect->error);
        }
    } else
        return $dbconnect->error;

    if ($resultCode == E_SUCCESS)
        $resultData = array("member_id" => $member_id, "recipepro_id" => $recipepro_id);

    return $resultCode;
}

//刪除登入會員專業食譜
function Member_DELETELOGINMEMBERRECIPEPRO($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = null;

    //取得會員編號
    $member_id = 0;
    if (( $resultCode = MemberGetIDByAccessToken($dbconnect, $accesstoken, $member_id)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["recipepro_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $recipepro_id = $data['recipepro_id'];

    //檢查會員編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "member", "id", $member_id) == false)
        return E_MEMBERIDNOTFOUND;

    //檢查文章編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "recipepro", "id", $recipepro_id) == false)
        return E_RECIPEPROIDNOTFOUND;

    $loves = 0;
    $query = "DELETE FROM `member_recipepro` WHERE member_id='$member_id' && recipepro_id='$recipepro_id'";
    if ($dbconnect->query($query)) {
        $resultCode = E_SUCCESS;
    } else
        throw new Exception($dbconnect->error);

    if ($resultCode == E_SUCCESS)
        $resultData = array("member_id" => $member_id, "recipepro_id" => $recipepro_id);

    return $resultCode;
}

//查詢登入會員專業食譜
function Member_GETLOGINMEMBERRECIPEPRO($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = null;

    //取得會員編號
    $member_id = 0;
    if (( $resultCode = MemberGetIDByAccessToken($dbconnect, $accesstoken, $member_id)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = "SELECT `member_id`, `member_account`, `member_name`, `member_status`, `id`, `name`, `pic_url`, `pic_alt`, `feature`, `tags`, `price`, `type`, `style`, `product_ids`, `product_names`, `material_weight`, `nutrition`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `member_recipepro_view` WHERE member_id='$member_id' AND status < 1";

    if (isset($request["query"]))
        $query = $query . " AND " . $request["query"];

    if (isset($request["order"]))
        $query = $query . " ORDER BY " . $request["order"];
    else
        $query = $query . " ORDER BY list_order";

    $result = $dbconnect->query($query);
    if ($result) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $resultData[] = RecipeProBuildQueryResultData($accesstoken, $r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增登入會員招客秘笈
function Member_ADDLOGINMEMBERHIGI($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = null;

    //取得會員編號
    $member_id = 0;
    if (( $resultCode = MemberGetIDByAccessToken($dbconnect, $accesstoken, $member_id)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["higi_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $higi_id = $data['higi_id'];

    //檢查會員編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "member", "id", $member_id) == false)
        return E_MEMBERIDNOTFOUND;

    //檢查專業食譜編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "higi", "id", $higi_id) == false)
        return E_HIGIIDNOTFOUND;

    $query = "SELECT `member_id`, `higi_id` FROM `member_higi` WHERE member_id='$member_id' && higi_id='$higi_id' ";
    if ($result = $dbconnect->query($query)) {
        $r = mysqli_fetch_array($result, MYSQLI_ASSOC);
        if ($result->num_rows <= 0) {
            $query = "INSERT INTO `member_higi`(`member_id`, `higi_id`) VALUES ('$member_id', '$higi_id');";
            if ($dbconnect->query($query)) {
                $resultCode = E_SUCCESS;
            } else
                throw new Exception($dbconnect->error);
        }
    } else
        return $dbconnect->error;

    if ($resultCode == E_SUCCESS)
        $resultData = array("member_id" => $member_id, "higi_id" => $higi_id);

    return $resultCode;
}

//刪除登入會員招客秘笈
function Member_DELETELOGINMEMBERHIGI($dbconnect, $accesstoken, $fileData, &$resultData, &$programguid) {
    $programguid = null;

    //取得會員編號
    $member_id = 0;
    if (( $resultCode = MemberGetIDByAccessToken($dbconnect, $accesstoken, $member_id)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["higi_id"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $higi_id = $data['higi_id'];

    //檢查會員編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "member", "id", $member_id) == false)
        return E_MEMBERIDNOTFOUND;

    //檢查文章編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "higi", "id", $higi_id) == false)
        return E_HIGIIDNOTFOUND;

    $loves = 0;
    $query = "DELETE FROM `member_higi` WHERE member_id='$member_id' && higi_id='$higi_id'";
    if ($dbconnect->query($query)) {
        $resultCode = E_SUCCESS;
    } else
        throw new Exception($dbconnect->error);

    if ($resultCode == E_SUCCESS)
        $resultData = array("member_id" => $member_id, "higi_id" => $higi_id);

    return $resultCode;
}

//查詢登入會員招客秘笈
function Member_GETLOGINMEMBERHIGI($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = null;

    //取得會員編號
    $member_id = 0;
    if (( $resultCode = MemberGetIDByAccessToken($dbconnect, $accesstoken, $member_id)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = "SELECT `member_id`, `member_account`, `member_name`, `member_status`, `id`, `name`, `pic_url`, `pic_alt`, `content`, `description`, `recipepro_id`, `recipepro_name`, `recipepro_pic_url`, `recipepro_pic_alt`, `recipepro_member_only`, `brand_id`, `brand_name`, `brand_pic_url`, `brand_pic_alt`, `product_id`, `product_name`, `product_pic_urls`, `product_pic_alts`, `tags`,`type`, `style`,`methods`, `note`, `note_pic_url`, `note_pic_alt`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `member_higi_view` WHERE member_id='$member_id' AND status < 1";

    if (isset($request["query"]))
        $query = $query . " AND " . $request["query"];

    if (isset($request["order"]))
        $query = $query . " ORDER BY " . $request["order"];
    else
        $query = $query . " ORDER BY list_order";

    $result = $dbconnect->query($query);
    if ($result) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $resultData[] = HigiBuildQueryResultData($accesstoken, $r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢會員基本QueryString
function MemberGetBaseQueryString() {
    return "SELECT `id`, `account`, `verification`, `name`, `gender`, `birthday`, `phone`, `restaurant_name`, `restaurant_zipcode`, `restaurant_city_id`, `restaurant_city_name`, `restaurant_area_id`, `restaurant_area_name`, `restaurant_type`, `last_login_time`, `last_login_ip`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `member_view` WHERE 1";
}

//建立查詢會員回傳資料
function MemberBuildQueryResultData($dbconnect, $array) {
    return array("id" => $array["id"],
        "account" => $array["account"],
        "verification" => $array["verification"],
        "name" => $array["name"],
        "gender" => $array["gender"],
        "birthday" => $array["birthday"],
        "phone" => $array['phone'],
        "restaurant_name" => $array['restaurant_name'],
        "restaurant_zipcode" => $array['restaurant_zipcode'],
        "restaurant_city_id" => $array['restaurant_city_id'],
        "restaurant_city_name" => $array['restaurant_city_name'],
        "restaurant_area_id" => $array['restaurant_area_id'],
        "restaurant_area_name" => $array['restaurant_area_name'],
        "restaurant_type" => $array['restaurant_type'],
        "last_login_time" => $array['last_login_time'],
        "last_login_ip" => $array['last_login_ip'],
        "status" => $array['status'],
        "remark" => $array['remark'],
        "c_time" => $array['c_time'],
        "c_user_id" => $array['c_user_id'],
        "c_user_name" => $array['c_user_name'],
        "u_time" => $array['u_time'],
        "u_user_id" => $array['u_user_id'],
        "u_user_name" => $array['u_user_name']);
}

//修改會員最後登入時間及IP
function MemberUpdateLastLoginDataByID($dbconnect, $id) {
    if (!$dbconnect)
        return E_DBCONNECTERROR;
    $lastlogintime = GetCurrentDateTime();
    $ip = GetClientIP();
    $query = "UPDATE `member` SET last_login_time='$lastlogintime', last_login_ip='$ip' WHERE id='$id'";
    try {
        $dbconnect->query($query);
    } catch (Exception $e) {

    }
}

//依據Account取得會員編號
function MemberGetIDByAccount($dbconnect, $account, &$member_id) {
    if (!$dbconnect)
        return E_DBCONNECTERROR;

    //根據accesstoken，在login_member中尋找userID
    $query = "SELECT `id` FROM `member` WHERE account='$account'";
    $result = $dbconnect->query($query);
    if ($result) {
        if ($result->num_rows == 1) {
            $r = mysqli_fetch_array($result, MYSQLI_ASSOC);
            if ($r) {
                //根據userID及programguid在useer_role_program_view尋找資料
                $member_id = $r['id'];
                return E_SUCCESS;
            } else
                return $dbconnect->error;
        } else
            return E_MEMBERACCOUNTNOTFOUND;
    } else
        return $dbconnect->error;
}

//依據AccessToken取得會員編號
function MemberGetIDByAccessToken($dbconnect, $accesstoken, &$member_id) {
    if (!$dbconnect)
        return E_DBCONNECTERROR;

    //根據accesstoken，在loginuser中尋找userID
    $query = "SELECT `member_id` FROM `login_member` WHERE token='$accesstoken'";
    $result = $dbconnect->query($query);
    if ($result) {
        if ($result->num_rows == 1) {
            $r = mysqli_fetch_array($result, MYSQLI_ASSOC);
            if ($r) {
                //根據userID及programguid在useer_role_program_view尋找資料
                $member_id = $r['member_id'];
                return E_SUCCESS;
            } else
                return $dbconnect->error;
        } else
            return E_ACCESSTOKENERROR;
    } else
        return $dbconnect->error;
}
