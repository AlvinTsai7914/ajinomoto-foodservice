<?PHP
require_once '_head.php';
if (IsMemberLogin() == true)
    redir("index.php");

$member_id = request_num("id");
$member_verification = request_str("v");
if (empty($member_id) || empty($member_verification))
    redir("index.php");

$verification_flag = false;
//伺服器登入
$servertoken = WebServerLogin(API_ACCOUNT, API_PASSWORD);

//啟用會員帳號
$data = array("id" => $member_id,
    "verification" => $member_verification);

$jsondata = json_encode($data, JSON_UNESCAPED_UNICODE);
$url = WEBAPI_MEMBER_ENABLEACCOUNT;
$method = "PUT";
$resultMessage = "未知的錯誤";
$resultData = null;
if (CallAPI($method, $url, $servertoken, $jsondata, $resultMessage, $resultData) == 200) {
    $verification_flag = true;
    $msg = "Successful";
}

//伺服器登出
WebServerLogout($servertoken);
?>

<?php include_once '_header.php'; ?>

<section class="member-page content">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item active" aria-current="page">會員帳號驗證</li>
            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="VERIFY">帳號驗證</h2>
        </div>
    </div>
    <div class="inner p-tb50 bg-Light">
        <div class="container text-center">
            <?php if ($verification_flag == true) { ?>
                <p class="m-b20">會員帳號驗證成功!</p>
            <?php } else { ?>
                <p class="m-b20">會員帳號驗證失敗!</p>
            <?php } ?>
            <div>
                <button type="button" class="primary-btn m-lr20" onclick="javascript:location.href='index.php'">回首頁</button>
            </div>
        </div>
    </div>
</section>


<?php include_once '_footer.php'; ?>
<?php require_once "_post_js.php"; ?>
<script>
</script>
<?php require_once '_foot.php'; ?>