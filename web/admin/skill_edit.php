<?php
require '_admin_head.php';

$higi_id = request_num('edit_id');

if ($higi_id == '')
    redir("skill_list.php");

$id = 0;
$name = "";
$pic_urls = "";
$pic_alts = "";
$content = "";
$description = "";
$recipepro_id = 0;
$product_id = 0;
$tags = "";
$type = "";
$style = "";
$methods = "";
$note = "";
$note_pic_url = "";
$note_pic_alt = "";
$member_only = 0;
$visitor = 0;
$list_order = 0;
$status = 0;
$remark = "";
$sub_title = '新增';

$row = null;
if ($higi_id != 0) {//0:新增，其他:修改
    $url = WEBAPI_HIGI . "/" . $higi_id;
    $resultMessage = "";
    $rows = null;
    $result = CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $rows);
    if ($result != 200 || count($rows) != 1)
        redir("skill_list.php");
    $row = $rows[0];

    if ($row) {
        $id = $row['id'];
        $name = $row['name'];
        $pic_urls = $row['pic_url'];
        $pic_alts = $row['pic_alt'];
        $content = $row['content'];
        $description = $row['description'];
        $recipepro_id = $row['recipepro_id'];
        $product_id = $row['product_id'];
        $tags = $row['tags'];
        $tags = explode(",", $tags);
        $type = $row['type'];
        $style = $row['style'];
        $methods = $row['methods'];
        $note = $row['note'];
        $note_pic_url = $row['note_pic_url'];
        $note_pic_alt = $row['note_pic_alt'];
        $member_only = $row['member_only'];
        $visitor = $row['visitor'];
        $list_order = $row['list_order'];
        $status = $row['status'];
        $remark = $row['remark'];
        $sub_title = '編輯';
    }
}

if (!empty($pic_urls))
    $pic_urls_array = explode(',', $pic_urls);
if (!empty($pic_alts))
    $pic_alts_array = explode(',', $pic_alts);
if (!empty($methods))
    $methods = explode(",", $methods);

//查詢專業食譜
$recipepros = null;
if (CallAPI('GET', WEBAPI_RECIPEPRO, $_SESSION['accesstoken'], null, $resultMessage, $recipepros) != 200)
    $recipepros = null;

//查詢商品
$products = null;
if (CallAPI('GET', WEBAPI_PRODUCT, $_SESSION['accesstoken'], null, $resultMessage, $products) != 200)
    $products = null;

//取得食材標籤
$tags_buf = null;
$querystring = "category_id=1";
$url = WEBAPI_TAG . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $tags_buf) != 200)
    $tags_buf = null;
$food_array = null;
foreach ($tags_buf as $item) {
    $food_array[] = $item["name"];
}

//取得菜色標籤
$tags_buf = null;
$querystring = "category_id=2";
$url = WEBAPI_TAG . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $tags_buf) != 200)
    $tags_buf = null;
$type_array = null;
foreach ($tags_buf as $item) {
    $type_array[] = $item["name"];
}

//取得菜式標籤
$tags_buf = null;
$querystring = "category_id=3";
$url = WEBAPI_TAG . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $tags_buf) != 200)
    $tags_buf = null;
