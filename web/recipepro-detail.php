<?PHP
require_once '_head.php';

$recipepro_id = request_num("id");
if (empty($recipepro_id) || $recipepro_id == 0)
    redir("recipepro.php");

//查詢專業食譜
$url = WEBAPI_RECIPEPRO . "/" . $recipepro_id;
$recipepros = null;
if (CallAPI('GET', $url, null, null, $resultMessage, $recipepros) != 200)
    redir("recipepro.php");

if (count($recipepros) != 1)
    redir("recipepro.php");

$recipepro = $recipepros[0];
//檢查會員登入
if ($recipepro["member_only"] == true && IsMemberLogin() == false)
    redir("recipepro.php");

//查詢專業食譜詳細
$url = WEBAPI_RECIPPRODETAIL . "/" . $recipepro_id;
$recipepro_details = null;
if (CallAPI('GET', $url, null, null, $resultMessage, $recipepro_details) != 200)
    redir("recipepro.php");

//查詢相關商品食譜
$product_ids = $recipepro['product_ids'];
$product_ids = explode(",", $product_ids);
$product_recipepros = null;
$querystring = "";
foreach ($product_ids as $item) {
    if ($querystring == "")
        $querystring = "FIND_IN_SET(" . $item . ",product_ids)";
}
$url = WEBAPI_RECIPEPRO . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $product_recipepros) != 200)
    $product_recipepros = null;

foreach ($product_recipepros as $key => $item) {
    if ($item["id"] == $recipepro["id"])
        unset($product_recipepros[$key]);
}
shuffle($product_recipepros);

//查詢使用商品
$querystring = "";
foreach ($product_ids as $item) {
    if ($querystring == "")
        $querystring = "id = '" . $item . "'";
    else
        $querystring .= " or id = '" . $item . "'";
}
$products = null;
$url = WEBAPI_PRODUCT . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $products) != 200)
    $products = null;


//查詢相同菜式食譜
$style_recipepros = null;
$querystring = "style='" . $recipepro["style"] . "'";
$url = WEBAPI_RECIPEPRO . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $style_recipepros) != 200)
    $style_recipepros = null;

foreach ($style_recipepros as $key => $item) {
    if ($item["id"] == $recipepro["id"])
        unset($style_recipepros[$key]);
}
shuffle($style_recipepros);

//檢查我的最愛
$like_flag = false;
if (IsMemberLogin() == true) {
    //查詢專業食譜
    $url = WEBAPI_MEMBER_LOGINMEMBERRECIPEPRO . "?query=" . urlencode("id=" . $recipepro_id);
    $like_recipepros = null;
    if (CallAPI('GET', $url, $_SESSION["MEMBER_ACCESSTOKEN"], null, $resultMessage, $like_recipepros) != 200)
        $like_recipepros = null;
    if (count($like_recipepros) == 1)
        $like_flag = true;
}

//增加瀏覽人數
$servertoken = WebServerLogin(API_ACCOUNT, API_PASSWORD);
$url = WEBAPI_RECIPEPRO_ADDVISITOR . "/" . $recipepro["id"];
CallAPI('PUT', $url, $servertoken, null, $resultMessage, $resultData);
WebServerLogout($servertoken);
?>
<?php include_once '_header.php'; ?>

