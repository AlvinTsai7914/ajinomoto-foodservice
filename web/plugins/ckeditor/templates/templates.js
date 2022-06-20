//加入template
CKEDITOR.addTemplates(
        'default',
        {
            imagesPath:CKEDITOR.getUrl(BASE_PATH+'/plugins/ckeditor/templates/images/'),
            insertOption:false,
            templates:[
                {
                    title:'餐飲情報-內容',
                    image:'餐飲情報-內容.png',
                    description:'餐飲情報-內容',
                    html:'內容內容內容內容內容內容內容內容內容內容'
                },
                {
                    title:'商品-內容',
                    image:'商品-內容.png',
                    description:'商品-內容',
                    html:'內容內容內容內容內容內容內容內容內容內容'
                },
                {
                    title:'商品-美味秘訣',
                    image:'商品-美味秘訣.png',
                    description:'商品-美味秘訣',
                    html:'內容內容內容內容內容內容內容內容內容內容'
                },
                {
                    title:'商品-商品資訊',
                    image:'商品-商品資訊.png',
                    description:'商品-商品資訊',
                    html:'<ul class="product-info-box p-a0">'+
                            '<li class="d-flex ">'+
                            '<span class="title">原料</span>'+
                            '<span class="text">調味劑(L-麩酸鈉、5`-次黃嘌呤核苷磷酸二鈉、琥珀酸二鈉)、食鹽、乳糖、砂糖、乾燻鰹魚、鰹魚抽出物、酵母抽出物、D-木糖、麥芽糖、葡萄糖、糊精</span>'+
                            '</li>'+
                            '<li class="d-flex">'+
                            '<span class="title">淨重</span>'+
                            '<span class="text">1公斤</span>'+
                            '</li>'+
                            '<li class="d-flex">'+
                            '<span class="title">原產地</span>'+
                            '<span class="text">日本國神奈川縣</span>'+
                            '</li>'+
                            '<li class="d-flex">'+
                            '<span class="title">產品包裝</span>'+
                            '<span class="text">1kgx12袋/箱</span>'+
                            '</li>'+
                            '<li class="d-flex">'+
                            '<span class="title">產品條碼</span>'+
                            '<span class="text">4901001375431</span>'+
                            '</li>'+
                            '<li class="d-flex">'+
                            '<span class="title">外箱尺寸</span>'+
                            '<span class="text">522x262x209mm</span>'+
                            '</li>'+
                            '<li class="d-flex">'+
                            '<span class="title">保存期限</span>'+
                            '<span class="text">24個月(常溫未開封狀態下) </span>'+
                            '</li>'+
                            '<li class="d-flex">'+
                            '<span class="title">過敏原</span>'+
                            '<span class="text">2本產品含有牛奶及其製品</span>'+
                            '</li>'+
                            '<li class="d-flex">'+
                            '<span class="title">保存方法</span>'+
                            '<span class="text">開封後，為了避免受潮，請密封存放於乾燥通風處，以確認產品的最佳風味及品質。 </span>'+
                            '</li>'+
                            '</ul>'
                },
                {
                    title:'商品-營養標示',
                    image:'商品-營養標示.png',
                    description:'商品-營養標示',
                    html:'<ul class="info-box p-a0">'+
                            '<li class="d-flex">'+
                            '<span class="title">每一份量</span>'+
                            '<span class="text">1公克</span>'+
                            '</li>'+
                            '<li class="d-flex">'+
                            '<span class="title">本包裝含</span>'+
                            '<span class="text">1000份</span>'+
                            '</li>'+
                            '</ul>'+
                            '<ul class="product-info-box p-a0">'+
                            '<li class="d-flex justify-content-between">'+
                            '<span class="title"></span>'+
                            '<span class="text-e">每份</span>'+
                            '<span class="text-h">每100公克</span>'+
                            '</li>'+
                            '<li class="d-flex justify-content-between">'+
                            '<span class="title">熱量</span>'+
                            '<span class="text-e">2.2大卡</span>'+
                            '<span class="text-h">225大卡</span>'+
                            '</li>'+
                            '<li class="d-flex justify-content-between">'+
                            '<span class="title">蛋白質</span>'+
                            '<span class="text-e">0.2公克</span>'+
                            '<span class="text-h">24.1公克</span>'+
                            '</li>'+
                            '<li class="d-flex justify-content-between">'+
                            '<span class="title">脂肪</span>'+
                            '<span class="text-e">0.0公克</span>'+
                            '<span class="text-h">0.0公克</span>'+
                            '</li>'+
                            '<li class="d-flex justify-content-between">'+
                            '<span class="title">&nbsp;&nbsp;&nbsp;&nbsp;飽和脂肪</span>'+
                            '<span class="text-e">0.0公克</span>'+
                            '<span class="text-h">0.0公克</span>'+
                            '</li>'+
                            '<li class="d-flex justify-content-between">'+
                            '<span class="title">&nbsp;&nbsp;&nbsp;&nbsp;反式脂肪</span>'+
                            '<span class="text-e">0.0公克</span>'+
                            '<span class="text-h">0.0公克</span>'+
                            '</li>'+
                            '<li class="d-flex justify-content-between">'+
                            '<span class="title">碳水化合物</span>'+
                            '<span class="text-e">0.3公克</span>'+
                            '<span class="text-h">31.6公克</span>'+
                            '</li>'+
                            '<li class="d-flex justify-content-between">'+
                            '<span class="title">&nbsp;&nbsp;&nbsp;&nbsp;糖</span>'+
                            '<span class="text-e">0.2公克</span>'+
                            '<span class="text-h">17.0公克</span>'+
                            '</li>'+
                            '<li class="d-flex justify-content-between">'+
                            '<span class="title">鈉</span>'+
                            '<span class="text-e">175毫克</span>'+
                            '<span class="text-h">17500毫克</span>'+
                            '</li>'+
                            '</ul>'
                },
                {
                    title:'專業食譜-營養成份',
                    image:'專業食譜-營養成份.png',
                    description:'專業食譜-營養成份',
                    html:'<div class="table-wrap p-tb20">'+
                            '<table class="recipe-nutrition-box">'+
                            '<tbody>'+
                            '<tr>'+
                            '<th>熱量(Kcal)</th>'+
                            '<td>上稿</td>'+
                            '<th>蛋白質(g)</th>'+
                            '<td>上稿</td>'+
                            '<th>脂肪(g)</th>'+
                            '<td>上稿</td>'+
                            '<th>碳水化合物(g)</th>'+
                            '<td>上稿</td>'+
                            '</tr>'+
                            '<tr>'+
                            '<th>鈣(mg)</th>'+
                            '<td>上稿</td>'+
                            '<th>鐵(mg)</th>'+
                            '<td>上稿</td>'+
                            '<th>維生素A(μg)</th>'+
                            '<td>上稿</td>'+
                            '<th>維生素E(mg)</th>'+
                            '<td>上稿</td>'+
                            '</tr>'+
                            '<tr>'+
                            '<th>維生素B1(mg)</th>'+
                            '<td>上稿</td>'+
                            '<th>維生素B2(mg)</th>'+
                            '<td>上稿</td>'+
                            '<th>維生素B6(mg)</th>'+
                            '<td>上稿</td>'+
                            '<th>維生素B12(mg)</th>'+
                            '<td>上稿</td>'+
                            '</tr>'+
                            '<tr>'+
                            '<th>維生素C(mg)</th>'+
                            '<td>上稿</td>'+
                            '<th>膽固醇(mg)</th>'+
                            '<td>上稿</td>'+
                            '<th>膳食纖維(g)</th>'+
                            '<td>上稿</td>'+
                            '<th>鹽分(g)</th>'+
                            '<td>上稿</td>'+
                            '</tr>'+
                            '<tr>'+
                            '<th>蔬菜攝取量(g)</th>'+
                            '<td>上稿</td>'+
                            '<th></th>'+
                            '<td></td>'+
                            '<th></th>'+
                            '<td></td>'+
                            '<th></th>'+
                            '<td></td>'+
                            '</tr>'+
                            '</tbody>'+
                            '</table>'+
                            '</div>'
                },
            ]
        });