<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require ($_SERVER['DOCUMENT_ROOT'] . BASE_PATH . "/libs/PHPMailer-master/src/Exception.php"); //匯入PHPMailer類別
require ($_SERVER['DOCUMENT_ROOT'] . BASE_PATH . "/libs/PHPMailer-master/src/PHPMailer.php"); //匯入PHPMailer類別
require ($_SERVER['DOCUMENT_ROOT'] . BASE_PATH . "/libs/PHPMailer-master/src/SMTP.php"); //匯入PHPMailer類別

function root() {
    return $_SERVER['PATH_TRANSLATED'];
}

function RGB2RGBA($rgb, $a) {
    $new = str_replace("rgb", "rgba", $rgb);
    $astr = "," . $a . ")";
    $new = str_replace(")", $astr, $new);
    return $new;
}

function CheckIsAvalidDate($dateString) {
    return (bool) strtotime($dateString);
}

function GetYear($date) {
    $timestamp = strtotime($date);
    return date("Y", $timestamp);
}

function GetMonth($date) {
    $timestamp = strtotime($date);
    return date("M", $timestamp);
}

function GetDay($date) {
    $timestamp = strtotime($date);
    return date("d", $timestamp);
}

function GetEnglishDayMonthYearString($date) {
    $timestamp = strtotime($date);
    return strtoupper(date("d M Y", $timestamp));
}

function GetEnglishMonthYearString($date) {
    $timestamp = strtotime($date);
    return strtoupper(date("M.Y", $timestamp));
}

function GetDateString($date) {
    $timestamp = strtotime($date);
    return date("Y/m/d", $timestamp);
}

function GetDateTimeString($date) {
    $timestamp = strtotime($date);
    return date("Y/m/d H:i:s", $timestamp);
}

function isValidEmail($address) {
    // check an email address is possibly valid
    return preg_match('/^[a-z0-9.+_-]+@([a-z0-9-]+.)+[a-z]+$/i', $address);
}

function GetNumberFormatString($number) {
    return number_format($number, 0);
}

//輸入****************************************************************************************************
#取得request
function request($name) {
    if (isset($_GET[$name])) {
        $value = $_GET[$name];
    } else if (isset($_POST[$name])) {
        $value = $_POST[$name];
    } else {
        $value = "";
    }
    return $value;
}

#取得字串

function request_str($name) {
    $value = request($name);
    //如果magie_qutes_gpc 為ON ，則恢復
    if (get_magic_quotes_gpc()) {
        $value = stripslashes($value);
    }
    return $value;
}

function request_num($name) {
    $value = request($name);
    //如果magie_qutes_gpc 為ON ，則恢復
    if (get_magic_quotes_gpc()) {
        $value = stripslashes($value);
    }

    if (is_numeric($value)) {
        return $value;
    } else {
        return "";
    }
}

function request_dat($name, $default = "") {
    return request_date($name, $default);
}

function request_date($name, $default = "") {
    $value = request($name);
    //如果magie_qutes_gpc 為ON ，則恢復
    if (get_magic_quotes_gpc()) {
        $value = stripslashes($value);
    }

    if (strlen($value) >= 8) {
        $dat = strtotime($value);
        if ($dat) {
            return $value;
        } else {
            return $default;
        }
    } else {
        return $default;
    }
}

function request_pag($name) {
    $page = request_num($name);
    if ($page == "") {
        return 1;
    } else if ($page < 1) {
        return 1;
    } else {
        return $page;
    }
}

function request_arr($name) {
    return request_ary($name);
}

function request_ary($name) {
    $data = request($name);
    if (gettype($data) == "array") {
        if (get_magic_quotes_gpc()) {
            $d = array();
            foreach ($data as $key => $value) {
                $v = stripslashes($value);
                $d[$key] = $v;
            }
            return $d;
        } else {
            return $data;
        }
    } else {
        return array();
    }
}

function request_upl($name) {
    $f = new UploadFile();
    $f->query($name);
    return $f;
}

function request_ag() {
    return $_SERVER['HTTP_USER_AGENT'];
}

