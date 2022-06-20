<?php

require_once 'tools.php';

//查詢招客秘笈GET
function Higi_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "9817A811-0AC3-9301-9847-A8AF5047FA43";
    //檢查操作權限
    $loginid = 0;
    if ($accesstoken != null)
        if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
            return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = HigiGetBaseQueryString();
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
            $resultData[] = HigiBuildQueryResultData($accesstoken, $r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增招客秘笈POST
function Higi_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "FE5A89D7-193B-257B-6474-A90A828AA922";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "pic_url", "pic_alt", "content", "description", "recipepro_id", "product_id", "tags", "type", "style", "methods", "note", "note_pic_url", "note_pic_alt", "member_only", "visitor", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $name = $data['name'];
    $pic_url = $data['pic_url'];
    $pic_alt = $data['pic_alt'];
    $content = $data['content'];
    $description = $data['description'];
    $recipepro_id = $data['recipepro_id'];
    $product_id = $data['product_id'];
    $tags = $data['tags'];
    $type = $data['type'];
    $style = $data['style'];
    $methods = $data['methods'];
    $note = $data['note'];
    $note_pic_url = $data['note_pic_url'];
    $note_pic_alt = $data['note_pic_alt'];
    $member_only = $data['member_only'];
    $visitor = $data['visitor'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    $query = "INSERT INTO `higi`(`name`, `pic_url`,  `pic_alt`, `content`, `description`, `recipepro_id`, `product_id`, `tags`, `type`, `style`, `methods`, `note`, `note_pic_url`, `note_pic_alt`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$name', '$pic_url', '$pic_alt', '$content', '$description', '$recipepro_id', '$product_id', '$tags', '$type', '$style', '$methods', '$note', '$note_pic_url', '$note_pic_alt', '$member_only', '$visitor', '$list_order', '$status', '$remark', '$loginid', '$loginid');";

    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改招客秘笈PUT
function Higi_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "488C8C4A-A503-7182-02F1-8F01C056B596";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["name", "pic_url", "pic_alt", "content", "description", "recipepro_id", "product_id", "tags", "type", "style", "methods", "note", "note_pic_url", "note_pic_alt", "member_only", "visitor", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    $name = $data['name'];
    $pic_url = $data['pic_url'];
    $pic_alt = $data['pic_alt'];
    $content = $data['content'];
    $description = $data['description'];
    $recipepro_id = $data['recipepro_id'];
    $product_id = $data['product_id'];
    $tags = $data['tags'];
    $type = $data['type'];
    $style = $data['style'];
    $methods = $data['methods'];
    $note = $data['note'];
    $note_pic_url = $data['note_pic_url'];
    $note_pic_alt = $data['note_pic_alt'];
    $member_only = $data['member_only'];
    $visitor = $data['visitor'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查招客秘笈編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "higi", "id", $id) == false)
        return E_HIGIIDNOTFOUND;

    $query = "UPDATE `higi` SET `name`='$name',`pic_url`='$pic_url',`pic_alt`='$pic_alt',`content`='$content',`description`='$description',`recipepro_id`='$recipepro_id',`product_id`='$product_id',`tags`='$tags',`type`='$type',`style`='$style',`methods`='$methods',`note`='$note',`note_pic_url`='$note_pic_url',`note_pic_alt`='$note_pic_alt',`member_only`='$member_only',`visitor`='$visitor',`list_order`='$list_order',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query)) {
        $resultData = array("id" => $id);
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//增加瀏覽人數PUT
function Higi_ADDVISITOR($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "A53CAF90-B5F8-CA2A-CE48-48359C948E88";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    //檢查招客秘笈編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "higi", "id", $id) == false)
        return E_HIGIIDNOTFOUND;

    $vistors = 0;
    $query = "SELECT `visitor` FROM `higi` WHERE id = '$id'";
    if ($result = $dbconnect->query($query)) {
        $r = mysqli_fetch_array($result, MYSQLI_ASSOC);
        $visitor = $r["visitor"] + 1;
    } else
        throw new Exception($dbconnect->error);

    $query = "UPDATE `higi` SET `visitor` = '$visitor', `u_user_id` = '$loginid' WHERE id = '$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除招客秘笈DELETE
function Higi_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "9B5FF3D9-F53B-1F3C-0942-452B3BE5716F";

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
    if (CheckDataExistByFieldValue($dbconnect, "higi", "id", $id) == false)
        return E_HIGIIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `higi` SET `status`= 2 ,`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢角色基本QueryString
function HigiGetBaseQueryString() {
    return "SELECT `id`, `name`, `pic_url`, `pic_alt`, `content`, `description`, `recipepro_id`, `recipepro_name`, `recipepro_pic_url`, `recipepro_pic_alt`, `recipepro_member_only`, `brand_id`, `brand_name`, `brand_pic_url`, `brand_pic_alt`, `product_id`, `product_name`, `product_pic_urls`, `product_pic_alts`, `tags`, `type`, `style`, `methods`, `note`, `note_pic_url`, `note_pic_alt`, `member_only`, `visitor`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `higi_view` WHERE 1";
}

//建立查詢使用者回傳資料
function HigiBuildQueryResultData($accesstoken, $array) {
    if ($accesstoken != null) {
        return array("id" => $array["id"],
            "name" => $array["name"],
            "pic_url" => $array['pic_url'],
            "pic_alt" => $array['pic_alt'],
            "content" => $array['content'],
            "description" => $array['description'],
            "recipepro_id" => $array['recipepro_id'],
            "recipepro_name" => $array['recipepro_name'],
            "recipepro_pic_url" => $array['recipepro_pic_url'],
            "recipepro_pic_alt" => $array['recipepro_pic_alt'],
            "recipepro_member_only" => $array['recipepro_member_only'],
            "brand_id" => $array['brand_id'],
            "brand_name" => $array['brand_name'],
            "brand_pic_url" => $array['brand_pic_url'],
            "brand_pic_alt" => $array['brand_pic_alt'],
            "product_id" => $array['product_id'],
            "product_name" => $array['product_name'],
            "product_pic_urls" => $array['product_pic_urls'],
            "product_pic_alts" => $array['product_pic_alts'],
            "tags" => $array['tags'],
            "type" => $array['type'],
            "style" => $array['style'],
            "methods" => $array['methods'],
            "note" => $array['note'],
            "note_pic_url" => $array['note_pic_url'],
            "note_pic_alt" => $array['note_pic_alt'],
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
            "content" => $array['content'],
            "description" => $array['description'],
            "recipepro_id" => $array['recipepro_id'],
            "recipepro_name" => $array['recipepro_name'],
            "recipepro_pic_url" => $array['recipepro_pic_url'],
            "recipepro_pic_alt" => $array['recipepro_pic_alt'],
            "recipepro_member_only" => $array['recipepro_member_only'],
            "brand_id" => $array['brand_id'],
            "brand_name" => $array['brand_name'],
            "brand_pic_url" => $array['brand_pic_url'],
            "brand_pic_alt" => $array['brand_pic_alt'],
            "product_id" => $array['product_id'],
            "product_name" => $array['product_name'],
            "product_pic_urls" => $array['product_pic_urls'],
            "product_pic_alts" => $array['product_pic_alts'],
            "tags" => $array['tags'],
            "type" => $array['type'],
            "style" => $array['style'],
            "methods" => $array['methods'],
            "note" => $array['note'],
            "note_pic_url" => $array['note_pic_url'],
            "note_pic_alt" => $array['note_pic_alt'],
            "member_only" => $array['member_only'],
            "visitor" => $array['visitor'],
            "list_order" => $array['list_order']);
    }
}

?>
