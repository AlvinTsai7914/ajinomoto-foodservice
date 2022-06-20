<?php
require '_admin_head.php';

$product_id = request_num('edit_id');

if ($product_id == '')
    redir("product_list.php");

$id = 0;
$brand_id = 0;
$name = "";
$pic_urls = "";
$pic_alts = "";
$tag = "";
$content = "內容內容內容內容內容內容內容內容內容內容";
$tips = "內容內容內容內容內容內容內容內容內容內容";
$information = '<ul class="product-info-box p-a0">' .
        '<li class="d-flex ">' .
        '<span class="title">原料</span>' .
        '<span class="text">調味劑(L-麩酸鈉、5`-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span>' .
        '</li>' .
        '<li class="d-flex">' .
        '<span class="title">淨重</span>' .
        '<span class="text">1公斤</span>' .
        '</li>' .
        '<li class="d-flex">' .
        '<span class="title">原產地</span>' .
        '<span class="text">日本國神奈川縣</span>' .
        '</li>' .
        '<li class="d-flex">' .
        '<span class="title">產品包裝</span>' .
        '<span class="text">1kgx12袋/箱</span>' .
        '</li>' .
        '<li class="d-flex">' .
        '<span class="title">產品條碼</span>' .
        '<span class="text">4901001375431</span>' .
        '</li>' .
        '<li class="d-flex">' .
        '<span class="title">外箱尺寸</span>' .
        '<span class="text">522x262x209mm</span>' .
        '</li>' .
        '<li class="d-flex">' .
        '<span class="title">保存期限</span>' .
        '<span class="text">24個月(常溫未開封狀態下) </span>' .
        '</li>' .
        '<li class="d-flex">' .
        '<span class="title">過敏原</span>' .
        '<span class="text">2本產品含有牛奶及其製品</span>' .
        '</li>' .
        '<li class="d-flex">' .
        '<span class="title">保存方法</span>' .
        '<span class="text">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span>' .
        '</li>' .
        '</ul>';
$mark = '<ul class="info-box p-a0">' .
        '<li class="d-flex">' .
        '<span class="title">每一份量</span>' .
        '<span class="text">1公克</span>' .
        '</li>' .
        '<li class="d-flex">' .
        '<span class="title">本包裝含</span>' .
        '<span class="text">1000份</span>' .
        '</li>' .
        '</ul>' .
        '<ul class="product-info-box p-a0">' .
        '<li class="d-flex justify-content-between">' .
        '<span class="title"></span>' .
        '<span class="text-e">每份</span>' .
        '<span class="text-h">每100公克</span>' .
        '</li>' .
        '<li class="d-flex justify-content-between">' .
        '<span class="title">熱量</span>' .
        '<span class="text-e">2.2大卡</span>' .
        '<span class="text-h">225大卡</span>' .
        '</li>' .
        '<li class="d-flex justify-content-between">' .
        '<span class="title">蛋白質</span>' .
        '<span class="text-e">0.2公克</span>' .
        '<span class="text-h">24.1公克</span>' .
        '</li>' .
        '<li class="d-flex justify-content-between">' .
        '<span class="title">脂肪</span>' .
        '<span class="text-e">0.0公克</span>' .
        '<span class="text-h">0.0公克</span>' .
        '</li>' .
        '<li class="d-flex justify-content-between">' .
        '<span class="title">&nbsp;&nbsp;&nbsp;&nbsp;飽和脂肪</span>' .
        '<span class="text-e">0.0公克</span>' .
        '<span class="text-h">0.0公克</span>' .
        '</li>' .
        '<li class="d-flex justify-content-between">' .
        '<span class="title">&nbsp;&nbsp;&nbsp;&nbsp;反式脂肪</span>' .
        '<span class="text-e">0.0公克</span>' .
        '<span class="text-h">0.0公克</span>' .
        '</li>' .
        '<li class="d-flex justify-content-between">' .
        '<span class="title">碳水化合物</span>' .
        '<span class="text-e">0.3公克</span>' .
        '<span class="text-h">31.6公克</span>' .
        '</li>' .
        '<li class="d-flex justify-content-between">' .
        '<span class="title">&nbsp;&nbsp;&nbsp;&nbsp;糖</span>' .
        '<span class="text-e">0.2公克</span>' .
        '<span class="text-h">17.0公克</span>' .
        '</li>' .
        '<li class="d-flex justify-content-between">' .
        '<span class="title">鈉</span>' .
        '<span class="text-e">175毫克</span>' .
        '<span class="text-h">17500毫克</span>' .
        '</li>' .
        '</ul>';
$list_order = 0;
$status = 0;
$remark = "";
$sub_title = '新增';

