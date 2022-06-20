<?PHP
require_once '_head.php';

$product_id = request_num("id");
if (empty($product_id) || $product_id == 0)
    redir("product.php");

//查詢商品
$url = WEBAPI_PRODUCT . "/" . $product_id;
$products = null;
if (CallAPI('GET', $url, null, null, $resultMessage, $products) != 200)
    redir("product.php");

if (count($products) != 1)
    redir("product.php");

$product = $products[0];
$pic_url_array = explode(',', $product["pic_urls"]);
$pic_alt_array = explode(',', $product["pic_alts"]);

//查詢相關商品食譜
$product_recipepros = null;
$querystring = "FIND_IN_SET('" . $product["id"] . "',product_ids)";
$url = WEBAPI_RECIPEPRO . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $product_recipepros) != 200)
    $product_recipepros = null;

if (is_array($product_recipepros))
    shuffle($product_recipepros);
?>
<?php include_once '_header.php'; ?>

<section class="productDetail-page content">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item"><a href="product.php">商品介紹</a></li>
                <li class="breadcrumb-item active" aria-current="page"><?= $product["name"] ?></li>
            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="PRODUCTS">商品介紹</h2>
        </div>
    </div>
    <div class="inner p-b50">
        <div class="container">
            <h3 class="subheader"><?= $product["name"] ?></h3>
            <div class="product-top row m-b40">
                <div class="col-lg-6 left-box">
                    <div class="swiper-container productSlide">
                        <div class="swiper-wrapper">
                            <?php
                            foreach ($pic_url_array as $key => $pic_url) {
                                $pic_alt = $pic_alt_array[$key];
                                ?>
                                <div class="swiper-slide">
                                    <img src="<?= BASE_PATH . $pic_url ?>" alt="<?= $pic_alt ?>">
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="swiper-container productSlide-thumb">
                        <div class="swiper-wrapper">
                            <?php
                            foreach ($pic_url_array as $key => $pic_url) {
                                $pic_alt = $pic_alt_array[$key];
                                ?>
                                <div class="swiper-slide">
                                    <img src="<?= BASE_PATH . $pic_url ?>" alt="<?= $pic_alt ?>">
                                </div>
                            <?php } ?>
                        </div>
                    </div>

                </div>
                <div class="col-lg-6 right-box">
                    <span><?= $product["tag"] ?></span>
                    <p class="m-t20 m-b50">
                        <?= $product["content"] ?>
                    </p>

                    <?php if (!empty($product["tips"])) { ?>
                        <div class="text-box">
                            <h4 class="third-title">美味秘訣</h4>
                            <p class="m-t10">
                                <?= $product["tips"] ?>
                            </p>
                        </div>
                    <?php } ?>
                </div>
            </div>

            <?php if (!empty($product["information"]) || !empty($product["mark"])) { ?>
                <div class="product-info row m-b40">
                    <?php if (!empty($product["information"])) { ?>
                        <div class="col-md-6 col-12">
                            <div class="text-box">
                                <h4 class="third-title">商品資訊</h4>
                                <?= $product["information"] ?>
                            </div>
                        </div>
                    <?php } ?>
                    <?php if (!empty($product["mark"])) { ?>
                        <div class="col-md-6 col-12">
                            <div class="text-box">
                                <h4 class="third-title">營養標示</h4>
                                <?= $product["mark"] ?>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            <?php } ?>

            <?php if (!empty($product_recipepros)) { ?>
                <div class="refer-recipe">
                    <h4 class="third-title">相關料理</h4>
                    <div class="row justify-content-center m-t20">
                        <?php
                        foreach ($product_recipepros as $key => $item) {
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
            <?php } ?>
        </div>
    </div>
</section>

<?php include_once '_footer.php'; ?>
<?php require_once "_post_js.php"; ?>
<script>
    $(function(){
        var productSlideThumb=new Swiper('.productSlide-thumb',{
            spaceBetween:10,
            slidesPerView:4,
            slidesPerGroup:4,
            watchSlidesVisibility:true,
            pagination:{
                el:'.swiper-pagination',
                clickable:true,
            },
        });
        var productSlide=new Swiper('.productSlide',{

            thumbs:{
                swiper:productSlideThumb
            }
        });
    })
</script>
<?php require_once '_foot.php'; ?>