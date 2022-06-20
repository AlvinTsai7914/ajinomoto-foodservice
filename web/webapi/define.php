<?php

//Passwork加密
define("PASSWORK_KEY", "34BA38CA10446784DCF638D63FBFC0B6");
define("PASSWORK_IV", "9185935E0ECB4AFD");

//檔案上傳路徑
define("D_UPLOAD_PATH", "./uploads/");

//Log檔案路徑
define("D_LOG_PATH", "./log/");
define("D_LOG_LEVEL", "1"); //0:ALL, 1：Only Error;
//回傳碼
define("D_SUCCESS", 200);
define("D_BAD_REQUEST", 400);
define("D_NOT_FOUND", 404);
define("D_METHOD_NOT_ALLOWED", 405);
define("D_INTERNAL_SERVER_ERROR", 500);
/* 2xx: 成功
  200 OK: 通用狀態碼
  201 Created: 資源新增成功
  202 Accepted: 請求已接受，但尚在處理中
  204 No Content: 請求成功，但未回傳任何內容
  3xx: 重新導向
  301 Moved Permanently: 資源已移至它處
  303 See Other: 回傳的內容可在它處取得（例如在用戶端發送了一個POST請求之後）
  304 Not Modified: 請求的資源並未修改（通常是用戶端發送了帶有If-Modified-Since或If-None-Match表頭的請求）
  4xx: 用戶端錯誤（用戶端不應retry原始請求）
  400 Bad Request: 通用狀態碼
  401 Unauthorized: 用戶端尚未驗證*
  403 Forbidden: 用戶端被禁止此請求*
  404 Not Found: 請求的資源不存在
  405 Method Not Allowed: 不支援請求的HTTP方法
  406 Not Acceptable: 不支援請求所要求的內容類型*（Accept表頭）
  415 Unsupported Media Type: 不支援請求所用的內容類型*（Content-Type表頭）
  5xx: 伺服器錯誤（用戶端可合理retry）
  500 Internal Server Error: 工程師要找bug了
  501 Not Implemented: 用戶端的請求目前未支援（也就是將來有可能支援）
  502 Bad Gateway: 上游的伺服器未回傳正確結果，一般是gateway或proxy server才會回傳此狀態碼
  503 Service Unavailable: 暫停服務（也就是過不久就會恢復服務──如果一切順利的話）
  504 Gateway Timeout: 上游的伺服器逾時，一般是gateway或proxy server才會回傳此狀態碼 */

//錯誤訊息
//回傳碼
define("E_SUCCESS", 0);        //成功
define("E_NOT_FOUND", 1);       //
define("E_DBCONNECTERROR", 2);       //資料庫連線錯誤
define("E_AUTHORITYNOTENOUGH", 3);     //權限不足
define("E_ACCESSTOKENERROR", 4);      //AccessToken錯誤
define("E_INPUTPARAMETERERROR", 5);     //輸入參數錯誤
define("E_ACCOUNTORPASSWORDERROR", 6);    //帳號或密碼錯誤
define("E_OLDPASSWORDERROR", 7);    //舊密碼錯誤
define("E_USERDATANUMBERSLIMIT", 8);    //資料讀取筆數超過上限
//使用者
define("E_USERIDNOTFOUND", 100);      //使用者編號不存在
define("E_USERACCOUNTNOTFOUND", 101);     //使用者帳號不存在
define("E_USERACCOUNTALREADYEXISTS", 102);    //使用者帳號已存在
define("E_USERSTATUSERROR", 103);       //使用者狀態錯誤
define("E_USERACCOUNTNOTACTIVE", 104);      //帳號未啟用
define("E_USERACCOUNTSTARTDATE", 105);      //帳號尚未到授權開始日期
define("E_USERACCOUNTENDDATE", 106);      //帳號已超過授權結束日期
//角色
define("E_ROLEIDNOTFOUND", 200);      //角色編號不存在
define("E_ROLESTATUSERROR", 201);      //角色狀態錯誤
//程式類別
define("E_PROGRAMCATEGORYIDNOTFOUND", 300);   //程式類別編號不存在
//程式
define("E_PROGRAMIDNOTFOUND", 400);     //程式編號不存在
define("E_PROGRAMSTATUSERROR", 401);      //程式狀態錯誤
//選單
define("E_MENUIDNOTFOUND", 500);      //選單編號不存在
define("E_MENURULEERROR", 501);      //選單規則錯誤
//首頁Banner
define("E_BANNERIDNOTFOUND", 600);      //首頁Banner編號不存在
//廣告
define("E_ADIDNOTFOUND", 700);      //廣告編號不存在
//餐飲情報標籤
define("E_CAMPAIGNTAGIDNOTFOUND", 800);      //餐飲情報標籤編號不存在
//餐飲情報
define("E_CAMPAIGNIDNOTFOUND", 900);      //餐飲情報編號不存在
//品牌
define("E_BRANDIDNOTFOUND", 1000);      //品牌編號不存在
//商品
define("E_PRODUCTIDNOTFOUND", 1100);      //商品編號不存在
//專業食譜
define("E_RECIPEPROIDNOTFOUND", 1200);      //專業食譜編號不存在
//專業食譜
define("E_HIGIIDNOTFOUND", 1300);      //招客秘笈編號不存在
//會員
define("E_MEMBERIDNOTFOUND", 1400);      //會員編號不存在
define("E_MEMBERACCOUNTNOTFOUND", 1401);      //會員帳號不存在
define("E_MEMBERACCOUNTALREADYEXISTS", 1402);    //會員帳號已存在
define("E_MEMBERACCOUNTNOTACTIVE", 1403);    //會員帳號未啟用
define("E_MEMBERPASSWORD", 1404);    //密碼錯誤
define("E_MEMBERVERIFICATION", 1405);    //驗證碼錯誤
define("E_MEMBERSTATUSERROR", 1406);    //會員帳號狀態錯誤
//標籤類別
define("E_TAGCATEGORYIDNOTFOUND", 1500);  //標籤類別編號不存在
//標籤
define("E_TAGIDNOTFOUND", 1600);  //標籤編號不存在
//其他
define("E_UNKNOWNERROR", 9900);       //未知的錯誤

