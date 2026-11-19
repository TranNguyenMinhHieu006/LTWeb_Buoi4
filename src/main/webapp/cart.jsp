<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>murach's Java Servelets and</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/main.css">
</head>
<body>
    <div class="page">
        <h2>Your cart</h2>
        <table>
            <tr>
                <th class="cart-quantity-column">Quantity</th>
                <th class="description">Description</th>
                <th class="cart-price-column">Price</th>
                <th class="cart-amount-column">Amount</th>
                <th class="cart-action-column"></th>
            </tr>
            <c:forEach var="item" items="${cart.items}">
                <tr>
                    <td>
                        <form action="cart" method="post">
                            <input type="number" name="quantity" value="${item.quantity}" min="1">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="productCode" value="${item.product.ID}">
                            <input type="submit" value="Update">
                        </form>
                    </td>
                    <td>${item.product.description}</td>
                    <td>$<fmt:formatNumber value="${item.product.price}" pattern="0.00"/></td>
                    <td>$<fmt:formatNumber value="${item.total}" pattern="0.00"/></td>
                    <td>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="productCode" value="${item.product.ID}">
                            <input type="submit" value="Remove Item">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <p class="quantity-note">
            <strong>To change the quantity,</strong> enter the new quantity and click on the Update button.
        </p>
        <div class="actions">
            <div class="action-row">
                <form action="index.html" method="get">
                    <input type="submit" value="Continue Shopping">
                </form>
            </div>
            <div class="action-row">
                <form action="checkout" method="post">
                    <input type="submit" value="Checkout">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
