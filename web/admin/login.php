<?php
require '_admin_config.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><?= $sys_site_title ?> CMS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

        <!-- Bootstrap v4.1.0-->
        <link type="text/css" rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
        <!-- AdminLTE -->
        <link type="text/css" rel="stylesheet" href="../plugins/adminlte/css/adminlte.min.css">
        <!-- jQuery Validation Engine -->
        <link type="text/css" rel="stylesheet" href="../plugins/jQuery-Validation-Engine-2.6.2/css/validationEngine.jquery.css">
        <!-- Sweetalert -->
        <link type="text/css" rel="stylesheet" href="../plugins/bootstrap-sweetalert/sweetalert.css">

        <link type="text/css" rel="stylesheet" href="./css/all.css">
    </head>
    <body class="hold-transition login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href='../' target='_blank'><img style="max-width: 50%; height: auto;" class="center-block" src="../img/logo.png"/></a>
            </div>
            <div class="login-box-body">
                <form id="login_form" action="login_ajax.php">
                    <label for="user_account">帳號</label>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control validate[required]" id="user_account" name="user_account" placeholder="請輸入帳號">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                    </div>

                    <label for="user_password">密碼</label>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control validate[required]" id="user_password" name="user_password" placeholder="請輸入密碼">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        </div>
                    </div>

                    <label for="checkcode">驗證碼</label>
                    <div class="input-group mb-3">
                        <input style="width:70%" type="text" class="form-control validate[required]" id="checkcode" name="checkcode" maxlength="4" autocomplete="off" placeholder="點擊圖片刷新驗證碼">
                        <img class="pull-right" style="width:30%; height: 34px; cursor:pointer" name="checkcode_img" id="checkcode_img" src="_checkcode.php">
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-block btn-brand">登入</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- jQuery -->
        <script type="text/javascript" src="../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script type="text/javascript" src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery Validation Engine -->
        <script type="text/javascript" src="../plugins/jQuery-Validation-Engine-2.6.2/js/jquery.validationEngine.js"></script>
        <script type="text/javascript" src="../plugins/jQuery-Validation-Engine-2.6.2/js/languages/jquery.validationEngine-zh_TW.js"></script>
        <!-- Sweetalert -->
        <script src="../plugins/bootstrap-sweetalert/sweetalert.min.js"></script>
        <!-- FontAwesome -->
        <script type="text/javascript" src="../plugins/fontawesome-5.3.1/all.min.js"></script>
        <script>
            $(document).ready(function(){
                $("#login_form").validationEngine({
                    promptPosition:'bottomLeft',
                    maxErrorsPerField:1,
                    showOneMessage:true,
                    addFailureCssClassToField:"formError-border_red",
                    autoHidePrompt:true,
                    autoHideDelay:3000,
                    validateNonVisibleFields:true,
                    ajaxFormValidation:true,
                    ajaxFormValidationMethod:'post',
                    onAjaxFormComplete:ajaxCallback,
                });
            });

            function ajaxCallback(status,form,json,options){
                if(status===true){
                    if(json.result==true){
                        location.href='dashboard.php';
                    }else{
                        swal({title:json.msg,type:"error",confirmButtonText:"OK"});
                        $("#checkcode").val("");
                        $("#checkcode_img").click();
                    }
                }
            }

            $("#checkcode_img").click(function(){
                $(this).attr("src","_checkcode.php?v="+(new Date().getTime())).change();
            })
        </script>
    </body>
</html>