function request_ip() {
    return $_SERVER["REMOTE_ADDR"];
}

function request_cd() {
    return datetime();
}

/*
  //http://aaa.bbb.ccc/xx/yy/zz.php?a=1&b=2
  $_SERVER["HTTPS"]                 //   on off
  $_SERVER["HTTP_HOST"]             //   aaa.bbb.ccc   or  aaa.bbb.ccc:81
  $_SERVER["REQUEST_URI"]           //   /xx/yy/zz.php?a=1&b=2
  $_SERVER["SCRIPT_NAME"]           //   /xx/yy/zz.php
  $_SERVER["QUERY_STRING"]          //   a=1&b=2
  basename($_SERVER["SCRIPT_NAME"])  //   zz.php          取完整 檔名
  dirname($_SERVER["SCRIPT_NAME"])  //   /xx/yy           取完整 PATH
 */

function req_protocol() {
    if (isset($_SERVER['HTTPS']) && $_SERVER["HTTPS"] == 'on') {
        return "https://";
    } else {
        return "http://";
    }
}

//http://www.abc.com/dir/aaa.php?a=1
function request_full_url() {
    return req_protocol() . $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"];
}

//http://www.abc.com/dir/
function request_url() {
    $res = req_protocol() . $_SERVER["HTTP_HOST"] . dirname($_SERVER["SCRIPT_NAME"]);
    if (right($res, 1) != "/") {
        $res .= "/";
    }
    return $res;
}

//http://www.abc.com/
function request_host() {
    return req_protocol() . $_SERVER["HTTP_HOST"] . "/";
}

//aaa.php
function request_sc() {
    return basename($_SERVER['SCRIPT_NAME']);
}

function request_ref() {
    return $_SERVER["HTTP_REFERER"];
}

//Session操作****************************************************************************************************
#取得session
function session($name) {
    return getSession($name);
}

#取得session

function getSession($name) {
    if (isset($_SESSION[$name])) {
        return $_SESSION[$name];
    } else {
        return "";
    }
}

#設定session

function setSession($name, $value) {
    $_SESSION[$name] = $value;
}

#清除session

function unSession($name) {
    unset($_SESSION["$name"]);
}

//系統警告及轉向****************************************************************************************************
function alert($msg) {
    echo("<script>alert('" . $msg . "');</script>");
}

function alert_die($msg) {
    echo("<script>alert('" . $msg . "');</script>");
    die("");
}

function redir($dir) {
    header("Location: {$dir}");
    exit();
}

function redir_js($dir) {
    die("<script>location.replace('" . $dir . "');</script>");
}

function alert_back($msg) {
    die("<script>alert('" . $msg . "');history.back();</script>");
}

function alert_redir($msg, $dir) {
    die("<script>alert('" . $msg . "');location.replace('" . $dir . "');</script>");
}

function alert_go($msg, $dir) {
    die("<script>alert('" . $msg . "');location.href='" . $dir . "';</script>");
}

function alert_close($msg) {
    die("<script>alert('" . $msg . "');window.close();</script>");
}

function is_mobile() {
    $useragent = $_SERVER['HTTP_USER_AGENT'];
    if (preg_match('/android.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i', $useragent) || preg_match('/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-/i', substr($useragent, 0, 4))) {
        return true;
    } else {
        return false;
    }
}

//網頁伺服器登入
function WebServerLogin($account, $password) {
    $resultMessage = "";
    $resultData = "";
    $login = array("account" => $account, "password" => $password);
    if (CallAPI('POST', WEBAPI_USER_Login, NULL, json_encode($login), $resultMessage, $resultData) == 200) {
        if (array_key_exists('token', $resultData)) {
            return $resultData['token'];
        } else
            return null;
    }
    return null;
}

//網頁伺服器登出
function WebServerLogout($token) {
    $resultMessage = "";
    $resultData = "";
    if ($token != null) {
        CallAPI('POST', WEBAPI_USER_Logout, $token, NULL, $resultMessage, $resultData);
    }
    return true;
}

