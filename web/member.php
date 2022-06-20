<?PHP
require_once '_head.php';

if (IsMemberLogin() == false)
    redir("index.php");

//查詢登入會員資料
$members = null;
$url = WEBAPI_MEMBER_LOGINMEMBERDATA;
if (CallAPI('GET', $url, $_SESSION["MEMBER_ACCESSTOKEN"], null, $resultMessage, $members) != 200)
    $members = null;

$member = $members[0];

//查詢縣市
$cities = null;
if (CallAPI('GET', WEBAPI_CITYAREA_FindCity, null, null, $resultMessage, $cities) != 200)
    $cities = null;

//查詢登入會員專業食譜
$recipepros = null;
if (CallAPI('GET', WEBAPI_MEMBER_LOGINMEMBERRECIPEPRO, $_SESSION["MEMBER_ACCESSTOKEN"], null, $resultMessage, $recipepros) != 200)
    $recipepros = null;

//查詢登入會員招客秘笈
$higis = null;
if (CallAPI('GET', WEBAPI_MEMBER_LOGINMEMBERHIGI, $_SESSION["MEMBER_ACCESSTOKEN"], null, $resultMessage, $higis) != 200)
    $higis = null;
?>
<?php include_once '_header.php'; ?>

<section class="member-page content">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item active" aria-current="page">會員專區</li>
            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="MEMBER">會員專區</h2>
        </div>
    </div>
    <div class="inner bg-Light">
        <div class="container">
            <div class="member-block row p-a20">
                <div class="col-lg-2 col-12">
                    <div class="member-tab-pill nav nav-pills" role="tablist">
                        <a class="nav-link active" data-toggle="pill" href="#member-edit" role="tab" aria-selected="true">會員資料</a>
                        <a class="nav-link" data-toggle="pill" href="#member-password" role="tab" aria-selected="false">修改密碼</a>
                        <a class="nav-link" data-toggle="pill" href="#member-favorite" role="tab" aria-selected="false">我的最愛</a>
                        <a class="nav-link" href="javascript: void(0)" onclick="AlertLogout();">登出</a>
                    </div>
                </div>
                <div class="col-lg-10 col-12">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="member-edit" role="tabpanel">
                            <form class="form-box" name="data_form" id="data_form" action="ajax/member_data_edit_ajax.php" data-toggle="validator" role="form">
                                <input type="hidden" id="hidden_restaurant_area_id" value="<?= $member["restaurant_area_id"] ?>">
                                <div class="form-box">
                                    <h4 class="third-title m-b20"><img src="img/baker.svg">個人資訊</h4>
                                    <div class="form-group row">
                                        <label for="name" class="col-sm-2 col-form-label">真實姓名</label>
                                        <div class="col-sm-7">
                                            <input type="name" class="form-control form-control-sm validate[required]" name="name" placeholder="請輸入姓名" value="<?= $member["name"] ?>">
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input validate[required]" type="radio" name="gender" value="1"  <?= ($member["gender"] == 1) ? "checked" : ""; ?>>
                                                <label class="form-check-label" for="gender">先生</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input validate[required]" type="radio" name="gender" value="2"  <?= ($member["gender"] == 2) ? "checked" : ""; ?>>
                                                <label class="form-check-label" for="gender">小姐</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="email" class="col-sm-2 col-form-label">帳號</label>
                                        <div class="col-sm-10">
                                            <input type="email" class="form-control form-control-sm" placeholder="" readonly="readonly" value="<?= $member["account"] ?>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="phone" class="col-sm-2 col-form-label">聯絡電話</label>
                                        <div class="col-sm-10">
                                            <input type="tel" class="form-control form-control-sm validate[required,custom[phone]]" name="phone" placeholder="請輸入聯絡電話" value="<?= $member["phone"] ?>">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-box m-t50">
                                    <h4 class="third-title m-b20"><img src="img/bakery.svg">餐廳資訊</h4>
                                    <div class="form-group row">
                                        <label for="restaurant_name" class="col-sm-2 col-form-label">餐廳名稱</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control form-control-sm validate[required]" name="restaurant_name" placeholder="請輸入餐廳名稱" value="<?= $member["restaurant_name"] ?>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="restaurant_city_id" class="col-sm-2 col-form-label">縣/市</label>
                                        <div class="col-sm-10">
                                            <select class="form-control form-control-sm validate[required] select2" name="restaurant_city_id" id="restaurant_city_id">
                                                <option  value="" <?php echo (0 == $member["restaurant_city_id"]) ? "selected='selected'" : ""; ?>>(請選擇)</option>
                                                <?php foreach ($cities as $city) { ?>
                                                    <option  value="<?= $city["id"] ?>" <?php echo ($city["id"] == $member["restaurant_city_id"]) ? "selected='selected'" : ""; ?>><?= $city["name"] ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="restaurant_area_id" class="col-sm-2 col-form-label">鄉/鎮/區/市</label>
                                        <div class="col-sm-10">
                                            <select class="form-control form-control-sm validate[required] select2" name="restaurant_area_id" id="restaurant_area_id">
                                                <option  value="" selected>(請選擇)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="restaurant_type" class="col-sm-2 col-form-label">經營型態</label>
                                        <div class="col-sm-10">
                                            <select class="form-control form-control-sm validate[required]" name="restaurant_type">
                                                <option value="中式" <?= ($member["restaurant_type"] == "中式") ? "selected" : "" ?>>中式</option>
                                                <option value="日式" <?= ($member["restaurant_type"] == "日式") ? "selected" : "" ?>>日式</option>
                                                <option value="火鍋" <?= ($member["restaurant_type"] == "火鍋") ? "selected" : "" ?>>火鍋</option>
                                                <option value="複合" <?= ($member["restaurant_type"] == "複合") ? "selected" : "" ?>>複合</option>
                                                <option value="素食" <?= ($member["restaurant_type"] == "素食") ? "selected" : "" ?>>素食</option>
                                                <option value="連鎖體系" <?= ($member["restaurant_type"] == "連鎖體系") ? "selected" : "" ?>>連鎖體系</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <button class="primary-btn m-lr20" type="button" onclick="form_sumbit('#data_form')">修改會員資料</button>
                                </div>
                            </form>
                        </div>

                        <div class="tab-pane fade" id="member-password" role="tabpanel">
                            <form class="form-box" name="password_form" id="password_form" action="ajax/member_password_edit_ajax.php" data-toggle="validator" role="form">
                                <div class="form-box">
                                    <h4 class="third-title m-b20"><img src="img/key.svg">修改密碼</h4>
                                    <div class="form-group row">
                                        <label for="old_password" class="col-sm-2 col-form-label">輸入原密碼</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control form-control-sm validate[required, minSize[8]]" name="old_password" id="old_password" placeholder="請輸入原密碼">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="new_password" class="col-sm-2 col-form-label">輸入新密碼</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control form-control-sm validate[required, minSize[8]]" name="new_password" id="new_password" placeholder="請輸入新密碼，英數組合，最少8碼">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="password2" class="col-sm-2 col-form-label">確認密碼</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control form-control-sm validate[required,equals[new_password]]" name="password2" id="password2" placeholder="請輸入新密碼">
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button class="primary-btn m-lr20" type="button" onclick="form_sumbit('#password_form')">修改會員資料</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="tab-pane fade" id="member-favorite" role="tabpanel">
                            <h4 class="third-title m-b20"><img src="img/note.svg">招客秘笈</h4>
                            <div class="fav-block m-b30">
                                <?php
                                foreach ($higis as $item) {
                                    $pic_url_array = explode(',', $item["pic_url"]);
                                    $pic_alt_array = explode(',', $item["pic_alt"]);
                                    ?>
                                    <div class="list-box d-flex">
                                        <a href="javascript: goto_higi_detail(<?= $item["id"] ?>,<?= $item["member_only"] ?>)">
                                            <div class="img-box">
                                                <img src="<?= BASE_PATH . $pic_url_array[0] ?>" alt="<?= $pic_alt_array[0] ?>">
                                            </div>
                                        </a>
                                        <div class="text-box">
                                            <p class="icon-group m-r10">
                                                <a class="icon-like" href="javascript:void(0)" data-source="higi" data-id="<?= $item["id"] ?>"><i class="fab fa-gratipay"></i></a>
                                            </p>
                                            <?php if ($item["member_only"] == true) { ?>
                                                <span class="member-icon">會員限定</span>
                                            <?php } ?>
                                            <a href="javascript: goto_higi_detail(<?= $item["id"] ?>,<?= $item["member_only"] ?>)">
                                                <span class="title"><?= $item["name"] ?></span>
                                            </a>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                            <h4 class="third-title m-b20"><img src="img/book.svg">專業食譜</h4>
                            <div class="fav-block fav-recipe">
                                <?php foreach ($recipepros as $item) { ?>
                                    <div class="list-box d-flex">
                                        <a href="javascript: goto_recipepro_detail(<?= $item["id"] ?>,<?= $item["member_only"] ?>)">
                                            <div class="img-box">
                                                <img src="<?= BASE_PATH . $item["pic_url"] ?>" alt="<?= $item["pic_alt"] ?>">
                                            </div>
                                        </a>
                                        <div class="text-box">
                                            <p class="icon-group m-r10">
                                                <a class="icon-like" href="javascript:void(0)" data-source="recipepro" data-id="<?= $item["id"] ?>"><i class="fab fa-gratipay"></i></a>
                                            </p>
                                            <?php if ($item["member_only"] == true) { ?>
                                                <span class="member-icon">會員限定</span>
                                            <?php } ?>
                                            <a href="javascript: goto_recipepro_detail(<?= $item["id"] ?>,<?= $item["member_only"] ?>)">
                                                <span class="title"><?= $item["name"] ?></span>
                                            </a>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 內容 END -->

<?php include_once '_footer.php'; ?>
<?php require_once "_post_js.php"; ?>
<script>
    $(document).ready(function(){
        RefreshArea($('#restaurant_city_id').val(),$("#hidden_restaurant_area_id").val(),"#restaurant_area_id","#restaurant_zipcode");

        $("#data_form").validationEngine({
            promptPosition:'bottomLeft',
            maxErrorsPerField:1,
            showOneMessage:true,
            addFailureCssClassToField:"formError-border_red",
            autoHidePrompt:true,
            autoHideDelay:3000,
            validateNonVisibleFields:false,
            ajaxFormValidation:true,
            ajaxFormValidationMethod:'post',
            onAjaxFormComplete:dataformajaxCallback
        });

        $("#password_form").validationEngine({
            promptPosition:'bottomLeft',
            maxErrorsPerField:1,
            showOneMessage:true,
            addFailureCssClassToField:"formError-border_red",
            autoHidePrompt:true,
            autoHideDelay:3000,
            validateNonVisibleFields:false,
            ajaxFormValidation:true,
            ajaxFormValidationMethod:'post',
            onAjaxFormComplete:passwordformajaxCallback
        });
    });

    $('#restaurant_city_id').on('select2:select',function(e){
        RefreshArea($('#restaurant_city_id').val(),$("#hidden_restaurant_area_id").val(),"#restaurant_area_id","#restaurant_zipcode");
    });

    function dataformajaxCallback(status,form,json,options){
        if(status===true){
            if(json.sResult===true){
                swal_message("會員資料更新成功","","success",true);
            }else
                swal_message('會員資料更新失敗',json.msg,"error",false);
        }else{
            swal_message('會員資料更新失敗',json.msg,"error",false);
        }
    }

    function passwordformajaxCallback(status,form,json,options){
        if(status===true){
            if(json.sResult===true)
            {
                Swal.fire({
                    title:"密碼修改成功",
                    text:"請重新登入",
                    type:'success',
                    buttonsStyling:false,
                    confirmButtonText:'確定',
                    confirmButtonClass:'primary-btn m-lr20',
                }).then(()=>{
                    var url="ajax/member_logout.php";
                    var result=new Object();
                    AJAX(url,"POST",null,result);
                    window.location.reload();
                })
            }else
                swal_message('密碼修改失敗',json.msg,"error",false);
        }else{
            swal_message('密碼修改失敗',json.msg,"error",false);
        }
    }

    function form_sumbit(selector){
        $(selector).submit();
    }
</script>
<?php require_once '_foot.php'; ?>