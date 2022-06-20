<?PHP
require_once '_head.php';
?>
<?php include_once '_header.php'; ?>

<section class="member-page content">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item active" aria-current="page">隱私權政策</li>
            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="POLICY">隱私權政策</h2>
        </div>
    </div>
    <div class="inner p-tb50 bg-Light">
        <div class="container">
            <?php
            require_once "ajax/_privacy_content.php";
            ?>
        </div>
        <div class="container text-center">
            <button type="button" class="primary-btn m-lr20" onclick="javascript:location.href='index.php'">回首頁</button>
        </div>
    </div>
</section>

<?php include_once '_footer.php'; ?>
<?php require_once "_post_js.php"; ?>
<script>
</script>
<?php require_once '_foot.php'; ?>