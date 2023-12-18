<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@tag pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
       <div class="container-fluid">
           <a href="/main" class="navbar-brand">
               HOSTEL
           </a>
           <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
           </button>
           <div class="collapse navbar-collapse d-flex justify-content-between" id="navbarNavAltMarkup">
               <div class="navbar-nav">
                   <a class="nav-link" href="#">ABOUT US</a>
                   <c:choose>
                       <c:when test="${ sessionScope.role eq 'client' }">
                           <a class="nav-link" href="/book">BOOK</a>
                           <a href="/orders" class="nav-link">MY ORDERS</a>
                       </c:when>
                   </c:choose>
                   <c:choose>
                       <c:when test="${ sessionScope.role eq null }">
                           <a class="nav-link" href="/registration">REGISTRATION</a>
                       </c:when>
                   </c:choose>
                   <c:choose>
                       <c:when test="${ sessionScope.role eq 'admin' }">
                           <a class="nav-link" href="/admin">ADMIN PANEL</a>
                           <a href="/admin/rooms" class="nav-link">HOSTEL ROOMS</a>
                           <a href="/admin/orders" class="nav-link">USER ORDERS</a>
                       </c:when>
                   </c:choose>

               </div>

               <div class="d-flex align-items-center justify-content-around g-3">
                   <c:choose>
                       <c:when test="${ sessionScope.role eq null}">
                           <form class="d-flex" action="/main" method="POST">
                               <input class="form-control me-2" name="login" id="login" type="text" placeholder="Login" aria-label="Login">
                               <input class="form-control me-2" name="password" id="password" type="password" placeholder="Password" aria-label="Password">
                               <button class="btn btn-outline-success" type="submit">SING IN</button>
                           </form>
                       </c:when>
                       <c:otherwise>
                           WELCOME ${ sessionScope.name }!
                           <c:choose>
                               <c:when test="${ sessionScope.role eq 'admin' || sessionScope.role eq 'client' }">
                                   <a class="nav-link" href="/main/sing-out"> SING OUT</a>
                               </c:when>
                           </c:choose>
                       </c:otherwise>
                   </c:choose>
               </div>
           </div>
       </div>
    </nav>
</header>
