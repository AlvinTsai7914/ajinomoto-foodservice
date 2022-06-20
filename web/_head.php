<?PHP
require_once 'setting/config.php';
require_once 'setting/webapi.php';
require_once 'setting/tools.php';
require_once '_func.php';
?>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
        <title>台灣味之素餐飲通路網</title>
        <link rel="shortcut icon" href="img/favicon.ico" />
        <?php require_once "_pre_css.php"; ?>

        <script>
            var BASE_PATH="<?php echo BASE_PATH ?>";
            var MEMBER_LOGIN="<?php echo IsMemberLogin(); ?>";
        </script>
    </head>

    <body>
        <section class="wrapper">
