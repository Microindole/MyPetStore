$(function (){
    $('.quantity').on('blur',function (){
        let $this = $(this);

        $.ajax({
            type    :   'POST',
            url     :   'http://localhost:8080/mypetstore/updateCartItem',
            data    :   {
                itemId  :   $this.data('itemid'),
                quantity:   $this.val()
            },
            success :   function (data){
                if (data.valid){
                    let $tr = $this.closest('tr');

                    $('#subTotal').text('$' + data.subTotal);
                    $tr.find('.total').text('$' + data.total);

                    if (data.isRemoved) {
                        $tr.remove();
                    }

                }else {
                    $this.val(data.oldQuantity);
                }
            },
            error   :   function (errorMsg){
                console.log(errorMsg);
            }
        })
    })
})
