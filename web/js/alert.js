$(document).on('click','.checkcode_img',function(e){
    $(this).attr("src","_checkcode.php?v="+(new Date().getTime())).change();
});

$(document).on('change','#restaurant_city_id',function(e){
    RefreshArea($('#restaurant_city_id').val(),$("#restaurant_area_id").val(),"#restaurant_area_id","#restaurant_zipcode");
});

// alert 會員登入
function AlertLogin(){
    var html='<div class="inner p-tb50 bg-Light">'+
            '<div class="container">'+
            '<form id="login_form" class="form-horizontal form-box">'+
            '<div class="form-group row">'+
            '<label for="account" class="col-sm-4 col-form-label">帳號</label>'+
            '<div class="col-sm-8">'+
            '<input type="email" class="form-control form-control-sm  validate[required,custom[email]]" name="account" id="account" placeholder="請輸入電子信箱">'+
            '</div>'+
            '</div>'+
            '<div class="form-group row">'+
            '<label for="password" class="col-sm-4 col-form-label">密碼</label>'+
            '<div class="col-sm-8">'+
            '<input type="password" class="form-control form-control-sm validate[required, minSize[8]]" name="password" id="password" autocomplete="off" placeholder="請輸入密碼">'+
            '</div>'+
            '</div>'+
            '<div class="form-group row">'+
            '<label for="checkcode" class="col-sm-4 col-form-label">驗證碼</label>'+
            '<div class="col-sm-8">'+
            '<input type="text" class="form-control form-control-sm validate[required]" name="checkcode" id="checkcode" autocomplete="off" placeholder="請輸入驗證碼">'+
            '</div>'+
            '</div>'+
            '<div class="form-group row">'+
            '<p class="col-sm-4 col-form-label"></p>'+
            '<div class="col-sm-8">'+
            '<img class="checkcode_img" style="width: 150px; height: 38px;" src="_checkcode.php">'+
            '<span class="col text-right">'+'點擊圖片換一張'+'</span>'+
            '</div>'+
            '</div>'+
            '<div class="form-group row">'+
            '<p class="col-sm-4 col-form-label"></p>'+
            '<div class="col-sm-8">'+
            '<a href="#" onclick="AlertSignUp()">'+'註冊會員'+'</a>'+
            '<a href="#" onclick="AlertForgetPassword();">'+'忘記密碼'+'</a>'+
            '<a href="#" onclick="AlertSendVerification()">'+'重寄驗證信'+'</a>'+
            '</div>'+
            '</div>'+
            '</form>'+
            '</div>'+
            '</div>';
    Swal.fire({
        title:'會員登入',
        html:html,
        background:'#f7f7f7',
        reverseButtons:true,
        allowOutsideClick:false,
        buttonsStyling:false,
        confirmButtonText:'登入',
        confirmButtonClass:'primary-btn m-lr20',
        showCancelButton:true,
        cancelButtonText:'取消',
        cancelButtonClass:'cancel-btn primary-btn m-lr20',
        preConfirm:function(){
            $('#login_form').validationEngine('attach',{
                promptPosition:'bottomLeft',
                scroll:false,
                maxErrorsPerField:1,
                showOneMessage:false,
                addFailureCssClassToField:'formError-border_red',
                autoHidePrompt:false,
                autoHideDelay:3000,
                validateNonVisibleFields:false
            });
            if($('#login_form').validationEngine('validate')===false)
                return false;
            else
            {
                var account=$('#account').val();
                var password=$('#password').val();
                var checkcode=$('#checkcode').val();
                var jsondata={account:account,password:password,checkcode:checkcode};
                var url='ajax/member_login.php';
                var result=new Object();
                if(AJAX(url,'POST',jsondata,result))
                {
                    result=JSON.parse(result.data);
                    if(result.result===true)
                    {
                        Swal.fire({
                            title:'會員登入成功',
                            type:'success',
                            buttonsStyling:false,
                            confirmButtonText:'確認',
                            confirmButtonClass:'primary-btn m-lr20',
                        }).then(function(){
                            window.location.reload();
                        })
                        return false;
                    }else
                    {
                        Swal.showValidationMessage(result.msg);
                        return false;
                    }
                }else
                {
                    Swal.showValidationMessage('未知的錯誤');
                    return false;
                }
            }
        }
    })
}

