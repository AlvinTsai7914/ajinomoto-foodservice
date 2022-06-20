<?php

require_once 'api.class.php';

class Vic_API extends API {

    protected $m_AccessToken = '';

    //建構式
    public function __construct($request, $origin, $token) {
        $this->m_AccessToken = $token;
        parent::__construct($request); //父類別建構式
    }

    //endpoint
    //使用者
    protected function user(&$resultData, &$programguid) {
        include_once("user.php");
        switch ($this->method) {
            case 'GET': {
                    if (empty($this->verb) || $this->verb == "{id}")
                        return User_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
                    else {
                        switch ($this->verb) {
                            case "loginuserdata":
                                return User_GETLOGINUSERDATA($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
                            case "loginusermenutree":
                                return User_GETLOGINUSERMENUTREE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
                            case "loginuserprogram":
                                return User_GETLOGINUSERPROGRAM($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
                            default:
                                return E_NOT_FOUND;
                        }
                    }
                }
            case 'POST': {
                    if (empty($this->verb) || $this->verb == "{id}")
                        return User_INSERT($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                    else {
                        switch ($this->verb) {
                            case "login":
                                return User_LOGIN($this->dbconnect, $this->request, $this->file, $resultData, $programguid);
                            case "logout":
                                return User_LOGOUT($this->dbconnect, $this->m_AccessToken, $resultData, $programguid);
                            case "registerrole":
                                return User_REGISTERROLE($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                            case "unregisterrole":
                                return User_UNREGISTERROLE($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                            case "unregisterallroles":
                                return User_UNREGISTERALLROLES($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                            default:
                                return E_NOT_FOUND;
                        }
                    }
                }
            case 'PUT':
                if (empty($this->verb) || $this->verb == "{id}")
                    return User_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
                else {
                    switch ($this->verb) {
                        case "loginuserdata":
                            return User_SETLOGINUSERDATA($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
                        case "loginuserpassword":
                            return User_SETLOGINUSERPASSWORD($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
                        case "password":
                            return User_SETPASSWORD($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
                        default:
                            return E_NOT_FOUND;
                    }
                }
                break;
            case 'DELETE':
                return User_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //程式類別
    protected function programcategory(&$resultData, &$programguid) {
        include_once("program_category.php");
        switch ($this->method) {
            case 'GET':
                return Program_Category_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return Program_Category_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'PUT':
                return Program_Category_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
            case 'DELETE':
                return Program_Category_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //程式
    protected function program(&$resultData, &$programguid) {
        include_once("program.php");
        switch ($this->method) {
            case 'GET':
                return Program_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return Program_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'PUT':
                return Program_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
            case 'DELETE':
                return Program_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //角色
    protected function role(&$resultData, &$programguid) {
        include_once("role.php");
        switch ($this->method) {
            case 'GET':
                if (empty($this->verb) || $this->verb == "{id}")
                    return Role_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
                else {
                    switch ($this->verb) {
                        case "program":
                            return Role_GETROLEPROGRAM($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
                        case "menu":
                            return Role_GETROLEMENU($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
                        default:
                            return E_NOT_FOUND;
                    }
                }
            case 'POST':
                if (empty($this->verb) || $this->verb == "{id}")
                    return Role_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
                else {
                    switch ($this->verb) {
                        case "registerprogram":
                            return Role_REGISTERPROGRAM($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                        case "registerallprograms":
                            return Role_REGISTERALLPROGRAMS($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                        case "unregisterprogram":
                            return Role_UNREGISTERPROGRAM($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                        case "unregisterallprograms":
                            return Role_UNREGISTERALLPROGRAMS($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                        case "registermenu":
                            return Role_REGISTERMENU($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                        case "registerallmenus":
                            return Role_REGISTERALLMENUS($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                        case "unregistermenu":
                            return Role_UNREGISTERMENU($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                        case "unregisterallmenus":
                            return Role_UNREGISTERALLMENUS($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                        default:
                            return E_NOT_FOUND;
                    }
                }
            case 'PUT':
                return Role_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
            case 'DELETE':
                return Role_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //選單
    protected function menu(&$resultData, &$programguid) {
        include_once("menu.php");
        switch ($this->method) {
            case 'GET':
                return Menu_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return Menu_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'PUT':
                return Menu_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
            case 'DELETE':
                return Menu_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //操作記錄
    protected function log(&$resultData, &$programguid) {
        include_once("log.php");
        switch ($this->method) {
            case 'GET':
                return Log_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //縣市-鄉鎮市區
    protected function cityarea(&$resultData, &$programguid) {
        include_once("cityarea.php");
        switch ($this->method) {
            case 'GET':
                switch ($this->verb) {
                    case "city":
                        return CityArea_GETCITY($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
                    case "area":
                        return CityArea_GETAREA($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
                    default:
                        return E_NOT_FOUND;
                }
            default:
                return E_NOT_FOUND;
        }
    }

    //首頁banner
    protected function banner(&$resultData, &$programguid) {
        include_once("banner.php");
        switch ($this->method) {
            case 'GET':
                return Banner_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return Banner_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'PUT':
                return Banner_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
            case 'DELETE':
                return Banner_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //廣告
    protected function ad(&$resultData, &$programguid) {
        include_once("ad.php");
        switch ($this->method) {
            case 'GET':
                return Ad_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return Ad_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'PUT':
                return Ad_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
            case 'DELETE':
                return Ad_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //餐飲情報標籤
    protected function campaigntag(&$resultData, &$programguid) {
        include_once("campaign_tag.php");
        switch ($this->method) {
            case 'GET':
                return Campaign_Tag_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return Campaign_Tag_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'PUT':
                return Campaign_Tag_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
            case 'DELETE':
                return Campaign_Tag_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //餐飲情報
    protected function campaign(&$resultData, &$programguid) {
        include_once("campaign.php");
        switch ($this->method) {
            case 'GET':
                return Campaign_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return Campaign_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'PUT':
                return Campaign_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
            case 'DELETE':
                return Campaign_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //品牌
    protected function brand(&$resultData, &$programguid) {
        include_once("brand.php");
        switch ($this->method) {
            case 'GET':
                return Brand_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return Brand_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'PUT':
                return Brand_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
            case 'DELETE':
                return Brand_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //商品
    protected function product(&$resultData, &$programguid) {
        include_once("product.php");
        switch ($this->method) {
            case 'GET':
                return Product_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return Product_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'PUT':
                return Product_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
            case 'DELETE':
                return Product_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //專業食譜
    protected function recipepro(&$resultData, &$programguid) {
        include_once("recipepro.php");
        switch ($this->method) {
            case 'GET':
                return RecipePro_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return RecipePro_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'PUT':
            case 'PUT':
                if (empty($this->verb) || $this->verb == "{id}")
                    return RecipePro_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
                else {
                    switch ($this->verb) {
                        case "addvisitor":
                            return RecipePro_ADDVISITOR($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
                        default:
                            return E_NOT_FOUND;
                    }
                }
            case 'DELETE':
                return RecipePro_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //專業食譜內容
    protected function recipeprodetail(&$resultData, &$programguid) {
        include_once("recipepro_detail.php");
        switch ($this->method) {
            case 'GET':
                return RecipePro_Detail_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return RecipePro_Detail_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'DELETE':
                return RecipePro_Detail_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //招客秘笈
    protected function higi(&$resultData, &$programguid) {
        include_once("higi.php");
        switch ($this->method) {
            case 'GET':
                return Higi_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return Higi_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'PUT':
                if (empty($this->verb) || $this->verb == "{id}")
                    return Higi_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
                else {
                    switch ($this->verb) {
                        case "addvisitor":
                            return Higi_ADDVISITOR($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
                        default:
                            return E_NOT_FOUND;
                    }
                }
            case 'DELETE':
                return Higi_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //會員
    protected function member(&$resultData, &$programguid) {
        include_once("member.php");
        switch ($this->method) {
            case 'GET': {
                    if (empty($this->verb) || $this->verb == "{id}")
                        return Member_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
                    else {
                        switch ($this->verb) {
                            case "loginmemberdata":
                                return Member_GET_LOGINMEMBERDATA($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
                            case "loginmemberrecipepro":
                                return Member_GETLOGINMEMBERRECIPEPRO($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
                            case "loginmemberhigi":
                                return Member_GETLOGINMEMBERHIGI($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
                            default:
                                return E_NOT_FOUND;
                        }
                    }
                }
            case 'POST': {
                    if (empty($this->verb) || $this->verb == "{id}")
                        return Member_INSERT($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                    else {
                        switch ($this->verb) {
                            case "login":
                                return Member_LOGIN($this->dbconnect, $this->request, $this->file, $resultData, $programguid);
                            case "logout":
                                return Member_LOGOUT($this->dbconnect, $this->m_AccessToken, $resultData, $programguid);
                            case "loginmemberrecipepro":
                                return Member_ADDLOGINMEMBERRECIPEPRO($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                            case "loginmemberhigi":
                                return Member_ADDLOGINMEMBERHIGI($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                            default:
                                return E_NOT_FOUND;
                        }
                    }
                }
            case 'PUT':
                if (empty($this->verb) || $this->verb == "{id}")
                    return Member_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
                else {
                    switch ($this->verb) {
                        case "password":
                            return Member_SETPASSWORD($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
                        case "enableaccount":
                            return Member_ENABLEACCOUNT($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
                        case "verification":
                            return Member_SETVERIFICATION($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
                        case "loginmemberdata":
                            return Member_SETLOGINMEMBERDATA($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
                        case "loginmemberpassword":
                            return Member_SETLOGINMEMBERPASSWORD($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
                        default:
                            return E_NOT_FOUND;
                    }
                }
                break;
            case 'DELETE':
                if (empty($this->verb) || $this->verb == "{id}")
                    return Member_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
                else {
                    switch ($this->verb) {
                        case "loginmemberrecipepro":
                            return Member_DELETELOGINMEMBERRECIPEPRO($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                        case "loginmemberhigi":
                            return Member_DELETELOGINMEMBERHIGI($this->dbconnect, $this->m_AccessToken, $this->file, $resultData, $programguid);
                        default:
                            return E_NOT_FOUND;
                    }
                }
            default:
                return E_NOT_FOUND;
        }
    }

    //標籤類別
    protected function tagcategory(&$resultData, &$programguid) {
        include_once("tag_category.php");
        switch ($this->method) {
            case 'GET':
                return Tag_Category_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return Tag_Category_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'PUT':
                return Tag_Category_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
            case 'DELETE':
                return Tag_Category_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

    //標籤
    protected function tag(&$resultData, &$programguid) {
        include_once("tag.php");
        switch ($this->method) {
            case 'GET':
                return Tag_GET($this->dbconnect, $this->m_AccessToken, $this->args, $this->request, $resultData, $programguid);
            case 'POST':
                return Tag_INSERT($this->dbconnect, $this->m_AccessToken, $this->request, $this->file, $resultData, $programguid);
            case 'PUT':
                return Tag_UPDATE($this->dbconnect, $this->m_AccessToken, $this->args, $this->file, $resultData, $programguid);
            case 'DELETE':
                return Tag_DELETE($this->dbconnect, $this->m_AccessToken, $this->args, $resultData, $programguid);
            default:
                return E_NOT_FOUND;
        }
    }

}

//來自同一伺服器的請求沒有HTTP_ORIGIN標題
if (!array_key_exists('HTTP_ORIGIN', $_SERVER)) {
    $_SERVER['HTTP_ORIGIN'] = $_SERVER['SERVER_NAME'];
}

if (!array_key_exists('HTTP_TOKEN', $_SERVER)) {
    $_SERVER['HTTP_TOKEN'] = null;
}

try {
    date_default_timezone_set('Asia/Taipei');
    $API = new Vic_API($_REQUEST['request'], $_SERVER['HTTP_ORIGIN'], $_SERVER['HTTP_TOKEN']);
    echo $API->processRequest();
} catch (Exception $e) {
    $resultMessage = json_encode(Array('error' => $e->getMessage()));
    header("HTTP/1.1 " . $resultCode . " " . $resultMessage);
    echo json_encode($resultMessage);
}
?>