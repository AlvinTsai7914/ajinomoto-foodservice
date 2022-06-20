<?php
require '_admin_head.php';

$campaign_tag_id = request_num('edit_id');

if ($campaign_tag_id == '')
    redir("campaign_tag_list.php");

$id = 0;
$name = "";
$color = "#000000";
$list_order = 0;
$status = 0;
$remark = "";
$sub_title = '新增';

$row = null;
if ($campaign_tag_id != 0) {//0:新增，其他:修改
    $url = WEBAPI_CAMPAIGN_TAG . "/" . $campaign_tag_id;
    $resultMessage = "";
    $rows = null;
    $result = CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $rows);
    if ($result != 200 || count($rows) != 1)
        redir("campaign_tag_list.php");
    $row = $rows[0];
    if ($row) {
        $id = $row['id'];
        $name = $row['name'];
        $color = $row['color'];
        $list_order = $row['list_order'];
        $status = $row['status'];
        $remark = $row['remark'];
        $sub_title = '編輯';
    }
}
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>餐飲情報標籤
                            <small><?= $sub_title ?></small>
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-12">
                    <form name="edit_form" id="edit_form" action="campaign_tag_edit_ajax.php" data-toggle="validator" role="form">
                        <input type="hidden" id="campaign_tag_id" name="campaign_tag_id" value="<?= $id ?>">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-2">
                                    <label for="name" class="col-md-1">名稱</label>
                                    <div class="col-md-5">
                                        <input type="text" id="name" name="name" class="form-control validate[required]" value="<?= $name ?>" maxlength="50">
                                    </div>
                                    <label for="color" class="col-md-1">顏色</label>
                                    <div class="col-md-5">
                                        <input type="color" id="color" name="color" class="form-control validate[required]" style="height:38px" value="<?= $color ?>">
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="list_order" class="col-md-1">列表順序</label>
                                    <div class="col-md-5">
                                        <input type="number" id="list_order" name="list_order" class="form-control validate[required]" min="0" step="1" value="<?= $list_order ?>">
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
                                <button type="button" class="btn btn-warning float-left" onclick="javascript:location.href='campaign_tag_list.php'">取消</button>
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
            if(json.sResult==true)
                success_alert("餐飲情報標籤<?= $sub_title ?>","campaign_tag_list.php");
            else
                error_alert(json.msg);
        }else{
            error_alert(json.msg);
        }
    }

</script>
<?php require_once '_admin_foot.php'; ?>