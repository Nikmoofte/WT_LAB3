<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="users" scope="request" type="java.util.List"/>
<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages" />
<c:choose>
    <c:when test="${ sessionScope.role eq null || sessionScope.role eq 'client'}">
        <% response.sendRedirect("/main"); %>
    </c:when>
    <c:otherwise>
        <tags:header />
        <tags:links pageTitle="ADMIN">
            <h1>ADMIN PANEL</h1>
            <hr />
            <h1>WEBSITE USERS</h1>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">LOGIN</th>
                    <th scope="col">EMAIL</th>
                    <th scope="col">NAME</th>
                    <th scope="col">SURNAME</th>
                    <th scope="col">ADMIN STATUS</th>
                    <th scope="col">DISCOUNT</th>
                    <th scope="col">BAN STATUS</th>
                    <th scope="col">ACTION</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <th scope="row">${user.id_user}</th>
                        <td>${user.user_login}</td>
                        <td>${user.user_email}</td>
                        <td>${user.user_name}</td>
                        <td>${user.user_surname}</td>
                        <td>
                            <c:choose>
                                <c:when test="${ user.user_role == true}">
                                    YES
                                </c:when>
                                <c:otherwise>
                                    NO
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${user.user_discount * 100}%</td>
                        <td>
                            <c:choose>
                                <c:when test="${ user.user_ban == true}">
                                    YES
                                </c:when>
                                <c:otherwise>
                                    NO
                                </c:otherwise>
                        </c:choose>
                        </td>
                        <td class="d-flex justify-around">
                            <form action="/admin" method="POST">
                                <input type="hidden" name="sub" value="ban" />
                                <input type="hidden" name="user_id" value="${user.id_user}" />
                                <input type="hidden" name="discount" value="" />
                                <button type="submit" class="btn btn-danger">
                                    <c:choose>
                                        <c:when test="${ user.user_ban == true}">
                                            UNBAN
                                        </c:when>
                                        <c:otherwise>
                                            BAN
                                        </c:otherwise>
                                    </c:choose>
                                    USER</button>
                            </form>

                            <form action="/admin" method="POST">
                                <input type="hidden" name="sub" value="admin" />
                                <input type="hidden" name="discount" value="" />
                                <input type="hidden" name="user_id" value="${user.id_user}" />
                                <button type="submit" class="btn btn-primary">
                                    <c:choose>
                                        <c:when test="${ user.user_role == true}">
                                            UNSET
                                        </c:when>
                                        <c:otherwise>
                                            SET
                                        </c:otherwise>
                                    </c:choose>
                                    </button>
                            </form>
                            <form action="/admin" method="POST" class="d-flex">
                                <input type="hidden" name="sub" value="discount" />
                                <input type="hidden" name="user_id" value="${user.id_user}" />
                                <button type="submit" class="btn btn-primary">SET DISCOUNT</button>
                                <div>
                                    <input type="range" name="discount" class="form-range" min="0" max="1" step="0.05" id="discount_input_${user.id_user}">
                                    <p>Discount: <output id="value_${user.id_user}"></output> %</p>

                                </div>
                                <script>
                                    const value_${user.id_user} = document.querySelector("#value_${user.id_user}");
                                    const input_${user.id_user} = document.querySelector("#discount_input_${user.id_user}");
                                    value_${user.id_user}.textContent = Math.round(Number(input_${user.id_user}.value * 100));
                                    input_${user.id_user}.addEventListener("input", (event) => {
                                        value_${user.id_user}.textContent = Math.round(Number(event.target.value * 100));
                                    });

                                </script>

                            </form>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </tags:links>
    </c:otherwise>
</c:choose>