//alert 會員登出
function AlertLogout(){
    Swal.fire({
        title:'會員登出',
        html:'確定要登出嗎?',
        background:'#f7f7f7',
        reverseButtons:true,
        allowOutsideClick:false,
        buttonsStyling:false,
        confirmButtonText:'登出',
        confirmButtonClass:'primary-btn m-lr20',
        showCancelButton:true,
        cancelButtonText:'取消',
        cancelButtonClass:'cancel-btn primary-btn m-lr20',
    }).then(function(result){
        if(result.value===true)
        {
            var url='ajax/member_logout.php';
            var result=new Object();
            AJAX(url,'POST',null,result);
            window.location.reload();
        }
    })
}

// alert 註冊會員
function AlertSignUp(){
    console.log("A");
    var url='ajax/get_privacy_ajax.php';
    var result=new Object();
    AJAX(url,'POST',null,result);
    var privacy_html=JSON.parse(result.data).msg;
    privacy_html="<h3>隱私權條款</h3>"+privacy_html;
    var url='ajax/get_member-terms_ajax.php';
    var result=new Object();
    AJAX(url,'POST',null,result);
    var terms_html=JSON.parse(result.data).msg;
    terms_html="<h3>會員服務條款</h3>"+terms_html;
    var html='<div class="inner p-tb50 bg-Light">'+
            '<div class="container">'+
            '<form id="signup_form" class="form-horizontal form-box" method="post">'+
            '<div class="form-box">'+
            '<h4 class="third-title m-b20"><img src="img/baker.svg">個人資訊</h4>'+
            '<div class="form-group row">'+
            '<label for="name" class="col-sm-2 col-form-label">真實姓名</label>'+
            '<div class="col-sm-7">'+
            '<input type="name" class="form-control form-control-sm validate[required]" name="name" id="name" placeholder="請輸入姓名">'+
            '</div>'+
            '<div class="col-sm-3">'+
            '<div class="form-check form-check-inline">'+
            '<input class="form-check-input" type="radio" name="gender" value="1" checked="">'+
            '<label class="form-check-label" for="gender">先生</label>'+
            '</div>'+
            '<div class="form-check form-check-inline">'+
            '<input class="form-check-input" type="radio" name="gender" value="2">'+
            '<label class="form-check-label" for="gender">小姐</label>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-group row">'+
            '<label for="account" class="col-sm-2 col-form-label">帳號</label>'+
            '<div class="col-sm-10">'+
            '<input type="email" class="form-control form-control-sm  validate[required,custom[email]]" name="account" id="account" placeholder="請輸入電子信箱">'+
            '</div>'+
            '</div>'+
            '<div class="form-group row">'+
            '<label for="phone" class="col-sm-2 col-form-label">聯絡電話</label>'+
            '<div class="col-sm-10">'+
            '<input type="tel" class="form-control form-control-sm  validate[required,custom[phone]]" name="phone" id="phone" placeholder="請輸入聯絡電話">'+
            '</div>'+
            '</div>'+
            '<div class="form-group row">'+
            '<label for="password" class="col-sm-2 col-form-label">輸入密碼</label>'+
            '<div class="col-sm-10">'+
            '<input type="password" class="form-control form-control-sm validate[required, minSize[8]]" name="password" id="password" autocomplete="off" placeholder="請輸入密碼，英數組合，最少8碼">'+
            '</div>'+
            '</div>'+
            '<div class="form-group row">'+
            '<label for="passwordAgain" class="col-sm-2 col-form-label">確認密碼</label>'+
            '<div class="col-sm-10">'+
            '<input type="password" class="form-control form-control-sm validate[required,equals[password]]" name="passwordAgain" autocomplete="off" placeholder="請輸入密碼">'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="form-box m-t50">'+
            '<h4 class="third-title m-b20"><img src="img/bakery.svg">餐廳資訊</h4>'+
            '<div class="form-group row">'+
            '<label for="restaurant_name" class="col-sm-2 col-form-label">餐廳名稱</label>'+
            '<div class="col-sm-10">'+
            '<input type="text" class="form-control form-control-sm validate[required]" name="restaurant_name" id="restaurant_name" placeholder="請輸入餐廳名稱">'+
            '</div>'+
            '</div>'+
            '<div class="form-group row">'+
            '<label for="restaurant_city_id" class="col-sm-2 col-form-label">縣/市</label>'+
            '<div class="col-sm-10">'+
            '<select id="restaurant_city_id" class="form-control form-control-sm">'+
            '<option value="" selected="selected">(請選擇)</option>'+
            '<option value="1">基隆市</option>'+
            '<option value="2">台北市</option>'+
            '<option value="3">新北市</option>'+
            '<option value="4">桃園市</option>'+
            '<option value="5">新竹市</option>'+
            '<option value="6">新竹縣</option>'+
            '<option value="7">宜蘭縣</option>'+
            '<option value="8">苗栗縣</option>'+
            '<option value="9">台中市</option>'+
            '<option value="10">彰化縣</option>'+
            '<option value="11">南投縣</option>'+
            '<option value="12">雲林縣</option>'+
            '<option value="13">嘉義市</option>'+
            '<option value="14">嘉義縣</option>'+
            '<option value="15">台南市</option>'+
            '<option value="16">高雄市</option>'+
            '<option value="17">屏東縣</option>'+
            '<option value="18">澎湖縣</option>'+
            '<option value="19">花蓮縣</option>'+
            '<option value="20">台東縣</option>'+
            '<option value="21">金門縣</option>'+
            '<option value="22">連江縣</option>'+
            '</select>'+
            '</div>'+
            '</div>'+
            '<div class="form-group row">'+
            '<label for="restaurant_area_id" class="col-sm-2 col-form-label">鄉/鎮/區/市</label>'+
            '<div class="col-sm-10">'+
            '<select id="restaurant_area_id" name="restaurant_area_id" id="restaurant_area_id" class="form-control form-control-sm">'+
            '<option  value="">(請選擇)</option>'+
            '</select>'+
            '</div>'+
            '</div>'+
            '<div class="form-group row">'+
            '<label for="restaurant_type" class="col-sm-2 col-form-label">經營型態</label>'+
            '<div class="col-sm-10">'+
            '<select class="form-control form-control-sm" name="restaurant_type" id="restaurant_type">'+
            '<option value="中式" selected="">中式</option>'+
            '<option value="日式">日式</option>'+
            '<option value="西式">西式</option>'+
            '<option value="火鍋">火鍋</option>'+
            '<option value="複合">複合</option>'+
            '<option value="素食">素食</option>'+
            '<option value="連鎖體系">連鎖體系</option>'+
            '</select>'+
            '</div>'+
            '</div>'+
            '<div class="form-check form-check-inline">'+
            '<input class="form-check-input validate[required] checkbox" type="checkbox" id="agree" name="agree"/>'+
            '<label class="form-check-label" for="checkbox">我已閱讀並同意<a href="#"  data-toggle="modal" data-target="#terms_modal" data-backdrop="static" data-keyboard="false">會員條款</a>及'+
            '<a href="#"  data-toggle="modal" data-target="#privacy_modal" data-backdrop="static" data-keyboard="false">個人資料保護政策</a></label>'+
            '</div>'+
            '</form>'+
            '</div>'+
            '</div>'+
            '<div class="modal fade" id="privacy_modal" tabindex="-1" role="dialog" aria-hidden="true">'+
            '<div class="modal-dialog modal-dialog-centered modal-xl" style="min-width:60%" role="document">'+
            '<div class="modal-content">'+
            '<div class="modal-body member-page">'+
            privacy_html+
            '</div>'+
            '<div class="modal-footer">'+
            '<button type="button" class="primary-btn" data-dismiss="modal">確認</button>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '<div class="modal fade" id="terms_modal" tabindex="-1" role="dialog" aria-hidden="true">'+
            '<div class="modal-dialog modal-dialog-centered modal-xl" style="min-width:60%" role="document">'+
            '<div class="modal-content">'+
            '<div class="modal-body member-page">'+
            '<div class="container">'+
            terms_html+
            '</div>'+
            '</div>'+
            '<div class="modal-footer">'+
            '<button type="button" class="primary-btn" data-dismiss="modal">確認</button>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</div>';
    Swal.fire({
        title:'會員註冊',
        html:html,
        background:'#f7f7f7',
        reverseButtons:true,
        allowOutsideClick:false,
        buttonsStyling:false,
        confirmButtonText:'註冊',
        confirmButtonClass:'primary-btn m-lr20',
        showCancelButton:true,
        cancelButtonText:'取消',
        cancelButtonClass:'cancel-btn primary-btn m-lr20',
        customClass:'swal-wide',
        preConfirm:function(){
            $('#signup_form').validationEngine('attach',{
                promptPosition:'bottomLeft',
                scroll:false,
                maxErrorsPerField:1,
                showOneMessage:false,
                addFailureCssClassToField:'formError-border_red',
                autoHidePrompt:false,
                autoHideDelay:3000,
                validateNonVisibleFields:false
            });
            if($('#signup_form').validationEngine('validate')===false)
                return false;
            else
            {
                var account=$('#account').val();
                var password=$('#password').val();
                var name=$('#name').val();
                var gender=$('input[name=gender]:checked').val();
                var phone=$('#phone').val();
                var restaurant_name=$('#restaurant_name').val();
                var restaurant_area_id=$('#restaurant_area_id').val();
                var restaurant_type=$('#restaurant_type').val();
                var jsondata={account:account,password:password,name:name,gender:gender,phone:phone,restaurant_name:restaurant_name,restaurant_area_id:restaurant_area_id,restaurant_type:restaurant_type};
                var url='ajax/member_signup.php';
                var result=new Object();
                if(AJAX(url,'POST',jsondata,result))
                {
                    result=JSON.parse(result.data);
                    if(result.result===true)
                    {
                        Swal.fire({
                            title:'會員註冊成功',
                            text:result.msg,
                            type:'success',
                            buttonsStyling:false,
                            confirmButtonText:'確認',
                            confirmButtonClass:'primary-btn m-lr20',
                        }).then(function(){
                            window.location.reload();
                        })
                        return false;
                    }else
                    {
                        Swal.showValidationMessage(result.msg);
                        return false;
                    }
                }else
                {
                    Swal.showValidationMessage('未知的錯誤');
                    return false;
                }
            }
        }
    })
}


