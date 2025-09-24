$(document).ready(function () {
    $('#OpenOrderPage').click(function () {
        const container = $('#OrderContainer');
        $.ajax({
            url: 'http://localhost:8080/mypetstore/newOrderForm',// 替换为实际的 JSP 文件路径
            method: 'GET',
            success: function (html) {
                $('#overlay').fadeIn();
                container.html(html);
                container.show();
            },
            error: function (xhr, status, error) {
                console.error('Failed to load order page:', error);
                container.html('<p id="color_red" ">Failed to load order page. Please try again later.</p>');
                container.show();
            }
        });
    });
    $('#CloseOrderPage').click(function () {
        $('#OrderContainer').hide();
        $('#overlay').fadeOut();
    });
    $('#save-payment').click(function () {
        const formData = $('#payment-form').serialize();
        $.ajax({
            url: 'http://localhost:8080/mypetstore/newOrder', // 后端Servlet地址
            type: 'POST',
            data: formData + '&action=savePayment', // 附加标志参数
            success: function (response) {
                alert('Payment information saved successfully!');
            },
            error: function () {
                alert('Failed to save payment information.');
            }
        });
    });
    $(".tabs li").on("click", function () {
        var tabId = $(this).data("tab");

        // 切换选项卡按钮的样式
        $(".tabs li").removeClass("active");
        $(this).addClass("active");

        // 切换选项卡内容
        $(".tab").removeClass("active");
        $("#" + tabId).addClass("active");
    });
});