<?PHP
require_once '_head.php';

//查詢首頁Banner
$banners = null;
if (CallAPI('GET', WEBAPI_BANNER, null, null, $resultMessage, $banners) != 200)
    $banners = null;

//查詢餐飲情報
$campaigns = null;
if (CallAPI('GET', WEBAPI_CAMPAIGN, null, null, $resultMessage, $campaigns) != 200)
    $campaigns = null;

//查詢專業食譜
$recipepros = null;
if (CallAPI('GET', WEBAPI_RECIPEPRO, null, null, $resultMessage, $recipepros) != 200)
    $recipepros = null;
if ($recipepros != null)
    shuffle($recipepros);

//查詢商品
$products = null;
if (CallAPI('GET', WEBAPI_PRODUCT, null, null, $resultMessage, $products) != 200)
    $products = null;

//查詢廣告
$ads = null;
if (CallAPI('GET', WEBAPI_AD, null, null, $resultMessage, $ads) != 200)
    $ads = null;
?>
<?php include_once '_header.php'; ?>

<section class="content">
    <?php if ($banners != null) { ?>
        <section>
            <div class="swiper-container main-banner">
                <div class="swiper-wrapper">
                    <?php foreach ($banners as $item) { ?>
                        <div class="swiper-slide">
                            <?php if (empty($item["link"])) { ?>
                                <img src="<?= BASE_PATH . $item["pic_url"] ?>" alt="<?= $item["pic_alt"] ?>">
                            <?php } else { ?>
                                <a href="<?= $item["link"] ?>" target="<?= ($item["blank"] == "1") ? "_blank" : "" ?>">
                                    <img src="<?= BASE_PATH . $item["pic_url"] ?>" alt="<?= $item["pic_alt"] ?>">
                                </a>
                            <?php } ?>
                        </div>
                    <?php } ?>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </section>
    <?php } ?>

    <?php if ($campaigns != null) { ?>
        <section class="index-news-block p-tb100">
            <div class="container">
                <div class="main-title m-b80">
                    <h2 data-title="NEWS">餐飲情報</h2>
                </div>
                <div class="row">
                    <?php
                    foreach ($campaigns as $key => $item) {
                        if ($key < 2) {
                            ?>
                            <div class="list-box col-lg-6 col-12">
                                <a href="campaign-detail.php?id=<?= $item["id"] ?>">
                                    <div class="img-box">
                                        <img src="<?= BASE_PATH . $item["pic_url"] ?>" alt="<?= $item["pic_alt"] ?>">
                                    </div>
                                    <div class="text-box">
                                        <!--<span><?= GetDateString($item["release_date"]) ?></span>-->
                                        <p class = "text-wrap"><?= $item["title"] ?></p>
                                    </div>
                                </a>
                            </div>
                            <?php
                        }
                    }
                    ?>
                </div>
            </div>
        </section>
    <?php } ?>

    <?php if ($recipepros != null) { ?>
        <section class="index-recipe-block p-tb100">
            <div class="container">
                <div class="main-title m-b80">
                    <h2 data-title="RECIPES">最新食譜</h2>
                </div>
                <div class="row">
                    <div class="box m-b100 col-lg-6 col-md-6 col-12">
                        <div class="left-box">
                            <?php if ($recipepros[0]["member_only"] == true) { ?>
                                <div class="member-icon">
                                    <span>會員限定</span>
                                </div>
                            <?php } ?>
                            <div class="img-box">
                                <a href="javascript: return false;" onclick="goto_recipepro_detail(<?= $recipepros[0]["id"] ?>,<?= $recipepros[0]["member_only"] ?>)">
                                    <img src="<?= BASE_PATH . $recipepros[0]["pic_url"] ?>" alt="<?= $recipepros[0]["pic_alt"] ?>">
                                </a>
                            </div>
                            <div class="text-box">
                                <a href="javascript: return false;" onclick="goto_recipepro_detail(<?= $recipepros[0]["id"] ?>,<?= $recipepros[0]["member_only"] ?>)">
                                    <span class="primary-red"><?= $recipepros[0]["name"] ?></span>
                                    <?php if (!empty($recipepros[0]["feature"])) { ?>
                                        <p class="text-wrap"><?= $recipepros[0]["feature"] ?></p>
                                    <?php } ?>
                                </a>
                                <a class="primary-btn gobtn" href="javascript: return false;" onclick="goto_recipepro_detail(<?= $recipepros[0]["id"] ?>,<?= $recipepros[0]["member_only"] ?>)">詳細食譜</a>
                            </div>
                        </div>
                    </div>
                    <?php array_splice($recipepros, 0, 1); ?>
                    <div class="box m-b100 col-lg-6 col-md-4 col-12">
                        <div class="swiper-container recipe-display">
                            <div class="swiper-wrapper">
                                <?php foreach ($recipepros as $key => $item) { ?>
                                    <?php if ($key < 4) { ?>
                                        <div class="swiper-slide">
                                            <a href="javascript: return false;" onclick="goto_recipepro_detail(<?= $recipepros[$key]["id"] ?>,<?= $recipepros[$key]["member_only"] ?>)">
                                                <?php if ($item["member_only"] == true) { ?>
                                                    <div class="member-icon small-tag">
                                                        <span>會員限定</span>
                                                    </div>
                                                <?php } ?>
                                                <img src="<?= BASE_PATH . $item["pic_url"] ?>" alt="<?= $item["pic_alt"] ?>">
                                            </a>
                                        </div>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <?php } ?>

    <?php if ($products != null) { ?>
        <section class="index-product-block bg-Light p-tb100">
            <div class="container">
                <div class="main-title m-b80">
                    <h2 data-title="PRODUCTS">商品介紹</h2>
                </div>
                <div class="product-display m-tb20">
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <?php
                            foreach ($products as $key => $item) {
                                $pic_url_array = explode(',', $item["pic_urls"]);
                                $pic_alt_array = explode(',', $item["pic_alts"]);
                                ?>
                                <div class="swiper-slide">
                                    <div class="item-box">
                                        <a href="product-detail.php?id=<?= $item["id"] ?>">
                                            <span class="icon">
                                                <img src="<?= BASE_PATH . $item["brand_pic_url"] ?>" alt="<?= $item["brand_pic_alt"] ?>">
                                            </span>
                                            <span class="item">
                                                <img src="<?= BASE_PATH . $pic_url_array[0] ?>" alt="<?= $pic_alt_array[0] ?>">
                                            </span>
                                            <p><?= $item["name"] ?></p>
                                        </a>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <?php } ?>

    <?php if ($ads != null) { ?>
        <section class="index-ad-block p-tb100">
            <div class="container">
                <div class="ad-box row justify-content-center">
                    <?php
                    foreach ($ads as $key => $item) {
                        if ($key < 6) {
                            ?>
                            <div class="col-md-5 col-12">
                                <a href="<?= $item["link"] ?>" target="_blank">
                                    <img src="<?= BASE_PATH . $item["pic_url"] ?>" alt="<?= $item["pic_alt"] ?>">
                                </a>
                            </div>
                            <?php
                        }
                    }
                    ?>
                </div>
            </div>
        </section>
    <?php } ?>
</section>

<?php include_once '_footer.php'; ?>
<?php require_once "_post_js.php"; ?>
<script>
    $(function(){
        if($(".main-banner .swiper-slide").length>1)
        {
            //index top banner
            var mainBanner=new Swiper('.main-banner',{
                height:300,
                spaceBetween:30,
                centeredSlides:true,
                loop:true,
                autoplay:{
                    delay:3000,
                    stopOnLastSlide:false,
                    disableOnInteraction:false,
                },
                pagination:{
                    el:'.swiper-pagination',
                    clickable:true,
                },

            });
        }

        //index recipe display
        var recipeDisplay=new Swiper('.recipe-display',{
            slidesPerView:2,
            slidesPerColumn:2,
            spaceBetween:10,
            watchOverflow:true,
            breakpoints:{
                992:{
                    slidesPerView:1,
                    slidesPerColumn:2,
                    spaceBetween:10,
                    watchOverflow:false,
                    pagination:{
                        el:'.swiper-pagination',
                        clickable:true,
                    },
                }
            }
        });
        //index product
        var productDisplay=new Swiper('.product-display .swiper-container',{
            slidesPerView:'3',
            navigation:{
                nextEl:'.swiper-button-next',
                prevEl:'.swiper-button-prev',
            },
            breakpoints:{
                992:{
                    slidesPerView:2
                },
                468:{
                    slidesPerView:1
                }
            }
        });
    })
</script>
<?php require_once '_foot.php'; ?>