$(document).on('shown.bs.modal','#privacy_modal, #terms_modal',function(e){
    $(".swal2-actions").hide();
})

$(document).on('hidden.bs.modal','#privacy_modal, #terms_modal',function(e){
    $(".swal2-actions").show();
})

// alert 忘記密碼
function AlertForgetPassword(){
    var html='<form id="forgetpassword_form" class="form-horizontal form-box">'+
            '<div class="form-group text-center">'+
            '<label class="d-block text-left" for="account">'+'帳號'+'</label>'+
            '<input type="email" class="form-control text-left validate[required,custom[email]]" id="account" name="account" placeholder="'+'帳號'+'" onkeypress="if (event.keyCode == 13) {return false;}" autocomplete="off">'+
            '<div class="messages text-danger"></div>'+
            '</div>'+
            '</form>';
    Swal.fire({
        title:'忘記密碼',
        html:html,
        background:'#f7f7f7',
        reverseButtons:true,
        allowOutsideClick:false,
        buttonsStyling:false,
        confirmButtonText:'確認',
        confirmButtonClass:'primary-btn m-lr20',
        showCancelButton:true,
        cancelButtonText:'取消',
        cancelButtonClass:'cancel-btn primary-btn m-lr20',
        preConfirm:function(){
            $('#forgetpassword_form').validationEngine('attach',{
                promptPosition:'bottomLeft',
                scroll:false,
                maxErrorsPerField:1,
                showOneMessage:false,
                addFailureCssClassToField:'formError-border_red',
                autoHidePrompt:false,
                autoHideDelay:3000,
                validateNonVisibleFields:false
            });
            if($('#forgetpassword_form').validationEngine('validate')===false)
                return false;
            else
            {
                var account=$('#account').val();
                var jsondata={account:account};
                var url='ajax/member_forgetpassword.php';
                var result=new Object();
                if(AJAX(url,'POST',jsondata,result))
                {
                    result=JSON.parse(result.data);
                    if(result.result===true)
                    {
                        Swal.fire({
                            title:'發送密碼重設信成功',
                            text:result.msg,
                            type:'success',
                            buttonsStyling:false,
                            confirmButtonText:'確認',
                            confirmButtonClass:'primary-btn m-lr20',
                        }).then(function(){
                            window.location.reload();
                        })
                        return false;
                    }else
                    {
                        Swal.showValidationMessage(result.msg);
                        return false;
                    }
                }else
                {
                    Swal.showValidationMessage('未知的錯誤');
                    return false;
                }
            }
        }
    })
}

