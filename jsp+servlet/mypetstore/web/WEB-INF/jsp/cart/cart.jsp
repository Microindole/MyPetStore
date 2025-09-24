<%@ include file="../common/top.jsp"%>


<style>

</style>
<div id="BackLink">
    <a href="mainForm">Return to Main Menu</a>
</div>

<div id="Catalog">

    <div id="Cart">

        <h2>Shopping Cart</h2>

        <form name="cart" action="updateCart" method="post">
            <table id="cartTable">
                <tr id="tableHeader">
                    <th><b>Item ID</b></th>
                    <th><b>Product ID</b></th>
                    <th><b>Description</b></th>
                    <th><b>In Stock?</b></th>
                    <th><b>Quantity</b></th>
                    <th><b>List Price</b></th>
                    <th><b>Total Cost</b></th>
                    <th>&nbsp;</th>
                </tr>

                <c:if test="${sessionScope.cart.numberOfItems == 0}">
                    <tr>
                        <td colspan="8"><b>Your cart is empty.</b></td>
                    </tr>
                </c:if>

                <c:forEach var="cartItem" items="${sessionScope.cart.cartItems}">
                    <tr id="${cartItem.item.itemId}">
                        <td>
                            <a href="itemForm?itemId=${cartItem.item.itemId}">${cartItem.item.itemId}</a>
                        </td>
                        <td>
                                ${cartItem.item.product.productId}
                        </td>
                        <td>
                                ${cartItem.item.attribute1} ${cartItem.item.attribute2}
                                ${cartItem.item.attribute3} ${cartItem.item.attribute4}
                                ${cartItem.item.attribute5} ${cartItem.item.product.name}
                        </td>
                        <td>
                                ${cartItem.inStock}
                        </td>


<%--                                            quantity列                                             --%>
                        <td style="width: 120px">
                            <input type="text" class="quantity" name="${cartItem.item.itemId}" value="${cartItem.quantity}">
                        </td>


<%--                                            该物品单价                                                 --%>
                        <td id="${cartItem.item.listPrice}">
                            <fmt:formatNumber value="${cartItem.item.listPrice}"
                                              pattern="$#,##0.00" />
                        </td>

<%--                                            该物品总价                                                --%>
                        <td>
                            <fmt:formatNumber value="${cartItem.total}"
                                              pattern="$#,##0.00" />
                        </td>

<%--                                            去除该物品                                                           --%>
                        <td>
<%--                            <a href="removeCartItem?workingItemId=${cartItem.item.itemId}" class="Button">Remove</a>--%>
                            <input type="button" class="remove" value="Remove">
                        </td>
                    </tr>

<%--                                               购物车总价                                                        --%>
                </c:forEach>
<%--                <tr>--%>
<%--                    <td colspan="7">--%>

<%--                        Sub Total: --%>
<%--                        <fmt:formatNumber  value="${sessionScope.cart.subTotal}" pattern="$#,##0.00" />--%>
<%--&lt;%&ndash;                        <input type="submit"  value="Update Cart">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <input type="button" value="updateCart">&ndash;%&gt;--%>
<%--                    </td>--%>
<%--                    <td>&nbsp;</td>--%>
<%--                </tr>--%>
            </table>



        </form>



        <c:if test="${sessionScope.cart.numberOfItems > 0}">

            <a href="newOrderForm" class="Button" id="isCheckout">Proceed to Checkout</a>
        </c:if>
    </div>

    <div id="MyList">
        <c:if test="${sessionScope.loginAccount != null}">
            <c:if test="${!empty sessionScope.loginAccount.listOption}">
                <%@ include file="includeMyList.jsp"%>
            </c:if>
        </c:if>
    </div>

    <div id="Separator">&nbsp;</div>
</div>
<script src="js/ajax-cart.js" ></script>
<%@ include file="../common/bottom.jsp"%>