<%@ include file="../common/top.jsp"%>


<div id="BackLink">

<a href="categoryForm?categoryId=${sessionScope.category.categoryId}">Return to ${sessionScope.category.name}</a>
</div>

<div id="Catalog">

    <h2>${sessionScope.product.name}</h2>

    <table>
        <tr>
          <th>Item ID</th>
          <th>Product ID</th>
          <th>Description</th>
          <th>List Price</th>
          <th>&nbsp;</th>
        </tr>
        <c:forEach var="item" items="${sessionScope.itemList}">
          <tr>
            <td>
                <a href="itemForm?itemId=${item.itemId}">${item.itemId}</a>
            </td>
            <td>${item.product.productId}</td>
            <td>${item.attribute1} ${item.attribute2} ${item.attribute3}
                ${item.attribute4} ${item.attribute5} ${sessionScope.product.name}</td>
            <td><fmt:formatNumber value="${item.listPrice}"
                                  pattern="$#,##0.00" /></td>
            <td>
<%--            <a href="" class="Button">Add to Cart</a>--%>
            <a href="addItemToCart?workingItemId=${item.itemId}" class="Button">Add to Cart</a>
            </td>
          </tr>
        </c:forEach>

    </table>

</div>

<%@ include file="../common/bottom.jsp"%>





