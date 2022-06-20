<?php
require '_admin_head.php';

$recipepro_id = request_num('edit_id');

if ($recipepro_id == '')
    redir("recipepro_list.php");

$id = 0;
$name = "";
$pic_url = "";
$pic_alt = "";
$feature = "";
$tags = "";
$price = "";
$type = "";
$style = "";
$product_ids = "";
$material_weight = "";
$nutrition = '<div class="table-wrap p-tb20">' .
        '<table class="recipe-nutrition-box">' .
        '<tbody>' .
        '<tr>' .
        '<th>熱量(Kcal)</th>' .
        '<td>上稿</td>' .
        '<th>蛋白質(g)</th>' .
        '<td>上稿</td>' .
        '<th>脂肪(g)</th>' .
        '<td>上稿</td>' .
        '<th>碳水化合物(g)</th>' .
        '<td>上稿</td>' .
        '</tr>' .
        '<tr>' .
        '<th>鈣(mg)</th>' .
        '<td>上稿</td>' .
        '<th>鐵(mg)</th>' .
        '<td>上稿</td>' .
        '<th>維生素A(μg)</th>' .
        '<td>上稿</td>' .
        '<th>維生素E(mg)</th>' .
        '<td>上稿</td>' .
        '</tr>' .
        '<tr>' .
        '<th>維生素B1(mg)</th>' .
        '<td>上稿</td>' .
        '<th>維生素B2(mg)</th>' .
        '<td>上稿</td>' .
        '<th>維生素B6(mg)</th>' .
        '<td>上稿</td>' .
        '<th>維生素B12(mg)</th>' .
        '<td>上稿</td>' .
        '</tr>' .
        '<tr>' .
        '<th>維生素C(mg)</th>' .
        '<td>上稿</td>' .
        '<th>膽固醇(mg)</th>' .
        '<td>上稿</td>' .
        '<th>膳食纖維(g)</th>' .
        '<td>上稿</td>' .
        '<th>鹽分(g)</th>' .
        '<td>上稿</td>' .
        '</tr>' .
        '<tr>' .
        '<th>蔬菜攝取量(g)</th>' .
        '<td></td>' .
        '<th></th>' .
        '<td></td>' .
        '<th></th>' .
        '<td></td>' .
        '<th></th>' .
        '<td></td>' .
        '</tr>' .
        '</tbody>' .
        '</table>' .
        '</div>';
$member_only = 0;
$visitor = 0;
$list_order = 0;
$status = 0;
$remark = "";
$sub_title = '新增';

$row = null;
if ($recipepro_id != 0) {//0:新增，其他:修改
    $url = WEBAPI_RECIPEPRO . "/" . $recipepro_id;
    $resultMessage = "";
    $rows = null;
    $result = CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $rows);
    if ($result != 200 || count($rows) != 1)
        redir("recipepro_list.php");
    $row = $rows[0];
    if ($row) {
        $id = $row['id'];
        $name = $row['name'];
        $pic_url = $row['pic_url'];
        $pic_alt = $row['pic_alt'];
        $feature = $row['feature'];
        $tags = $row['tags'];
        $tags = explode(",", $tags);
        $price = $row['price'];
        $type = $row['type'];
        $style = $row['style'];
        $product_ids = $row['product_ids'];
        $product_ids = explode(",", $product_ids);
        $material_weight = $row['material_weight'];
        $nutrition = $row['nutrition'];
        $member_only = $row['member_only'];
        $visitor = $row['visitor'];
        $list_order = $row['list_order'];
        $status = $row['status'];
        $remark = $row['remark'];
        $sub_title = '編輯';
    }
}

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

//取得材料單位
$tags_buf = null;
$querystring = "category_id=4";
$url = WEBAPI_TAG . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $tags_buf) != 200)
    $tags_buf = null;
$unit_array = null;
foreach ($tags_buf as $item) {
    $unit_array[] = $item["name"];
}

