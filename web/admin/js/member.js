function send_verification_alert(id,account,url){
    var text="確定要發送帳號驗證信給 ("+id+")"+account+"?";
    var id=id.toString().replace(/-/g,"");
    swal(
            {
                title:"發送帳號驗證信",
                text:text,
                type:"warning",
                showCancelButton:true,
                confirmButtonClass:"btn-danger",
                confirmButtonText:"確定!",
                cancelButtonText:"取消",
                closeOnConfirm:false
            },
            function(){
                var jsondata={account:account};
                var url="../ajax/member_sendverification.php";
                var result=new Object();
                if(AJAX(url,"POST",jsondata,result)===true){
                    var result=JSON.parse(result.data);
                    if(result.result===true)
                        swal(account,result.msg,"success");
                    else
                        swal(account,result.msg,"error");
                }else
                    swal("帳號驗證信發送失敗","AJAX錯誤","error");
            }
    );
}

function send_setpassword_alert(id,account,url){
    var text="確定要發送重設密碼信給 ("+id+")"+account+"?";
    var id=id.toString().replace(/-/g,"");
    swal(
            {
                title:"發送重設密碼信",
                text:text,
                type:"warning",
                showCancelButton:true,
                confirmButtonClass:"btn-danger",
                confirmButtonText:"確定!",
                cancelButtonText:"取消",
                closeOnConfirm:false
            },
            function(){
                var jsondata={account:account};
                var url="../ajax/member_forgetpassword.php";
                var result=new Object();
                if(AJAX(url,"POST",jsondata,result)===true){
                    var result=JSON.parse(result.data);
                    if(result.result===true)
                        swal(account,result.msg,"success");
                    else
                        swal(account,result.msg,"error");
                }else
                    swal("重設密碼信發送失敗","AJAX錯誤","error");
            }
    );
}