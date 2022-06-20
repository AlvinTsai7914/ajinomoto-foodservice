<?PHP
require_once '_admin_config.php';
no_permission_gohome();
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="no-cache">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache">
        <title><?= $sys_site_title ?> CMS</title>
        <link rel='shortcut icon' href='favicon.ico' />
        <!-- 使用螢幕寬度，初始尺寸及最大尺寸為1，不可縮放 -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

        <?php require_once "_admin_pre_css.php"; ?>
    </head>

    <script>
        var BASE_PATH = "<?php echo BASE_PATH ?>";
    </script>

    <body class="hold-transition sidebar-mini">
        <?php include_once '_croppie_image_modal.php'; ?>