<?PHP
require_once '_head.php';

$member_id = request_num("id");
$member_verification = request_str("v");
if (empty($member_id) || empty($member_verification))
    redir("index.php");

$verification_flag = false;
//伺服器登入
$servertoken = WebServerLogin(API_ACCOUNT, API_PASSWORD);

//查詢會員帳號
$sResult = false;
$resultMessage = "未知的錯誤";
$resultData = null;
$querystring = "id='" . $member_id . "'";
$querystring .= " AND verification='" . $member_verification . "'";
$url = WEBAPI_MEMBER . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, $servertoken, null, $resultMessage, $resultData) == 200) {
    if (count($resultData) == 1) {
        $verification_flag = true;
    }
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
                <li class="breadcrumb-item active" aria-current="page">重設密碼</li>
            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="RESET">重設密碼</h2>
        </div>
    </div>
    <div class="inner p-tb50 bg-Light">
        <div class="container text-center">
            <?php if ($verification_flag == true) { ?>
                <form class="form-box" name="edit_form" id="edit_form" action="ajax/reset_password_ajax.php" data-toggle="validator" role="form">
                    <input type="hidden" name="member_id" value="<?= $member_id ?>">
                    <input type="hidden" name="verification" value="<?= $member_verification ?>">
                    <div class="form-box">
                        <div class="form-group row">
                            <label for="password" class="col-sm-2 col-form-label">輸入新密碼</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control form-control-sm validate[required, minSize[8]]" name="password" id="password" placeholder="輸入新密碼，英數組合，最少8碼">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="passwordAgain" class="col-sm-2 col-form-label">確認新密碼</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control form-control-sm validate[required,equals[password]]"  name="passwordAgain" id="passwordAgain" placeholder="請輸入新密碼">
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="button" class="primary-btn m-lr20" onclick="form_sumbit('#edit_form')">重設密碼</button>
                        </div>
                    </div>
                </form>
            </div>
        <?php } else { ?>
            <p class="m-b20">會員帳號驗證失敗</p>
            <button type="button" class="primary-btn m-lr20" onclick="javascript:location.href='index.php'">回首頁</button>
        <?php } ?>
    </div>
</section>

<?php require_once '_footer.php'; ?>
<?php require_once '_post_js.php'; ?>

<script>
    $(document).ready(function(){
        $("#edit_form").validationEngine({
            promptPosition:'bottomLeft',
            maxErrorsPerField:1,
            showOneMessage:true,
            addFailureCssClassToField:"formError-border_red",
            autoHidePrompt:true,
            autoHideDelay:3000,
            validateNonVisibleFields:false,
            ajaxFormValidation:true,
            ajaxFormValidationMethod:'post',
            onAjaxFormComplete:ajaxCallback,
        });
    });

    function ajaxCallback(status,form,json,options){
        if(status===true){
            if(json.sResult===true)
                Swal.fire({
                    title:"重設密碼成功",
                    text:"請使用新密碼登入",
                    type:'success'
                }).then(()=>{
                    window.location='index.php';
                })
        }else{
            Swal.fire({
                title:"重設密碼失敗",
                text:json.msg,
                type:'error'
            }).then(()=>{
                location.reload();
            })
        }
    }

    function form_sumbit(selector){
        $(selector).submit();
    }
</script>

<?php require_once '_foot.php'; ?>