// alert 重發驗證信
function AlertSendVerification(){
    var html='<form id="sendverification_form" class="form-horizontal form-box"'+
            '<div class="form-group text-center">'+
            '<label class="d-block text-left" for="email">'+'帳號'+'</label>'+
            '<input type="email" class="form-control text-left validate[required,custom[email]]" id="account" name="account" placeholder="'+'帳號'+'" onkeypress="if (event.keyCode == 13) {return false;}" autocomplete="off">'+
            '<div class="messages text-danger"></div>'+
            '</div>'+
            '</form>';
    Swal.fire({
        title:'重寄驗證信',
        html:html,
        background:'#f7f7f7',
        reverseButtons:true,
        allowOutsideClick:false,
        buttonsStyling:false,
        confirmButtonText:'確認',
        confirmButtonClass:'primary-btn m-lr20',
        showCancelButton:true,
        cancelButtonText:'取消',
        cancelButtonClass:'cancel-btn primary-btn m-lr20',
        preConfirm:function(){
            $('#sendverification_form').validationEngine('attach',{
                promptPosition:'bottomLeft',
                scroll:false,
                maxErrorsPerField:1,
                showOneMessage:false,
                addFailureCssClassToField:'formError-border_red',
                autoHidePrompt:false,
                autoHideDelay:3000,
                validateNonVisibleFields:false
            });
            if($('#sendverification_form').validationEngine('validate')===false)
                return false;
            else
            {
                var account=$('#account').val();
                var jsondata={account:account};
                var url='ajax/member_sendverification.php';
                var result=new Object();
                if(AJAX(url,'POST',jsondata,result))
                {
                    result=JSON.parse(result.data);
                    if(result.result===true)
                    {
                        Swal.fire({
                            title:'重寄驗證信成功',
                            text:result.msg,
                            type:'success',
                            buttonsStyling:false,
                            confirmButtonText:'確認',
                            confirmButtonClass:'primary-btn m-lr20',
                        }).then(function(){
                            window.location.reload();
                        })
                        return false;
                    }else
                    {
                        Swal.showValidationMessage(result.msg);
                        return false;
                    }
                }else
                {
                    Swal.showValidationMessage('未知的錯誤');
                    return false;
                }
            }
        }
    });
}

