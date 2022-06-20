<?PHP
require_once '_head.php';

//查詢餐飲情報標籤
$campaign_tags = null;
if (CallAPI('GET', WEBAPI_CAMPAIGN_TAG, null, null, $resultMessage, $campaign_tags) != 200)
    $campaign_tags = null;

//查詢餐飲情報
$campaigns = null;
if (CallAPI('GET', WEBAPI_CAMPAIGN, null, null, $resultMessage, $campaigns) != 200)
    $campaigns = null;
?>
<?php include_once '_header.php'; ?>

<section class="campaign-page content">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item active" aria-current="page">餐飲情報</li>
            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="NEWS">餐飲情報</h2>
        </div>
    </div>
    <div class="inner p-tb50 bg-Light">
        <div class="container">
            <div class="filter-btn-group">
                <button data-filter="*" class="tag color-all">全部</button>
                <?php foreach ($campaign_tags as $item) { ?>
                    <button data-filter=".campaign_tag_<?= $item["id"] ?>" class="tag" style="background-color:<?= $item["color"] ?>"><?= $item["name"] ?></button>
                <?php } ?>
            </div>
            <div class="list-box-group row">
                <?php
                foreach ($campaigns as $item) {
                    $tag_id_array = explode(',', $item["tag_ids"]);
                    $tag_name_array = explode(',', $item["tag_names"]);
                    $tag_color_array = explode(',', $item["tag_colors"]);
                    $campaign_tag_class = "";
                    foreach ($tag_id_array as $tag_id) {
                        $campaign_tag_class .= " campaign_tag_" . $tag_id;
                    }
                    ?>
                    <div class="<?= $campaign_tag_class ?> list-box col-lg-6 col-12">
                        <a href="campaign-detail.php?id=<?= $item["id"] ?>">
                            <div class="img-box" style="min-height:100px">
                                <img src="<?= BASE_PATH . $item["pic_url"] ?>" alt="<?= $item["pic_alt"] ?>">
                            </div>
                            <div class="text-box">
                                <!--<span><?= GetDateString($item["release_date"]) ?></span>-->
                                <p class="text-wrap"><?= $item["title"] ?></p>
                            </div>
                        </a>
                        <div class="tag-box" style="margin-top:0px">
                            <?php foreach ($tag_name_array as $key => $tag_name) { ?>
                                <span class="tag" style="background-color: <?= $tag_color_array[$key] ?>"><?= $tag_name ?></span>
                            <?php } ?>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
</section>

<?php include_once '_footer.php'; ?>
<?php require_once "_post_js.php"; ?>
<script>
    $(document).ready(function(){
        var imgdefereds=[];
        $('img').each(function(){
            var dfd=$.Deferred();
            $(this).bind('load',function(){
                dfd.resolve();
            }).bind('error',function(){
                dfd.resolve();
            })
            if(this.complete)
                setTimeout(function(){
                    dfd.resolve();
                },1000);
            imgdefereds.push(dfd);
        })
        $.when.apply(null,imgdefereds).done(function(){
            imgloaded();
        });
    })

    function imgloaded(){
        // init Isotope
        var $listGroup=$('.list-box-group').isotope({
            layoutMode:'fitRows',
        });

        // filter items on button click
        $('.filter-btn-group').on('click','button',function(){
            var filterValue=$(this).attr('data-filter');
            $listGroup.isotope({
                filter:filterValue
            });
        });
    }
</script>
<?php require_once '_foot.php'; ?>