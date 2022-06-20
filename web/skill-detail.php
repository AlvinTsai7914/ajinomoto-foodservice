<?PHP
require_once '_head.php';


$higi_id = request_num("id");
if (empty($higi_id) || $higi_id == 0)
    redir("skill.php");

//查詢招客秘笈
$url = WEBAPI_HIGI . "/" . $higi_id;
$higis = null;
if (CallAPI('GET', $url, null, null, $resultMessage, $higis) != 200)
    redir("skill.php");

if (count($higis) != 1)
    redir("skill.php");

$higi = $higis[0];
$pic_url_array = explode(',', $higi["pic_url"]);
$pic_alt_array = explode(',', $higi["pic_alt"]);
$product_pic_url_array = explode(',', $higi["product_pic_urls"]);
$product_pic_alt_array = explode(',', $higi["product_pic_alts"]);

$method_array = null;
if (!empty($higi["methods"]))
    $method_array = explode(',', $higi["methods"]);

//檢查會員登入
if ($higi["member_only"] == true && IsMemberLogin() == false)
    redir("skill.php");

//查詢相關招客秘笈
$product_higis = null;
$querystring = "product_id=" . $higi["product_id"];
$url = WEBAPI_HIGI . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $product_higis) != 200)
    $product_higis = null;

foreach ($product_higis as $key => $item) {
    if ($item["id"] == $higi["id"])
        unset($product_higis[$key]);
}
shuffle($product_higis);


//檢查我的最愛
$like_flag = false;
if (IsMemberLogin() == true) {
    //查詢招客秘笈
    $url = WEBAPI_MEMBER_LOGINMEMBERHIGI . "?query=" . urlencode("id=" . $higi_id);
    $like_higis = null;
    if (CallAPI('GET', $url, $_SESSION["MEMBER_ACCESSTOKEN"], null, $resultMessage, $like_higis) != 200)
        $like_higis = null;
    if (count($like_higis) == 1)
        $like_flag = true;
}

//增加瀏覽人數
$servertoken = WebServerLogin(API_ACCOUNT, API_PASSWORD);
$url = WEBAPI_HIGI_ADDVISITOR . "/" . $higi["id"];
CallAPI('PUT', $url, $servertoken, null, $resultMessage, $resultData);
WebServerLogout($servertoken);
?>
<?php include_once '_header.php'; ?>

