<?php

require_once 'tools.php';

//查詢餐飲情報GET
function Campaign_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "FAEA951F-BFB5-6A20-379F-3B4F7B82098F";

    //檢查操作權限
    $loginid = 0;
    if ($accesstoken != null)
        if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
            return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = CampaignGetBaseQueryString();
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
        $query = $query . " ORDER BY release_date, list_order";

    $result = $dbconnect->query($query);
    if ($result) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $resultData[] = CampaignBuildQueryResultData($accesstoken, $r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增餐飲情報POST
function Campaign_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "C23669F6-4626-1D60-008A-5BDA48210079";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["tag_ids", "title", "sub_title", "content", "pic_url", "pic_alt", "release_date", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $tag_ids = $data['tag_ids'];
    $title = $data['title'];
    $sub_title = $data['sub_title'];
    $content = $data['content'];
    $pic_url = $data['pic_url'];
    $pic_alt = $data['pic_alt'];
    $release_date = $data['release_date'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    $query = "INSERT INTO `campaign`(`tag_ids`, `title`, `sub_title`, `content`, `pic_url`, `pic_alt`, `release_date`, `list_order`, `status`, `remark`, `c_user_id`, `u_user_id`) VALUES ('$tag_ids', '$title', '$sub_title', '$content', '$pic_url', '$pic_alt', '$release_date', '$list_order', '$status', '$remark', '$loginid', '$loginid');";

    if ($dbconnect->query($query))
        $resultData = array("id" => $dbconnect->insert_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//修改餐飲情報PUT
function Campaign_UPDATE($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "69876D85-3705-66FA-54E1-EF8F7AAD544A";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["tag_ids", "title", "sub_title", "content", "pic_url", "pic_alt", "release_date", "list_order", "status", "remark"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    $tag_ids = $data['tag_ids'];
    $title = $data['title'];
    $sub_title = $data['sub_title'];
    $content = $data['content'];
    $pic_url = $data['pic_url'];
    $pic_alt = $data['pic_alt'];
    $release_date = $data['release_date'];
    $list_order = $data['list_order'];
    $status = $data['status'];
    $remark = $data['remark'];

    //檢查餐飲情報編號是否已存在
    if (CheckDataExistByFieldValue($dbconnect, "campaign", "id", $id) == false)
        return E_CAMPAIGNIDNOTFOUND;

    $query = "UPDATE `campaign` SET `tag_ids`='$tag_ids',`title`='$title',`sub_title`='$sub_title',`content`='$content',`pic_url`='$pic_url',`pic_alt`='$pic_alt',`release_date`='$release_date',`list_order`='$list_order',`status`='$status',`remark`='$remark',`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query)) {
        $resultData = array("id" => $id);
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除餐飲情報DELETE
function Campaign_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "07F68971-5A59-EE4B-285C-59D0A840EC32";

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
    if (CheckDataExistByFieldValue($dbconnect, "campaign", "id", $id) == false)
        return E_CAMPAIGNIDNOTFOUND;

    //不做資料刪除，改將status設定為2
    $query = "UPDATE `campaign` SET `status`= 2 ,`u_user_id`='$loginid' WHERE ID='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢餐飲情報基本QueryString
function CampaignGetBaseQueryString() {
    return "SELECT `id`, `tag_ids`, `tag_names`, `tag_colors`, `title`, `sub_title`, `content`, `pic_url`, `pic_alt`, `release_date`, `list_order`, `status`, `remark`, `c_time`, `c_user_id`, `c_user_name`, `u_time`, `u_user_id`, `u_user_name` FROM `campaign_view` WHERE 1";
}

//建立查詢餐飲情報回傳資料
function CampaignBuildQueryResultData($accesstoken, $array) {
    if ($accesstoken != null) {
        return array("id" => $array["id"],
            "tag_ids" => $array["tag_ids"],
            "tag_names" => $array["tag_names"],
            "tag_colors" => $array["tag_colors"],
            "title" => $array["title"],
            "sub_title" => $array["sub_title"],
            "content" => $array["content"],
            "pic_url" => $array['pic_url'],
            "pic_alt" => $array['pic_alt'],
            "release_date" => $array['release_date'],
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
            "tag_ids" => $array["tag_ids"],
            "tag_names" => $array["tag_names"],
            "tag_colors" => $array["tag_colors"],
            "title" => $array["title"],
            "sub_title" => $array["sub_title"],
            "content" => $array["content"],
            "pic_url" => $array['pic_url'],
            "pic_alt" => $array['pic_alt'],
            "release_date" => $array['release_date'],
            "list_order" => $array['list_order']);
    }
}

?>
