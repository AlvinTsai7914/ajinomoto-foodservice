function AJAX(url,type,jsondata,resultdata){
    var returnFlag=false;
    $.ajax({
        url:url,
        type:type,
        data:jsondata,
        async:false,
        success:function(result){
            resultdata.data=result;
            returnFlag=true;
        },
        error:function(xhr,ajaxOptions,thrownError){
            //alert(xhr.responseText);
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
        var url="webapi/cityarea/area"+"/?city_id="+city_id;
        var result=new Object();
        if(AJAX(url,"GET",null,result)===true)
        {
            var len=result.data.ResultData.length;
            var items=result.data.ResultData;
            for(i=0;i<len;i++){
                newitem+="<option value="+items[i]["area_id"]+">";
                newitem+=items[i]["area_name"];
                newitem+="</option>";

                if(items[i]["area_id"]===old_city_id)
                {
                    find=true;
                    zipcode=items[i]["zipcode"];
                }
            }
        }
    }

    $(area_target).html(newitem).trigger('select2:select').change();

    if(find==true)
    {
        $(area_target).val(old_city_id).change();
        $(zipcode_target).val(zipcode).change();
    }
}

$("#search-btn").click(function(){
    var word=$("#search-box").val();
    if(word!=="")
        window.location=encodeURI("search.php?key="+word);
    return false;
});

$("#search-box").change(function(){
    event.preventDefault();
    var word=$("#search-box").val();
    if(word!=="")
        window.location=encodeURI("search.php?key="+word);
    return false;
});

$(document).ready(function(){
    $(window).keydown(function(event){
        if(event.keyCode===13){
            event.preventDefault();
            return false;
        }
    });
});
