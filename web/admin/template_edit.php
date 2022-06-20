<?php
require '_admin_head.php';

$product_id = request_num('edit_id');

if ($product_id == '')
    redir("product_list.php");

$row = null;
if ($product_id != 0) {//0:新增，其他:修改
    $url = WEBAPI_PRODUCT . "/" . $product_id;
    $resultMessage = "";
    $rows = null;
    $result = CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $rows);
    if ($result != 200 || count($rows) != 1)
        redir("product_list.php");
    $row = $rows[0];
}

if ($row) {
    $id = $row['id'];
    $category_id = $row['category_id'];
    $name = $row['name'];
    $pic1url = $row['pic1url'];
    $pic1alt = $row['pic1alt'];
    $content = $row['content'];
    $newlisting = $row['newlisting'];
    $list_order = $row['list_order'];
    $status = $row['status'];
    $remark = $row['remark'];
    $sub_title = '編輯';
} else {
    $id = 0;
    $category_id = 0;
    $name = "";
    $pic1url = "";
    $pic1alt = "";
    $content = "";
    $newlisting = 0;
    $list_order = 0;
    $status = 0;
    $remark = "";
    $sub_title = '新增';
}

//查詢商品類別
$product_categorys = null;
if (CallAPI('GET', WEBAPI_PRODUCTCATEGORY, $_SESSION['accesstoken'], null, $resultMessage, $product_categorys) != 200)
    $product_categorys = null;

