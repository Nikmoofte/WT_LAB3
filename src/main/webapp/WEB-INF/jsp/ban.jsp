<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages" />
<tags:links pageTitle="BANNED">
    <div style="width:100%; height: 100%;" class="bg-dark text-white">
        <div class="container py-5 m-auto" >
            <div class="row">
                <div class="col-md-2 text-center">
                    <p><i class="fa fa-exclamation-triangle fa-5x"></i><br/>Status: BANNED</p>
                </div>
                <div class="col-md-10">
                    <h3>OPPSSS!!!! Sorry...</h3>
                    <p>Sorry, your access is refused due to your illegal actions on website. Connect with administration to learn more.</p>
                </div>
            </div>
        </div>
    </div>
</tags:links>