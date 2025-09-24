<%@ include file="../common/top.jsp"%>


<div id="BackLink">
    <a href="mainForm">Return to Main Menu</a>
</div>

<div id="Catalog">
    <form action="confirmOrderForm" method="post" id="addressForm">
        <table  style="width: 520px;margin-left: 267px">
            <tr>
                <th colspan=2>Payment Details</th>
            </tr>

            <tr>
                <td>Card Type:</td>
                <td>
                    <select name="order.cardType">
                        <option selected="selected" value="Visa" <c:if test="${sessionScope.order.cardType == 'Visa'}">selected</c:if>>Visa</option>
                        <option value="MasterCard" <c:if test="${sessionScope.order.cardType == 'MasterCard'}">selected</c:if>>MasterCard</option>
                        <option value="American Express" <c:if test="${sessionScope.order.cardType == 'American Express'}">selected</c:if>>American Express</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>Card Number:</td>
                <td>
                    <input type="text" name="creditCard" value="${sessionScope.order.creditCard}" required />
                </td>
            </tr>
            <tr>
                <td>Expiry Date (MM/YYYY):</td>
                <td>
                    <input type="date" name="expiryDate" value="${sessionScope.order.expiryDate}" required />
                </td>
            </tr>
            <tr>
                <th colspan=2>Billing Address</th>
            </tr>

            <tr>
                <td>First name:</td>
                <td>
                    <input type="text" name="billToFirstName" value="${sessionScope.order.billToFirstName}" required />
                </td>
            </tr>
            <tr>
                <td>Last name:</td>
                <td>
                    <input type="text" name="billToLastName" value="${sessionScope.order.billToLastName}" required />
                </td>
            </tr>
            <tr>
                <td>Address 1:</td>
                <td>
                    <input type="text" name="billAddress1" value="${sessionScope.order.billAddress1}" required />
                </td>
            </tr>
            <tr>
                <td>Address 2:</td>
                <td>
                    <input type="text" name="billAddress2" value="${sessionScope.order.billAddress2}" required />
                </td>
            </tr>
            <tr>
                <td>City:</td>
                <td>
                    <input type="text" name="billCity" value="${sessionScope.order.billCity}" required />
                </td>
            </tr>
            <tr>
                <td>State:</td>
                <td>
                    <input type="text" name="billState" value="${sessionScope.order.billState}" required />
                </td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td>
                    <input type="text" name="billZip" value="${sessionScope.order.billZip}" required />
                </td>
            </tr>
            <tr>
                <td>Country:</td>
                <td>
                    <input type="text" name="billCountry" value="${sessionScope.order.billCountry}" required />
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <input type="checkbox" name="shippingAddressRequired" id="shippingAddressRequired" value="true" />
                    <label for="shippingAddressRequired">Ship to different address...</label>
<%--                    <input id="shippingCheckbox" name="shippingAddressRequired" value="true" type="checkbox" >Ship to different address...--%>
                </td>
            </tr>
        </table>

        <table style="width: 520px;margin-left: 267px" id="addressTable">

        </table>
        <input name="newOrder" value="Continue" type="submit">
    </form>
</div>
<script src="js/shipping-form.js">
</script>
<%@ include file="../common/bottom.jsp"%>