//查詢商品圖片
$product_pictures = null;
$querystring = "product_id='" . $id . "'";
$url = WEBAPI_PRODUCTPICTURE . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $product_pictures) != 200)
    $product_pictures = null;
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
                    <form name="edit_form" id="edit_form" action="template_edit_ajax.php" data-toggle="validator" role="form">
                        <input type="hidden" id="product_id" name="product_id" value="<?= $id ?>">
                        <div class="card">
                            <div class="card-body">

                                <div class="row mb-2">
                                    <label for="category_id" class="col-md-1">商品類別</label>
                                    <div class="col-md-11">
                                        <select id="category_id" name="category_id" class="form-control validate[required]" data-placeholder="選擇商品類別">
                                            <?php
                                            foreach ($product_categorys as $item) {
                                                $selected = ($item["id"] == $category_id) ? 'selected="selected"' : '';
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
                                    <label for="pic1url" class="col-md-1">代表圖片</label>
                                    <div class="col-md-11">
                                        <div class="input-group">
                                            <input type="text" id="pic1url" name="pic1url" class="form-control validate[required]" value="<?= $pic1url ?>" placeholder="請選擇圖片" readonly>
                                            <input type="hidden" id="pic_src_string" name="pic_src_string" value="">
                                            <span class="input-group-append">
                                                <button  type="button" class="btn btn-flat btn-brand" data-toggle="modal" data-target="#croppie_modal" data-width="1920" data-height="600" data-source="#pic1url" data-result="#pic_src_string" data-preview="#pic1url_preview"><i class="fas fa-image"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="file" class="col-md-1">代表圖片預覽</label>
                                    <div class="col-md-11">
                                        <img style="max-width: 100%; height: auto;" id="pic1url_preview" src="<?= BASE_PATH . $pic1url ?>" alt="">
                                    </div>
                                    <span for="file" class="col-md-6" id="pic1_fileInfo"></span>
                                </div>
                                <div class="row mb-2">
                                    <label for="pic1alt" class="col-md-1">代表圖片說明</label>
                                    <div class="col-md-11">
                                        <input type="text" id="pic1alt" name="pic1alt" class="form-control" value="<?= $pic1alt ?>" maxlength="50">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="content" class="col-md-1">商品資訊</label>
                                    <div class="col-md-11">
                                        <textarea id="content" name="content" class="form-control ckeditor" rows="3"><?= $content ?></textarea>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="newlisting" class="col-md-1">新品上市</label>
                                    <div class="col-md-5">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="newlisting" id="newlisting1" class="square-red" value="1" <?= ($newlisting == 1) ? "checked" : ""; ?>>
                                                <span class="badge bg-success">是</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="newlisting" id="newlisting0" class="square-red" value="0" <?= ($newlisting == 0) ? "checked" : ""; ?> >
                                                <span class="badge bg-danger">否</span>
                                            </label>
                                        </div>
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


                                <div class="row mb-2">
                                    <div class="col-md-1">
                                        <label class="col-md-12">商品圖片</label>
                                        <button type="button" class="btn btn-brand float-right" id="picture_add_btn"><span class="fas fa-plus"></span></button>
                                    </div>
                                    <div class="col-md-11">
                                        <ul id="picture_ul" class="no-padding">
                                            <?php
                                            foreach ($product_pictures as $key => $item) {
                                                $key = $key + 1;
                                                ?>
                                                <li style="cursor: pointer;" class="list-group-item" data-picture_id="<?= $key ?>">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="row">
                                                                <div class="col-md-11">
                                                                    <div class="input-group mb-2">
                                                                        <input type="text" class="form-control detail-filename validate[required]" name="picture_pic1url[<?= $key ?>]" id="picture_pic1url-<?= $key ?>" value="<?= $item[pic1url] ?>" placeholder="請選擇圖片" readonly>
                                                                        <input type="hidden" name="picture_pic1url_image_string[<?= $key ?>]" id="picture_pic1url_image_string-<?= $key ?>" value="">
                                                                        <span class="input-group-append">
                                                                            <button  type="button" class="btn btn-flat btn-brand" data-toggle="modal" data-target="#croppie_modal" data-width="300" data-height="300" data-source="#picture_pic1url-<?= $key ?>" data-result="#picture_pic1url_image_string-<?= $key ?>" data-preview="#picture_pic1url_preview-<?= $key ?>"><i class="fas fa-image"></i></button>
                                                                        </span>
                                                                    </div>
                                                                    <input type="text" name="picture_pic1alt[]" class="form-control mb-2" value="<?= $item[pic1alt] ?>" maxlength="100" placeholder="請輸入商品圖片說明">
                                                                </div>
                                                                <div class="col-md-1">
                                                                    <button type="button" class="btn btn-brand float-right picture_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <img style="max-width: 100%; height: auto;" id="picture_pic1url_preview-<?= $key ?>" src="<?= BASE_PATH . $item[pic1url] ?>" alt="<?= $item[pic1alt] ?>">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="row">
                                                                <div class="col-md-2">
                                                                    <label>情境圖片<br>
                                                                        <input type="hidden" id="picture_pic_srcs_image_string-<?= $key ?>" value="" data-picture_id="<?= $key ?>">
                                                                        <button  type="button" class="btn btn-flat btn-brand" data-toggle="modal" data-target="#croppie_modal" data-width="520" data-height="520" data-source="" data-result="#picture_pic_srcs_image_string-<?= $key ?>" data-preview="#picture_pic_srcs_preview"><i class="fas fa-image"></i></button>
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-10">
                                                                    <div class="row mb-2" id="picture_pic_srcs_preview_row-<?= $key ?>">
                                                                        <?php
                                                                        if (!empty($item["pic_srcs"])) {
                                                                            $picture_pic_srcs = explode(',', $item["pic_srcs"]);
                                                                            $picture_pic_alts = explode(',', $item["pic_alts"]);
                                                                            foreach ($picture_pic_srcs as $key1 => $pic) {
                                                                                ?>
                                                                                <div class='col-md-4 img-wrap'>
                                                                                    <input type="hidden" name="picture_pic_srcs_string[<?= $key ?>][]" value="<?= $pic ?>">
                                                                                    <input type='hidden' name='picture_pic_srcs_image_string[<?= $key ?>][]' value="">
                                                                                    <span class='close'>&times;</span>
                                                                                    <img style='max-width: 100%;' src="<?= BASE_PATH . $pic ?>">
                                                                                    <input type="text" name="picture_pic_alts[<?= $key ?>][]" class="form-control" value="<?= $picture_pic_alts[$key1] ?>" placeholder="請輸入情境圖片說明">
                                                                                </div>
                                                                                <?php
                                                                            }
                                                                        }
                                                                        ?>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="button" class="btn btn-warning float-left" onclick="javascript:location.href = 'template_list.php'">取消</button>
                                <button type="button" class="btn btn-success float-right submit_btn" onclick="validate_form_sumbit('#edit_form')">確定</button>
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

        $("#picture_ul").sortable();

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
    });

    function ajaxCallback(status, form, json, options) {
        if (status === true) {
            if (json.sResult == true)
                success_alert("商品修改<?= $sub_title ?>", "template_list.php");
            else
                error_alert(json.msg);
        } else {
            error_alert(json.msg);
        }
        $(".submit_btn").attr('disabled', false);
    }
    $("#picture_add_btn").click(function () {
        var max_picture_id = 0;
        $("#picture_ul li").each(function () {
            var pid = $(this).data("picture_id");
            if (pid > max_picture_id)
                max_picture_id = pid;
        })
        var key = max_picture_id + 1;

        var html = '<li style="cursor: pointer;" class="list-group-item" data-picture_id="' + key + '">' +
                '<div class="row">' +
                '<div class="col-md-6">' +
                '<div class="row">' +
                '<div class="col-md-11">' +
                '<div class="input-group mb-2">' +
                '<input type="text" class="form-control detail-filename validate[required]" name="picture_pic1url[' + key + ']" id="picture_pic1url-' + key + '" value="" placeholder="請選擇圖片" readonly>' +
                '<input type="hidden" name="picture_pic1url_image_string[' + key + ']" id="picture_pic1url_image_string-' + key + '" value="">' +
                '<span class="input-group-append">' +
                '<button  type="button" class="btn btn-flat btn-brand" data-toggle="modal" data-target="#croppie_modal" data-width="300" data-height="300" data-source="#picture_pic1url-' + key + '" data-result="#picture_pic1url_image_string-' + key + '" data-preview="#picture_pic1url_preview-' + key + '"><i class="fas fa-image"></i></button>' +
                '</span>' +
                '</div>' +
                '<input type="text" name="picture_pic1alt[]" class="form-control mb-2" value="" maxlength="100" placeholder="請輸入圖片說明">' +
                '</div>' +
                '<div class="col-md-1">' +
                '<button type="button" class="btn btn-brand float-right picture_delete_btn"><span class="fas fa-trash-alt"></span></button>' +
                '</div>' +
                '<div class="col-md-12">' +
                '<img style="max-width: 100%; height: auto;" id="picture_pic1url_preview-' + key + '" src="" alt="">' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="col-md-6">' +
                '<div class="row">' +
                '<div class="col-md-2">' +
                '<label>情境圖片<br>' +
                '<input type="hidden" id="picture_pic_srcs_image_string-' + key + '" value="" data-picture_id="' + key + '">' +
                '<button  type="button" class="btn btn-flat btn-brand" data-toggle="modal" data-target="#croppie_modal" data-width="520" data-height="520" data-source="" data-result="#picture_pic_srcs_image_string-' + key + '" data-preview="#picture_pic_srcs_preview"><i class="fas fa-image"></i></button>' +
                '</label>' +
                '</div>' +
                '<div class="col-md-10">' +
                '<div class="row mb-2" id="picture_pic_srcs_preview_row-' + key + '">' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</li>';

        $("#picture_ul").append(html);
    });

    $(document).off("change", "input[id*='picture_pic_srcs_image_string-']").on("change", "input[id*='picture_pic_srcs_image_string-']", function (e) {
        if ($(this).val() !== "")
        {
            var picture_id = $(this).data("picture_id");
            var html = "<div class='col-md-4 img-wrap'>" +
                    "<input type='hidden' name='picture_pic_srcs_string[" + picture_id + "][]' value='upload" + picture_id + "'>" +
                    "<input type='hidden' name='picture_pic_srcs_image_string[" + picture_id + "][]' value=" + $(this).val() + ">" +
                    "<span class='close'>&times;</span>" +
                    "<img style='max-width: 100%;' src=" + $(this).val() + ">" +
                    "<input type='text' name='picture_pic_alts[" + picture_id + "][]' class='form-control' value='' placeholder='請輸入情境圖片說明'>" +
                    "</div>";
            $("#picture_pic_srcs_preview_row-" + picture_id).append(html);
        }
    });

    $(document).off("click", ".picture_delete_btn").on("click", ".picture_delete_btn", function (e) {
        $(this).closest("li").remove();
    });

    $(document).off("click", ".close").on("click", ".close", function () {
        $(this).parent().remove();
    });
</script>
<?php require_once '_admin_foot.php'; ?>