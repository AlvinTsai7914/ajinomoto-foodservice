<?php
require '_admin_head.php';

$role_id = request_num('edit_id');

if ($role_id == '' || ( $role_id <= 1 && $role_id != 0))
    redir("role_list.php");

$row = null;
if ($role_id != 0) {//0:新增，其他:修改
    $url = WEBAPI_ROLE . "/" . $role_id;
    $resultMessage = "";
    $rows = null;
    $result = CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $rows);
    if ($result != 200 || count($rows) != 1)
        die('System error 001');
    $row = $rows[0];
}

if ($row) {
    $id = $row['id'];
    $name = $row['name'];
    $status = $row['status'];
    $remark = $row['remark'];
    $sub_title = '編輯';
} else {
    $id = 0;
    $name = "";
    $status = 0;
    $remark = "";
    $sub_title = '新增';
}

$result = false;
$menus = null;
//查詢樹狀選單
if (CallAPI('GET', WEBAPI_USER_LoginUserMenuTree, $_SESSION['accesstoken'], null, $resultMessage, $menus) != 200)
    $menus = null;

//查詢角色選單
$rolemenus = null;
if ($role_id != 0) {
    $url = WEBAPI_ROLE_Menu . "/" . $id;
    if (CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $rolemenus) != 200)
        $rolemenus = null;
}

$program_categories = null;
//查詢程式類別
if (CallAPI('GET', WEBAPI_PROGRAMCATEGORY, $_SESSION['accesstoken'], null, $resultMessage, $program_categories) != 200)
    $program_categories = null;

$programs = null;
//查詢程式
if (CallAPI('GET', WEBAPI_USER_LoginUserProgram, $_SESSION['accesstoken'], null, $resultMessage, $programs) != 200)
    $programs = null;

//查詢角色程式
$roleprograms = null;
if ($role_id != 0) {
    $url = WEBAPI_ROLE_Program . "/" . $id;
    if (CallAPI('GET', $url, $_SESSION['accesstoken'], null, $resultMessage, $roleprograms) != 200)
        $roleprograms = null;
}

function DisplayCheckMenuTree($menus, $rolemenus, $rootflag) {
    if ($menus != null) {
        if ($rootflag)
            echo "<ul class='checktree no-padding' data-widget='treeview'>";
        else
            echo "<ul class='checktree' data-widget='treeview'>";

        foreach ($menus as $menu) {
            echo "<li>";
            if ($menu["id"] == 1) {  //dashboard
                echo "<input type='hidden' class='menu_checktreeinput form-control square-red' name='menu[]' value='" . $menu["id"] . "' checked='checked' " . " data-program_ids='" . $menu["program_ids"] . "'disabled><span> " . $menu["name"] . "</span>";
            } else {
                $checked = CheckIDExist($rolemenus, $menu["id"]) ? " checked" : "";
                echo "<input type='checkbox' class='menu_checktreeinput form-control square-red' name='menu[]' value='" . $menu["id"] . "'" . $checked . " data-program_ids='" . $menu["program_ids"] . "'><span> " . $menu["name"] . "</span>";
            }
            if (isset($menu["submenu"]))
                DisplayCheckMenuTree($menu["submenu"], $rolemenus, false);
            echo "</li>";
        }
        echo "</ul>";
    }
}

function DisplayCheckProgram($program_categories, $programs, $roleprograms, $rootflag) {
    if ($program_categories == null || $programs == null)
        return "";
    $html = "<ul class='nav nav-sidebar flex-column checktree' data-widget='treeview' role='menu' id = 'checkprogram_tree' data-accordion = 0>";
    foreach ($program_categories as $c) {
        $html .= "<li class = 'nav-item has-treeview checktree'>";
        $html .= "<a href='' class='nav-link'>" . $c["name"] . "</a>";
        $html .= "<ul class = 'nav nav-treeview checktree'>";
        foreach ($programs as $program) {
            if ($program["category_id"] == $c["id"]) {
                $html .= "<li class='nav-item'>";
                $checked = CheckIDExist($roleprograms, $program["id"]) ? " checked" : "";
                $html .= "<input type = 'checkbox' class = 'program_checktreeinput form-control square-red' name = 'program[]' value = '" . $program["id"] . "'" . $checked . "><span> " . "(" . $program["id"] . ")" . $program["name"] . "</span>";
                $html .= "</a></li>";
            }
        }
        $html .= "</ul>";
        $html .= "</li>";
    }
    $html .= "</ul>";
    echo $html;
}

