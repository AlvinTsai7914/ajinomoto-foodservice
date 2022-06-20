<?php

const WEBAPI_PROGRAMCATEGORY = '/programcategory'; //查詢程式類別

const WEBAPI_ROLE = '/role';    //查詢角色
const WEBAPI_ROLE_Menu = '/role/menu';    //查詢角色選單
const WEBAPI_ROLE_Program = '/role/program';    //查詢角色程式
const WEBAPI_ROLE_RregisterProgram = '/role/registerprogram';    //角色註冊程式
const WEBAPI_ROLE_RegisterAllPrograms = '/role/registerallprograms';    //角色註冊所有程式
const WEBAPI_ROLE_UnregisterAllPrograms = '/role/unregisterallprograms';    //角色註銷所有程式
const WEBAPI_ROLE_RregisterMenu = '/role/registermenu';    //角色註冊選單
const WEBAPI_ROLE_UnregisterAllMenu = '/role/unregisterallmenus';    //角色註銷所有選單

const WEBAPI_USER = '/user';    //查詢使用者
const WEBAPI_USER_Login = '/user/login';    //使用者登入
const WEBAPI_USER_Logout = '/user/logout';    //使用者登出
const WEBAPI_USER_LoginUserData = '/user/loginuserdata'; //查詢登入使用者資料
const WEBAPI_USER_Password = '/user/password'; //修改使用者密碼
const WEBAPI_USER_LoginUserPassword = '/user/loginuserpassword'; //修改登入使用者密碼
const WEBAPI_USER_LoginUserMenuTree = '/user/loginusermenutree'; //查詢登入使用者樹狀選單
const WEBAPI_USER_LoginUserProgram = '/user/loginuserprogram'; //查詢登入使用者程式
const WEBAPI_USER_RegisterRole = '/user/registerrole'; //使用者註冊角色

const WEBAPI_LOG = '/log';    //查詢操作記錄

const WEBAPI_BANNER = '/banner';    //查詢首頁Banner
const WEBAPI_AD = '/ad';    //查詢廣告
const WEBAPI_CAMPAIGN_TAG = '/campaigntag';    //查詢餐飲情報標籤
const WEBAPI_CAMPAIGN = '/campaign';    //查詢餐飲情報
const WEBAPI_BRAND = '/brand';    //查詢品牌
const WEBAPI_PRODUCT = '/product';    //查詢商品
const WEBAPI_RECIPEPRO = '/recipepro';    //專業食譜
const WEBAPI_RECIPEPRO_ADDVISITOR = '/recipepro/addvisitor';    //專業食譜增加瀏覽人數
const WEBAPI_RECIPPRODETAIL = '/recipeprodetail';    //專業食譜內容
const WEBAPI_HIGI = '/higi';    //招客秘笈
const WEBAPI_HIGI_ADDVISITOR = '/higi/addvisitor';    //招客秘笈增加瀏覽人數
const WEBAPI_MEMBER = '/member';    //會員
const WEBAPI_MEMBER_ENABLEACCOUNT = '/member/enableaccount';    //啟用會員帳號
const WEBAPI_MEMBER_PASSWORD = '/member/password';    //修改會員密碼
const WEBAPI_MEMBER_LOGIN = '/member/login';    //會員登入
const WEBAPI_MEMBER_LOGOUT = '/member/logout';    //會員登出
const WEBAPI_MEMBER_LOGINMEMBERDATA = '/member/loginmemberdata';    //查詢登入會員資料
const WEBAPI_MEMBER_LOGINMEMBERPASSWORD = '/member/loginmemberpassword';    //修改登入會員密碼
const WEBAPI_MEMBER_LOGINMEMBERRECIPEPRO = '/member/loginmemberrecipepro';    //查詢登入會員專業食譜
const WEBAPI_MEMBER_LOGINMEMBERHIGI = '/member/loginmemberhigi';    //查詢登入會員招客秘笈

