<?PHP
require_once '_head.php';

$campaign_id = request_num("id");
if (empty($campaign_id) || $campaign_id == 0)
    redir("campaign.php");

//查詢餐飲情報
$url = WEBAPI_CAMPAIGN . "/" . $campaign_id;
$campaigns = null;
if (CallAPI('GET', $url, null, null, $resultMessage, $campaigns) != 200)
    redir("campaign.php");

if (count($campaigns) != 1)
    redir("campaign.php");

$campaign = $campaigns[0];
?>
<?php include_once '_header.php'; ?>

<section class="campaign-page content">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item"><a href="campaign.php">餐飲情報</a></li>
                <li class="breadcrumb-item active" aria-current="page"><?= $campaign["title"] ?></li>
            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="NEWS">餐飲情報</h2>
        </div>
    </div>
    <div class="inner p-tb50 bg-Light">
        <div class="container">
            <p class="goback-btn m-b20">
                <a href="campaign.php"><i class="fas fa-angle-left"></i>回列表</a>
            </p>
            <div class="card-box">
                <div class="title-box">
                    <p class="card-title"><?= $campaign["title"] ?></p>
                    <!--<p class="card-date"><?= GetDateString($campaign["release_date"]) ?></p>-->
                </div>
                <div class="p-a20"><?= $campaign["content"] ?></div>
            </div>
        </div>
    </div>
</section>

<?php include_once '_footer.php'; ?>
<?php require_once "_post_js.php"; ?>
<script>
</script>
<?php require_once '_foot.php'; ?>