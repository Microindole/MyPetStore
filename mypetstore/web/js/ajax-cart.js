
$(function (){

    // 修改购物车内物品的数量
    $('.quantity').each(function (){
        $(this).on('blur',function (){
            var listPrice = this.parentNode.nextSibling.nextSibling;
            var totalPrice = listPrice.nextSibling.nextSibling;
            var itemRow = this.parentNode.parentNode;
            var itemId = $(itemRow).attr('id');
            totalPrice.firstChild.textContent = '$' + ($(listPrice).attr('id') * this.value).toFixed(2);

            $.ajax({
                type    :'GET',
                url     :'http://localhost:8080/mypetstore/ajaxUpdateCart?itemId='+itemId+'&quantity='+this.value,
                success :function (data){},
                error   :function (errorMsg){
                    console.log(errorMsg);
                }
            });
        });
    });

    // 删除购物车中的物品
    $('.remove').each(function () {
        $(this).on('click',function () {
            var itemRow = this.parentNode.parentNode;
            var itemId = $(itemRow).attr('id');
            var isCheckout = $('#isCheckout');
            $(itemRow).remove();
            var tableHeader = $('#tableHeader');
            var cartTable = $('#cartTable');
            console.log(cartTable.find('tr').length);
            // 在前端判断购物车是否为空，如果为空，显示购物车为空，并隐藏Checkout按钮
            if(cartTable.find('tr').length == 1){
                tableHeader.after("<tr><td colspan='8'><b>Your cart is empty.</b></td></tr>");
                isCheckout.hide();
            }

            $.ajax({
                type    : "GET",
                url     :'http://localhost:8080/mypetstore/ajaxRemoveCart?itemId='+itemId,
                success :function (data){},
                error   :function (errorMsg){
                    console.log(errorMsg);
                }
            });
        });
    });
});
