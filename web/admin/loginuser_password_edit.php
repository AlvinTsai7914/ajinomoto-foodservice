<?php
require '_admin_head.php';

$sub_title = '修改密碼';
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
                    <form name="edit_form" id="edit_form" action="loginuser_password_edit_ajax.php" data-toggle="validator" role="form">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-2">
                                    <label for="old_password" class="col-md-1">舊密碼</label>
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <input type="password" id="old_password" name="old_password" class="form-control validate[required, minSize[5]]" maxlength="16" placeholder="最少8位英數字">
                                            <span class="input-group-append">
                                                <button  type="button" class="btn btn-flat btn-brand look_password_btn"><i class="fas fa-eye"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="new_password" class="col-md-1">新密碼</label>
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <input type="password" id="new_password" name="new_password" class="form-control validate[required, minSize[8]]" maxlength="16" placeholder="最少8位英數字">
                                            <span class="input-group-append">
                                                <button  type="button" class="btn btn-flat btn-brand look_password_btn"><i class="fas fa-eye"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="password2" class="col-md-1">新密碼確認</label>
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <input type="password" id="password2" name="password2" class="form-control validate[required,equals[new_password]]" placeholder="必須與新密碼相同">
                                            <span class="input-group-append">
                                                <button  type="button" class="btn btn-flat btn-brand look_password_btn"><i class="fas fa-eye"></i></button>
                                            </span>
                                        </div>
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
                success_alert("密碼修改", "logout_ajax.php");
            else
                error_alert(json.msg);
        } else {
            error_alert(json.msg);
        }
    }
</script>
<?php require_once '_admin_foot.php'; ?>

