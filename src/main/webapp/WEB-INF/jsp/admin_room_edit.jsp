<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="room" scope="request" type="by.bsuir.barilko.entity.rooms.Rooms"/>

<fmt:setBundle basename="messages" />
<c:choose>
    <c:when test="${ sessionScope.role eq null || sessionScope.role eq 'client'}">
        <% response.sendRedirect("/main"); %>
    </c:when>
    <c:otherwise>
        <tags:header/>
        <tags:links pageTitle="ADMIN-ROOMS-EDIT">
            <h1>EDIT ROOM</h1>
            <div class="mt-3 p-5">
                <form action="/admin/rooms/edit" method="POST" class="p-2 border rounded border-dark">
                    <input type="hidden" name="id" value="${room.id_rooms}">
                    <div class="form-group row">
                        <label for="num" class="col-5 col-form-label">Amount of Guests</label>
                        <div class="col-7">
                            <input id="num" name="num" type="number" required="required" class="form-control" value="${room.rooms_guest_amount}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="price" class="col-5 col-form-label">Price</label>
                        <div class="col-7">
                            <input id="price" name="price" placeholder="Enter price in $" type="number"
                                   class="form-control" required="required" value="${room.rooms_price}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="description" class="col-5 col-form-label">Description</label>
                        <div class="col-7">
                            <textarea id="description" name="description" cols="40" rows="5" class="form-control"
                                      required="required">${room.rooms_discription}</textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-5 col-7">
                            <button name="submit" type="submit" class="btn btn-primary">SUBMIT</button>
                        </div>
                    </div>
                </form>
            </div>
        </tags:links>
    </c:otherwise>
</c:choose>
