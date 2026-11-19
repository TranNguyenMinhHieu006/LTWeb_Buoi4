<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/main.css">
</head>
<body>
    <div class="page">
        <h2>Checkout</h2>
        <c:choose>
            <c:when test="${empty cart.items}">
                <p>Your cart is empty.</p>
            </c:when>
            <c:otherwise>
                <p>Thank you for your order! Here is your summary:</p>
                <c:set var="grandTotal" value="0" />
                <table>
                    <tr>
                        <th>Quantity</th>
                        <th class="description">Description</th>
                        <th>Price</th>
                        <th>Amount</th>
                    </tr>
                    <c:forEach var="item" items="${cart.items}">
                        <c:set var="grandTotal" value="${grandTotal + item.total}" />
                        <tr>
                            <td>${item.quantity}</td>
                            <td>${item.product.description}</td>
                            <td>$<fmt:formatNumber value="${item.product.price}" pattern="0.00"/></td>
                            <td>$<fmt:formatNumber value="${item.total}" pattern="0.00"/></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="3"><b>Total</b></td>
                        <td><b>$<fmt:formatNumber value="${grandTotal}" pattern="0.00"/></b></td>
                    </tr>
                </table>
                <div class="actions">
                    <div class="action-row">
                        <form action="${pageContext.request.contextPath}/cart" method="post">
                            <input type="hidden" name="action" value="finish">
                            <input type="submit" value="Finish &amp; Back to Home">
                        </form>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="actions">
            <div class="action-row">
                <form action="${pageContext.request.contextPath}/cart" method="get">
                    <input type="submit" value="Back to Cart">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