$row = null;
if ($product_id != 0) {//0:新增，其他:修改
    $url = WEBAPI_PRODUCT . "/" . $product_id;
    $resultMessage = "";
    $rows = null;
    $result = CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $rows);
    if ($result != 200 || count($rows) != 1)
        redir("product_list.php");
    $row = $rows[0];
    if ($row) {
        $id = $row['id'];
        $brand_id = $row['brand_id'];
        $name = $row['name'];
        $pic_urls = $row['pic_urls'];
        $pic_alts = $row['pic_alts'];
        $tag = $row['tag'];
        $content = $row['content'];
        $tips = $row['tips'];
        $information = $row['information'];
        $mark = $row['mark'];
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

//查詢品牌
$brands = null;
if (CallAPI('GET', WEBAPI_BRAND, $_SESSION['accesstoken'], null, $resultMessage, $brands) != 200)
    $brands = null;
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>商品
                            <small><?= $sub_title ?></small>
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-12">
                    <form name="edit_form" id="edit_form" action="product_edit_ajax.php" data-toggle="validator" role="form">
                        <input type="hidden" id="product_id" name="product_id" value="<?= $id ?>">
                        <input type="file" id="upload_image_btn" accept="image/*">
                        <input type="hidden" id="upload_image_string" name="upload_image_string" value="">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-2">
                                    <label for="brand_id" class="col-md-1">品牌</label>
                                    <div class="col-md-11">
                                        <select id="brand_id" name="brand_id" class="form-control validate[required]" data-placeholder="選擇品牌">
                                            <?php
                                            foreach ($brands as $item) {
                                                $selected = ($item["id"] == $brand_id) ? 'selected="selected"' : '';
                                                ?>
                                                <option  value="<?= $item["id"] ?>"<?= $selected ?>><?= $item["name"] ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="name" class="col-md-1">名稱</label>
                                    <div class="col-md-11">
                                        <input type="text" id="name" name="name" class="form-control validate[required]" value="<?= $name ?>" maxlength="50">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-1">
                                        <label class="col-md-12">商品圖片</label>
                                        <button type="button" class="btn btn-brand float-right" id="pic_add_btn"><span class="fas fa-plus"></span></button>
                                    </div>
                                    <div class="col-md-11">
                                        <ul id="pic_ul" class="no-padding">
                                            <li style="cursor: pointer;" class="list-group-item pic-template" >
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="input-group mb-2">
                                                            <input type="text" class="form-control detail-filename" name="pic_url[]" placeholder="建議尺寸260*340" readonly>
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
                                                                <input type="text" class="form-control detail-filename" name="pic_url[]" value="<?= $pic_urls_array[$key] ?>" placeholder="建議尺寸260*340" readonly>
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
                                    <label for="tag" class="col-md-1">商品標籤</label>
                                    <div class="col-md-11">
                                        <input type="text" id="tag" name="tag" class="form-control" value="<?= $tag ?>" maxlength="50">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="content" class="col-md-1">內容</label>
                                    <div class="col-md-11">
                                        <textarea id="content" name="content" class="form-control ckeditor" rows="3"><?= $content ?></textarea>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="tips" class="col-md-1">美味秘訣</label>
                                    <div class="col-md-11">
                                        <textarea id="tips" name="tips" class="form-control ckeditor" rows="3"><?= $tips ?></textarea>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="information" class="col-md-1">商品資訊</label>
                                    <div class="col-md-11">
                                        <textarea id="information" name="information" class="form-control ckeditor" rows="3"><?= $information ?></textarea>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="mark" class="col-md-1">營養標示</label>
                                    <div class="col-md-11">
                                        <textarea id="mark" name="mark" class="form-control ckeditor" rows="3"><?= $mark ?></textarea>
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
                                <button type="button" class="btn btn-warning float-left" onclick="javascript:location.href='product_list.php'">取消</button>
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

        $("#pic_ul").sortable();

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

    $("#pic_add_btn").click(function(){
        var clone=$(".pic-template").clone(true);
        clone.removeClass("pic-template");
        clone.show();
        $("#pic_ul").append(clone);
    });

    var detail_image_obj=null;
    $(document).off("click",".pic_image_btn").on("click",".pic_image_btn",function(e){
        detail_image_obj=$(this).closest(".input-group");
        $("#upload_image_btn").click();
    });

    function ajaxCallback(status,form,json,options){
        if(status===true){
            if(json.sResult==true)
                success_alert("商品<?= $sub_title ?>","product_list.php");
            else
                error_alert(json.msg);
        }else{
            error_alert(json.msg);
        }
    }

    $(document).off("click",".pic_delete_btn").on("click",".pic_delete_btn",function(e){
        $(this).closest("li").remove();
    });

</script>
<?php require_once '_admin_foot.php'; ?>