<?php

require_once 'tools.php';

//查詢縣市GET
function CityArea_GETCITY($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "12D1A070-F262-82BE-707C-5ACAF42543D2";

    //檢查操作權限
    $loginid = 0;
    if ($accesstoken != null)
        if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
            return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = "SELECT `id`, `name` FROM `city` WHERE 1";

    $id = "";
    if (isset($request["id"]) && $request["id"] != 0)
        $id = $request["id"];
    if ($id != "")
        $query = $query . " AND id='$id'";

    $result = $dbconnect->query($query);
    if ($result) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $resultData[] = array("id" => $r["id"], "name" => $r["name"]);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

//查詢鄉鎮市區GET
function CityArea_GETAREA($dbconnect, $accesstoken, $args, $request, &$resultData, &$programguid) {
    $programguid = "AF256869-5FEA-66C7-2E9E-4CB76915C9E8";

    //檢查操作權限
    $loginid = 0;
    if ($accesstoken != null)
        if (( $resultCode = CheckAccess($dbconnect, $accesstoken, $programguid, $loginid)) != E_SUCCESS)
            return $resultCode;

    $resultCode = E_SUCCESS;
    $resultData = null;

    $query = "SELECT `zipcode`, `city_id`, `city_name`, `area_id`, `area_name` FROM `city_area_view` WHERE 1";

    $city_id = "";
    if (isset($request["city_id"]) && $request["city_id"] != 0)
        $city_id = $request["city_id"];
    if ($city_id != "")
        $query = $query . " AND city_id='$city_id'";

    $id = "";
    if (isset($request["id"]) && $request["id"] != 0)
        $id = $request["id"];
    if ($id != "")
        $query = $query . " AND area_id='$id'";

    $result = $dbconnect->query($query);
    if ($result) {
        while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $resultData[] = array("zipcode" => $r["zipcode"],
                "city_id" => $r["city_id"],
                "city_name" => $r["city_name"],
                "area_id" => $r["area_id"],
                "area_name" => $r["area_name"]);
        }
    } else
        throw new Exception($dbconnect->error);

    return $resultCode;
}

?>