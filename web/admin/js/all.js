$('input[type="checkbox"].square-red, input[type="radio"].square-red').iCheck({
    checkboxClass:'icheckbox_square-red',
    radioClass:'iradio_square-red'
})

$('.date-picker').daterangepicker({
    singleDatePicker:true,
    showDropdowns:true,
    timePicker:false,
    autoApply:true,
    minDate:"1910/01/01",
    locale:{
        format:"YYYY/MM/DD",
        applyLabel:"確定",
        cancelLabel:"取消",
        fromLabel:"開始日期",
        toLabel:"結束日期",
        customRangeLabel:"自訂日期區間",
        daysOfWeek:["日","一","二","三","四","五","六"],
        monthNames:["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],
        firstDay:0
    }
});

$('.select2').select2();

$(".look_password_btn").click(function(){
    var input=$(this).closest(".input-group").children("input");
    if(input)
    {
        if(input.attr("type")=="password")
        {
            input.attr("type","text");
            $(this).empty();
            $(this).append("<i class='fas fa-eye-slash'></i>");
        }else
        {
            input.attr("type","password");
            $(this).empty();
            $(this).append("<i class='fas fa-eye'></i>");
        }
    }
    return false;
});

function query_form_clear(selector){
    $(selector).find("input").val("");
    $(selector).find("select").val("");
}

function query_form_sumbit(url){
    var f=document.query_form;
    f.action=url;
    f.submit();
}

function form_sumbit(selector){
    for(instance in CKEDITOR.instances){
        CKEDITOR.instances[instance].updateElement();
    }
    $(selector).submit();
}

function validate_form_sumbit(selector){
    for(instance in CKEDITOR.instances){
        CKEDITOR.instances[instance].updateElement();
    }

    $(selector).removeClass('validating');
    if($(selector).validationEngine('validate')===true)
    {
        $(".submit_btn").attr('disabled',true);
        $(selector).submit();
    }
}

function validate_form_sumbit_result(selector){
    $(".submit_btn").attr('disabled',false);
}

function GetStatusColorString(status,object)
{
    switch(status){
        case "0":
            object.color="success";
            object.string="啟用";
            break;
        case "1":

            object.color="danger";
            object.string="停用";
            break;
        default:
            object.color="warning";
            object.string="未知";
            break;
    }
}

function GetMemberOnlyColorString(member_only,object)
{
    switch(member_only){
        case "0":
            object.color="success";
            object.string="否";
            break;
        case "1":

            object.color="danger";
            object.string="是";
            break;
        default:
            object.color="warning";
            object.string="未知";
            break;
    }
}


function GetMemberStatusColorString(status,object)
{
    switch(status){
        case "0":
            object.color="success";
            object.string="啟用";
            break;
        case "1":
            object.color="warning";
            object.string="尚未驗證";
            break;
        case "2":
            object.color="danger";
            object.string="停用";
            break;
        default:
            object.color="gray";
            object.string="未知";
            break;
    }
}

function GetMemberGenderString(gender)
{
    switch(gender){
        default:
        case "0":
            return "未知";
        case "1":
            return "男";
        case "2":
            return "女";
    }
}

function GetDateString(date)
{
    var d=new Date(date);
    var curr_date=d.getDate();
    var curr_month=d.getMonth()+1;
    var curr_year=d.getFullYear();

    if(isNaN(curr_year)||isNaN(curr_month)||isNaN(curr_year))
        return "";

    return curr_year+"/"+curr_month+"/"+curr_date;
}

function GetDateTimeString(date)
{
    var d=new Date(date);
    var curr_date=d.getDate();
    var curr_month=d.getMonth()+1;
    var curr_year=d.getFullYear();
    var curr_hour=d.getHours();
    var curr_minute=d.getMinutes();
    var curr_second=d.getSeconds();

    if(isNaN(curr_year)||isNaN(curr_month)||isNaN(curr_year)||isNaN(curr_hour)||isNaN(curr_minute)||isNaN(curr_second))
        return "";

    return curr_year+"/"+curr_month+"/"+curr_date+" "+curr_hour+":"+curr_minute+":"+curr_second;
}

function delete_alert(title,id,name,url){
    var text="確定要刪除 ("+id+")"+name+"?";
    var id=id.toString().replace(/-/g,"");
    swal(
            {
                title:"刪除"+title,
                text:text,
                type:"warning",
                showCancelButton:true,
                confirmButtonClass:"btn-danger",
                confirmButtonText:"確定!",
                cancelButtonText:"取消",
                closeOnConfirm:false
            },
            function(){
                $.ajax({
                    url:"_admin_del_ajax.php",
                    type:"POST",
                    data:"delete_url="+url+"/"+id,
                    dataType:"json",
                    success:function(json){
                        if(json.sResult==true){
                            swal({
                                title:"刪除成功",
                                text:"("+id+")"+name+"-已刪除",
                                type:"success",
                                showCancelButton:false,
                                confirmButtonClass:"btn-primary",
                                confirmButtonText:"確定",
                                closeOnConfirm:false
                            },
                                    function(){
                                        location.reload();
                                    });
                        }else{
                            swal({
                                title:"刪除失敗",
                                text:json.msg,
                                type:"warning",
                                showCancelButton:false,
                                confirmButtonClass:"btn-danger",
                                confirmButtonText:"確定",
                                closeOnConfirm:false
                            },
                                    function(){
                                        location.reload();
                                    });
                        }
                    },
                    error:function(){
                        swal("刪除資料發生錯誤","請再試一次","失敗");
                    }
                });
            }
    );
}

function success_alert(title,url){
    swal({title:title+"成功",type:"success",confirmButtonText:"OK"},
            function(){
                if(url!=="")
                    location.href=url;
            });
}

function error_alert(title)
{
    swal({title:title,type:"error",confirmButtonText:"OK"});
}

function AJAX(url,type,jsondata,resultdata){
    $("#LoadingDialog").modal("show");

    var returnFlag=false;
    $.ajax({
        url:url,
        type:type,
        data:jsondata,
        async:false,
        success:function(result){
            $("#LoadingDialog").modal("hide");
            resultdata.data=result;
            returnFlag=true;
        },
        error:function(xhr,ajaxOptions,thrownError){
            //alert(xhr.responseText);
            $("#LoadingDialog").modal("hide");
            resultdata.data=xhr.responseText;
            returnFlag=false;
        }
    });
    return returnFlag;
}

//依據縣市編號更新郵遞區號、鄉鎮市區
function RefreshArea(city_id,old_city_id,area_target,zipcode_target){
    var newitem="";
    var find=false;
    if(city_id)
    {
        var zipcode="";
        var url="../webapi/cityarea/area"+"/?city_id="+city_id;
        var result=new Object();
        if(AJAX(url,"GET",null,result)==true)
        {
            var len=result.data.ResultData.length;
            var items=result.data.ResultData;
            for(i=0;i<len;i++){
                newitem+="<option value="+items[i]["area_id"]+">";
                newitem+=items[i]["area_name"];
                newitem+="</option>";

                if(items[i]["area_id"]==old_city_id)
                {
                    find=true;
                    zipcode=items[i]["zipcode"];
                }
            }
        }
    }

    if(newitem==="")
        newitem='<option  value="">(請選擇)</option>';

    $(zipcode_target).val("");
    $(area_target).html(newitem).trigger('select2:select').change();

    if(find==true)
    {
        $(area_target).val(old_city_id).change();
        $(zipcode_target).val(zipcode).change();
    }
}

//依據縣市編號更新郵遞區號、鄉鎮市區
function RefreshZipcode(area_id,target){
    if(!area_id)
        return;
    url="../webapi/cityarea/area"+"/?id="+area_id;
    var result=new Object();
    if(AJAX(url,"GET",null,result)==true)
    {
        var len=result.data.ResultData.length;
        var items=result.data.ResultData;
        if(len>0)
            $(target).val(items[0]["zipcode"]);
        else
            $(target).val("");
    }
}