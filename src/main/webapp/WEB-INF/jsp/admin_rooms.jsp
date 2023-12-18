<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages" />
<jsp:useBean id="rooms" scope="request" type="java.util.List"/>
<c:choose>
    <c:when test="${ sessionScope.role eq null || sessionScope.role eq 'client'}">
        <% response.sendRedirect("/main"); %>
    </c:when>
    <c:otherwise>
        <tags:header/>
        <tags:links pageTitle="ADMIN-ROOMS">

            <h1>CREATE ROOM</h1>
            <div class="mt-3 p-5">
                <form action="/admin/rooms" method="POST" class="p-2 border rounded border-dark">
                    <div class="form-group row">
                        <label for="num" class="col-5 col-form-label">AMOUNT OF GUESTS</label>
                        <div class="col-7">
                            <input id="num" name="num" type="number" required="required" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="price" class="col-5 col-form-label">PRICE</label>
                        <div class="col-7">
                            <input id="price" name="price" placeholder="Enter price in $" type="number"
                                   class="form-control" required="required">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="description" class="col-5 col-form-label">DESCRIPTION</label>
                        <div class="col-7">
                            <textarea id="description" name="description" cols="40" rows="5" class="form-control"
                                      required="required"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-5 col-7">
                            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
            <hr/>
            <h1>ROOMS</h1>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">AMOUNT OF GUESTS</th>
                    <th scope="col">PRICE</th>
                    <th scope="col">DESCRIPTION</th>
                    <th scope="col">ACTION</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="room" items="${rooms}">
                    <tr>
                        <th scope="row">${room.id_rooms}</th>
                        <td>${room.rooms_guest_amount}</td>
                        <td>${room.rooms_price}</td>
                        <td>${room.rooms_discription}</td>

                        <td class="d-flex justify-around">
                            <form action="/admin/rooms/edit" method="GET">
                                <input type="hidden" name="id" value="${room.id_rooms}" />
                                <button type="submit" class="btn btn-primary">
                                    EDIT
                                </button>
                            </form>
                            <form action="/admin/rooms/delete" method="POST">
                                <input type="hidden" name="sub" value="delete" />
                                <input type="hidden" name="id" value="${room.id_rooms}" />
                                <button type="submit" class="btn btn-danger">
                                    DELETE
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