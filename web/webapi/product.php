<?php

require_once 'tools.php';

//查詢商品GET
function Product_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "04732B43-9951-41A2-4669-23CFF9C5511C";
    //檢查操作權限
    $loginid = 0;
    if ($accesstoken != null)
        if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
            return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = ProductGetBaseQueryString();
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
            $resultData[] = ProductBuildQueryResultData($accesstoken, $r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增商品POST
function Product_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "C1A391AC-6DA5-3368-8D90-5798F00B3585";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["brand_id", "name", "pic_urls", "pic_alts", "tag", "content", "tips", "information", "mark", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $brand_id = $data['brand_id'];
    $name = $data['name'];
    $pic_urls = $data['pic_urls'];
    $pic_alts = $data['pic_alts'];
    $tag = $data['tag'];
    $content = $data['content'];
    $tips = $data['tips'];
    $information = $data['information'];
    $mark = $data['mark'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    $query = "INSERT INTO `product`(`brand_id`, `name`, `pic_urls`, `pic_alts`, `tag`,`content`, `tips`, `information`, `mark`, `list_order`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$brand_id', '$name', '$pic_urls', '$pic_alts', '$tag', '$content', '$tips', '$information', '$mark', '$list_order', '$status', '$remark', '$loginid', '$loginid');";

    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改商品PUT
function Product_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "2B06ADD9-7C12-1EFB-FB4D-7A728B592DBA";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["brand_id", "name", "pic_urls", "pic_alts", "tag", "content", "tips", "information", "mark", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    $brand_id = $data['brand_id'];
    $name = $data['name'];
    $pic_urls = $data['pic_urls'];
    $pic_alts = $data['pic_alts'];
    $tag = $data['tag'];
    $content = $data['content'];
    $tips = $data['tips'];
    $information = $data['information'];
    $mark = $data['mark'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查商品編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "product", "id", $id) == false)
        return E_PRODUCTIDNOTFOUND;

    $query = "UPDATE `product` SET `brand_id`='$brand_id',`name`='$name',`pic_urls`='$pic_urls',`pic_alts`='$pic_alts',`tag`='$tag',`content`='$content',`tips`='$tips',`information`='$information',`mark`='$mark',`list_order`='$list_order',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query)) {
        $resultData = array("id" => $id);
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除商品DELETE
function Product_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "C96C51C8-456B-026B-5629-A9E6A9023731";

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
    if (CheckDataExistByFieldValue($dbconnect, "product", "id", $id) == false)
        return E_PRODUCTIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `product` SET `status`= 2 ,`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢角色基本QueryString
function ProductGetBaseQueryString() {
    return "SELECT `id`, `brand_id`, `brand_name`, `brand_pic_url`, `brand_pic_alt`, `name`, `pic_urls`, `pic_alts`, `tag`, `content`, `tips`, `information`, `mark`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `product_view` WHERE 1";
}

//建立查詢使用者回傳資料
function ProductBuildQueryResultData($accesstoken, $array) {
    if ($accesstoken != null) {
        return array("id" => $array["id"],
            "brand_id" => $array["brand_id"],
            "brand_name" => $array["brand_name"],
            "brand_pic_url" => $array["brand_pic_url"],
            "brand_pic_alt" => $array["brand_pic_alt"],
            "name" => $array["name"],
            "pic_urls" => $array['pic_urls'],
            "pic_alts" => $array['pic_alts'],
            "tag" => $array['tag'],
            "content" => $array['content'],
            "tips" => $array['tips'],
            "information" => $array['information'],
            "mark" => $array['mark'],
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
            "brand_id" => $array["brand_id"],
            "brand_name" => $array["brand_name"],
            "brand_pic_url" => $array["brand_pic_url"],
            "brand_pic_alt" => $array["brand_pic_alt"],
            "name" => $array["name"],
            "pic_urls" => $array['pic_urls'],
            "pic_alts" => $array['pic_alts'],
            "tag" => $array['tag'],
            "content" => $array['content'],
            "tips" => $array['tips'],
            "information" => $array['information'],
            "mark" => $array['mark'],
            "list_order" => $array['list_order']);
    }
}

?>
