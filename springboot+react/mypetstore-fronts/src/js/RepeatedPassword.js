$(document).ready(function () {
        var password = $("#newpassword");
        var repeatedPassword = $("#repeatpassword");
        var repeatedPasswordFeedback = $("#repeatedPasswordFeedback");

        repeatedPassword.on("blur", function () {
            var passwordValue = password.val();
            var repeatedPasswordValue = repeatedPassword.val();
            if(repeatedPasswordValue!==''&&repeatedPasswordValue!==null&&repeatedPasswordValue.length!==0) {
                $('#repeatedPasswordFeedback').show();
                if (passwordValue !== repeatedPasswordValue) {
                repeatedPasswordFeedback.text("Two input password must be consistent").removeClass('success-message').addClass('error-message');;
            } else {
                repeatedPasswordFeedback.text("Two input passwords are the same").removeClass('error-message').addClass('success-message');
            }
            }else{
                $('#repeatedPasswordFeedback').hide();
            }
        });
    });
