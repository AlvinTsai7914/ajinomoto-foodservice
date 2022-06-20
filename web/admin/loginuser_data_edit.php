<?php
require '_admin_head.php';

$row = null;
$url = WEBAPI_USER_LoginUserData;
$resultMessage = "";
$rows = null;
$result = CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $rows);
if ($result != 200 || count($rows) != 1)
    die('System error 001');
$row = $rows[0];

if ($row) {
    $id = $row['id'];
    $account = $row['account'];
    $name = $row['name'];
    $email = $row['email'];
    $phone = $row['phone'];
    $last_login_time = $row['last_login_time'];
    $last_login_ip = $row['last_login_ip'];
    $status = $row['status'];
    $remark = $row['remark'];
    $user_roles = $row['roles'];
    $sub_title = '修改資料';
} else
    redir("dashboard.php");
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>使用者資料
                            <small><?= $sub_title ?></small>
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-12">
                    <form name="edit_form" id="edit_form" action="loginuser_data_edit_ajax.php" data-toggle="validator" role="form">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-2">
                                    <label for="account" class="col-md-1">帳號</label>
                                    <div class="col-md-5">
                                        <input type="text" id="account" name="account" class="form-control" value="<?= $account ?>" readonly>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="name" class="col-md-1">姓名</label>
                                    <div class="col-md-5">
                                        <input type="text" id="name" name="name" class="form-control validate[required]" value="<?= $name ?>">
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="email" class="col-md-1">Email</label>
                                    <div class="col-md-5">
                                        <input type="text" id="email" name="email" class="form-control validate[required,custom[email]]" placeholder="abc@email.com" value="<?= $email ?>">
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="phone" class="col-md-1">電話</label>
                                    <div class="col-md-5">
                                        <input type="text" id="phone" name="phone" class="form-control validate[custom[phone]" value="<?= $phone ?>">
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="button" class="btn btn-warning float-left" onclick="javascript:location.href = 'dashboard.php'">取消</button>
                                <button type="button" class="btn btn-success float-right" onclick="form_sumbit('#edit_form')">確定</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>
<?php require_once "_admin_post_js.php"; ?>
<script>
    document.title += "-使用者資料";
    $(document).ready(function () {
        $("#edit_form").validationEngine({
            promptPosition: 'bottomLeft',
            maxErrorsPerField: 1,
            showOneMessage: true,
            addFailureCssClassToField: "formError-border_red",
            autoHidePrompt: true,
            autoHideDelay: 3000,
            validateNonVisibleFields: true,
            ajaxFormValidation: true,
            ajaxFormValidationMethod: 'post',
            onAjaxFormComplete: ajaxCallback,
        });
    });

    function ajaxCallback(status, form, json, options) {
        if (status === true) {
            if (json.sResult == true)
                success_alert("使用者資料修改修改", "dashboard.php");
            else
                error_alert(json.msg);
        } else {
            error_alert(json.msg);
        }
    }
</script>
<?php require_once '_admin_foot.php'; ?>