const WEBAPI_CITYAREA_FindCity = '/cityarea/city';    //查詢縣市
const WEBAPI_CITYAREA_FindArea = '/cityarea/area';    //查詢鄉鎮市區

const WEBAPI_TAG_CATEGORY = '/tagcategory';    //標籤類別
const WEBAPI_TAG = '/tag';    //標籤

function CallAPI($method, $requestURL, $access_token, $json_body_data, &$resultMessage, &$resultData) {
    $curl = curl_init();    //curl初始

    if ($access_token != NULL) {
        $header[] = "token:" . $access_token;
        curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
    }

    switch ($method) {
        case "POST":
            curl_setopt($curl, CURLOPT_POST, 1);    //用POST方式傳遞
            if ($json_body_data)
                curl_setopt($curl, CURLOPT_POSTFIELDS, $json_body_data);  //要POST傳送的資料
            break;
        case "PUT":
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "PUT");
            if ($json_body_data) {
                curl_setopt($curl, CURLOPT_POSTFIELDS, $json_body_data);  //要POST傳送的資料
            }
            //curl_setopt($curl, CURLOPT_PUT, 1);
            //curl_setopt($curl, CURLOPT_INFILE, $json_body_data);
            //curl_setopt($curl, CURLOPT_INFILESIZE, strlen($json_body_data));
            //curl_setopt($curl, CURLOPT_PUT, 1);     //用PUT方式傳遞
            //if ($json_body_data)
            //    curl_setopt($curl, CURLOPT_POSTFIELDS, $json_body_data);  //要PUT傳送的資料
            break;
        case "DELETE":
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "DELETE");
            if ($json_body_data)
                curl_setopt($curl, CURLOPT_POSTFIELDS, $json_body_data);  //要POST傳送的資料
        default:                                    //預設為GET
            if ($json_body_data)
                $url = sprintf("%s?%s", $url, http_build_query($json_body_data));
    }

    //Optional Authentication:
    //curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
    //curl_setopt($curl, CURLOPT_USERPWD, "username:password");
    $url = API_SERVER . API_BASEURL . $requestURL;

    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

    $result = curl_exec($curl);

    curl_close($curl);
    $resultCode = NULL;

    if (!parseWebAPIResult($result, $resultCode, $resultMessage, $resultData)) {
        $resultCode = 500;
        $resultMessage = "Internal Server Error";
        $resultData = "API回傳格式錯誤";
    }
    return $resultCode;
}

function parseWebAPIResult($result, &$resultCode, &$resultMessage, &$resultData) {
    $returnArray = json_decode($result, TRUE);
    if (is_array($returnArray) && array_key_exists("ResultCode", $returnArray)) {
        $resultCode = $returnArray['ResultCode'];
        if (array_key_exists("ResultMessage", $returnArray)) {
            $resultMessage = $returnArray['ResultMessage'];
            if (array_key_exists("ResultData", $returnArray)) {
                $resultData = $returnArray["ResultData"];
                return TRUE;
            } else
                return FALSE;
        } else
            return FALSE;
    } else {
        $resultMessage = $returnArray['ResultMessage'];
        return FALSE;
    }
}

function BuildEchoData1($requestRows, $requestPage, $resultData) {
    if (is_array($resultData)) {
        if ($requestRows == "ALL") {
            $pageData = $resultData;
            $total = 1;  //總頁數
            $page = 1;
            $records = count($resultData);  //總筆數
            $rows = $resultData;
        } else {
            $pageData = array_chunk($resultData, $requestRows); //resultData依rows分割
            $total = count($pageData);  //總頁數
            $page = min($requestPage, $total); //若要求的頁數大於總頁數，則為最後一頁
            $records = count($resultData);  //總筆數
            $rows = $pageData[$page - 1];
        }
        $echoData = array("total" => $total,
            "page" => $page,
            "records" => $records,
            "rows" => $rows);
    } else
        $echoData = array("total" => 0, "page" => 1, "records" => 0, "rows" => 0);

    return json_encode($echoData, JSON_UNESCAPED_UNICODE);
}

?>