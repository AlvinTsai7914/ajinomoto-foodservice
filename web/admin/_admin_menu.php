<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-dark bg-brand border-bottom">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
        </li>
    </ul>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <span class="hidden-xs"><?= $_SESSION['loginusername'] ?></span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <div class=""card:>
                    <div class="card-body box-profile">
                        <h3 class="profile-username text-center"><?= $_SESSION['loginusername'] ?></h3>
                        <ul class="list-group list-group-unbordered mb-3">
                            <li class="list-group-item">
                                <b>登入IP</b> <a class="float-right"><?= $_SESSION['loginip'] ?></a>
                            </li>
                            <li class="list-group-item">
                                <b>登入時間</b> <a class="float-right"><?= GetDateTimeString($_SESSION['logintime']) ?></a>
                            </li>
                        </ul>
                        <a href="logout_ajax.php" class="float-right btn btn-brand">登出</a>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</nav>

<aside class="main-sidebar">
    <section class="sidebar">
        <?php include_once "_admin_aside.php"; ?>
    </section>
</aside>