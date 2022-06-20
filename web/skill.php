<?PHP
require_once '_head.php';

//查詢招客秘笈
$higis = null;
if (CallAPI('GET', WEBAPI_HIGI, null, null, $resultMessage, $higis) != 200)
    $higis = null;

//建立查詢選項
//取得食材標籤
$tags_buf = null;
$querystring = "category_id=1";
$url = WEBAPI_TAG . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $tags_buf) != 200)
    $tags_buf = null;
$food_array = null;
foreach ($tags_buf as $item) {
    $food_array[] = $item["name"];
}

//取得菜色標籤
$tags_buf = null;
$querystring = "category_id=2";
$url = WEBAPI_TAG . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $tags_buf) != 200)
    $tags_buf = null;
$type_array = null;
foreach ($tags_buf as $item) {
    $type_array[] = $item["name"];
}

//取得菜式標籤
$tags_buf = null;
$querystring = "category_id=3";
$url = WEBAPI_TAG . "?query=" . urlencode($querystring);
if (CallAPI('GET', $url, null, null, $resultMessage, $tags_buf) != 200)
    $tags_buf = null;
$style_array = null;
foreach ($tags_buf as $item) {
    $style_array[] = $item["name"];
}

//建立查詢商品選項
$product_array = null;
foreach ($higis as $item) {
    $product_array[$item["product_id"]] = $item["product_name"];
}
ksort($product_array);

//分頁設定
$page = request_num("page");
if (empty($page))
    $page = 0;
$length = 40;
$total = count($higis);
?>

<script>
    var PAGE=<?= $page ?>;
    var LENGTH=<?= $length ?>;</script>

<?php include_once '_header.php'; ?>

<section class="higi-page content">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item active" aria-current="page">招客秘笈</li>
            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="SKILL">招客秘笈</h2>
        </div>
    </div>
    <div class="inner p-b50">
        <div class="container">
            <div class="page-banner m-b50"><img src="img/banner/skill.jpg" alt=""></div>
        </div>
        <div class="search-block p-tb80">
            <div class="container">
                <div class="search-box p-a30">
                    <p>食材</p>
                    <div class="m-tb20 food_div">
                        <?php foreach ($food_array as $item) { ?>
                            <div class="form-check-inline">
                                <input class="form-check-input" type="checkbox" value="<?= $item ?>">
                                <label class="form-check-label" for=""><?= $item ?></label>
                            </div>
                        <?php } ?>
                    </div>
                    <p>菜色</p>
                    <div class="m-tb20 type_div">
                        <?php foreach ($type_array as $item) { ?>
                            <div class="form-check-inline">
                                <input class="form-check-input" type="checkbox" value="<?= $item ?>">
                                <label class="form-check-label" for=""><?= $item ?></label>
                            </div>
                        <?php } ?>
                    </div>
                    <p>菜式</p>
                    <div class="m-tb20 style_div">
                        <?php foreach ($style_array as $item) { ?>
                            <div class="form-check-inline">
                                <input class="form-check-input" type="checkbox" value="<?= $item ?>">
                                <label class="form-check-label" for=""><?= $item ?></label>
                            </div>
                        <?php } ?>
                    </div>
                    <p>商品</p>
                    <div class="m-tb20 product_div">
                        <?php foreach ($product_array as $key => $item) { ?>
                            <div class="form-check-inline">
                                <input class="form-check-input" type="checkbox" value="<?= $key ?>">
                                <label class="form-check-label" for=""><?= $item ?></label>
                            </div>
                        <?php } ?>
                    </div>
                    <button type="button" class="primary-btn gobtn m-auto d-block" id="search_btn">搜尋秘笈</button>
                </div>
            </div>
        </div>

        <div class="higi-display m-t50 p-tb50" id="higi-display">
            <div class="container">
                <div class="sub-title">
                    <h3>招客秘笈</h3>
                </div>
                <div class="row m-t50" id="higi_div">
                    <?php
                    foreach ($higis as $key => $item) {
                        if ($key < $length) {
                            $pic_url_array = explode(',', $item["pic_url"]);
                            $pic_alt_array = explode(',', $item["pic_alt"]);

                            $product_pic_url_array = explode(',', $item["product_pic_urls"]);
                            $product_pic_alt_array = explode(',', $item["product_pic_alts"]);
                            ?>
                            <div class="list-box col-lg-6 col-12">
                                <a href="javascript: goto_higi_detail(<?= $item["id"] ?>,<?= $item["member_only"] ?>)">
                                    <div class="img-box">
                                        <?php if ($item["member_only"] == true) { ?>
                                            <div class="member-icon small-tag">
                                                <span>會員限定</span>
                                            </div>
                                        <?php } ?>
                                        <img src="<?= BASE_PATH . $pic_url_array[0] ?>" alt="<?= $pic_alt_array[0] ?>">
                                    </div>
                                    <div class="text-box">
                                        <span class="title"><?= $item["name"] ?></span>
                                        <span class="sp-text primary-red text-wrap"><?= $item["content"] ?></span>
                                        <div class="higi-box">
                                            <img src="<?= BASE_PATH . $product_pic_url_array[0] ?>" alt="<?= $product_pic_alt_array[0] ?>">
                                            <span><?= $item["product_name"] ?></span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <?php
                        }
                    }
                    ?>
                </div>
            </div>
        </div>

        <div class="pagination-box">
            <ul class="pagination" id="pagination_ul">
                <li>
                    <a href="javascript: gotopage(0)" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <?php
                for ($index = 0; $index < ceil($total / $length); $index++) {
                    ?>
                    <li <?= ($page == $index) ? "class='active'" : "" ?>>
                        <a href="javascript: gotopage(<?= $index ?>)"><?= $index + 1 ?></a>
                    </li>
                <?php } ?>
                <li>
                    <a href="javascript: gotopage(<?= ceil($total / $length) - 1 ?>)" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</section>

