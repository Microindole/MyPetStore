<%@ include file="../common/top.jsp"%>

<div id="BackLink">
    <a href="mainForm"><font color="green">Return to Main Menu</font></a>
</div>

<div id="Catalog">
    <form action="">
        <h3>User Information</h3>
        <table>
            <tr>
                <td>User ID:</td>
                <td>${sessionScope.loginAccount.username}</td>
            </tr>
            <tr>
                <td>New password:</td>
                <td><input type="password" name="password">
                </td>
            </tr>
            <tr>
                <td>Repeat password:</td>
                <td><input type="password" name="repeatedPassword"></td>
            </tr>
        </table>
        <%@ include file="includeAccountFields.jsp"%>
        <input type="submit" name="editAccount" value="Save Account Information">
        <%--    <stripes:submit name="editAccount" value="Save Account Information" />--%>
    </form>
    <a href="viewListOrder?username=${sessionScope.account.username}" class="Button">My Orders</a>
</div>

<%@ include file="../common/bottom.jsp"%>
