<?PHP
require '_admin_head.php';

$q_user_name = trim(request_str("q_user_name"));
$q_account = trim(request_str("q_account"));
$q_ip = trim(request_str("q_ip"));
$q_program_name = trim(request_str("q_program_name"));
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>操作記錄
                            <small>列表</small>
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
                                    <label for="q_user_name" class="col-md-1">使用者姓名</label>
                                    <div class="col-md-2">
                                        <input type="text" id="q_user_name" name="q_user_name" class="form-control" value="<?= $q_user_name ?>">
                                    </div>
                                    <label for="q_account" class="col-md-1">使用者帳號</label>
                                    <div class="col-md-2">
                                        <input type="text" id="q_account" name="q_account" class="form-control" value="<?= $q_account ?>">
                                    </div>
                                    <label for="q_ip" class="col-md-1">IP位址</label>
                                    <div class="col-md-2">
                                        <input type="text" id="q_ip" name="q_ip" class="form-control" value="<?= $q_ip ?>">
                                    </div>
                                    <label for="q_program_name" class="col-md-1">程式名稱</label>
                                    <div class="col-md-2">
                                        <input type="text" id="q_program_name" name="q_program_name" class="form-control" value="<?= $q_program_name ?>">
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="button" class="btn btn-primary float-right" onclick="query_form_sumbit('log_list.php')"><span class="fas fa-search"></span></button>
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
                                        <th style="width: 10%">使用者姓名</th>
                                        <th style="width: 10%">使用者帳號</th>
                                        <th style="width: 10%">IP</th>
                                        <th style="width: 20%">執行程式名稱</th>
                                        <th style="width: 10%">訊息</th>
                                        <th style="width: 20%">操作時間</th>
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
    document.title += "-操作記錄";
    $(function () {
        var kk = $('#table').DataTable({
            'paging': true,
            'lengthChange': true,
            'searching': false,
            'ordering': true,
            'info': true,
            'autoWidth': true,
            'aoColumnDefs': [{'bSortable': false, 'aTargets': [7]}],
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
                            var operate = "<a class='btn btn-sm btn-primary' data-title='檢視' href='log_edit.php?edit_id=" + row.id + "'><span class='fas fa-search'></span></a>";
                            return_data.push({
                                'id': row.id,
                                'user_account': row.user_account,
                                'user_name': row.user_name,
                                'ip': row.ip,
                                'program_name': row.program_name,
                                'resultMessage': row.resultMessage,
                                'c_time': row.c_time,
                                'operate': operate
                            })
                        }
                    }
                    return return_data;
                }
            },
            columns: [
                {data: "id"},
                {data: "user_account"},
                {data: "user_name"},
                {data: "ip"},
                {data: "program_name"},
                {data: "resultMessage"},
                {data: "c_time"},
                {data: "operate"}
            ]
        })
    });
    function GetUrl()
    {
        var url = "_admin_list_ajax.php?api=<?= WEBAPI_LOG ?>";
        var query_str = "";
        var q_user_name = $("#q_user_name").val().trim();
        if (q_user_name)
            query_str += " AND user_name like '%" + q_user_name + "%'";
        var q_account = $("#q_account").val().trim();
        if (q_account)
            query_str += " AND user_account like '%" + q_account + "%'";
        var q_ip = $("#q_ip").val().trim();
        if (q_ip)
            query_str += " AND ip like '%" + q_ip + "%'";
        var q_program_name = $("#q_program_name").val().trim();
        if (q_program_name)
            query_str += " AND program_name like '%" + q_program_name + "%'";
        if (query_str != "")
            url = url + "&query=" + encodeURIComponent(query_str.substr(5));
        return url;
    }
</script>
<?php require_once '_admin_foot.php'; ?>