<?php include_once '_footer.php'; ?>
<?php require_once "_post_js.php"; ?>
<script>
    $("#search_btn").click(function(){
        PAGE=0;
        rebuild_higi(PAGE,LENGTH);
        $("html,body").animate({scrollTop:$("#higi-display").offset().top},500);
    });
    function gotopage(page)
    {
        if(PAGE!==page)
        {
            PAGE=page;
            rebuild_higi(PAGE,LENGTH);
        }
    }

    function get_querystring()
    {
        var tags="";
        $(".food_div input:checked").each(function(){
            if($(this).val())
                tags+=" AND tags like '%"+$(this).val()+"%'";
        })

        var style="";
        $(".style_div input:checked").each(function(){
            if($(this).val())
                style+=" AND style like '%"+$(this).val()+"%'";
        })

        var type="";
        $(".type_div input:checked").each(function(){
            if($(this).val())
                type+=" AND type like '%"+$(this).val()+"%'";
        })

        var product="";
        $(".product_div input:checked").each(function(){
            if($(this).val())
                style+=" AND product_id="+$(this).val();
        })

        var query_str=tags+style+type+product;

        if(query_str)
            query_str=query_str.substr(4);

        return encodeURIComponent(query_str);
    }

    function rebuild_higi(page,length)
    {
        $("#higi_div").empty();
        var query=get_querystring();
        var start=page*length;
        var url="_list_ajax.php?api=<?= WEBAPI_HIGI ?>&start="+start+"&length="+length+"&query="+query;
        var result=new Object();
        if(AJAX(url,"GET",null,result)==true)
        {
            var result_data=JSON.parse(result.data);
            var recordsTotal=result_data.recordsTotal;
            var count=0;
            if(result_data.data)
                count=result_data.data.length;
            var items=result_data.data;
            var newitem="";
            for(i=0;i<count;i++){
                var pic_url_array=null;
                if(items[i]["pic_url"])
                    pic_url_array=items[i]["pic_url"].split(",");

                var pic_alt_array=null;
                if(items[i]["pic_alt"])
                    pic_alt_array=items[i]["pic_alt"].split(",");

                var product_pic_url_array=null;
                if(items[i]["product_pic_urls"])
                    product_pic_url_array=items[i]["product_pic_urls"].split(",");

                var product_pic_alt_array=null;
                if(items[i]["product_pic_alts"])
                    product_pic_alt_array=items[i]["product_pic_alts"].split(",");

                newitem+="<div class='list-box col-lg-6 col-12'>";
                newitem+="<a href='javascript: goto_higi_detail("+items[i]["id"]+","+items[i]["member_only"]+")'>";
                newitem+="<div class='img-box'>";
                if(items[i]["member_only"]==true)
                    newitem+="<div class='member-icon small-tag'><span>會員限定</span></div>";
                if(pic_url_array)
                {
                    if(pic_alt_array!=null)
                        newitem+="<img src='"+BASE_PATH+pic_url_array[0]+"' alt='"+pic_alt_array[0]+"'>";
                    else
                        newitem+="<img src='"+BASE_PATH+pic_url_array[0]+"' alt=''>";
                }
                newitem+="</div>";
                newitem+="<div class='text-box'>";
                newitem+="<span class='title'>"+items[i]["name"]+"</span>";
                newitem+="<span class='sp-text primary-red text-wrap'>"+items[i]["content"]+"</span>";
                newitem+="<div class='higi-box'>";

                if(product_pic_url_array)
                {
                    if(product_pic_alt_array!=null)
                        newitem+="<img src='"+BASE_PATH+product_pic_url_array[0]+"' alt='"+product_pic_alt_array[0]+"'>";
                    else
                        newitem+="<img src='"+BASE_PATH+product_pic_url_array[0]+"' alt=''>";
                }
                newitem+="<span>"+items[i]["product_name"]+"</span>";
                newitem+="</div>";
                newitem+="</div>";
                newitem+="</a>";
                newitem+="</div>";
            }
            $("#higi_div").html(newitem);
            rebuild_pagination(page,length,recordsTotal);

            $("html,body").animate({scrollTop:$("#higi-display").offset().top},0);
        }
    }

    function rebuild_pagination(page,length,total)
    {
        $("#pagination_ul").empty();
        if(total>0)
        {
            var newitem="";
            newitem+="<li>";
            newitem+="<a href='javascript: gotopage(0)' aria-label='Previous'>";
            newitem+="<span aria-hidden='true'>&laquo;</span>";
            newitem+="<span class='sr-only'>Previous</span>";
            newitem+="</a>";
            newitem+="</li>";
            for(i=0;i<Math.ceil(total/length);i++){
                if(page===i)
                    newitem+="<li class='active'>";
                else
                    newitem+="<li>";
                newitem+="<a href='javascript: gotopage("+i+")'>"+parseInt(i+1,10)+"</a>";
                newitem+="</li>";
            }
            newitem+="<li>";
            newitem+="<a href='javascript: gotopage("+parseInt(Math.ceil(total/length)-1)+")' aria-label='Next'>";
            newitem+="<span aria-hidden='true'>&raquo;</span>";
            newitem+="<span class='sr-only'>Next</span>";
            newitem+="</a>";
            newitem+="</li>";
            $("#pagination_ul").html(newitem);
        }
    }
</script>
<?php require_once '_foot.php'; ?>