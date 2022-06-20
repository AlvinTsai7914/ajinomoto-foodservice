<?php

//檢查會員是否已登入
function IsMemberLogin() {
    if (empty($_SESSION["MEMBER_ACCESSTOKEN"]))
        return false;
    else
        return true;
}
