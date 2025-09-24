<c:if test="${!empty sessionScope.myList}">
    <p>Pet Favorites <br />
        Shop for more of your favorite pets here.</p>
    <ul>
        <c:forEach var="product" items="${sessionScope.myList}">
            <li>
                <a href="productForm?productId=${product.productId}">${product.name}</a>
                (${product.productId})</li>
        </c:forEach>
    </ul>

</c:if>