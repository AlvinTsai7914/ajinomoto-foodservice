<?PHP
$get_page_name = explode('/', $_SERVER["PHP_SELF"]);
$get_page_name = explode('.', $get_page_name[count($get_page_name) - 1])[0];
?>
<!-- 共同自訂 -->
<link type="text/css" rel="stylesheet" href="css/normalize.min.css">
<link type="text/css" rel="stylesheet" href="css/base.css">
<link type="text/css" rel="stylesheet" href="css/fontawesome.5.10.1-all.min.css">
<link type="text/css" rel="stylesheet" href="plugins/bootstrap/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="plugins/sweetalert2/sweetalert2.min.css">
<link type='text/css' rel='stylesheet' href='plugins/jQuery-Validation-Engine-2.6.2/css/validationEngine.jquery.css'>

<!-- 頁面自訂 -->
<?php
switch ($get_page_name) {
    case "index":
    case "product-detail":
    case "skill-detail":
        echo "<link type='text/css' rel='stylesheet' href='plugins/swiper/css/swiper.min.css'>";
        break;
    default:
        break;
}
echo "\n";
?>
<!-- 共同自訂 -->
<link type="text/css" rel="stylesheet" href="css/style.css?v=20210612">
<link type="text/css" rel="stylesheet" href="css/all.css">

<?php
switch ($get_page_name) {
    case "recipepro-detail":
    case "skill-detail":
        echo "<link type='text/css' rel='stylesheet' href='css/print.css' media='print'>";
        break;
    case "salad_dressing":
        echo "<link rel='stylesheet' href='https://unpkg.com/aos@next/dist/aos.css'>";
        echo "<link rel='stylesheet' href='css/event_salad.css?v=20210706'>";
        break;
    default:
        break;
}
echo "\n";
?>