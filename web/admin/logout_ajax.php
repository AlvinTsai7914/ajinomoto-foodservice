<?php

require '_admin_config.php';

$result = false;
$resultMessage = "";
$resultData = "";

$result = CallAPI('POST', WEBAPI_USER_Logout, $_SESSION['accesstoken'], null, $resultMessage, $resultData);

unset($_SESSION['accesstoken']);
unset($_SESSION['loginusername']);
unset($_SESSION['loginip']);
unset($_SESSION['logintime']);
unset($_SESSION['loginuserrole']);

redir("login.php");
?>