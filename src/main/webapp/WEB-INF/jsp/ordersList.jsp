<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="orders" scope="request" type="java.util.List"/>
<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages" />
<c:choose>
    <c:when test="${ sessionScope.role eq null }">
        <% response.sendRedirect("/main"); %>
    </c:when>
    <c:otherwise>
        <tags:header/>
        <tags:links pageTitle="MY ORDERS">
            <hr/>
            <h1>MY ORDERS</h1>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Room</th>
                    <th scope="col">Type</th>
                    <th scope="col">Name</th>
                    <th scope="col">Surname</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Email</th>
                    <th scope="col">Status</th>
                    <th scope="col">Date Sent</th>
                    <th scope="col">Payment status</th>
                    <th scope="col">From</th>
                    <th scope="col">To</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <th scope="row">${order.id_order}</th>
                        <td>${order.rooms.id_rooms}</td>
                        <td>${order.order_type}</td>
                        <td>${order.order_name}</td>
                        <td>${order.order_surname}</td>
                        <td>${order.order_phonenumber}</td>
                        <td>${order.order_email}</td>
                        <td>${order.order_status}</td>
                        <td>${order.order_date}</td>
                        <td>
                            <c:choose>
                                <c:when test="${ order.order_paid == true}">
                                    YES
                                </c:when>
                                <c:otherwise>
                                    NO
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${order.order_startDate}</td>
                        <td>${order.order_endDate}</td>
                        <td class="d-flex justify-around">
                            <c:choose>
                                <c:when test="${ order.order_status == 'CANCELED' }">
                                    CANCELED
                                </c:when>
                                <c:otherwise>
                                    <form action="/orders/cancel" method="POST">
                                        <input type="hidden" name="orderID" value="${order.id_order}" />
                                        <button type="submit" class="btn btn-primary">
                                            CANCEL
                                        </button>
                                    </form>
                                </c:otherwise>
                            </c:choose>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </tags:links>
    </c:otherwise>
</c:choose>
