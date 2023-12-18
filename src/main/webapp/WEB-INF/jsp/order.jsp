<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="rooms" scope="request" type="java.util.List"/>
<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages" />
<c:set var="selected" value=""/>
<c:choose>
    <c:when test="${ sessionScope.role eq null }">
        <% response.sendRedirect("/main"); %>
    </c:when>
    <c:otherwise>
        <tags:header/>
        <tags:links pageTitle="BOOK">
            <h1>BOOK</h1>
            <hr/>
            <form action="/book" method="POST">
                <div class="form-group row">
                    <label class="col-4 col-form-label">TYPE</label>
                    <div class="col-8">
                        <div class="custom-controls-stacked">
                            <div class="custom-control custom-radio">
                                <input name="type" id="type_0" type="radio" required="required"
                                       class="custom-control-input" value="BOOKED">
                                <label for="type_0" class="custom-control-label">BOOKED</label>
                            </div>
                        </div>
                        <div class="custom-controls-stacked">
                            <div class="custom-control custom-radio">
                                <input name="type" id="type_1" type="radio" required="required"
                                       class="custom-control-input" value="PAID">
                                <label for="type_1" class="custom-control-label">PAID</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-4 col-form-label">Name</label>
                    <div class="col-8">
                        <input id="name" name="name" type="text" class="form-control" required="required">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="surname" class="col-4 col-form-label">Surname</label>
                    <div class="col-8">
                        <input id="surname" name="surname" type="text" required="required" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="phone" class="col-4 col-form-label">Phone number</label>
                    <div class="col-8">
                        <input id="phone" name="phone" type="text" class="form-control" required="required">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="email" class="col-4 col-form-label">Email</label>
                    <div class="col-8">
                        <input id="email" name="email" type="email" class="form-control" required="required">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-4 col-form-label">Room</label>
                    <div class="col-8">
                        <c:forEach var="roomObj" items="${rooms}">
                            <div class="custom-controls-stacked row-cols-3">
                                <div class="custom-control custom-radio col">
                                    <input name="roomID" id="roomID_${roomObj.id_rooms}" type="radio" required="required"
                                           class="custom-control-input" value="${roomObj.id_rooms}" hidden="hidden">
                                    <label for="roomID_${roomObj.id_rooms}" class="custom-control-label">
                                        <div class="card text-center">
                                            <div class="card-header">
                                                Room #${ roomObj.id_rooms }
                                            </div>
                                            <div class="card-body">
                                                <h5 class="card-title">Amount of Guests: ${ roomObj.rooms_guest_amount }</h5>
                                                <p class="card-text">About room: <br/>${ roomObj.rooms_discription }</p>
                                            </div>
                                            <div class="card-footer text-muted">
                                                <c:choose>
                                                    <c:when test="${ sessionScope.discount eq 0.0  }">
                                                        Price: ${ roomObj.rooms_price }$
                                                    </c:when>
                                                    <c:otherwise>
                                                        Price: <del>${ roomObj.rooms_price }$</del> <mark>${ roomObj.rooms_price - roomObj.rooms_price * sessionScope.discount }$</mark>

                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </div>
                                    </label>

                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
                <div class="form-group row">
                    <label for="startDate" class="col-4 col-form-label">From</label>
                    <div class="col-8">
                        <input id="startDate" name="startDate" type="date" required="required" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="endDate" class="col-4 col-form-label">To</label>
                    <div class="col-8">
                        <input id="endDate" name="endDate" type="date" class="form-control" required="required">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="offset-4 col-8">
                        <button name="submit" type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </tags:links>
    </c:otherwise>
</c:choose>