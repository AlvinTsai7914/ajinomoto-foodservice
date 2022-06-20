<?PHP
require_once '_head.php';

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

<section class="product-page content">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item active" aria-current="page">商品介紹</li>

            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="PRODUCTS">商品介紹</h2>
        </div>
    </div>
    <div class="inner">
        <div class="product-block p-tb50">
            <div class="container">
                <div class="item-group row">
                    <?php
                    foreach ($products as $key => $item) {
                        $pic_url_array = explode(',', $item["pic_urls"]);
                        $pic_alt_array = explode(',', $item["pic_alts"]);
                        ?>
                        <div class="col-lg-4 col-md-6">
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

        <?php if ($ads != null) { ?>
            <div class="container p-tb50">
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
        <?php } ?>
    </div>
</section>

<?php include_once '_footer.php'; ?>
<?php require_once "_post_js.php"; ?>
<script>
</script>
<?php require_once '_foot.php'; ?>