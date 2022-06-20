<?PHP
require_once '_head.php';

$key = request_str("key");
if (empty($key))
    redir("index.php");

//查詢餐飲情報
$campaigns = null;
$querystring = "tag_names like '%" . $key . "%'";
$querystring .= " or title like '%" . $key . "%'";
$querystring .= " or sub_title like '%" . $key . "%'";
$querystring .= " or content like '%" . $key . "%'";
$url = WEBAPI_CAMPAIGN . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $campaigns) != 200)
    $campaigns = null;

//查詢商品
$products = null;
$querystring = "brand_name like '%" . $key . "%'";
$querystring .= " or name like '%" . $key . "%'";
$querystring .= " or tag like '%" . $key . "%'";
$querystring .= " or content like '%" . $key . "%'";
$querystring .= " or tips like '%" . $key . "%'";
$querystring .= " or information like '%" . $key . "%'";
$querystring .= " or mark like '%" . $key . "%'";
$url = WEBAPI_PRODUCT . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $products) != 200)
    $products = null;

//查詢專業食譜
$recipepros = null;
$querystring = "name like '%" . $key . "%'";
$querystring .= " or feature like '%" . $key . "%'";
$querystring .= " or tags like '%" . $key . "%'";
$querystring .= " or type like '%" . $key . "%'";
$querystring .= " or style like '%" . $key . "%'";
$querystring .= " or product_names like '%" . $key . "%'";
$querystring .= " or nutrition like '%" . $key . "%'";
$url = WEBAPI_RECIPEPRO . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $recipepros) != 200)
    $recipepros = null;

//查詢招客秘笈
$higis = null;
$querystring = "name like '%" . $key . "%'";
$querystring .= " or content like '%" . $key . "%'";
$querystring .= " or recipepro_name like '%" . $key . "%'";
$querystring .= " or brand_name like '%" . $key . "%'";
$querystring .= " or product_name like '%" . $key . "%'";
$querystring .= " or tags like '%" . $key . "%'";
$querystring .= " or methods like '%" . $key . "%'";
$querystring .= " or note like '%" . $key . "%'";
$url = WEBAPI_HIGI . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $higis) != 200)
    $higis = null;
?>
<?php include_once '_header.php'; ?>

<section class="search-page content">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item active" aria-current="page">搜尋結果</li>
            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="SEARCH">搜尋結果</h2>
        </div>
    </div>
    <div class="inner p-tb50 bg-Light">
        <div class="container">
            <h4 class="third-title m-tb30">
                <img src="img/recipe.svg">餐飲情報
            </h4>
            <div class="search-result m-t30 m-b50">
                <?php
                foreach ($campaigns as $item) {
                    $tag_id_array = explode(',', $item["tag_ids"]);
                    $tag_name_array = explode(',', $item["tag_names"]);
                    $tag_color_array = explode(',', $item["tag_colors"]);
                    ?>
                    <div class="list-box">
                        <a href="campaign-detail.php?id=<?= $item["id"] ?>">
                            <div class="img-box">
                                <img src="<?= BASE_PATH . $item["pic_url"] ?>" alt="<?= $item["pic_alt"] ?>">
                            </div>
                            <div class="text-box">
                                <span><?= GetDateString($item["release_date"]) ?></span>
                                <p class = "text-wrap"><?= $item["title"] ?></p>
                            </div>
                        </a>
                        <div class="tag-box">
                            <?php foreach ($tag_name_array as $key => $tag_name) { ?>
                                <span class="tag" style="background-color: <?= $tag_color_array[$key] ?>"><?= $tag_name ?></span>
                            <?php } ?>
                        </div>
                    </div>
                <?php } ?>
            </div>

            <h4 class="third-title m-tb30">
                <img src="img/condiment.svg">商品
            </h4>
            <div class="search-result m-t30 m-b50">
                <?php
                foreach ($products as $item) {
                    $pic_url_array = explode(',', $item["pic_urls"]);
                    $pic_alt_array = explode(',', $item["pic_alts"]);
                    ?>
                    <div class="list-box">
                        <a href="product-detail.php?id=<?= $item["id"] ?>">
                            <div class="img-box">
                                <img src="<?= BASE_PATH . $pic_url_array[0] ?>" alt="<?= $pic_alt_array[0] ?>">
                            </div>
                            <div class="text-box">
                                <span class="title"><?= $item["name"] ?></span>
                            </div>
                        </a>
                    </div>
                <?php } ?>
            </div>

            <h4 class="third-title m-tb30">
                <img src="img/book.svg">專業食譜
            </h4>
            <div class="search-result m-t30 m-b50">
                <?php foreach ($recipepros as $item) { ?>
                    <div class="list-box ">
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
                <?php } ?>
            </div>

            <h4 class="third-title m-tb30">
                <img src="img/note.svg">招客秘笈
            </h4>
            <div class="search-result m-t30 m-b50">
                <?php foreach ($higis as $item) { ?>
                    <div class="list-box ">
                        <a href="javascript: goto_higi_detail(<?= $item["id"] ?>,<?= $item["member_only"] ?>)">
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
                <?php } ?>
            </div>
        </div>
    </div>
</section>

<?php include_once '_footer.php'; ?>
<?php require_once "_post_js.php"; ?>
<script>
</script>
<?php require_once '_foot.php'; ?>