function goto_recipepro_detail(recipepro_id,member_only)
{
    if(member_only==true&&MEMBER_LOGIN==false)
    {
        Swal.fire({
            title:'會員限定',
            html:'請先登入會員',
            background:'#f7f7f7',
            reverseButtons:true,
            allowOutsideClick:false,
            buttonsStyling:false,
            confirmButtonText:'確認',
            confirmButtonClass:'primary-btn m-lr20',
            showCancelButton:true,
            cancelButtonText:'取消',
            cancelButtonClass:'cancel-btn primary-btn m-lr20',
        }).then(function(result){
            if(result.value===true)
                AlertLogin();
        })
    }else
        location.href="recipepro-detail.php?id="+recipepro_id;
}

function goto_higi_detail(higi_id,member_only)
{
    if(member_only==true&&MEMBER_LOGIN==false)
    {
        Swal.fire({
            title:'會員限定',
            html:'請先登入會員',
            background:'#f7f7f7',
            reverseButtons:true,
            allowOutsideClick:false,
            buttonsStyling:false,
            confirmButtonText:'確認',
            confirmButtonClass:'primary-btn m-lr20',
            showCancelButton:true,
            cancelButtonText:'取消',
            cancelButtonClass:'cancel-btn primary-btn m-lr20',
        }).then(function(result){
            if(result.value===true)
                AlertLogin();
        })
    }else
        location.href="skill-detail.php?id="+higi_id;
}