<section class="higiDetail-page content">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item"><a href="skill.php">招客秘笈</a></li>
                <li class="breadcrumb-item active" aria-current="page"><?= $higi["name"] ?></li>
            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="SKILL">招客秘笈</h2>
        </div>
    </div>
    <div class="inner">
        <div class="higidetail-block bg-Light p-b50">
            <div class="container">
                <h3 class="subheader p-t50"><?= $higi["name"] ?>
                    <div class="icon-group">
                        <?php if (IsMemberLogin() == false) { ?>
                            <a class="icon-dislike" href="javascript: login_member_first()"><i class="fab fa-gratipay"></i></a>
                        <?php } else if ($like_flag == true) { ?>
                            <a class="icon-like" href="javascript:void(0)" data-source="higi" data-id="<?= $higi["id"] ?>"><i class="fab fa-gratipay"></i></a>
                        <?php } else { ?>
                            <a class="icon-dislike" href="javascript:void(0)" data-source="higi" data-id="<?= $higi["id"] ?>"><i class="fab fa-gratipay"></i></a>
                        <?php } ?>
                        <a class="icon-print" href="javascript:window.print()"><i class="fas fa-print"></i></a>
                    </div>
                </h3>
                <div class="row justify-content-center m-b40">
                    <div class="col-lg-6 col-md-8 col-12 left-box">
                        <div class="swiper-container skillSlide">
                            <div class="swiper-wrapper">
                                <?php foreach ($pic_url_array as $key => $item) { ?>
                                    <div class="swiper-slide">
                                        <img src="<?= BASE_PATH . $item ?>" alt="<?= $pic_alt_array[$key] ?>">
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="swiper-container productSlide-thumb">
                            <div class="swiper-wrapper">
                                <?php foreach ($pic_url_array as $key => $item) { ?>
                                    <div class="swiper-slide" style="cursor: pointer">
                                        <img src="<?= BASE_PATH . $item ?>" alt="<?= $pic_alt_array[$key] ?>">
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-8 col-12 right-box">
                        <div class="text-box m-b50">
                            <h4><?= $higi["content"] ?></h4>
                            <span><?= $higi["description"] ?></span>
                        </div>

                        <div class="d-flex m-b50">
                            <?php if (!empty($higi["recipepro_id"])) { ?>
                                <div class="dish-box">
                                    <h4 class="third-title">
                                        <img src="img/recipe.svg" />相關料理
                                    </h4>
                                    <div class="img-box">
                                        <a href="javascript: goto_recipepro_detail(<?= $higi["recipepro_id"] ?>,<?= $higi["recipepro_member_only"] ?>)">
                                            <?php if ($higi["recipepro_member_only"] == true) { ?>
                                                <div class="member-icon small-tag">
                                                    <span>會員限定</span>
                                                </div>
                                            <?php } ?>
                                            <img src="<?= BASE_PATH . $higi["recipepro_pic_url"] ?>" alt="<?= $higi["recipepro_pic_alt"] ?>">
                                        </a>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if (!empty($higi["product_id"])) { ?>
                                <div class="product-box">
                                    <h4 class="third-title">
                                        <img src="img/condiment.svg" />使用商品
                                    </h4>
                                    <div class="img-box">
                                        <a href="product-detail.php?id=<?= $higi["product_id"] ?>">
                                            <img src="<?= BASE_PATH . $product_pic_url_array[0] ?>" alt="<?= $product_pic_alt_array[0] ?>">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>

                        <div class="method-box">
                            <?php if (!empty($method_array)) { ?>
                                <h4 class="third-title">
                                    <img src="img/spatula.svg" />烹調方式
                                </h4>
                                <ul>
                                    <?php
                                    foreach ($method_array as $item) {
                                        if ($item != "") {
                                            ?>
                                            <li><?= $item ?></li>
                                            <?php
                                        }
                                    }
                                    ?>
                                </ul>
                            <?php } ?>
                            <?php if (!empty($higi["note"])) { ?>
                                <h4 class="third-title">
                                    <img src="img/note.svg" />小筆記
                                </h4>
                                <ul>
                                    <li><img src="<?= BASE_PATH . $higi["note_pic_url"] ?>" alt="<?= $higi["note_pic_alt"] ?>"><?= $higi["note"] ?></li>
                                </ul>
                            <?php } ?>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <?php if (!empty($product_higis)) { ?>
            <div class="higi-display p-tb50">
                <div class="container">
                    <h4 class="third-title">相關秘笈</h4>
                    <div class="row m-t30">
                        <?php
                        foreach ($product_higis as $key => $item) {
                            if ($key < 2) {
                                $product_pic_url_array = explode(',', $item["product_pic_urls"]);
                                $product_pic_alt_array = explode(',', $item["product_pic_alts"]);
                                ?>
                                <div class="list-box col-lg-6 col-12">
                                    <a href="javascript: goto_higi_detail(<?= $item["id"] ?>,<?= $item["member_only"] ?>)">
                                        <div class="img-box">
                                            <?php if ($item["member_only"] == true) { ?>
                                                <div class="member-icon small-tag">
                                                    <span>會員限定</span>
                                                </div>
                                            <?php } ?>
                                            <img src="<?= BASE_PATH . $item["pic_url"] ?>" alt="<?= $item["pic_alt"] ?>">
                                        </div>
                                        <div class="text-box">
                                            <span class="title"><?= $item["name"] ?></span>
                                            <span
                                                class="sp-text primary-red text-wrap"><?= $item["content"] ?></span>
                                            <div class="higi-box">
                                                <img src="<?= BASE_PATH . $product_pic_url_array[0] ?>" alt="<?= $product_pic_alt_array[0] ?>">
                                                <span><?= $item["product_name"] ?></span>
                                            </div>
                                        </div>
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
    $(function(){
        var SlideThumb=new Swiper('.productSlide-thumb',{
            spaceBetween:10,
            slidesPerView:4,
            slidesPerGroup:4,
            watchSlidesVisibility:true,
        });
        var skillSlide=new Swiper('.skillSlide',{

            thumbs:{
                swiper:SlideThumb
            }
        });
    })
</script>
<?php require_once '_foot.php'; ?>