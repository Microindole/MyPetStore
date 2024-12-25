<%@ include file="../common/top.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(function() {
        var $code = $("#code_image");
        $code.click(function() {
            this.src = "kaptcha.jpg?" + new Date().getTime(); // 使用 getTime() 方法获取当前时间的毫秒数
        });
    });
</script>

<div id="Catalog">
    <form action="signon" method="post">
        <p>Please enter your username and password.</p>
        <c:if test="${requestScope.signOnMsg != null}">
            <p><font color="red">${requestScope.signOnMsg}</font></p>
        </c:if>
        <table>
            <tr>
                <td>Username:</td>
                <td><input type="text" name="username"></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td>Verification code:</td>
                <td>
                    <input type="text" name="code" style="width: 60px">
                    <img id="code_image" style="width: 88px;height: 22px;position: absolute;+margin-top:1px;margin-left: 5px" src="kaptcha.jpg">

                </td>

            </tr>


        </table>
        <input type="submit" value="Login">
    </form>
    Need a username and password?
    <a href="registerForm">Register Now!</a>
</div>

<%@ include file="../common/bottom.jsp"%>