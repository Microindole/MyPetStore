$(function () {
    $('#username').on('blur', function () {
        var username = $(this).val();
        if(username!==''&&username!==null&&username.length!==0) {
            $.ajax({
                type: 'GET',
                url: 'http://localhost:8080/mypetstore/nameIsExist',
                data: {username: username}, // 传递用户名参数
                success: function (response) {
                    $('#feedback').show();
                    if (response.status === 'error') {
                        $('#feedback').text(response.message).removeClass('success-message').addClass('error-message');;
                    } else {
                        $('#feedback').text(response.message).removeClass('error-message').addClass('success-message');
                    }
                },
                error: function () {
                    $('#feedback').text('Error checking username');
                }
            });
        }else{
            $('#feedback').hide();

        }
    });
});