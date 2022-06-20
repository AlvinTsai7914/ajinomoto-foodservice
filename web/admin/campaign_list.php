<?PHP
require_once '_admin_head.php';

$q_tag_id = request_str("q_tag_id");
$q_title = request_str("q_title");
$q_status = request_str("q_status");

//查詢餐飲情報標籤
$campaign_tags = null;
if (CallAPI('GET', WEBAPI_CAMPAIGN_TAG, $_SESSION['accesstoken'], null, $resultMessage, $campaign_tags) != 200)
    $campaign_tags = null;
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>餐飲情報
                            <small>列表</small>
                            <button type="button" class="btn btn-brand float-right" onclick="location.href='campaign_edit.php?edit_id=0'"><span class="fas fa-plus"></span></button>
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
                                    <label for="q_tag_id" class="col-md-1">標籤</label>
                                    <div class="col-md-2">
                                        <select id="q_tag_id" name="q_tag_id" class="form-control" style="width: 100%;">
                                            <option  value="">(All)</option>
                                            <?php foreach ($campaign_tags as $c) { ?>
                                                <option  value="<?= $c["id"] ?>" <?php echo ($c["id"] == $q_tag_id) ? "selected='selected'" : ""; ?>><?= $c["name"] ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <label for="q_title" class="col-md-1">標題</label>
                                    <div class="col-md-2">
                                        <input type="text" id="q_title" name="q_title" class="form-control" value="<?= $q_title ?>">
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
                                <button type="button" class="btn btn-primary float-right" onclick="query_form_sumbit('campaign_list.php')"><span class="fas fa-search"></span></button>
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
                                        <th style="width: 10%">類別</th>
                                        <th style="width: 20%">標題</th>
                                        <th style="width: 20%">圖片</th>
                                        <th style="width: 10%">發佈日期</th>
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
    document.title+="-餐飲情報";
    $(function(){
        $('#table').DataTable({
            'paging':true,
            'lengthChange':true,
            'searching':false,
            'ordering':true,
            'info':true,
            'autoWidth':true,
            'aoColumnDefs':[{'bSortable':false,'aTargets':[1,3,7]}],
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
                            var tag_names=row.tag_names;
                            if(tag_names!==null)
                                tag_names=tag_names.replace(/,/g,"</br>");

                            var release_date=GetDateString(row.release_date);

                            var pic_url="<img style='max-width:200px;' src='"+BASE_PATH+row.pic_url+"\' alt=\'"+row.pic_alt+"\'>";

                            var status={};
                            GetStatusColorString(row.status,status);
                            status="<span class='badge bg-"+status.color+"'>"+status.string+"</span>";

                            var operate="<a class='btn btn-sm btn-primary' data-title='編輯' href='campaign_edit.php?edit_id="+row.id+"'><span class='fas fa-pen-square'></span></a>";
                            operate+="<a class='btn btn-sm btn-danger' data-title='刪除' onclick='delete_alert(\"餐飲情報\","+row.id+",\""+row.title+"\",\"<?= WEBAPI_CAMPAIGN ?>\"); return false;'><span class='fas fa-trash-alt'></span></a>";

                            return_data.push({
                                'id':row.id,
                                'tag':tag_names,
                                'title':row.title,
                                'pic_url':pic_url,
                                'release_date':release_date,
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
                {data:"tag"},
                {data:"title"},
                {data:"pic_url"},
                {data:"release_date"},
                {data:"list_order"},
                {data:"status"},
                {data:"operate"},
            ]
        })
    });

    function GetUrl()
    {
        var url="_admin_list_ajax.php?api=<?= WEBAPI_CAMPAIGN ?>";

        var query_str="";

        var q_tag_id=$("#q_tag_id").val().trim();
        if(q_tag_id)
            query_str+=" AND tag_ids like '%"+q_tag_id+"%'";

        var q_title=$("#q_title").val().trim();
        if(q_title)
            query_str+=" AND title like '%"+q_title+"%'";

        var q_status=$("#q_status").val();
        if(q_status)
            query_str+=" AND status='"+q_status+"'";

        if(query_str!="")
            url=url+"&query="+encodeURIComponent(query_str.substr(5));

        return url;
    }
</script>
<?php require_once '_admin_foot.php'; ?>