function SMTPSentMail($to, $cc, $bcc, $subject, $body, $attachment, $filename, &$errorinfo) {
	$mail = new PHPMailer(true);
    //$mail->SMTPDebug = 3;
    $mail->CharSet = "UTF-8";
    $mail->IsSMTP();
    $mail->FromName = SERVICE_NAME;
    $mail->IsHTML(true);
    $mail->SMTPAuth = true;
    if (SMTP_SSL == true)
        $mail->SMTPSecure = "ssl";
    else
        $mail->SMTPSecure = "tls";
    $mail->Host = SMTP_HOST;
    $mail->Port = SMTP_PORT;
    $mail->Username = SMTP_ID;
    $mail->Password = SMTP_PW;
    $mail->From = SERVICE_MAIL;

    $mail->smtpConnect(
            array(
                "ssl" => array(
                    "verify_peer" => false,
                    "verify_peer_name" => false,
                    "allow_self_signed" => true
                )
            )
    );

    $to_array = explode(",", $to);
    foreach ($to_array as $item) {
        $mail->AddAddress($item, $item); //設定收件者郵件及名稱
    }

    if (!empty($cc))
        $mail->AddCC($cc, $cc); // 副本
    if (!empty($bcc))
        $mail->AddBCC($bcc, $bcc);  // 密件副本

    $mail->Subject = $subject; //設定郵件標題
    $mail->Body = $body; //設定郵件內容

    if (!empty($attachment)) {
        //$mail->AddAttachment($attachment, $filename);
        $mail->AddStringAttachment($attachment, $filename);
        //echo $attachment . "<br/>";
    }

    if ($mail->Send())
        return true;
    else
        $errorinfo = $mail->ErrorInfo;
    return false;
}

//發送會員帳號啟用確認信
function SendMemberAccountVerificationMail($email, $id, $verification) {
    $link = "http" . ((isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on") ? "s" : "") . "://" . $_SERVER['HTTP_HOST'] . BASE_PATH . "/member_verification.php?id=" . $id . "&v=" . $verification;
    $mail_content = "<p>親愛的餐飲業者 您好：</p>";
    $mail_content .= "<p>感謝您註冊成為台灣味之素(股)公司「餐飲通路網」會員</p>";
    $mail_content .= "<p>請點擊以下網址啟動您的帳號，並完成註冊程序： <br>";
    $mail_content .= "<a href='" . $link . "'>" . $link . "</a><br>";
    $mail_content .= "<small class='note'>〈 如果網址斷成兩行，請複製網址、連接成一行並貼在網路瀏覽器的地址欄來連結以完成註冊 〉</small>";
    $mail_content .= "</p>";
    $mail_content .= "<p>感謝您對我們的支持！<br> 餐飲通路網 團隊敬上</p>";
    $mail_content .= "<p style='color:brown'>會員專區諮詢：0800-022-000(上班日8:30~17:30)</p>";
    $mail_content .= "<p style='color:brown'>網站客服信箱：webmaster@ajinomoto.com.tw</p>";

    $errorinfo = "";
    return SMTPSentMail($email, "", "", "餐飲網會員帳號啟用確認信", "$mail_content", null, null, $errorinfo);
}

//發送會員重設密碼確認信
function SendMemberResetPasswordVerificationMail($email, $id, $verification) {
    $link = "http" . ((isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on") ? "s" : "") . "://" . $_SERVER['HTTP_HOST'] . BASE_PATH . "/reset_password.php?id=" . $id . "&v=" . $verification;
    $mail_content = "<p>您好：</p>";
    $mail_content .= "<p>我們已收到您的設定密碼要求，請點選以下按鈕前往設定新的一組帳號密碼。<br>";
    $mail_content .= "為了保護您的帳號安全，請在24小時內完成設定。如果您未曾提出此項申請，請忽略此信件。</p>";
    $mail_content .= "<a href='" . $link . "'>" . $link . "</a><br>";
    $mail_content .= "</p>";
    $mail_content .= "<p>感謝您對我們的支持！<br> 餐飲網 團隊敬上</p>";
    $errorinfo = "";
    return SMTPSentMail($email, "", "", "餐飲網會員重設密碼確認信", "$mail_content", null, null, $errorinfo);
}

?>