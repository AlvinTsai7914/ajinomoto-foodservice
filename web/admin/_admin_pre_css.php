<?PHP
$get_page_name = explode('/', $_SERVER["PHP_SELF"]);
$get_page_name = explode('.', $get_page_name[count($get_page_name) - 1])[0];
?>

<!-- Bootstrap v4.1.0-->
<link type="text/css" rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.css">
<!-- jQuery Validation Engine -->
<link type="text/css" rel="stylesheet" href="../plugins/jQuery-Validation-Engine-2.6.2/css/validationEngine.jquery.css">
<!-- Sweetalert -->
<link type="text/css" rel="stylesheet" href="../plugins/bootstrap-sweetalert/sweetalert.css">
<!-- DataTables -->
<link type="text/css" rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap4.css">
<!-- iCheck -->
<link type="text/css" rel="stylesheet" href="../plugins/iCheck/all.css">
<!-- daterange picker -->
<link type="text/css" rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
<!-- select2 -->
<link type="text/css" rel="stylesheet" href="../plugins/select2/select2.css">
<!-- AdminLTE 3-->
<link type="text/css" rel="stylesheet" href="../plugins/adminlte/css/adminlte.min.css">
<!-- croppie-->
<link type="text/css" rel="stylesheet" href="../plugins/croppie/croppie.css">

<!-- 共同自訂 -->
<link type="text/css" rel="stylesheet" href="css/all.css">
<!-- 頁面自訂 -->
<?php
switch ($get_page_name) {
    default:
        break;
}
echo "\n";
?>

