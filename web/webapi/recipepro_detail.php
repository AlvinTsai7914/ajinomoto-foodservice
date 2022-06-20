<?php

require_once 'tools.php';

//查詢專業食譜內容GET
function RecipePro_Detail_GET($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "FA4CB3B0-A777-BEF0-EBAA-BAEFC7E4926C";

    //檢查操作權限
    $loginid = 0;
    if ($accesstoken != null)
        if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
            return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = RecipeProDetailGetBaseQueryString();

    if (isset($args[0])) {
        $id = $args[0];
        $query = $query . " AND recipepro_id='$id'";
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
            $resultData[] = RecipeProDetailBuildQueryResultData($accesstoken, $r);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//新增專業食譜內容POST
function RecipePro_Detail_INSERT($dbconnect, $accesstoken, $args, $fileData, &$resultData, &$programguid) {
    $programguid = "DEA3E52C-E72F-1CD5-87C4-05EC43338813";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;
    $data = json_decode($fileData, true);

    //檢查輸入參數
    $keys = ["recipepro_id", "class", "names", "contents", "links", "blanks", "list_order"];
    if (!CheckArrayKeys($data, $keys))
        return E_INPUTPARAMETERERROR;

    $recipepro_id = $data['recipepro_id'];
    $class = $data['class'];
    $names = $data['names'];
    $contents = $data['contents'];
    $links = $data['links'];
    $blanks = $data['blanks'];
    $list_order = $data['list_order'];

    //檢查專業食譜編號是否存在
    if (CheckDataExistByFieldValue($dbconnect, "recipepro", "id", $recipepro_id) == false)
        return E_RECIPEPROIDNOTFOUND;

    $query = "INSERT INTO `recipepro_detail`(`recipepro_id`, `class`,  `names`, `contents`, `links`, `blanks`, `list_order`) VALUES ('$recipepro_id', '$class', '$names', '$contents', '$links', '$blanks', '$list_order');";

    if ($dbconnect->query($query))
        $resultData = array("id" => $recipepro_id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//刪除專業食譜內容DELETE
function RecipePro_Detail_DELETE($dbconnect, $accesstoken, $args, &$resultData, &$programguid) {
    $programguid = "C4742744-712B-DC32-1BD5-3C73397472BB";

    //檢查操作權限
    $loginid = 0;
    if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
        return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    if (!isset($args[0]))
        return E_INPUTPARAMETERERROR;

    $id = $args[0];

    //檢查專業食譜編號是否存在
    if (CheckDataExistByFieldValue($dbconnect, "recipepro", "id", $id) == false)
        return E_RECIPEPROIDNOTFOUND;

    $query = "DELETE FROM `recipepro_detail` WHERE recipepro_id='$id'";
    if ($result = $dbconnect->query($query))
        $resultData = array("id" => $id);
    else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//取得查詢專業食譜內容QueryString
function RecipeProDetailGetBaseQueryString() {
    return "SELECT `recipepro_id`, `class`, `names`, `contents`, `links`, `blanks`, `list_order` FROM `recipepro_detail` WHERE 1";
}

//建立查詢專業食譜回傳資料
function RecipeProDetailBuildQueryResultData($accesstoken, $array) {
    return array("recipepro_id" => $array["recipepro_id"],
        "class" => $array["class"],
        "names" => $array["names"],
        "contents" => $array['contents'],
        "links" => $array['links'],
        "blanks" => $array['blanks'],
        "list_order" => $array['list_order']);
}

?>