//查詢專業食譜內容
$recipepro_details = null;
$url = WEBAPI_RECIPPRODETAIL . "/" . $recipepro_id;
if (CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $recipepro_details) != 200)
    $recipepro_details = null;
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>專業食譜
                            <small><?= $sub_title; ?></small>
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-12">
                    <form name="edit_form" id="edit_form" action="recipepro_edit_ajax.php" data-toggle="validator" role="form">
                        <input type="hidden" id="recipepro_id" name="recipepro_id" value="<?= $id ?>">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-2">
                                    <label for="name" class="col-md-1">名稱</label>
                                    <div class="col-md-11">
                                        <input type="text" id="name" name="name" class="form-control validate[required]" value="<?= $name ?>" maxlength="50">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="feature" class="col-md-1">特色</label>
                                    <div class="col-md-11">
                                        <input type="text" id="feature" name="feature" class="form-control" value="<?= $feature ?>" maxlength="500">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="pic_url" class="col-md-1">圖片</label>
                                    <div class="col-md-11">
                                        <div class="input-group">
                                            <input type="file" id="upload_image_btn" accept="image/*">
                                            <input type="hidden" id="upload_image_string" name="upload_image_string" value="">
                                            <input type="text" id="pic_url" name="pic_url" class="form-control" value="<?= $pic_url ?>" placeholder="建議尺寸750*570" readonly>
                                            <span class="input-group-append">
                                                <button  type="button" class="btn btn-flat btn-brand" id="pic_url_btn"><i class="fas fa-eye"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="file" class="col-md-1">圖片預覽</label>
                                    <div class="col-md-5">
                                        <img style="max-width: 500%; height: auto;" id="pic1_img" src="<?= BASE_PATH . $pic_url ?>" alt="">
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
                                    <label for="tags" class="col-md-1">食材</label>
                                    <div class="col-md-5">
                                        <select id="tags" name="tags[]" class="form-control validate[required] select2" multiple="multiple" data-placeholder="選擇標籤">
                                            <?php
                                            foreach ($food_array as $item) {
                                                $selected = in_array($item, $tags) ? 'selected="selected"' : '';
                                                ?>
                                                <option  value="<?= $item ?>"<?= $selected ?>><?= $item ?></option>
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
                                                <option  value="<?= $item ?>"<?= $selected ?>><?= $item ?></option>
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
                                                <option  value="<?= $item ?>"<?= $selected ?>><?= $item ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <label for="product_ids" class="col-md-1">商品</label>
                                    <div class="col-md-5">
                                        <select id="product_ids" name="product_ids[]" class="form-control validate[required] select2" multiple="multiple" data-placeholder="選擇商品">
                                            <?php
                                            foreach ($products as $item) {
                                                $selected = in_array($item["id"], $product_ids) ? 'selected="selected"' : '';
                                                ?>
                                                <option  value="<?= $item["id"] ?>"<?= $selected ?>><?= $item["name"] ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="price" class="col-md-1">參考價格</label>
                                    <div class="col-md-5">
                                        <input type="text" id="price" name="price" class="form-control validate[required]" value="<?= $price ?>" maxlength="500">
                                    </div>

                                    <label for="material_weight" class="col-md-1">材料份量</label>
                                    <div class="col-md-5">
                                        <input type="text" id="material_weight" name="material_weight" class="form-control validate[required]" value="<?= $material_weight ?>" maxlength="10">
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-1">
                                        <label class="col-md-12">材料</label>
                                        <button type="button" class="btn btn-brand float-right" id="food_add_btn"><span class="fas fa-plus"></span></button>
                                    </div>
                                    <div class="col-md-11">
                                        <ul>
                                            <li style="cursor: pointer;" class="list-group-item food-template" >
                                                <div class="food-detail_row">
                                                    <div class="row food-detail">
                                                        <div class="col-md-5">
                                                            <input type="text" name="food_names[][]" class="form-control mb-2 food_names validate[required]" value="" maxlength="500" placeholder="請輸入內容">
                                                        </div>
                                                        <div class="col-md-5">
                                                            <div class="input-group">
                                                                <input type="text" name="food_contents[][]" class="form-control mb-2 food_contents" value="" maxlength="500" placeholder="請輸入數量">
                                                                <div class="input-group-append">
                                                                    <button class="btn btn-default dropdown-toggle food-dropdown-btn mb-2" type="button" data-toggle="dropdown"></button>
                                                                    <div class="dropdown-menu">
                                                                        <?php foreach ($unit_array as $item) { ?>
                                                                            <a class="dropdown-item food-dropdown-item"><?= $item ?></a>
                                                                        <?php } ?>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <button type="button" class="btn btn-warning food_detail_add_btn"><span class="fas fa-plus"></span></button>
                                                            <button type="button" class="btn btn-warning float-right food_detail_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <button type="button" class="btn btn-danger float-right food_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul id="food_ul" class="no-padding">
                                            <?php
                                            $index = 1;
                                            foreach ($recipepro_details as $recipepro_detail) {
                                                if ($recipepro_detail["class"] == 1) {
                                                    ?>
                                                    <li style="cursor: pointer;" class="list-group-item">
                                                        <div class="food-detail_row">
                                                            <?php
                                                            $names_array = explode(",", $recipepro_detail["names"]);
                                                            $contents_array = explode(",", $recipepro_detail["contents"]);
                                                            for ($i = 0; $i < count($names_array); $i++) {
                                                                ?>
                                                                <div class="row food-detail">
                                                                    <div class="col-md-5">
                                                                        <input type="text" name="food_names[<?= $index ?>][]" class="form-control mb-2 food_names validate[required]" value="<?= $names_array[$i] ?>" maxlength="500" placeholder="請輸入內容">
                                                                    </div>
                                                                    <div class="col-md-5">
                                                                        <div class="input-group">
                                                                            <input type="text" name="food_contents[<?= $index ?>][]" class="form-control mb-2 food_contents" value="<?= $contents_array[$i] ?>" maxlength="500" placeholder="請輸入數量">
                                                                            <div class="input-group-append">
                                                                                <button class="btn btn-default dropdown-toggle food-dropdown-btn mb-2" type="button" data-toggle="dropdown"></button>
                                                                                <div class="dropdown-menu">
                                                                                    <?php foreach ($unit_array as $item) { ?>
                                                                                        <a class="dropdown-item food-dropdown-item"><?= $item ?></a>
                                                                                    <?php } ?>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <button type="button" class="btn btn-warning food_detail_add_btn"><span class="fas fa-plus"></span></button>
                                                                        <button type="button" class="btn btn-warning float-right food_detail_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                                    </div>
                                                                </div>
                                                                <?php
                                                            }
                                                            $index++;
                                                            ?>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <button type="button" class="btn btn-danger float-right food_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <?php
                                                }
                                            }
                                            ?>
                                        </ul>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-1">
                                        <label class="col-md-12">調味料</label>
                                        <button type="button" class="btn btn-brand float-right" id="sauce_add_btn"><span class="fas fa-plus"></span></button>
                                    </div>
                                    <div class="col-md-11">
                                        <ul>
                                            <li style="cursor: pointer;" class="list-group-item sauce-list-group-item sauce-template" >
                                                <div class="sauce-detail_row">
                                                    <div class="row sauce-detail">
                                                        <div class="col-md-3">
                                                            <input type="text" name="sauce_names[][]" class="form-control mb-2 sauce_names validate[required]" value="" maxlength="500" placeholder="請輸入內容">
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="input-group">
                                                                <input type="text" name="sauce_contents[][]" class="form-control mb-2 sauce_contents" value="" maxlength="500">
                                                                <div class="input-group-append">
                                                                    <button class="btn btn-default dropdown-toggle sauce-dropdown-btn mb-2" type="button" data-toggle="dropdown"></button>
                                                                    <div class="dropdown-menu">
                                                                        <?php foreach ($unit_array as $item) { ?>
                                                                            <a class="dropdown-item sauce-dropdown-item"><?= $item ?></a>
                                                                        <?php } ?>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <input type="text" name="sauce_links[][]" class="form-control sauce_links" value="" placeholder="請輸入連結位址">
                                                        </div>
                                                        <div class="col-md-2">
                                                            <select name="sauce_blanks[][]" class="form-control sauce_blanks">
                                                                <option  value="0">不另開視窗</option>
                                                                <option  value="1">另開視窗</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <button type="button" class="btn btn-warning sauce_detail_add_btn"><span class="fas fa-plus"></span></button>
                                                            <button type="button" class="btn btn-warning float-right sauce_detail_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <button type="button" class="btn btn-danger float-right sauce_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul id="sauce_ul" class="no-padding">
                                            <?php
                                            $index = 1;
                                            foreach ($recipepro_details as $recipepro_detail) {
                                                if ($recipepro_detail["class"] == 2) {
                                                    ?>
                                                    <li style="cursor: pointer;" class="list-group-item sauce-list-group-item">
                                                        <div class="sauce-detail_row">
                                                            <?php
                                                            $names_array = explode(",", $recipepro_detail["names"]);
                                                            $contents_array = explode(",", $recipepro_detail["contents"]);
                                                            $link_array = explode(",", $recipepro_detail["links"]);
                                                            $blank_array = explode(",", $recipepro_detail["blanks"]);
                                                            for ($i = 0; $i < count($names_array); $i++) {
                                                                ?>
                                                                <div class="row sauce-detail">
                                                                    <div class="col-md-3">
                                                                        <input type="text" name="sauce_names[<?= $index ?>][]" class="form-control mb-2 sauce_names validate[required]" value="<?= $names_array[$i] ?>" maxlength="500" placeholder="請輸入內容">
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <div class="input-group">
                                                                            <input type="text" name="sauce_contents[<?= $index ?>][]" class="form-control mb-2 sauce_contents" value="<?= $contents_array[$i] ?>" maxlength="500">
                                                                            <div class="input-group-append">
                                                                                <button class="btn btn-default dropdown-toggle sauce-dropdown-btn mb-2" type="button" data-toggle="dropdown"></button>
                                                                                <div class="dropdown-menu">
                                                                                    <?php foreach ($unit_array as $item) { ?>
                                                                                        <a class="dropdown-item sauce-dropdown-item"><?= $item ?></a>
                                                                                    <?php } ?>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <input type="text" name="sauce_links[<?= $index ?>][]" class="form-control sauce_links" value="<?= $link_array[$i] ?>" placeholder="請輸入連結位址">
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <select name="sauce_blanks[<?= $index ?>][]" class="form-control sauce_blanks">
                                                                            <option  value="0" <?= ($blank_array[$i] == 0) ? 'selected="selected"' : ''; ?>>不另開視窗</option>
                                                                            <option  value="1" <?= ($blank_array[$i] == 1) ? 'selected="selected"' : ''; ?>>另開視窗</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <button type="button" class="btn btn-warning sauce_detail_add_btn"><span class="fas fa-plus"></span></button>
                                                                        <button type="button" class="btn btn-warning float-right sauce_detail_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                                    </div>
                                                                </div>

                                                                <?php
                                                            }
                                                            $index++;
                                                            ?>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <button type="button" class="btn btn-danger float-right sauce_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <?php
                                                }
                                            }
                                            ?>
                                        </ul>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-1">
                                        <label class="col-md-12">料理方法</label>
                                        <button type="button" class="btn btn-brand float-right" id="step_add_btn"><span class="fas fa-plus"></span></button>
                                    </div>
                                    <div class="col-md-11">
                                        <ul>
                                            <li style="cursor: pointer;" class="list-group-item step-template" >
                                                <div class="step-detail_row">
                                                    <div class="row step-detail">
                                                        <div class="col-md-8">
                                                            <input type="text" name="step_names[]" class="form-control mb-2 step_names validate[required]" value="" maxlength="500" placeholder="請輸入內容">
                                                        </div>
                                                        <div class="col-md-2">
                                                            <select name="step_blanks[]" class="form-control step_blanks">
                                                                <option  value="0">不顯示編號</option>
                                                                <option  value="1" selected="selected">顯示編號</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <button type="button" class="btn btn-danger float-right step_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul id="step_ul" class="no-padding">
                                            <?php
                                            $index = 1;
                                            foreach ($recipepro_details as $recipepro_detail) {
                                                if ($recipepro_detail["class"] == 3) {
                                                    ?>
                                                    <li style="cursor: pointer;" class="list-group-item">
                                                        <div class="step-detail_row">
                                                            <?php
                                                            $names_array = explode(",", $recipepro_detail["names"]);
                                                            $contents_array = explode(",", $recipepro_detail["contents"]);
                                                            $blank_array = explode(",", $recipepro_detail["blanks"]);
                                                            for ($i = 0; $i < count($names_array); $i++) {
                                                                ?>
                                                                <div class="row step-detail">
                                                                    <div class="col-md-8">
                                                                        <input type="text" name="step_names[<?= $index ?>]" class="form-control mb-2 step_names validate[required]" value="<?= $names_array[$i] ?>" maxlength="500" placeholder="請輸入內容">
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <select name="step_blanks[<?= $index ?>]" class="form-control step_blanks">
                                                                            <option  value="0" <?= ($blank_array[$i] == 0) ? 'selected="selected"' : ''; ?>>不顯示編號</option>
                                                                            <option  value="1" <?= ($blank_array[$i] == 1) ? 'selected="selected"' : ''; ?>>顯示編號</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <?php
                                                            }
                                                            $index++;
                                                            ?>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <button type="button" class="btn btn-danger float-right step_delete_btn"><span class="fas fa-trash-alt"></span></button>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <?php
                                                }
                                            }
                                            ?>
                                        </ul>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="nutrition" class="col-md-1">營養成份</label>
                                    <div class="col-md-11 inner">
                                        <textarea id="nutrition" name="nutrition" class="form-control ckeditor" rows="3"><?= $nutrition ?></textarea>
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
                                <button type="button" class="btn btn-warning float-left" onclick="javascript:location.href='recipepro_list.php'">取消</button>
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
<?php
echo "var unit_array = " . json_encode($unit_array) . ";\n";
?>
    $(document).ready(function(){
        $("#upload_image_btn").hide();

        $(".food-template").hide();
        $(".sauce-template").hide();
        $(".step-template").hide();

        $("#food_ul").sortable();
        $("#sauce_ul").sortable();
        $("#step_ul").sortable();

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

    $(document).off("click","#food_add_btn").on("click","#food_add_btn",function(e){
        var clone=$(".food-template").clone(true);
        clone.removeClass("food-template");
        clone.show();
        $("#food_ul").append(clone);

        $("#food_ul .food-detail_row").each(function(index){
            $(this).find(".food_names").prop("name","food_names["+index+"][]");
            $(this).find(".food_contents").prop("name","food_contents["+index+"][]");
        });
    });

    $(document).off("click",".food_delete_btn").on("click",".food_delete_btn",function(e){
        $(this).closest("li").remove();
    });

    $(document).off("click",".food_detail_add_btn").on("click",".food_detail_add_btn",function(e){
        var clone=$(this).closest(".food-detail_row").children(".food-detail").first().clone(true);
        clone.find("input").val("");
        clone.show();
        var parent=$(this).closest(".food-detail_row");
        parent.append(clone);
    });


    $(document).off("click",".food_detail_delete_btn").on("click",".food_detail_delete_btn",function(e){
        var li=$(this).closest("li");
        $(this).closest(".food-detail").remove();
        if(li.has(".food-detail").length===0)
            li.remove();
    });

    $(document).off("click","#sauce_add_btn").on("click","#sauce_add_btn",function(e){
        var clone=$(".sauce-template").clone(true);
        clone.removeClass("sauce-template");
        clone.show();
        $("#sauce_ul").append(clone);

        $("#sauce_ul .sauce-detail_row").each(function(index){
            $(this).find(".sauce_names").prop("name","sauce_names["+index+"][]");
            $(this).find(".sauce_contents").prop("name","sauce_contents["+index+"][]");
            $(this).find(".sauce_links").prop("name","sauce_links["+index+"][]");
            $(this).find(".sauce_blanks").prop("name","sauce_blanks["+index+"][]");
        });
    });

    $(document).off("click",".sauce_delete_btn").on("click",".sauce_delete_btn",function(e){
        $(this).closest("li").remove();
    });

    $(document).off("click",".sauce_detail_add_btn").on("click",".sauce_detail_add_btn",function(e){
        var clone=$(this).closest(".sauce-detail_row").children(".sauce-detail").first().clone(true);
        clone.find("input").val("");
        clone.show();
        var parent=$(this).closest(".sauce-detail_row");
        parent.append(clone);
    });

    $(document).off("click",".sauce_detail_delete_btn").on("click",".sauce_detail_delete_btn",function(e){
        var li=$(this).closest("li");
        $(this).closest(".sauce-detail").remove();
        if(li.has(".sauce-detail").length===0)
            li.remove();
    });

    $(document).off("click","#step_add_btn").on("click","#step_add_btn",function(e){
        var clone=$(".step-template").clone(true);
        clone.removeClass("step-template");
        clone.show();
        $("#step_ul").append(clone);

        $("#step_ul .step-detail_row").each(function(index){
            $(this).find(".step_names").prop("name","step_names["+index+"]");
            $(this).find(".step_blanks").prop("name","step_blanks["+index+"]");
        });
    });

    $(document).off("click",".step_delete_btn").on("click",".step_delete_btn",function(e){
        $(this).closest("li").remove();
    });

    $("#food_ul").on("sortstop",function(event,ui){
        $("#food_ul .food-detail_row").each(function(index){
            $(this).find(".food_names").prop("name","food_names["+index+"][]");
            $(this).find(".food_contents").prop("name","food_contents["+index+"][]");
        });
    });

    $("#sauce_ul").on("sortstop",function(event,ui){
        $("#sauce_ul .sauce-detail_row").each(function(index){
            $(this).find(".sauce_names").prop("name","sauce_names["+index+"][]");
            $(this).find(".sauce_contents").prop("name","sauce_contents["+index+"][]");
            $(this).find(".sauce_links").prop("name","sauce_links["+index+"][]");
            $(this).find(".sauce_blanks").prop("name","sauce_blanks["+index+"][]");
        });
    });

    $("#step_ul").on("sortstop",function(event,ui){
        $("#step_ul .step-detail_row").each(function(index){
            $(this).find(".step_names").prop("name","step_names["+index+"]");
            $(this).find(".step_blanks").prop("name","step_blanks["+index+"]");
        });
    });

    $(".food-dropdown-btn").click(function(){
        $(".food-list-group-item").css("z-index","2");
        $(this).closest("li").css("z-index","5");
    });

    $(".food-dropdown-item").click(function(){
        var content_input=$(this).closest(".input-group").children("input[name*='food_contents']");
        var text=$(this).text();
        if(content_input)
        {
            var value=content_input.val();

            for(i=0;i<unit_array.length;i++){
                var element=unit_array[i];
                var end=value.substr(value.length-(element.length),element.length);
                if(end===element)
                {
                    value=value.substr(0,value.length-(element.length));
                    break;
                }
            }
            content_input.val(value+text);
        }
    });


    $(".sauce-dropdown-btn").click(function(){
        $(".sauce-list-group-item").css("z-index","2");
        $(this).closest("li").css("z-index","5");
    });

    $(".sauce-dropdown-item").click(function(){
        var content_input=$(this).closest(".input-group").children("input[name*='sauce_contents']");
        var text=$(this).text();
        if(content_input)
        {
            var value=content_input.val();

            for(i=0;i<unit_array.length;i++){
                var element=unit_array[i];
                var end=value.substr(value.length-(element.length),element.length);
                if(end===element)
                {
                    value=value.substr(0,value.length-(element.length));
                    break;
                }
            }
            content_input.val(value+text);
        }
    });

    function ajaxCallback(status,form,json,options){
        if(status===true){
            if(json.sResult==true)
                success_alert("專業食譜<?= $sub_title ?>","recipepro_list.php");
            else
                error_alert(json.msg);
        }else{
            error_alert(json.msg);
        }
    }

    function ClearUploadField(){
        $("#pic1url").val("");
        $("#pic1_fileInfo").text("");
        $('#upload_image_string').val("");
    }
</script>
<?php require_once '_admin_foot.php'; ?>