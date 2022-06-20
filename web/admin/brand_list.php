<?PHP
require_once '_admin_head.php';

$q_name = request_str("q_name");
$q_status = request_str("q_status");
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>品牌
                            <small>列表</small>
                            <button type="button" class="btn btn-brand float-right" onclick="location.href='brand_edit.php?edit_id=0'"><span class="fas fa-plus"></span></button>
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <form name="query_form" id="query_form">
                            <div class="card-body">
                                <div class="row">
                                    <label for="q_name" class="col-md-1">名稱</label>
                                    <div class="col-md-2">
                                        <input type="text" id="q_name" name="q_name" class="form-control" value="<?= $q_name ?>">
                                    </div>
                                    <label for="q_status" class="col-md-1">狀態</label>
                                    <div class="col-md-2">
                                        <select id="q_status" name="q_status" class="form-control" style="width: 100%;">
                                            <option  value="" <?php echo ($q_status == "") ? "selected='selected'" : ""; ?>>(All)</option>
                                            <option  value="0" <?php echo ($q_status == "0") ? "selected='selected'" : ""; ?>>啟用</option>
                                            <option  value="1" <?php echo ($q_status == "1") ? "selected='selected'" : ""; ?>>停用</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="button" class="btn btn-primary float-right" onclick="query_form_sumbit('brand_list.php')"><span class="fas fa-search"></span></button>
                                <button type="button" class="btn btn-warning float-right" onclick="query_form_clear('#query_form')"><span class="fas fa-sync-alt"></span></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <table style="width: 100%" class="table table-striped table-bordered table-hover" id="table">
                                <thead>
                                    <tr>
                                        <th style="width: 10%">編號</th>
                                        <th style="width: 40%">名稱</th>
                                        <th style="width: 20%">圖片</th>
                                        <th style="width: 10%">列表順序</th>
                                        <th style="width: 10%">狀態</th>
                                        <th style="width: 10%">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<?php require_once "_admin_post_js.php"; ?>
<script>
    document.title+="-品牌";
    $(function(){
        $('#table').DataTable({
            'paging':true,
            'lengthChange':true,
            'searching':false,
            'ordering':true,
            'info':true,
            'autoWidth':true,
            'aoColumnDefs':[{'bSortable':false,'aTargets':[2,5]}],
            'sPaginationType':'full_numbers',
            'scrollX':true,
            'scrollCollapse':true,
            'pageLength':100,
            'processing':true,
            'serverSide':true,
            'oLanguage':{
                'sUrl':BASE_PATH+"/plugins/datatables/dataTables.Chinese.traditional.json",
            },
            'ajax':{
                url:GetUrl(),
                type:'POST',
                dataSrc:function(json){
                    var return_data=new Array();
                    if(json.data!=null){
                        for(var i=0;i<json.data.length;i++){
                            var row=json.data[i];

                            var pic_url="<img style='max-width:200px;' src='"+BASE_PATH+row.pic_url+"\' alt=\'"+row.pic_alt+"\'>";

                            var status={};
                            GetStatusColorString(row.status,status);
                            status="<span class='badge bg-"+status.color+"'>"+status.string+"</span>";

                            var operate="<a class='btn btn-sm btn-primary' data-title='編輯' href='brand_edit.php?edit_id="+row.id+"'><span class='fas fa-pen-square'></span></a>";
                            operate+="<a class='btn btn-sm btn-danger' data-title='刪除' onclick='delete_alert(\"品牌\","+row.id+",\""+row.name+"\",\"<?= WEBAPI_BRAND ?>\"); return false;'><span class='fas fa-trash-alt'></span></a>";

                            return_data.push({
                                'id':row.id,
                                'name':row.name,
                                'pic_url':pic_url,
                                'list_order':row.list_order,
                                'status':status,
                                'operate':operate
                            })
                        }
                    }
                    return return_data;
                }
            },
            columns:[
                {data:"id"},
                {data:"name"},
                {data:"pic_url"},
                {data:"list_order"},
                {data:"status"},
                {data:"operate"},
            ]
        })
    });

    function GetUrl()
    {
        var url="_admin_list_ajax.php?api=<?= WEBAPI_BRAND ?>";

        var query_str="";

        var q_name=$("#q_name").val().trim();
        if(q_name)
            query_str+=" AND name like '%"+q_name+"%'";

        var q_status=$("#q_status").val();
        if(q_status)
            query_str+=" AND status='"+q_status+"'";

        if(query_str!="")
            url=url+"&query="+encodeURIComponent(query_str.substr(5));

        return url;
    }
</script>
<?php require_once '_admin_foot.php'; ?>
