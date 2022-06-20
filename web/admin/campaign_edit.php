<?php
require '_admin_head.php';
$campaign_id = request_num('edit_id');

if ($campaign_id == '')
    redir("campaign_list.php");

$id = 0;
$tag_ids = "";
$tag_names = "";
$title = "";
$sub_title = "";
$content = "內容內容內容內容內容內容內容內容內容內容";
$pic_url = "";
$pic_alt = "";
$release_date = GetDateString('Y/m/d', time());
$list_order = 0;
$status = 0;
$remark = "";
$form_sub_title = '新增';

$row = null;
if ($campaign_id != 0) {//0:新增，其他:修改
    $url = WEBAPI_CAMPAIGN . "/" . $campaign_id;
    $resultMessage = "";
    $rows = null;
    $result = CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $rows);
    if ($result != 200 || count($rows) != 1)
        redir("campaign_list.php");
    $row = $rows[0];

    if ($row) {
        $id = $row['id'];
        $tag_ids = $row['tag_ids'];
        $tag_ids = explode(",", $tag_ids);
        $tag_names = $row['tag_names'];
        $title = $row['title'];
        $sub_title = $row['sub_title'];
        $content = $row['content'];
        $pic_url = $row['pic_url'];
        $pic_alt = $row['pic_alt'];
        $release_date = $row['release_date'];
        $list_order = $row['list_order'];
        $status = $row['status'];
        $remark = $row['remark'];
        $form_sub_title = '編輯';
    }
}

//查詢餐飲情報標籤
$campaign_tags = null;
if (CallAPI('GET', WEBAPI_CAMPAIGN_TAG, $_SESSION['accesstoken'], null, $resultMessage, $campaign_tags) != 200)
    $campaign_tags = null;
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>餐飲情報
                            <small><?= $form_sub_title ?></small>
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-12">
                    <form name="edit_form" id="edit_form" action="campaign_edit_ajax.php" data-toggle="validator" role="form">
                        <input type="hidden" id="campaign_id" name="campaign_id" value="<?= $id ?>">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-2">
                                    <label for="tag_ids" class="col-md-1">標籤</label>
                                    <div class="col-md-11">
                                        <select id="tag_ids" name="tag_ids[]" class="form-control validate[required] select2" multiple="multiple" data-placeholder="選擇標籤">
                                            <?php
                                            foreach ($campaign_tags as $item) {
                                                $selected = in_array($item["id"], $tag_ids) ? 'selected="selected"' : '';
                                                ?>
                                                <option  value="<?= $item["id"] ?>"<?= $selected ?>><?= $item["name"] ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="title" class="col-md-1">主標題</label>
                                    <div class="col-md-11">
                                        <input type="text" id="title" name="title" class="form-control validate[required]" value="<?= $title ?>" maxlength="50">
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="sub_title" class="col-md-1">副標題</label>
                                    <div class="col-md-11">
                                        <input type="text" id="sub_title" name="sub_title" class="form-control validate[required]" value="<?= $sub_title ?>" maxlength="50">
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="pic_url" class="col-md-1">圖片</label>
                                    <div class="col-md-11">
                                        <div class="input-group">
                                            <input type="file" id="upload_image_btn" accept="image/*">
                                            <input type="hidden" id="upload_image_string" name="upload_image_string" value="">
                                            <input type="text" id="pic_url" name="pic_url" class="form-control" value="<?= $pic_url ?>" placeholder="建議尺寸300*215" readonly>
                                            <span class="input-group-append">
                                                <button  type="button" class="btn btn-flat btn-brand" id="pic_url_btn"><i class="fas fa-eye"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="file" class="col-md-1">圖片預覽</label>
                                    <div class="col-md-5">
                                        <img style="max-width: 100%; height: auto;" id="pic1_img" src="<?= BASE_PATH . $pic_url ?>" alt="">
                                    </div>
                                    <span for="file" class="col-md-6" id="pic1_fileInfo"></span>
                                </div>
                                <div class="row mb-2">
                                    <label for="pic_alt" class="col-md-1">圖片說明</label>
                                    <div class="col-md-11">
                                        <input type="text" id="pic_alt" name="pic_alt" class="form-control" value="<?= $pic_alt ?>" maxlength="50">
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="content" class="col-md-1">內容</label>
                                    <div class="col-md-11">
                                        <textarea id="content" name="content" class="form-control ckeditor"><?= $content ?></textarea>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="release_date" class="col-md-1">發佈日期</label>
                                    <div class="col-md-5">
                                        <input type="text" id="release_date" name="release_date" class="form-control validate[required] date-picker" value="<?= GetDateString($release_date) ?>" readonly>
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
                                <button type="button" class="btn btn-warning float-left" onclick="javascript:location.href='campaign_list.php'">取消</button>
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
        $("#upload_image_btn").hide();

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

    $("#pic_url_btn").click(function(){
        $("#upload_image_btn").click();
    })

    $("#upload_image_btn").change(function(){
        ClearUploadField();
        var fileobj=$(this)[0].files[0];
        if(fileobj){
            var reader=new FileReader();
            reader.onload=function(e){
                $("#pic_url").val(fileobj.name);
                $("#pic1_fileInfo").text("檔案大小:"+fileobj.size+" Bytes");
                $('#upload_image_string').val(e.target.result);
            }
            reader.readAsDataURL(fileobj);
            $('#pic1_img').attr("src",URL.createObjectURL(this.files[0]));
        }
        $(this).val("");
    });

    function ajaxCallback(status,form,json,options){
        if(status===true){
            if(json.sResult==true)
                success_alert("餐飲情報<?= $form_sub_title ?>","campaign_list.php");
            else
                error_alert(json.msg);
        }else{
            error_alert(json.msg);
        }
    }

    function ClearUploadField(){
        $("#pic_url").val("");
        $("#pic1_fileInfo").text("");
        $('#upload_image_string').val("");
    }

</script>
<?php require_once '_admin_foot.php'; ?>