function login_member_first()
{
    Swal.fire({
        title:'加入我的最愛',
        html:'請先登入會員',
        background:'#f7f7f7',
        reverseButtons:true,
        allowOutsideClick:false,
        buttonsStyling:false,
        confirmButtonText:'確認',
        confirmButtonClass:'primary-btn m-lr20',
        showCancelButton:true,
        cancelButtonText:'取消',
        cancelButtonClass:'cancel-btn primary-btn m-lr20',
    }).then(function(result){
        if(result.value===true)
            AlertLogin();
    })
}

//加入/移除我的最愛
$(".icon-like, .icon-dislike").click(function(){
    var source=$(this).data("source");
    var id=$(this).data("id");

    if((source!=="recipepro"&&source!=="higi")||id===null)
        return true;
    var ret=false;
    if(source==="recipepro"){
        if($(this).hasClass("icon-like"))
            ret=AlertLoginMemberRecipePro("DELETE",id);
        else
            ret=AlertLoginMemberRecipePro("POST",id);
    }else
    {
        if($(this).hasClass("icon-like"))
            ret=AlertLoginMemberHigi("DELETE",id);
        else
            ret=AlertLoginMemberHigi("POST",id);
    }

    if(ret===true){
        $(this).toggleClass('icon-like');
        $(this).toggleClass('icon-dislike');
    }
    return false;
});

//alert 新增/刪除招客秘笈
function AlertLoginMemberHigi(type,id)
{
    if(type==null||id==null)
        return false;

    var jsondata={type:type,higi_id:id};
    var result=new Object();
    var url="ajax/member_skill_edit_ajax.php";
    if(AJAX(url,'POST',jsondata,result))
    {
        result=JSON.parse(result.data);
        if(result.result===true)
        {
            var text="加入我的最愛成功";
            if(type=='DELETE')
                text="移除我的最愛成功";

            Swal.fire({
                title:"招客秘笈",
                text:text,
                type:'success',
                buttonsStyling:false,
                confirmButtonText:'確認',
                confirmButtonClass:'primary-btn m-lr20',
            })
            return true;
        }else
        {
            Swal.showValidationMessage(result.msg);
            return false;
        }
    }else
    {
        Swal.showValidationMessage('未知的錯誤');
        return false;
    }
}

//alert 新增/刪除專業食譜
function AlertLoginMemberRecipePro(type,id)
{
    if(type==null||id==null)
        return false;

    var jsondata={type:type,recipepro_id:id};
    var result=new Object();
    var url="ajax/member_recipepro_edit_ajax.php";
    if(AJAX(url,'POST',jsondata,result))
    {
        result=JSON.parse(result.data);
        if(result.result===true)
        {
            var text="加入我的最愛成功";
            if(type=='DELETE')
                text="移除我的最愛成功";

            Swal.fire({
                title:"專業食譜",
                text:text,
                type:'success',
                buttonsStyling:false,
                confirmButtonText:'確認',
                confirmButtonClass:'primary-btn m-lr20',
            })
            return true;
        }else
        {
            Swal.showValidationMessage(result.msg);
            return false;
        }
    }else
    {
        Swal.showValidationMessage('未知的錯誤');
        return false;
    }
}


function swal_message(title,text,type,reload){
    Swal.fire({
        title:title,
        text:text,
        type:type,
        background:'#f7f7f7',
        reverseButtons:true,
        allowOutsideClick:false,
        buttonsStyling:false,
        confirmButtonText:'確認',
        confirmButtonClass:'primary-btn m-lr20',
    }).then(function(){
        if(reload===true)
            window.location.reload();
    })
}
