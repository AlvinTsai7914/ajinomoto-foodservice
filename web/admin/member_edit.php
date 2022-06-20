<?php
require '_admin_head.php';

$member_id = request_num('edit_id');

if ($member_id == '')
    redir("member_list.php");

$id = 0;
$account = "";
$name = "";
$gender = 0;
$phone = "";
$restaurant_name = "";
$restaurant_city_id = "";
$restaurant_area_id = "";
$restaurant_type = "";
$last_login_time = "";
$last_login_ip = "";
$status = 0;
$remark = "";
$sub_title = '新增';

$row = null;
if ($member_id != 0) {//0:新增，其他:修改
    $url = WEBAPI_MEMBER . "/" . $member_id;
    $resultMessage = "";
    $rows = null;
    $result = CallAPI('GET', $url, $_SESSION["accesstoken"], null, $resultMessage, $rows);
    if ($result != 200 || count($rows) != 1)
        redir("member_list.php");
    $row = $rows[0];
    if ($row) {
        $id = $row['id'];
        $account = $row['account'];
        $name = $row['name'];
        $phone = $row['phone'];
        $gender = $row['gender'];
        $restaurant_name = $row['restaurant_name'];
        $restaurant_city_id = $row['restaurant_city_id'];
        $restaurant_area_id = $row['restaurant_area_id'];
        $restaurant_type = $row['restaurant_type'];
        $last_login_time = GetDateTimeString($row['last_login_time']);
        $last_login_ip = $row['last_login_ip'];
        $status = $row['status'];
        $remark = $row['remark'];
        $sub_title = '編輯';
    }
}

//查詢縣市
$cities = null;
$resultMessage = "";
if (CallAPI('GET', WEBAPI_CITYAREA_FindCity, $_SESSION['accesstoken'], null, $resultMessage, $cities) != 200)
    $cities = null;

//建立經營型態選單
$type_array = ["中式", "日式", "西式", "火鍋", "複合", "素食", "連鎖體系"];
if (!in_array($type, $type_array))
    array_unshift($type_array, $type);
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>會員
                            <small><?= $sub_title ?></small>
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-12">
                    <form name="edit_form" id="edit_form" action="member_edit_ajax.php" data-toggle="validator" role="form">
                        <input type="hidden" id="member_id" name="member_id" value="<?= $id ?>">
                        <input type="hidden" id="hidden_restaurant_area_id" value="<?= $restaurant_area_id ?>">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-2">
                                    <label for="account" class="col-md-1">帳號</label>
                                    <div class="col-md-5">
                                        <input type="text" id="account" name="account" class="form-control validate[required, custom[email]]" value="<?= $account ?>" <?= ($member_id == 0) ? "" : "readonly" ?>>
                                    </div>
                                    <label for="name" class="col-md-1">姓名</label>
                                    <div class="col-md-5">
                                        <input type="text" id="name" name="name" class="form-control validate[required]" value="<?= $name ?>">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="phone" class="col-md-1">電話</label>
                                    <div class="col-md-5">
                                        <input type="text" id="phone" name="phone" class="form-control validate[custom[phone]]" value="<?= $phone ?>">
                                    </div>
                                    <label for="gender" class="col-md-1 control-label">性別</label>
                                    <div class="col-md-5">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="gender" id="gender0" class="square-orange" value="0" <?= ($gender == 0) ? "checked" : ""; ?> >
                                                <span class="badge bg-warning">未知</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="gender" id="gender1" class="square-orange" value="1" <?= ($gender == 1) ? "checked" : ""; ?> >
                                                <span class="badge bg-success">男</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="gender" id="gender2" class="square-orange" value="2" <?= ($gender == 2) ? "checked" : ""; ?> >
                                                <span class="badge bg-danger">女</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <?php if ($member_id == 0) { ?>
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
                                <?php } ?>

                                <div class="row mb-2">
                                    <label for="restaurant_name" class="col-md-1">餐廳名稱</label>
                                    <div class="col-md-5">
                                        <input type="text" id="restaurant_name" name="restaurant_name" class="form-control validate[required]" value="<?= $restaurant_name ?>">
                                    </div>
                                    <label for="restaurant_type" class="col-md-1">經營型態</label>
                                    <div class="col-md-5">
                                        <select id="restaurant_type" name="restaurant_type" class="form-control validate[required]" data-placeholder="選擇經營型態">
                                            <?php
                                            foreach ($type_array as $item) {
                                                $selected = ($item == $restaurant_type) ? 'selected="selected"' : '';
                                                ?>
                                                <option  value="<?= $item ?>"<?= $selected ?>><?= $item ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="address" class="col-md-1">餐廳位置</label>
                                    <div class="col-md-1">
                                        <input type="text" id="restaurant_zipcode" name="restaurant_zipcode" class="form-control" value="" placeholder="郵遞區號" readonly>
                                    </div>
                                    <div class="col-md-2">
                                        <select id="restaurant_city_id" name="restaurant_city_id" class="form-control select2" style="width: 100%;">
                                            <option  value="" <?php echo (0 == $restaurant_city_id) ? "selected='selected'" : ""; ?>>(請選擇)</option>
                                            <?php foreach ($cities as $city) { ?>
                                                <option  value="<?= $city["id"] ?>" <?php echo ($city["id"] == $restaurant_city_id) ? "selected='selected'" : ""; ?>><?= $city["name"] ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <select id="restaurant_area_id" name="restaurant_area_id" class="form-control select2" style="width: 100%;">
                                            <option  value="">(請選擇)</option>
                                        </select>
                                    </div>
                                </div>

                                <?php if ($member_id != 0) { ?>
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
                                <?php } ?>

                                <div class="row mb-2">
                                    <label for="status" class="col-md-1">狀態</label>
                                    <div class="col-md-5">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="status" id="status0" class="square-orange" value="0" <?= ($status == 0) ? "checked" : ""; ?>>
                                                <span class="badge bg-success">啟用</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="status" id="status1" class="square-orange" value="1" <?= ($status == 1) ? "checked" : ""; ?> >
                                                <span class="badge bg-warning">尚未驗證</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="status" id="status2" class="square-orange" value="2" <?= ($status == 2) ? "checked" : ""; ?> >
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
                                <button type="button" class="btn btn-warning float-left" onclick="javascript:location.href='member_list.php'">取消</button>
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
    $(document).ready(function(){
        RefreshArea($('#restaurant_city_id').val(),$("#hidden_restaurant_area_id").val(),"#restaurant_area_id","#restaurant_zipcode");

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

    $('#restaurant_city_id').on('select2:select',function(e){
        RefreshArea($('#restaurant_city_id').val(),$("#hidden_restaurant_area_id").val(),"#restaurant_area_id","#restaurant_zipcode");
    });

    $('#restaurant_area_id').on('select2:select',function(e){
        RefreshZipcode($('#restaurant_area_id').val(),"#restaurant_zipcode");
    });

    function ajaxCallback(status,form,json,options){
        if(status===true){
            if(json.sResult===true)
                success_alert("會員<?= $sub_title ?>","member_list.php");
            else
                error_alert(json.msg);
        }else{
            error_alert(json.msg);
        }
    }
</script>
<?php require_once '_admin_foot.php'; ?>