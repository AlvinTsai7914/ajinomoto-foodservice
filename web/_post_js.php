<!-- 共同自訂 -->
<script type="text/javascript" src='plugins/jquery/jquery.min.js'></script>
<script type='text/javascript' src='js/popper.min.js'></script>
<script type="text/javascript" src='plugins/bootstrap/js/bootstrap.min.js'></script>
<script type="text/javascript" src='plugins/sweetalert2/sweetalert2.all.min.js'></script>
<script type='text/javascript' src='plugins/jQuery-Validation-Engine-2.6.2/js/jquery.validationEngine.js'></script>
<script type='text/javascript' src='plugins/jQuery-Validation-Engine-2.6.2/js/languages/jquery.validationEngine-zh_TW.js'></script>
<script type='text/javascript' src='js/polyfill.min.js'></script>

<!-- 頁面自訂 -->
<?php
switch ($get_page_name) {
    case "index":
    case "product-detail":
    case "skill-detail":
        echo "<script type='text/javascript' src='plugins/swiper/js/swiper.min.js'></script>";
        break;
    case "campaign":
        echo "<script type='text/javascript' src='plugins/isotope/isotope.pkgd.min.js'></script>";
        break;
    case "safety":
        echo "<script type='text/javascript' src='js/scrollreveal.min.js'></script>";
        break;
    case "salad_dressing":
        echo "<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/skrollr/0.6.30/skrollr.min.js'></script>";
        echo "<script src='https://unpkg.com/aos@next/dist/aos.js'></script><script src='js/event_salad.js'></script>";
        break;
    default :
        break;
}
?>
<script type="text/javascript" src="js/common.js?v=20200227"></script>
<script type="text/javascript" src="js/all.js?v=20200227"></script>
<script type="text/javascript" src="js/alert.js?v=20200410"></script>