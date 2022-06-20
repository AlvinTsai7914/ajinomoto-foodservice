<?PHP
require_once '_head.php';

//查詢縣市
$cities = null;
if (CallAPI('GET', WEBAPI_CITYAREA_FindCity, null, null, $resultMessage, $cities) != 200)
    $cities = null;
?>
<?php include_once '_header.php'; ?>

<section class="member-page content">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item active" aria-current="page">聯絡我們</li>
            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="CONTACT US">聯絡我們</h2>
        </div>
    </div>
    <div class="inner p-tb50 bg-Light">
        <div class="container">
            <form name="data_form" id="data_form" action="ajax/contactus_ajax.php" data-toggle="validator" role="form">
                <div class="form-box">
                    <div class="form-group row">
                        <label for="name" class="col-sm-2 col-form-label">姓名</label>
                        <div class="col-sm-7">
                            <input type="name" class="form-control form-control-sm validate[required]" name="name" placeholder="請輸入姓名">
                        </div>
                        <div class="col-sm-3">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" value="先生" checked>
                                <label class="form-check-label" for="gender">先生</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" value="小姐">
                                <label class="form-check-label" for="gender">小姐</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="phone" class="col-sm-2 col-form-label">聯絡電話</label>
                        <div class="col-sm-10">
                            <input type="phone" class="form-control form-control-sm validate[required,custom[phone]]" name="phone" placeholder="請輸入聯絡電話">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="city_id" class="col-sm-2 col-form-label">縣/市</label>
                        <div class="col-sm-10">
                            <select class="form-control form-control-sm validate[required]" id="city_id" name="city_id">
                                <option  value="" selected>(請選擇)</option>
                                <?php foreach ($cities as $city) { ?>
                                    <option  value="<?= $city["id"] ?>"><?= $city["name"] ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="area_id" class="col-sm-2 col-form-label">鄉/鎮/區/市</label>
                        <div class="col-sm-10">
                            <select class="form-control form-control-sm validate[required]" id="area_id" name="area_id">
                                <option  value="" selected>(請選擇)</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="email" class="col-sm-2 col-form-label">電子信箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control form-control-sm validate[required,custom[email]" name="email" placeholder="請輸入電子信箱">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="qasort" class="col-sm-2 col-form-label">詢問類別</label>
                        <div class="col-sm-10">
                            <select class="form-control form-control-sm validate[required]" name="category">
                                <option  value="" selected>(請選擇)</option>
                                <option value="商品相關">商品相關</option>
                                <option value="服務相關">服務相關</option>
                                <option value="企業合作">企業合作</option>
                                <option value="其他建議">其他建議</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="textarea" class="col-sm-2 col-form-label">寶貴建議</label>
                        <div class="col-sm-10">
                            <textarea class="form-control validate[required]" name="content" rows="5"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="checkcode" class="col-sm-2 col-form-label">驗證碼</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control validate[required]" name="checkcode" autocomplete="off" placeholder="請輸入驗證碼">
                        </div>
                        <div class="col-sm-5">
                            <img style="width:30%; height: 34px; cursor:pointer" name="checkcode_img" id="checkcode_img" src="_checkcode.php">
                            <span>點擊圖片換一張</span>
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="primary-btn main-btn" onclick="form_sumbit('#data_form')">送出</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<?php include_once '_footer.php'; ?>
<?php require_once "_post_js.php"; ?>
<script>
    $(document).ready(function(){
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
    });

    function dataformajaxCallback(status,form,json,options){
        $("#checkcode").val("");
        $("#checkcode_img").click();
        if(status===true){
            if(json.sResult===true)
            {
                $("input").val("");
                $("select").val("");
                $("textarea").val("");
                swal_message("表單送出成功","謝謝您的建議，專員將儘快與您聯繫!","success",false);
            }else
                swal_message("表單送出失敗",json.msg,"error",false);

        }else{
            swal_message("表單送出失敗",json.msg,"error",false);
        }
        $(".main-btn").attr('disabled',false);
    }

    function form_sumbit(selector){
        if($("#data_form").validationEngine("validate")===true)
        {
            $(".main-btn").attr('disabled',true);
            $(selector).submit();
        }
    }

    $('#city_id').change(function(){
        RefreshArea($('#city_id').val(),null,"#area_id",null);
    });

    $('#checkcode_img').click(function(){
        $(this).attr("src","_checkcode.php?v="+(new Date().getTime())).change();
    });
</script>
<?php require_once '_foot.php'; ?>