<?PHP

require_once '_head.php';
?>
<?php include_once '_header.php'; ?>

<section class="wrong-page content">
    <div class="container">
    </div>
    <div class="inner bg-Light">
        <div class="container p-tb50 justify-content-center">
            <div class="row align-items-center">
                <div class="col-md-6 col-12">
                    <div class="error"><img src="img/404.svg" alt=""></div>
                </div>
                <div class="col-md-6 col-12">
                    <h1>糟糕！</h1>
                    <p>找不到頁面，可能網站在進行維護。</p>
                </div>

                <div class="col-12 text-center">
                    <button type="submit" class="primary-btn m-lr20" onclick="javascript:location.href='index.php'">回首頁</button>
                </div>
            </div>
        </div>
    </div>
</section>

<?php include_once '_footer.php'; ?>
<?php require_once "_post_js.php"; ?>
<script>
</script>
<?php require_once '_foot.php'; ?>