<?PHP
require_once '_admin_head.php';

$q_category_id = request_str("q_category_id");
$q_name = request_str("q_name");
$q_status = request_str("q_status");

//查詢商品類別
$product_categorys = null;
if (CallAPI('GET', WEBAPI_PRODUCTCATEGORY, $_SESSION['accesstoken'], null, $resultMessage, $product_categorys) != 200)
    $product_categorys = null;
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>商品
                            <small>列表</small>
                            <button type="button" class="btn btn-brand float-right" onclick="location.href = 'template_edit.php?edit_id=0'"><span class="fas fa-plus"></span></button>
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
                                    <label for="q_category_id" class="col-md-1">商品類別</label>
                                    <div class="col-md-2">
                                        <select id="q_category_id" name="q_category_id" class="form-control" style="width: 100%;">
                                            <option  value="">(All)</option>
                                            <?php foreach ($product_categorys as $c) { ?>
                                                <option  value="<?= $c["id"] ?>" <?php echo ($c["id"] == q_category_id) ? "selected='selected'" : ""; ?>><?= $c["name"] ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>

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
                                <button type="button" class="btn btn-primary float-right" onclick="query_form_sumbit('template_list.php')"><span class="fas fa-search"></span></button>
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
                                        <th style="width: 10%">商品類別</th>
                                        <th style="width: 20%">名稱</th>
                                        <th style="width: 20%">代表圖片</th>
                                        <th style="width: 10%">新品上市</th>
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
    document.title += "-商品類別";
    $(function () {
        $('#table').DataTable({
            'paging': true,
            'lengthChange': true,
            'searching': false,
            'ordering': true,
            'info': true,
            'autoWidth': true,
            'aoColumnDefs': [{'bSortable': false, 'aTargets': [4, 7]}],
            'sPaginationType': 'full_numbers',
            'scrollX': true,
            'scrollCollapse': true,
            'pageLength': 100,
            'processing': true,
            'serverSide': true,
            'oLanguage': {
                'sUrl': BASE_PATH + "/plugins/datatables/dataTables.Chinese.traditional.json",
            },
            'ajax': {
                url: GetUrl(),
                type: 'POST',
                dataSrc: function (json) {
                    var return_data = new Array();
                    if (json.data != null) {
                        for (var i = 0; i < json.data.length; i++) {
                            var row = json.data[i];
                            var pic1url = "<img style='max-width:200px;' src='" + BASE_PATH + row.pic1url + "\' alt=\'" + row.pic1alt + "\'>";
                            var status = {};
                            GetStatusColorString(row.status, status);
                            status = "<span class='badge bg-" + status.color + "'>" + status.string + "</span>";
                            var operate = "<a class='btn btn-sm btn-primary' data-title='編輯' href='template_edit.php?edit_id=" + row.id + "'><span class='fas fa-pen-square'></span></a>";
                            operate += "<a class='btn btn-sm btn-danger' data-title='刪除' onclick='delete_alert(\"商品\"," + row.id + ",\"" + row.name + "\",\"<?= WEBAPI_PRODUCT ?>\"); return false;'><span class='fas fa-trash-alt'></span></a>";
                            return_data.push({
                                'id': row.id,
                                'category_name': row.category_name,
                                'name': row.name,
                                'pic1url': pic1url,
                                'newlisting': row.newlisting,
                                'list_order': row.list_order,
                                'status': status,
                                'operate': operate
                            })
                        }
                    }
                    return return_data;
                }
            },
            columns: [
                {data: "id"},
                {data: "category_name"},
                {data: "name"},
                {data: "pic1url"},
                {data: "newlisting"},
                {data: "list_order"},
                {data: "status"},
                {data: "operate"},
            ]
        })
    });

    function GetUrl()
    {
        var url = "_admin_list_ajax.php?api=<?= WEBAPI_PRODUCT ?>";
        var query_str = "";
        var q_category_id = $("#q_category_id").val();
        if (q_category_id)
            query_str += " AND category_id='" + q_category_id + "'";
        var q_name = $("#q_name").val().trim();
        if (q_name)
            query_str += " AND name like '%" + q_name + "%'";
        var q_status = $("#q_status").val();
        if (q_status)
            query_str += " AND status='" + q_status + "'";
        if (query_str != "")
            url = url + "&query=" + encodeURIComponent(query_str.substr(5));
        return url;
    }
</script>
<?php require_once '_admin_foot.php'; ?>
