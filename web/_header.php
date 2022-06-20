<section>
    <nav class="navbar navbar-expand-lg main-nav">
        <div class="container">
            <div class="nav-logo">
                <a class="navbar-brand" href="index.php">
                    <img src="img/logo.png" alt="Ajinomoto"></a>
            </div>
            <button class="nav-switch burger" type="button" data-toggle="collapse" data-target="#mobnav"
                    aria-controls="mobnav" aria-expanded="false">
                <span class="line line-1"></span>
                <span class="line line-2"></span>
                <span class="line line-3"></span>
            </button>
            <div class="collapse navbar-collapse nav-box" id="mobnav">
                <ul class="navbar-nav nav-list">
                    <li <?= ($get_page_name == "campaign" || $get_page_name == "campaign-detail") ? "class='active'" : "" ?>>
                        <a href="campaign.php">餐飲情報</a>
                    </li>
                    <li <?= ($get_page_name == "recipepro" || $get_page_name == "recipepro-detail") ? "class='active'" : "" ?>>
                        <a href="recipepro.php">專業食譜</a>
                    </li>
                    <li <?= ($get_page_name == "product" || $get_page_name == "product-detail") ? "class='active'" : "" ?>>
                        <a href="product.php">商品介紹</a>
                    </li>
                    <li <?= ($get_page_name == "skill" || $get_page_name == "skill-detail") ? "class='active'" : "" ?>>
                        <a href="skill.php">招客秘笈</a>
                    </li>
                    <li <?= ($get_page_name == "contactus") ? "class='active'" : "" ?>>
                        <a href="contactus.php">聯絡我們</a>
                    </li>
                    <?php if (IsMemberLogin() == true) { ?>
                        <li <?= ($get_page_name == "member") ? "class='active'" : "" ?>>
                            <a href="member.php">會員專區</a>
                        </li>
                    <?php } else { ?>
                        <li>
                            <a href="javascript: AlertLogin();">會員登入</a>
                        </li>
                    <?php } ?>
                    <li>
                        <form>
                            <div class="input-group site-search">
                                <input type="text" class="search-box" id="search-box" placeholder="搜尋">
                                <button type="button" class="search-btn" id="search-btn"><i class="fas fa-search"></i></button>
                            </div>
                        </form>
                    </li>

                </ul>
            </div>

        </div>
    </nav>
</section>
