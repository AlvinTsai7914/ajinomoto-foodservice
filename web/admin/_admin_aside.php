<?php
$result = false;
$resultMessage = "";

//查詢選單
$menus = null;
$result = CallAPI('GET', WEBAPI_USER_LoginUserMenuTree, $_SESSION['accesstoken'], null, $resultMessage, $menus);

function DisplayMenuTree($menus) {
    echo "<ul class='nav nav-pills nav-sidebar flex-column' data-widget='treeview' role='menu' data-accordion='false'>";
    if ($menus != null) {
        foreach ($menus as $menu) {
            $class = "nav-item ";
            if (isset($menu["submenu"]))
                $class .= "has-treeview " . is_open_menu($menu);
            echo "<li class = '" . $class . "'>";
            echo empty($menu["url"]) ? "<a href = '#' class='nav-link " . is_active_menu($menu) . "'>" : "<a href = '" . $menu["url"] . "' class='nav-link " . is_active_menu($menu) . "'>";

            $icon = "fa fa-cogs";
            if (!empty($menu["icon"]))
                $icon = $menu["icon"];
            echo "<i class = 'nav-icon " . $icon . "'></i> <p>" . $menu["name"];

            if (isset($menu["submenu"]))
                echo "<i class='right fa fa-angle-left'></i>";
            echo "</p></a>";

            if (isset($menu["submenu"]))
                DisplayMenuTreeSubMenu($menu["submenu"]);
            echo "</li>";
        }
    }
    echo "</ul>";
}

function DisplayMenuTreeSubMenu($menuArray) {
    echo "<ul class='nav nav-treeview' style='padding-left:20px;'>";
    foreach ($menuArray as $menu) {
        $class = "nav-item ";
        if (isset($menu["submenu"]))
            $class .= "has-treeview " . is_open_menu($menu);
        echo "<li class = '" . $class . "'>";
        echo empty($menu["url"]) ? "<a href = '#' class='nav-link " . is_active_menu($menu) . "'>" : "<a href = '" . $menu["url"] . "' class='nav-link " . is_active_menu($menu) . "'>";

        $icon = "fa fa-cog";
        if (!empty($menu["icon"]))
            $icon = $menu["icon"];
        echo "<i class = 'nav-icon " . $icon . "'></i> <p>" . $menu["name"];

        if (isset($menu["submenu"]))
            echo "<i class='right fa fa-angle-left'></i>";
        echo "</p></a>";

        if (isset($menu["submenu"]))
            DisplayMenuTreeSubMenu($menu["submenu"]);
        echo "</li>";
    }
    echo "</ul>";
}

function is_active_menu($menu) {
    if (strpos(urldecode($_SERVER['REQUEST_URI']), $menu["url"]) == true)
        return "active";

    if (isset($menu["submenu"])) {
        foreach ($menu["submenu"] as $submenu) {
            if (is_active_menu($submenu) == "active")
                return "active";
        }
        return "";
    }
    return "";
}

function is_open_menu($menu) {
    if (isset($menu["submenu"])) {
        foreach ($menu["submenu"] as $submenu) {
            if (is_active_menu($submenu) == "active")
                return "menu-open";
        }
        return "";
    }
    return "";
}
?>

<aside class="main-sidebar sidebar-light-brand elevation-4">
    <a class="brand-link bg-brand" href='../index.php' target='_blank'>
        <img style="background-color: white;" src="../img/logo.png"  alt="Ajinomoto Logo" class="brand-image elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light"><?= $sys_site_title ?> CMS</span>
    </a>
    <div class="sidebar">
        <nav class="mt-2">
            <?= DisplayMenuTree($menus); ?>
        </nav>
    </div>
</aside>