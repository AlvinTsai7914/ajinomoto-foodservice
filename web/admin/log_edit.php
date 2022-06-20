<?php
require '_admin_head.php';

$log_id = request_num('edit_id');

if ($log_id == '')
    redir("log_list.php");

$row = null;
if ($log_id != 0) {//0:新增，其他:修改
    $url = WEBAPI_LOG . "/" . $log_id;
    $resultMessage = "";
    $rows = null;
    $result = CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $rows);
    if ($result != 200 || count($rows) != 1)
        die('System error 001');
    $row = $rows[0];
}

if ($row) {
    $id = $row['id'];
    $user_id = $row['user_id'];
    $user_account = $row['user_account'];
    $user_name = $row['user_name'];
    $ip = $row['ip'];
    $program_id = $row['program_id'];
    $program_name = $row['program_name'];
    $verb = $row['verb'];
    $args = $row['args'];
    $file = $row['file'];
    $resultCode = $row['resultCode'];
    $resultMessage = $row['resultMessage'];
    $resultData = $row['resultData'];
    $c_time = $row['c_time'];
    $sub_title = '詳細資料';
} else {
    redir("log_list.php");
}
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>操作記錄
                            <small><?= $sub_title ?></small>
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row mb-2">
                                <label for="user_account" class="col-md-1">使用者帳號</label>
                                <div class="col-md-5">
                                    <input type="text" id="user_account" name="user_account" class="form-control" value="<?= $user_account ?>" readonly>
                                </div>
                                <label for="user_name" class="col-md-1">使用者姓名</label>
                                <div class="col-md-5">
                                    <input type="text" id="user_name" name="user_name" class="form-control" value="<?= $user_name ?>" readonly>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <label for="ip" class="col-md-1">IP位址</label>
                                <div class="col-md-5">
                                    <input type="text" id="ip" name="ip" class="form-control" value="<?= $ip ?>" readonly>
                                </div>
                                <label for="program_name" class="col-md-1">程式名稱</label>
                                <div class="col-md-5">
                                    <input type="text" id="program_name" name="program_name" class="form-control" value="<?= $program_name ?>" readonly>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <label for="verb" class="col-md-1">動作</label>
                                <div class="col-md-5">
                                    <input type="text" id="verb" name="verb" class="form-control" value="<?= $verb ?>" readonly>
                                </div>
                                <label for="c_time" class="col-md-1">操作時間</label>
                                <div class="col-md-5">
                                    <input type="text" id="c_time" name="c_time" class="form-control" value="<?= $c_time ?>" readonly>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <label for="args" class="col-md-1">參數</label>
                                <div class="col-md-11">
                                    <textarea id="args" name="args" class="form-control" rows="3" readonly><?= $args ?></textarea>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <label for="file" class="col-md-1">檔案</label>
                                <div class="col-md-11">
                                    <textarea id="file" name="file" class="form-control" rows="3" readonly><?= $file ?></textarea>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <label for="resultCode" class="col-md-1">回傳代碼</label>
                                <div class="col-md-5">
                                    <input type="text" id="resultCode" name="resultCode" class="form-control" value="<?= $resultCode ?>" readonly>
                                </div>
                                <label for="resultMessage" class="col-md-1">回傳訊息</label>
                                <div class="col-md-5">
                                    <input type="text" id="resultMessage" name="resultMessage" class="form-control" value="<?= $resultMessage ?>" readonly>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <label for="resultData" class="col-md-1">回傳資料</label>
                                <div class="col-md-11">
                                    <textarea id="resultData" name="resultData" class="form-control" rows="3" readonly><?= $resultData ?></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button type="button" class="btn btn-warning float-left" onclick="javascript:location.href = 'log_list.php'">取消</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <?php include_once "_admin_footer.php"; ?>
</div>
<?php
require '_admin_foot.php';
?>

