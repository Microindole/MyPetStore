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
    <form action="register">

        <h3>User Information</h3>
        <c:if test="${requestScope.RegisterMsg !=null}">
            <p><font color="red">${requestScope.RegisterMsg}</font></p>
        </c:if>
        <table>
            <tr>
                <td>User ID:</td>
                <td><input name="userid" id="isExist"></td>

            </tr>

            <tr >
                <td id="checkUsername" style="color:red;width: 300px;background-color: white;font-size: 16px" colspan="2"></td>
            </tr>


            <tr>
                <td>New password:</td>
                <td><input type="password" name="password" id="pwd1"></td>
<%--                <div id="feedback"></div>--%>
            </tr>

            <tr >
                <td id="checkPassword" style="color:red;width: 300px;background-color: white;font-size: 16px" colspan="2"></td>
            </tr>

            <tr>
                <td>Repeat password:</td>
                <td><input type="password" name="repeatedPassword" id="pwd2"></td>
            </tr>

            <tr >
                <td id="checkRepeatedPassword" style="color:red;width: 300px;background-color: white;font-size: 16px" colspan="2"></td>
            </tr>
        </table>

        <h3>Account Information</h3>
        <div style="display: flex; justify-content: center; align-items: center;">
            <table>
                <tr>
                    <td>First name:</td>
                    <td>
                        <input type="text" name="account.firstName">
                    </td>
                </tr>
                <tr>
                    <td>Last name:</td>
                    <td>
                        <input type="text" name="account.lastName">
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <input type="email" size="40" name="account.email">
                    </td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td>
                        <input type="tel" name="account.phone">
                    </td>
                </tr>
                <tr>
                    <td>Address 1:</td>
                    <td>
                        <input type="text" size="40" name="account.address1">
                    </td>
                </tr>
                <tr>
                    <td>Address 2:</td>
                    <td>
                        <input type="text" size="40" name="account.address2">
                    </td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td>
                        <input type="text" name="account.city">
                    </td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td>
                        <input type="text" size="4" name="account.state">
                    </td>
                </tr>
                <tr>
                    <td>Zip:</td>
                    <td>
                        <input type="text" size="10" name="account.zip">
                    </td>
                </tr>
                <tr>
                    <td>Country:</td>
                    <td>
                        <input type="text" size="15" name="account.country">
                    </td>
                </tr>
            </table>

        </div>

        <h3>Profile Information</h3>

        <table>
            <tr>
                <td>Language Preference:</td>
                <td>
                    <select name="account.languagePreference" id="account.languagePreference">
                        <option value="english">English</option>
                        <option value="chinese">Chinese</option>
                        <option value="russian">Russian</option>
                        <option value="french">French</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Favourite Category:</td>
                <td>
                    <select name="account.favouriteCategoryId" id="account.favouriteCategoryId">
                        <option value="CATS">CATS</option>
                        <option value="DOGS">DOGS</option>
                        <option value="FISH">FISH</option>
                        <option value="BIRDS">BIRDS</option>
                        <option value="REPTILES">REPTILES</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Verification code:</td>
                <td>
                    <input type="text" name="code" style="width: 60px">
                    <img id="code_image" style="width: 88px;height: 22px;position: absolute;+margin-top:1px;margin-left: 5px" src="kaptcha.jpg">

                </td>

            </tr>
        </table>

        <input type="submit" name="editAccount" value="Save Account Information">

    </form>

</div>
<script src="js/check-username.js"></script>

<%@ include file="../common/bottom.jsp"%>
