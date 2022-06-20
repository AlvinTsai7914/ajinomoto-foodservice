<?php

require_once 'tools.php';

//查詢專業食譜GET
function RecipePro_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "7AC29E49-0D42-E418-311E-5DF01056F5FB";
    //檢查操作權限
    $loginid = 0;
    if ($accesstoken != null)
        if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
            return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = RecipeProGetBaseQueryString();
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
            $resultData[] = RecipeProBuildQueryResultData($accesstoken, $r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增專業食譜POST
function RecipePro_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "4EB21110-0D03-5FCA-C249-D7B119A2C716";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "pic_url", "pic_alt", "feature", "tags", "price", "type", "style", "product_ids", "material_weight", "nutrition", "member_only", "visitor", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $name = $data['name'];
    $pic_url = $data['pic_url'];
    $pic_alt = $data['pic_alt'];
    $feature = $data['feature'];
    $tags = $data['tags'];
    $price = $data['price'];
    $type = $data['type'];
    $style = $data['style'];
    $product_ids = $data['product_ids'];
    $material_weight = $data['material_weight'];
    $nutrition = $data['nutrition'];
    $member_only = $data['member_only'];
    $visitor = $data['visitor'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    $query = "INSERT INTO `recipepro`(`name`, `pic_url`, `pic_alt`, `feature`, `tags`, `price`, `type`, `style`, `product_ids`, `material_weight`, `nutrition`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$name', '$pic_url', '$pic_alt', '$feature', '$tags', '$price', '$type', '$style', '$product_ids', '$material_weight', '$nutrition', '$member_only', '$visitor', '$list_order', '$status', '$remark', '$loginid', '$loginid');";

    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改專業食譜PUT
function RecipePro_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "E27B2AEA-D0F7-BF15-A3E7-B80BE874DF3C";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "pic_url", "pic_alt", "feature", "tags", "price", "type", "style", "product_ids", "material_weight", "nutrition", "member_only", "visitor", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    $name = $data['name'];
    $pic_url = $data['pic_url'];
    $pic_alt = $data['pic_alt'];
    $feature = $data['feature'];
    $tags = $data['tags'];
    $price = $data['price'];
    $type = $data['type'];
    $style = $data['style'];
    $product_ids = $data['product_ids'];
    $material_weight = $data['material_weight'];
    $nutrition = $data['nutrition'];
    $member_only = $data['member_only'];
    $visitor = $data['visitor'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查專業食譜編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "recipepro", "id", $id) == false)
        return E_RECIPEPROIDNOTFOUND;

    $query = "UPDATE `recipepro` SET `name`='$name',`pic_url`='$pic_url',`pic_alt`='$pic_alt',`feature`='$feature',`tags`='$tags',`price`='$price',`type`='$type',`style`='$style',`product_ids`='$product_ids',`material_weight`='$material_weight',`nutrition`='$nutrition',`member_only`='$member_only',`visitor`='$visitor',`list_order`='$list_order',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query)) {
        $resultData = array("id" => $id);
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//增加瀏覽人數PUT
function RecipePro_ADDVISITOR($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "88475F0A-9820-4349-3804-3C287502E10E";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    //檢查專業食譜編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "recipepro", "id", $id) == false)
        return E_RECIPEPROIDNOTFOUND;

    $vistors = 0;
    $query = "SELECT `visitor` FROM `recipepro` WHERE id = '$id'";
    if ($result = $dbconnect->query($query)) {
        $r = mysqli_fetch_array($result, MYSQLI_ASSOC);
        $visitor = $r["visitor"] + 1;
    } else
        throw new Exception($dbconnect->error);

    $query = "UPDATE `recipepro` SET `visitor` = '$visitor', `u_user_id` = '$loginid' WHERE id = '$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除專業食譜DELETE
function RecipePro_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "B888A3E3-5588-700F-B841-FD618D4801D2";

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
    if (CheckDataExistByFieldValue($dbconnect, "recipepro", "id", $id) == false)
        return E_RECIPEPROIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `recipepro` SET `status`= 2 ,`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢角色基本QueryString
function RecipeProGetBaseQueryString() {
    return "SELECT `id`, `name`, `pic_url`, `pic_alt`, `feature`, `tags`, `price`, `type`, `style`, `product_ids`, `material_weight`, `product_names`, `nutrition`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `recipepro_view` WHERE 1";
}

//建立查詢使用者回傳資料
function RecipeProBuildQueryResultData($accesstoken, $array) {
    if ($accesstoken != null) {
        return array("id" => $array["id"],
            "name" => $array["name"],
            "pic_url" => $array['pic_url'],
            "pic_alt" => $array['pic_alt'],
            "feature" => $array['feature'],
            "tags" => $array['tags'],
            "price" => $array['price'],
            "type" => $array['type'],
            "style" => $array['style'],
            "product_ids" => $array['product_ids'],
            "product_names" => $array['product_names'],
            "material_weight" => $array['material_weight'],
            "nutrition" => $array['nutrition'],
            "member_only" => $array['member_only'],
            "visitor" => $array['visitor'],
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
            "feature" => $array['feature'],
            "tags" => $array['tags'],
            "price" => $array['price'],
            "type" => $array['type'],
            "style" => $array['style'],
            "product_ids" => $array['product_ids'],
            "product_names" => $array['product_names'],
            "material_weight" => $array['material_weight'],
            "nutrition" => $array['nutrition'],
            "member_only" => $array['member_only'],
            "visitor" => $array['visitor'],
            "list_order" => $array['list_order']);
    }
}

?>