<section class="recipeproDetail-page content">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item"><a href="recipepro.php">專業食譜</a></li>
                <li class="breadcrumb-item active" aria-current="page"><?= $recipepro["name"] ?></li>
            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="RECIPES">專業食譜</h2>
        </div>
    </div>

    <div class="inner">
        <div class="bg-Light">
            <div class="container">
                <div class="recipepro-block p-tb50 row justify-content-center">
                    <div class="left-box col-lg-8 col-12">
                        <div class="recipe-title">
                            <h3 class="subheader"><?= $recipepro["name"] ?></h3>
                            <div class="icon-group m-l20">
                                <?php if (IsMemberLogin() == false) { ?>
                                    <a class="icon-dislike" href="javascript: login_member_first()"><i class="fab fa-gratipay"></i></a>
                                <?php } else if ($like_flag == true) { ?>
                                    <a class="icon-like" href="javascript:void(0)" data-source="recipepro" data-id="<?= $recipepro["id"] ?>"><i class="fab fa-gratipay"></i></a>
                                <?php } else { ?>
                                    <a class="icon-dislike" href="javascript:void(0)" data-source="recipepro" data-id="<?= $recipepro["id"] ?>"><i class="fab fa-gratipay"></i></a>
                                <?php } ?>
                                <a class="icon-print" href="javascript:window.print()"><i class="fas fa-print"></i></a>
                            </div>
                        </div>
                        <p class="description text-wrap"><?= $recipepro["feature"] ?></p>
                        <div class="img-box">
                            <?php if ($recipepro["member_only"] == true) { ?>
                                <div class="member-icon">
                                    <span>會員限定</span>
                                </div>
                            <?php } ?>
                            <img src="<?= BASE_PATH . $recipepro["pic_url"] ?>" alt="<?= $recipepro["pic_alt"] ?>">
                        </div>
                    </div>
                    <div class="right-box col-lg-4 col-12">
                        <h4 class="third-title"><img src="img/recipe.svg" />相關調味料食譜</h4>
                        <?php
                        foreach ($product_recipepros as $key => $item) {
                            if ($key < 5) {
                                ?>
                                <div class="list-box recipe-box">
                                    <a href="javascript: goto_recipepro_detail(<?= $item["id"] ?>,<?= $item["member_only"] ?>)">
                                        <div class="img-box">
                                            <img src="<?= BASE_PATH . $item["pic_url"] ?>" alt="<?= $item["pic_alt"] ?>">
                                        </div>
                                        <div class="text-box">
                                            <?php if ($item["member_only"] == true) { ?>
                                                <span class="member-icon">會員限定</span>
                                            <?php } ?>
                                            <span class="title"><?= $item["name"] ?></span>
                                        </div>
                                    </a>
                                </div>
                                <?php
                            }
                        }
                        ?>
                    </div>
                    <div class="type-box p-t30 col-12">
                        <ul>
                            <?php if (false) { ?>
                                <li>
                                    <span class="tag">參考<br />價格</span>
                                    <p>
                                        <span class="primary-red"><?= $recipepro["price"] ?></span>
                                        <span>(1人份)</span>
                                    </p>
                                </li>
                            <?php } ?>
                            <li>
                                <span class="tag">菜色<br />類型</span>
                                <span><?= $recipepro["type"] ?></span>
                            </li>
                            <li>
                                <span class="tag">菜式<br />類型</span>
                                <span><?= $recipepro["style"] ?></span>
                            </li>
                            <li>
                                <span class="tag">使用<br />商品</span>
                                <?php
                                foreach ($products as $item) {
                                    $pic_url_array = explode(',', $item["pic_urls"]);
                                    $pic_alt_array = explode(',', $item["pic_alts"]);
                                    ?>
                                    <div class="good-box">
                                        <a href="product-detail.php?id=<?= $item["id"] ?>">
                                            <img src="<?= BASE_PATH . $pic_url_array[0] ?>" alt="<?= $pic_alt_array[0] ?>">
                                        </a>
                                    </div>
                                <?php } ?>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="recipepro-info-block m-tb50">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="method-box col-md-4 col-12">
                        <h4 class="third-title"><img src="img/food.svg">材料<span>(<?= $recipepro["material_weight"] ?>)</span></h4>
                        <ul>
                            <?php
                            $group_index = 0;
                            foreach ($recipepro_details as $item) {
                                if ($item["class"] == 1) {
                                    $name_array = explode(',', $item["names"]);
                                    $content_array = explode(',', $item["contents"]);
                                    if (count($name_array) == 1) {
                                        ?>
                                        <li class="d-flex justify-content-between none-num">
                                            <span><?= $item["names"] ?></span>
                                            <span><?= $item["contents"] ?></span>
                                        </li>
                                    <?php } else {
                                        ?>
                                        <li class = "sec-method">
                                            <span class = "group-num"><?= chr(ord("A") + $group_index) ?></span>
                                            <ul>
                                                <?php
                                                foreach ($name_array as $key => $name) {
                                                    $content = $content_array[$key];
                                                    ?>

                                                    <li class = "d-flex justify-content-between">
                                                        <span><?= $name ?></span>
                                                        <span><?= $content ?></span>
                                                    </li>
                                                    <?php
                                                }
                                                $group_index += 1;
                                                ?>
                                            </ul>
                                        </li>
                                        <?php
                                    }
                                }
                            }
                            ?>
                        </ul>
                    </div>
                    <div class="method-box col-md-4 col-12">
                        <h4 class="third-title"><img src="img/condiment.svg">調味料</h4>
                        <ul>
                            <?php
                            $group_index = 0;
                            foreach ($recipepro_details as $item) {
                                if ($item["class"] == 2) {
                                    $name_array = explode(',', $item["names"]);
                                    $content_array = explode(',', $item["contents"]);
                                    $link_array = explode(',', $item["links"]);
                                    $blank_array = explode(',', $item["blanks"]);
                                    if (count($name_array) == 1) {
                                        if (!empty($link_array[0])) {
                                            ?>
                                            <li>
                                                <a class = "d-flex justify-content-between" href="<?= $link_array[0] ?>" <?= ($blank_array[0] == true) ? "target='_blank'" : "" ?>>
                                                    <span><?= $name_array[0] ?><i class = "fas fa-external-link-alt" style = "padding-left:5px"></i></span>
                                                    <span><?= $content_array[0] ?></span>
                                                </a>
                                            </li>
                                        <?php } else { ?>
                                            <li class = "d-flex justify-content-between">
                                                <span><?= $name_array[0] ?></span>
                                                <span><?= $content_array[0] ?></span>
                                            </li>
                                            <?php
                                        }
                                    } else {
                                        ?>
                                        <li class = "sec-method">
                                            <span class = "group-num"><?= chr(ord("A") + $group_index) ?></span>
                                            <ul>
                                                <?php
                                                foreach ($name_array as $key => $name) {
                                                    $content = $content_array[$key];
                                                    $link = $link_array[$key];
                                                    $blank = $blank_array[$key];
                                                    ?>

                                                    <?php if (!empty($link)) { ?>
                                                        <li>
                                                            <a class = "d-flex justify-content-between" href="<?= $link ?>" <?= ($blank == true) ? "target='_blank'" : "" ?>>
                                                                <span><?= $name ?><i class = "fas fa-external-link-alt" style = "padding-left:5px"></i></span>
                                                                <span><?= $content ?></span>
                                                            </a>
                                                        </li>
                                                    <?php } else { ?>
                                                        <li class = "d-flex justify-content-between">
                                                            <span><?= $name ?></span>
                                                            <span><?= $content ?></span>
                                                        </li>
                                                    <?php } ?>

                                                    <?php
                                                }
                                                $group_index += 1;
                                                ?>
                                            </ul>
                                        </li>
                                        <?php
                                    }
                                }
                            }
                            ?>
                        </ul>
                    </div>
                    <div class="method-box col-md-4 col-12">
                        <h4 class="third-title"><img src="img/spatula.svg">料理方法</h4>
                        <ol>
                            <?php
                            $group_index = 0;
                            foreach ($recipepro_details as $key => $item) {
                                if ($item["class"] == 3) {
                                    ?>
                                    <?php
                                    if ($item["blanks"] == true) {
                                        $group_index += 1;
                                        ?>
                                        <li>
                                            <span class="group-num"><?= $group_index ?></span>
                                            <p><?= $item["names"] ?></p>
                                        </li>
                                    <?php } else { ?>
                                        <li>
                                            <p><?= $item["names"] ?></p>
                                        </li>
                                    <?php } ?>
                                    <?php
                                }
                            }
                            ?>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="nutrition-block m-tb50">
            <div class="container">
                <h4 class="third-title"><img src="img/rating.svg">營養成分（1 人份）</h4>
                <?= $recipepro["nutrition"] ?>
                <p><i class="far fa-arrow-alt-circle-left"></i> 往左滑看更多資訊</p>
            </div>
        </div>

        <?php if (!empty($style_recipepros)) { ?>
            <div class="refer-recipe m-t20 m-b80">
                <div class="container">
                    <h4 class="third-title"><img src="img/book.svg">相關食譜</h4>
                    <div class="row justify-content-center m-t20">
                        <?php
                        foreach ($style_recipepros as $key => $item) {
                            if ($key < 3) {
                                ?>
                                <div class="refer-box">
                                    <?php if ($item["member_only"] == true) { ?>
                                        <div class="member-icon small-tag">
                                            <span>會員限定</span>
                                        </div>
                                    <?php } ?>
                                    <a class="refer-hover" href="javascript: goto_recipepro_detail(<?= $item["id"] ?>,<?= $item["member_only"] ?>)">
                                        <div class="refer-txt">
                                            <h5><?= $item["name"] ?></h5>
                                            <span class="primary-btn gobtn" href="javascript: goto_recipepro_detail(<?= $item["id"] ?>,<?= $item["member_only"] ?>)">詳細食譜</span>
                                        </div>
                                        <img src="<?= BASE_PATH . $item["pic_url"] ?>" alt="<?= $item["pic_alt"] ?>">
                                    </a>
                                </div>
                                <?php
                            }
                        }
                        ?>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
</section>

<?php include_once '_footer.php'; ?>
<?php require_once "_post_js.php"; ?>
<script>
</script>
<?php require_once '_foot.php'; ?>