function CheckIDExist($datas, $checkid) {
    if ($datas == null || $checkid == null)
        return false;

    foreach ($datas as $data) {
        if ($data["id"] == $checkid)
            return true;
    }
    return false;
}
?>
<div class="wrapper">
    <?php include_once '_admin_menu.php'; ?>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>角色
                            <small><?= $sub_title ?></small>
                        </h1>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-12">
                    <form name="edit_form" id="edit_form" action="role_edit_ajax.php" data-toggle="validator" role="form">
                        <input type="hidden" id="role_id" name="role_id" value="<?= $id ?>">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-2">
                                    <label for="name" class="col-md-1">名稱</label>
                                    <div class="col-md-5">
                                        <input type="text" id="name" name="name" class="form-control validate[required]" value="<?= $name ?>">
                                    </div>
                                    <label for="status" class="col-md-1">狀態</label>
                                    <div class="col-md-5">
                                        <div class="radio">
                                            <label>
                                                <input type="radio" name="status" id="status0" class="square-red" value="0" <?= ($status == 0) ? "checked" : ""; ?>>
                                                <span class="badge bg-success">啟用</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="status" id="status1" class="square-red" value="1" <?= ($status == 1) ? "checked" : ""; ?> >
                                                <span class="badge bg-danger">停用</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="remark" class="col-md-1">備註</label>
                                    <div class="col-md-11">
                                        <textarea id="remark" name="remark" class="form-control" rows="3"><?= $remark ?></textarea>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="row mb-2">
                                            <label class="col-md-2">選單</label>
                                            <div class="col-md-10">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-brand selectall">選取</button>
                                                    <button type="button" class="btn btn-brand dropdown-toggle" data-toggle="dropdown">
                                                        <span class="caret"></span>
                                                        <span class="sr-only">Toggle Dropdown</span>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <a class="dropdown-item menu_selectall">全部選取</a>
                                                        <a class="dropdown-item menu_unselectall">全部取消</a>
                                                    </ul>
                                                </div>
                                            </div>
                                            <label class="col-md-2"></label>
                                            <div class="col-md-10" id="menu_div">
                                                <?= DisplayCheckMenuTree($menus, $rolemenus, $program_ids, true); ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row mb-2">
                                            <label class="col-md-2">程式</label>
                                            <div class="col-md-10">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-brand selectall">選取</button>
                                                    <button type="button" class="btn btn-brand dropdown-toggle" data-toggle="dropdown">
                                                        <span class="caret"></span>
                                                        <span class="sr-only">Toggle Dropdown</span>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a class="dropdown-item program_selectall">全部選取</a></li>
                                                        <li><a class="dropdown-item program_unselectall">全部取消</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <label class="col-md-2"></label>
                                            <div class="col-md-10" id="program_div">
                                                <?= DisplayCheckProgram($program_categories, $programs, $roleprograms, true); ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="button" class="btn btn-warning float-left" onclick="javascript:location.href = 'role_list.php'">取消</button>
                                <button type="button" class="btn btn-success float-right" onclick="form_sumbit('#edit_form')">確定</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>
<?php require_once "_admin_post_js.php"; ?>
<script>
    $(document).ready(function () {
        $("#edit_form").validationEngine({
            promptPosition: 'bottomLeft',
            maxErrorsPerField: 1,
            showOneMessage: true,
            addFailureCssClassToField: "formError-border_red",
            autoHidePrompt: true,
            autoHideDelay: 3000,
            validateNonVisibleFields: true,
            ajaxFormValidation: true,
            ajaxFormValidationMethod: 'post',
            onAjaxFormComplete: ajaxCallback,
        });
    });

    function ajaxCallback(status, form, json, options) {
        if (status === true) {
            if (json.sResult === true)
                success_alert("角色<?= $sub_title ?>", "role_list.php");
            else
                error_alert(json.msg);
        } else {
            error_alert(json.msg);
        }
    }

    $('.menu_checktreeinput').on('ifChecked', function (event) {
        $(this).parents('li').each(function () {
            $(this).find('.menu_checktreeinput').first().iCheck('check');
        });

        if ($(this).data("program_ids"))
        {
            var program_ids = $(this).data("program_ids") + ",";
            var arr = program_ids.split(',');
            for (var i = 0; i < arr.length; i++)
            {
                if (arr[i] === "")
                    continue;
                var target = ".program_checktreeinput[value='" + arr[i] + "']";
                $(target).iCheck('check');
            }
        }
    });

    $('.menu_checktreeinput').on('ifUnchecked', function (event) {
        $(this).closest('li').find('.menu_checktreeinput').each(function () {
            $(this).iCheck('uncheck');
        });
        if ($(this).data("program_ids"))
        {
            var program_ids = $(this).data("program_ids") + ",";
            var arr = program_ids.split(',');
            for (var i = 0; i < arr.length; i++)
            {
                if (arr[i] === "")
                    continue;
                var target = ".program_checktreeinput[value='" + arr[i] + "']";
                $(target).iCheck('uncheck');
            }
        }
    });

    $(".menu_selectall").click(function () {
        $('.menu_checktreeinput').iCheck('check');
    });

    $(".menu_unselectall").click(function () {
        $('.menu_checktreeinput').iCheck('uncheck');
    });

    $(".program_selectall").click(function () {
        $('.program_checktreeinput').iCheck('check');
    });

    $(".program_unselectall").click(function () {
        $('.program_checktreeinput').iCheck('uncheck');
    });
</script>
<?php require_once '_admin_foot.php'; ?>