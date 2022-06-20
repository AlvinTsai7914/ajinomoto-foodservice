<?php
require '_admin_head.php';

$user_id = request_num('edit_id');

if ($user_id == '' || ( $user_id <= 1 && $user_id != 0))
    redir("user_list.php");

$row = null;
if ($user_id != 0) {//0:新增，其他:修改
    $url = WEBAPI_USER . "/" . $user_id;
    $resultMessage = "";
    $rows = null;
    $result = CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $rows);
    if ($result != 200 || count($rows) != 1)
        die('System error 001');
    $row = $rows[0];
}

if ($row) {
    $id = $row['id'];
    $account = $row['account'];
    $name = $row['name'];
    $email = $row['email'];
    $phone = $row['phone'];
    $start_date = GetDateString($row['start_date']);
    $end_date = GetDateString($row['end_date']);
    $datanumber_current = $row['datanumber_current'];
    $datanumber_limit = $row['datanumber_limit'];
    $last_login_time = GetDateTimeString($row['last_login_time']);
    $last_login_ip = $row['last_login_ip'];
    $status = $row['status'];
    $remark = $row['remark'];
    $user_roles = $row['roles'];
    $sub_title = '編輯';
} else {
    $id = 0;
    $account = "";
    $name = "";
    $email = "";
    $phone = "";
    $start_date = date('Y/m/d', time());
    $end_date = date('Y/m/d', time());
    $datanumber_current = 0;
    $datanumber_limit = 0;
    $last_login_time = "";
    $last_login_ip = "";
    $status = 0;
    $remark = "";
    $user_roles = null;
    $sub_title = '新增';
}

$roles = null;
//查詢角色
if (CallAPI('GET', WEBAPI_ROLE, $_SESSION['accesstoken'], null, $resultMessage, $roles) != 200)
    $roles = null;
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>使用者
                            <small><?= $sub_title ?></small>
                            <?php if ($user_id != 0) { ?>
                                <button type="button" class="btn btn-brand float-right edit" id="edit_password_btn">設定密碼</button>
                            <?php } ?>
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-12">
                    <form name="edit_form" id="edit_form" action="user_edit_ajax.php" data-toggle="validator" role="form">
                        <input type="hidden" id="user_id" name="user_id" value="<?= $id ?>">
                        <input type="hidden" id="edit_password" name="edit_password" value="<?= ($id == 0) ? "0" : "1" ?>">
                        <div class="card">
                            <div class="card-body">

                                <div class="row mb-2">
                                    <label for="account" class="col-md-1">帳號</label>
                                    <div class="col-md-5">
                                        <input type="text" id="account" name="account" class="form-control validate[required, minSize[3]]" value="<?= $account ?>" <?= ($user_id == 0) ? "" : "readonly" ?>>
                                    </div>
                                    <label for="name" class="col-md-1">姓名</label>
                                    <div class="col-md-5">
                                        <input type="text" id="name" name="name" class="form-control validate[required]" value="<?= $name ?>">
                                    </div>
                                </div>

                                <div class="row mb-2" id="edit_password_div">
                                    <label for="password" class="col-md-1">密碼</label>
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <input type="password" id="password" name="password" class="form-control validate[required, minSize[8]]" maxlength="16" placeholder="最少8位英數字">
                                            <span class="input-group-append">
                                                <button  type="button" class="btn btn-flat btn-brand look_password_btn"><i class="fas fa-eye"></i></button>
                                            </span>
                                        </div>
                                    </div>

                                    <label for="password2" class="col-md-1">密碼確認</label>
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <input type="password" id="password2" name="password2" class="form-control validate[required,equals[password]]" maxlength="16" placeholder="必須與密碼相同">
                                            <span class="input-group-append">
                                                <button  type="button" class="btn btn-flat btn-brand look_password_btn"><i class="fas fa-eye"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="email" class="col-md-1">Email</label>
                                    <div class="col-md-5">
                                        <input type="text" id="email" name="email" class="form-control validate[required,custom[email]]" placeholder="abc@email.com" value="<?= $email ?>">
                                    </div>
                                    <label for="phone" class="col-md-1">電話</label>
                                    <div class="col-md-5">
                                        <input type="text" id="phone" name="phone" class="form-control validate[custom[phone]" value="<?= $phone ?>">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="last_login_time" class="col-md-1">最後登入時間</label>
                                    <div class="col-md-5">
                                        <input type="text" name="last_login_time" class="form-control" value="<?= GetDateTimeString($last_login_time) ?>" readonly>
                                    </div>
                                    <label for="last_login_ip" class="col-md-1">最後登入IP</label>
                                    <div class="col-md-5">
                                        <input type="text" name="last_login_ip" class="form-control" value="<?= $last_login_ip ?>" readonly>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="roles" class="col-md-1">角色</label>
                                    <div class="col-md-5">
                                        <select id = "roles" name="roles[]" class="form-control" style="width: 100%" data-placeholder="選擇角色">
                                            <?php
                                            foreach ($roles as $role) {
                                                $selected = in_array($role["id"], $user_roles) ? 'selected="selected"' : '';
                                                ?>
                                                <option  value="<?= $role["id"] ?>"<?= $selected ?>><?= $role["name"] ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <label for="status" class="col-md-1">狀態</label>
                                    <div class="col-md-5">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="status" id="status0" class="square-red" value="0" <?= ($status == 0) ? "checked" : ""; ?>>
                                                <span class="badge bg-success">啟用</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="status" id="status1" class="square-red" value="1" <?= ($status == 1) ? "checked" : ""; ?> >
                                                <span class="badge bg-danger">停用</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="remark" class="col-md-1">備註</label>
                                    <div class="col-md-11">
                                        <textarea id="remark" name="remark" class="form-control" rows="3"><?= $remark ?></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="button" class="btn btn-warning float-left" onclick="javascript:location.href = 'user_list.php'">取消</button>
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
    $(document).ready(function () {
        $("#edit_form").validationEngine({
            promptPosition: 'bottomLeft',
            maxErrorsPerField: 1,
            showOneMessage: true,
            addFailureCssClassToField: "formError-border_red",
            autoHidePrompt: true,
            autoHideDelay: 3000,
            validateNonVisibleFields: false,
            ajaxFormValidation: true,
            ajaxFormValidationMethod: 'post',
            onAjaxFormComplete: ajaxCallback,
        });
        ChangeEditPasswordStatus();
    });

    $("#edit_password_btn").click(function () {
        ChangeEditPasswordStatus();
    });

    function ajaxCallback(status, form, json, options) {
        if (status === true) {
            if (json.sResult == true)
                success_alert("使用者<?= $sub_title ?>", "user_list.php");
            else
                error_alert(json.msg);
        } else {
            error_alert(json.msg);
        }
    }

    function ChangeEditPasswordStatus()
    {
        var status = $("#edit_password").val();
        if (status == 0)
        {
            //修改為不設定密碼
            $("#edit_password").val("1");
            $("#edit_password_div").show();
            $("#edit_password_btn").text("取消設定密碼");
        } else
        {
            $("#edit_password").val("0");
            $("#edit_password_div").hide();
            $("#edit_password_btn").text("設定密碼");
        }
    }

</script>
<?php require_once '_admin_foot.php'; ?>