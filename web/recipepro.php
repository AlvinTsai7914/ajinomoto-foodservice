<?PHP
require_once '_head.php';

//查詢人氣推薦專業食譜
$visitor_recipepros = null;
$url = WEBAPI_RECIPEPRO . "?order=" . urlencode("visitor desc");
if (CallAPI('GET', $url, null, null, $resultMessage, $visitor_recipepros) != 200)
    $visitor_recipepros = null;

//查詢專業食譜
$recipepros = null;
if (CallAPI('GET', WEBAPI_RECIPEPRO, null, null, $resultMessage, $recipepros) != 200)
    $recipepros = null;

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
foreach ($recipepros as $item) {
    $product_id_array = explode(",", $item["product_ids"]);
    $product_name_array = explode(",", $item["product_names"]);
    foreach ($product_id_array as $key => $item) {
        $product_array[$item] = $product_name_array[$key];
    }
}
ksort($product_array);

//分頁設定
$page = request_num("page");
if (empty($page))
    $page = 0;
$length = 20;
$total = count($recipepros);
?>

<script>
    var PAGE=<?= $page ?>;
    var LENGTH=<?= $length ?>;
</script>

<?php include_once '_header.php'; ?>

<section class="recipepro-page content">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">首頁</a></li>
                <li class="breadcrumb-item active" aria-current="page">專業食譜</li>
            </ol>
        </nav>
        <div class="page main-title m-b80">
            <h2 data-title="RECIPES">專業食譜</h2>
        </div>
    </div>
    <div class="inner p-b50">
        <div class="refer-display bg-Light m-t50 p-tb50">
            <div class="container">
                <div class="sub-title">
                    <h3>人氣推薦</h3>
                </div>
                <div class="row justify-content-center m-t50">
                    <?php
                    foreach ($visitor_recipepros as $key => $item) {
                        if ($key < 3) {
                            ?>
                            <div class="list-box col-md-6 col-lg-4 col-10">
                                <a href="javascript: goto_recipepro_detail(<?= $item["id"] ?>,<?= $item["member_only"] ?>)">
                                    <?php if ($item["member_only"] == true) { ?>
                                        <div class="member-icon small-tag">
                                            <span>會員限定</span>
                                        </div>
                                    <?php } ?>
                                    <div class="img-box">
                                        <img src="<?= BASE_PATH . $item["pic_url"] ?>" alt="<?= $item["pic_alt"] ?>">
                                    </div>

                                    <div class="text-box d-flex flex-wrap justify-content-between">
                                        <span class="title"><?= $item["name"] ?></span>
                                        <span class="tag color-e"><?= $item["style"] ?></span>
                                    </div>
                                </a>
                            </div>
                            <?php
                        } else
                            break;
                    }
                    ?>
                </div>
            </div>
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
                    <button type="button" class="primary-btn gobtn m-auto d-block" id="search_btn">搜尋食譜</button>
                </div>
            </div>
        </div>

        <div class="recipepro-result m-t50 p-tb50" id="recipepro-result">
            <div class="container">
                <div class="sub-title">
                    <h3>搜尋結果</h3>
                </div>
                <div class="recipe-group row m-t50" id="recipepro_div">
                    <?php
                    foreach ($recipepros as $key => $item) {
                        if ($key < $length) {
                            ?>
                            <div class="list-box col-12">
                                <a href="javascript: goto_recipepro_detail(<?= $item["id"] ?>,<?= $item["member_only"] ?>)">
                                    <div class="img-box">
                                        <?php if ($item["member_only"] == true) { ?>
                                            <div class="member-icon small-tag">
                                                <span>會員限定</span>
                                            </div>
                                        <?php } ?>
                                        <img src="<?= BASE_PATH . $item["pic_url"] ?>" alt="<?= $item["pic_alt"] ?>">
                                    </div>
                                    <div class="text-box">
                                        <span class="title"><?= $item["name"] ?></span>
                                        <span class="sp-text primary-red"><?= $item["product_names"] ?></span>
                                        <span><?= $item["feature"] ?></span>
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
        rebuild_repicepro(PAGE,LENGTH);
        $("html,body").animate({scrollTop:$("#recipepro-result").offset().top},500);
    });

    function gotopage(page)
    {
        if(PAGE!==page)
        {
            PAGE=page;
            rebuild_repicepro(PAGE,LENGTH);
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
                style+=" AND FIND_IN_SET('"+$(this).val()+"',product_ids)";
        })

        var query_str=tags+style+type+product;

        if(query_str)
            query_str=query_str.substr(4);
        return encodeURIComponent(query_str);
    }

    function rebuild_repicepro(page,length)
    {
        $("#recipepro_div").empty();
        var query=get_querystring();
        var start=page*length;
        var url="_list_ajax.php?api=<?= WEBAPI_RECIPEPRO ?>&start="+start+"&length="+length+"&query="+query;
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
                newitem+="<div class='list-box col-12'>";
                newitem+="<a href='javascript: goto_recipepro_detail("+items[i]["id"]+","+items[i]["member_only"]+")'>";
                newitem+="<div class='img-box'>";
                if(items[i]["member_only"]==true)
                    newitem+="<div class='member-icon small-tag'><span>會員限定</span></div>";
                newitem+="<img src='"+BASE_PATH+items[i]["pic_url"]+"' alt='"+items[i]["pic_alt"]+"'>";
                newitem+="</div>";
                newitem+="<div class='text-box'>";
                newitem+="<span class='title'>"+items[i]["name"]+"</span>";
                newitem+="<span class='sp-text primary-red'>"+items[i]["product_names"]+"</span>";
                newitem+="<span>"+items[i]["feature"]+"</span>";
                newitem+="</div>";
                newitem+="</a>";
                newitem+="</div>";
            }
            $("#recipepro_div").html(newitem);
            rebuild_pagination(page,length,recordsTotal);

            $("html,body").animate({scrollTop:$("#recipepro-result").offset().top},0);
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