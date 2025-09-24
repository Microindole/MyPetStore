$(function() {

    //绑定标签 area ，鼠标悬停的事件 mouseover
    $('area').on('mouseover',function(){
        var categoryId  = $(this).data('category');
        var areaId      = $(this).attr('id');  // categoryId是笼统的，要加上一个具体的id确保匹配标签
        // console.log(areaId);
        // console.log(categoryId);

        // 发送异步请求
        $.ajax({
            type    :'GET',
            url     :'http://localhost:8080/mypetstore/showCategory?categoryId='+categoryId,
            success :function (data){
                console.log(data);
                var productListHTML = '';
                // 逐个显示信息
                for(var i=0;i<data.length; i++){
                    productListHTML += '<li class=\"productAutoItem\" data-productId="';
                    productListHTML += data[i].productId;
                    productListHTML += '">';
                    productListHTML += data[i].categoryId;
                    productListHTML += ': ';
                    productListHTML += data[i].name;
                    productListHTML += '</li>'
                }

                // 匹配具体的id
                switch (areaId){
                    case 'Birds1':
                        $('#showCategoryListBird1').html(productListHTML);
                        $('#showCategoryBird1').show();
                        break;
                    case 'Fish':
                        $('#showCategoryListFish').html(productListHTML);
                            $('#showCategoryFish').show();
                        break;
                    case 'Dogs':
                        $('#showCategoryListDogs').html(productListHTML);
                        $('#showCategoryDogs').show();
                        break;
                    case 'Cats':
                        $('#showCategoryListCats').html(productListHTML);
                        $('#showCategoryCats').show();
                        break;
                    case 'Reptiles':
                        $('#showCategoryListReptiles').html(productListHTML);
                        $('#showCategoryReptiles').show();
                        break;
                    case 'Birds2':
                        $('#showCategoryListBird2').html(productListHTML);
                        $('#showCategoryBird2').show();
                        break;
                }
            },
            error   :function (errorMsg){
                console.log(errorMsg);
            }
        });
    });

    // 跳转的具体的项
    $(document).on('click','.productAutoItem',function(){
        var productId = $(this).data('productid');
        // console.log(productId);
        $ ('#showCategoryBird1').hide();
        $ ('#showCategoryFish').hide();
        $ ('#showCategoryDogs').hide();
        $ ('#showCategoryReptiles').hide();
        $ ('#showCategoryCats').hide();
        $ ('#showCategoryBird2').hide();
        // $('#keyword').val('');
        window.location.href = 'http://localhost:8080/mypetstore/productForm?productId=' + productId;
    });


    // 鼠标离开列表后隐藏
    $('#showCategoryBird1').on('mouseleave',function(){
        $('#showCategoryBird1').hide();
    });

    $('#showCategoryFish').on('mouseleave',function(){
        $('#showCategoryFish').hide();
    });

    $('#showCategoryDogs').on('mouseleave',function(){
        $('#showCategoryDogs').hide();
    });

    $('#showCategoryCats').on('mouseleave',function(){
        $('#showCategoryCats').hide();
    });

    $('#showCategoryReptiles').on('mouseleave',function(){
        $('#showCategoryReptiles').hide();
    });

    $('#showCategoryBird2').on('mouseleave',function(){
        $('#showCategoryBird2').hide();
    });

});