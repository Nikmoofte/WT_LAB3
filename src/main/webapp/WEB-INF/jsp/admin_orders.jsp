<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="orders" scope="request" type="java.util.List"/>
<c:choose>
    <c:when test="${ sessionScope.role eq null || sessionScope.role eq 'client'}">
        <% response.sendRedirect("/main"); %>
    </c:when>
    <c:otherwise>
        <tags:header/>
        <tags:links pageTitle="ADMIN-ROOMS-EDIT">
            <hr/>
            <h1>ADMIN ROOMS</h1>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">ROOM</th>
                    <th scope="col">TYPE</th>
                    <th scope="col">NAME</th>
                    <th scope="col">SURNAME</th>
                    <th scope="col">PHONE</th>
                    <th scope="col">EMAIL</th>
                    <th scope="col">STATUS</th>
                    <th scope="col">SENT DATE</th>
                    <th scope="col">PAYMENT STATUS</th>
                    <th scope="col">FROM</th>
                    <th scope="col">TO</th>
                    <th scope="col">ACTION</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <th scope="row">${order.id_order}</th>
                        <td>${order.roomsOrders.id_rooms}</td>
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
                            <form action="/admin/orders" method="POST">
                                <input type="hidden" name="status" value="approve" />
                                <input type="hidden" name="id" value="${order.id_order}" />
                                <button type="submit" class="btn btn-primary">
                                    APPROVE
                                </button>
                            </form>
                            <form action="/admin/orders" method="POST">
                                <input type="hidden" name="status" value="reject" />
                                <input type="hidden" name="id" value="${order.id_order}" />
                                <button type="submit" class="btn btn-danger">
                                    REJECT
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </tags:links>
    </c:otherwise>
</c:choose>