$style_array = null;
foreach ($tags_buf as $item) {
    $style_array[] = $item["name"];
}
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>招客秘笈
                            <small><?= $sub_title ?></small>
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-12">
                    <form name="edit_form" id="edit_form" action="skill_edit_ajax.php" data-toggle="validator" role="form">
                        <input type="hidden" id="higi_id" name="higi_id" value="<?= $id ?>">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-2">
                                    <label for="name" class="col-md-1">名稱</label>
                                    <div class="col-md-11">
                                        <input type="text" id="name" name="name" class="form-control validate[required]" value="<?= $name ?>" maxlength="50">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="content" class="col-md-1">內容(黑字)</label>
                                    <div class="col-md-11">
                                        <input type="text" id="content" name="content" class="form-control" value="<?= $content ?>" maxlength="500">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="description" class="col-md-1">說明(紅字)</label>
                                    <div class="col-md-11">
                                        <input type="text" id="description" name="description" class="form-control" value="<?= $description ?>" maxlength="500">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-1">
                                        <label class="col-md-12">圖片</label>
                                        <button type="button" class="btn btn-brand float-right" id="pic_add_btn"><span class="fas fa-plus"></span></button>
                                        <input type="file" id="upload_image_btn" accept="image/*">
                                        <input type="hidden" id="upload_image_string" name="upload_image_string" value="">
                                    </div>
                                    <div class="col-md-11">
                                        <ul id="pic_ul" class="no-padding">
                                            <li style="cursor: pointer;" class="list-group-item pic-template" >
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="input-group mb-2">
                                                            <input type="text" class="form-control detail-filename" name="pic_url[]" placeholder="建議尺寸570*800" readonly>
                                                            <input type="hidden" class="form-control detail-image-string" name="upload_image_string[]" value="">
                                                            <span class="input-group-append">
                                                                <button  type="button" class="btn btn-flat btn-brand pic_image_btn"><i class="fas fa-eye"></i></button>
                                                            </span>
                                                        </div>
                                                        <input type="text" name="pic_alt[]" class="form-control mb-2" value="" maxlength="100" placeholder="請輸入圖片說明">
                                                    </div>
                                                    <div class="col-md-5">
                                                        <img style="max-width: 100%; max-height: 200px;" class="detail-image" src="" alt="">
                                                    </div>
                                                    <div class="col-md-1">
                                                        <button type="button" class="btn btn-brand float-right pic_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                    </div>
                                                </div>
                                            </li>
                                            <?php foreach ($pic_urls_array as $key => $picurl) { ?>
                                                <li style="cursor: pointer;" class="list-group-item" >
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="input-group mb-2">
                                                                <input type="text" class="form-control detail-filename" name="pic_url[]" value="<?= $pic_urls_array[$key] ?>" placeholder="建議尺寸570*800" readonly>
                                                                <input type="hidden" class="form-control detail-image-string" name="upload_image_string[]" value="">
                                                                <span class="input-group-append">
                                                                    <button  type="button" class="btn btn-flat btn-brand pic_image_btn"><i class="fas fa-eye"></i></button>
                                                                </span>
                                                            </div>
                                                            <input type="text" name="pic_alt[]" class="form-control mb-2" value="<?= $pic_alts_array[$key] ?>" maxlength="100" placeholder="請輸入圖片說明">
                                                        </div>
                                                        <div class="col-md-5">
                                                            <img style="max-width: 100%; max-height: 200px;" class="detail-image" src="<?= BASE_PATH . $pic_urls_array[$key] ?>" alt="<?= $pic_alts_array[$key] ?>">
                                                        </div>
                                                        <div class="col-md-1">
                                                            <button type="button" class="btn btn-brand float-right pic_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                        </div>
                                                    </div>
                                                </li>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="recipepro_id" class="col-md-1">專業食譜</label>
                                    <div class="col-md-5">
                                        <select id="recipepro_id" name="recipepro_id" class="form-control validate[required]" data-placeholder="選擇專業食譜">
                                            <option value="0">(無)</option>
                                            <?php
                                            foreach ($recipepros as $item) {
                                                $selected = ($item["id"] == $recipepro_id) ? 'selected="selected"' : '';
                                                ?>
                                                <option value="<?= $item["id"] ?>"<?= $selected ?>><?= $item["name"] ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="tags" class="col-md-1">食材</label>
                                    <div class="col-md-5">
                                        <select id="tags" name="tags[]" class="form-control validate[required] select2" multiple="multiple" data-placeholder="選擇標籤">
                                            <?php
                                            foreach ($food_array as $item) {
                                                $selected = in_array($item, $tags) ? 'selected="selected"' : '';
                                                ?>
                                                <option value="<?= $item ?>"<?= $selected ?>><?= $item ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <label for="type" class="col-md-1">菜色</label>
                                    <div class="col-md-5">
                                        <select id="type" name="type" class="form-control validate[required]" data-placeholder="選擇菜色類型">
                                            <?php
                                            foreach ($type_array as $item) {
                                                $selected = ($item == $type) ? 'selected="selected"' : '';
                                                ?>
                                                <option value="<?= $item ?>"<?= $selected ?>><?= $item ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>


                                <div class="row mb-2">
                                    <label for="style" class="col-md-1">菜式</label>
                                    <div class="col-md-5">
                                        <select id="style" name="style" class="form-control validate[required]" data-placeholder="選擇菜式類型">
                                            <?php
                                            foreach ($style_array as $item) {
                                                $selected = ($item == $style) ? 'selected="selected"' : '';
                                                ?>
                                                <option value="<?= $item ?>"<?= $selected ?>><?= $item ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <label for="product_id" class="col-md-1">商品</label>
                                    <div class="col-md-5">
                                        <select id="product_id" name="product_id" class="form-control validate[required]" data-placeholder="選擇商品">
                                            <?php
                                            foreach ($products as $item) {
                                                $selected = ($item["id"] == $product_id) ? 'selected="selected"' : '';
                                                ?>
                                                <option value="<?= $item["id"] ?>"<?= $selected ?>><?= $item["name"] ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-1">
                                        <label class="col-md-12">烹調方式</label>
                                        <button type="button" class="btn btn-brand float-right" id="method_add_btn"><span class="fas fa-plus"></span></button>
                                    </div>
                                    <div class="col-md-11">
                                        <ul>
                                            <li style="cursor: pointer;" class="list-group-item method-template" >
                                                <div class="method-detail_row">
                                                    <div class="row method-detail">
                                                        <div class="col-md-11">
                                                            <input type="text" name="method_names[]" class="form-control mb-2 method_names validate[required]" value="" maxlength="100" placeholder="請輸入內容">
                                                        </div>
                                                        <div class="col-md-1">
                                                            <button type="button" class="btn btn-danger float-right method_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul id="method_ul" class="no-padding">
                                            <?php
                                            $index = 1;
                                            foreach ($methods as $method) {
                                                if (!empty($method)) {
                                                    ?>
                                                    <li style="cursor: pointer;" class="list-group-item">
                                                        <div class="method-detail_row">
                                                            <div class="row method-detail">
                                                                <div class="col-md-11">
                                                                    <input type="text" name="method_names[<?= $index ?>]" class="form-control mb-2 method_names validate[required]" value="<?= $method ?>" maxlength="100" placeholder="請輸入內容">
                                                                </div>
                                                                <div class="col-md-1">
                                                                    <button type="button" class="btn btn-danger float-right method_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <?php
                                                    $index++;
                                                }
                                            }
                                            ?>
                                        </ul>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="note_pic_url" class="col-md-1">小筆記圖片</label>
                                    <div class="col-md-11">
                                        <div class="input-group">
                                            <input type="file" id="note_upload_image_btn" accept="image/*">
                                            <input type="hidden" id="note_upload_image_string" name="note_upload_image_string" value="">
                                            <input type="text" id="note_pic_url" name="note_pic_url" class="form-control" value="<?= $note_pic_url ?>" placeholder="建議尺寸200*134" readonly>
                                            <span class="input-group-append">
                                                <button type="button" class="btn btn-flat btn-brand" id="note_pic_url_btn"><i class="fas fa-eye"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="file" class="col-md-1">小筆記圖片預覽</label>
                                    <div class="col-md-5">
                                        <img style="max-width: 100%; height: auto;" id="note_pic1_img" src="<?= BASE_PATH . $note_pic_url ?>" alt="">
                                    </div>
                                    <span for="file" class="col-md-6" id="note_pic1_fileInfo"></span>
                                </div>
                                <div class="row mb-2">
                                    <label for="note_pic_alt" class="col-md-1">小筆記圖片說明</label>
                                    <div class="col-md-11">
                                        <input type="text" id="note_pic_alt" name="note_pic_alt" class="form-control" value="<?= $note_pic_alt ?>" maxlength="50">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="note" class="col-md-1">小筆記</label>
                                    <div class="col-md-11">
                                        <textarea id="note" name="note" class="form-control" rows="3"><?= $note ?></textarea>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="member_only" class="col-md-1">會員限定</label>
                                    <div class="col-md-5">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="member_only" id="member_only0" class="square-red" value="0" <?= ($member_only == 0) ? "checked" : ""; ?>>
                                                <span class="badge bg-success">否</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="member_only" id="member_only1" class="square-red" value="1" <?= ($member_only == 1) ? "checked" : ""; ?> >
                                                <span class="badge bg-danger">是</span>
                                            </label>
                                        </div>
                                    </div>

                                    <label for="visitor" class="col-md-1">瀏覽人數</label>
                                    <div class="col-md-5">
                                        <input type="text" id="visitor" name="visitor" class="form-control validate[required]" value="<?= $visitor ?>" readonly>
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
                                <button type="button" class="btn btn-warning float-left" onclick="javascript:location.href='skill_list.php'">取消</button>
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
        $(".pic-template").hide();
        $("#note_upload_image_btn").hide();

        $(".method-template").hide();

        $("#pic_ul").sortable();
        $("#method_ul").sortable();

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

    $("#upload_image_btn").change(function(){
        detail_image_obj.children("input").val("");
        var fileobj=$(this)[0].files[0];
        if(fileobj){
            var reader=new FileReader();
            reader.onload=function(e){
                detail_image_obj.children(".detail-filename").val(fileobj.name);
                detail_image_obj.children('.detail-image-string').val(e.target.result);
            };
            reader.readAsDataURL(fileobj);
            detail_image_obj.closest("li").find(".detail-image").attr("src",URL.createObjectURL(this.files[0]));
        }
        $(this).val("");
    });

    var detail_image_obj=null;
    $(document).off("click",".pic_image_btn").on("click",".pic_image_btn",function(e){
        console.log(":A:)");
        detail_image_obj=$(this).closest(".input-group");
        $("#upload_image_btn").click();
    });

    $(document).off("click",".pic_delete_btn").on("click",".pic_delete_btn",function(e){
        $(this).closest("li").remove();
    });

    $("#pic_add_btn").click(function(){
        var clone=$(".pic-template").clone(true);
        clone.removeClass("pic-template");
        clone.show();
        $("#pic_ul").append(clone);
    });

    $("#note_pic_url_btn").click(function(){
        $("#note_upload_image_btn").click();
    })

    $("#note_upload_image_btn").change(function(){
        ClearNoteUploadField();
        var fileobj=$(this)[0].files[0];
        if(fileobj){
            var reader=new FileReader();
            reader.onload=function(e){
                $("#note_pic_url").val(fileobj.name);
                $("#note_pic1_fileInfo").text("檔案大小:"+fileobj.size+" Bytes");
                $('#note_upload_image_string').val(e.target.result);
            }
            reader.readAsDataURL(fileobj);
            $('#note_pic1_img').attr("src",URL.createObjectURL(this.files[0]));
        }
        $(this).val("");
    });

    $(document).off("click","#method_add_btn").on("click","#method_add_btn",function(e){
        var clone=$(".method-template").clone(true);
        clone.removeClass("method-template");
        clone.show();
        $("#method_ul").append(clone);

        $("#method_ul .method-detail_row").each(function(index){
            $(this).find(".method_names").prop("name","method_names["+index+"]");
        });
    });

    $(document).off("click",".method_delete_btn").on("click",".method_delete_btn",function(e){
        $(this).closest("li").remove();
    });

    $("#method_ul").on("sortstop",function(event,ui){
        $("#method_ul .method-detail_row").each(function(index){
            $(this).find(".method_names").prop("name","method_names["+index+"]");
        });
    });

    function ajaxCallback(status,form,json,options){
        if(status===true){
            if(json.sResult==true)
                success_alert("招客秘笈<?= $sub_title ?>","skill_list.php");
            else
                error_alert(json.msg);
        }else{
            error_alert(json.msg);
        }
    }

    function ClearNoteUploadField(){
        $("#note_pic_url").val("");
        $("#note_pic1_fileInfo").text("");
        $('#note_upload_image_string').val("");
    }

</script>
<?php require_once '_admin_foot.php'; ?>