function GetResponseCode($code) {
    switch ($code) {
        case E_SUCCESS: return D_SUCCESS;
        case E_NOT_FOUND: return D_NOT_FOUND;
        case E_AUTHORITYNOTENOUGH: return D_METHOD_NOT_ALLOWED;
        default: return D_INTERNAL_SERVER_ERROR;
    }
}

//依據狀態碼取得狀態訊息說明
function GetResultMessage($code) {
    switch ($code) {
        case E_SUCCESS: return "執行成功";
        case E_NOT_FOUND: return "NOT FOUND";
        case E_DBCONNECTERROR: return "資料庫連線錯誤";
        case E_AUTHORITYNOTENOUGH: return "權限不足";
        case E_ACCESSTOKENERROR: return "AccessToken錯誤";
        case E_INPUTPARAMETERERROR: return "輸入參數錯誤";
        case E_ACCOUNTORPASSWORDERROR: return "帳號或密碼錯誤";
        case E_OLDPASSWORDERROR: return "舊密碼錯誤";
        case E_USERDATANUMBERSLIMIT: return "資料讀取筆數超過上限";

        case E_USERIDNOTFOUND: return "使用者編號不存在";
        case E_USERACCOUNTNOTFOUND: return "使用者帳號不存在";
        case E_USERACCOUNTALREADYEXISTS: return "使用者帳號已存在";
        case E_USERSTATUSERROR: return "使用者狀態錯誤";
        case E_USERACCOUNTNOTACTIVE: return "使用者帳號未啟用";
        case E_USERACCOUNTSTARTDATE: return "帳號尚未到授權開始日期";
        case E_USERACCOUNTENDDATE: return "帳號已超過授權結束日期";

        case E_ROLEIDNOTFOUND: return "角色編號不存在";
        case E_ROLESTATUSERROR: return "角色狀態錯誤";

        case E_PROGRAMCATEGORYIDNOTFOUND: return "程式類別編號不存在";

        case E_PROGRAMIDNOTFOUND: return "程式編號不存在";
        case E_PROGRAMSTATUSERROR: return "程式狀態錯誤";

        case E_MENUIDNOTFOUND: return "選單編號不存在";
        case E_MENURULEERROR: return "選單規則錯誤";

        case E_BANNERIDNOTFOUND: return "首頁Banner編號不存在";

        case E_ADIDNOTFOUND: return "廣告編號不存在";

        case E_CAMPAIGNTAGIDNOTFOUND: return "餐飲情報標籤編號不存在";

        case E_CAMPAIGNIDNOTFOUND: return "餐飲情報編號不存在";

        case E_PRODUCTIDNOTFOUND: return "商品編號不存在";

        case E_RECIPEPROIDNOTFOUND: return "專業食譜編號不存在";

        case E_HIGIIDNOTFOUND: return "招客秘笈編號不存在";

        case E_MEMBERIDNOTFOUND: return "會員編號不存在";
        case E_MEMBERACCOUNTNOTFOUND: return "會員帳號不存在";
        case E_MEMBERACCOUNTALREADYEXISTS: return "會員帳號已存在";
        case E_MEMBERACCOUNTNOTACTIVE: return "會員帳號未啟用";
        case E_MEMBERPASSWORD: return "密碼錯誤";
        case E_MEMBERVERIFICATION: return "驗證碼錯誤";
        case E_MEMBERSTATUSERROR: return "會員帳號狀態錯誤";

        case E_TAGCATEGORYIDNOTFOUND: return "標籤類別編號不存在";
        case E_TAGIDNOTFOUND: return "標籤編號不存在";

        default:
        case E_UNKNOWNERROR: return "未知的錯誤";
    }
}

?>