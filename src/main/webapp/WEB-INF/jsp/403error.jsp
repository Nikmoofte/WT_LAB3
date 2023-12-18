<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages" />
<tags:links pageTitle="ERROR">
    <div style="width:100%; height: 100%;" class="bg-dark text-white">
        <div class="container py-5 m-auto" >
            <div class="row">
                <div class="col-md-2 text-center">
                    <p><i class="fa fa-exclamation-triangle fa-5x"></i><br/><fmt:message key="ERROR_403"/></p>
                </div>
                <div class="col-md-10">
                    <h3><fmt:message key="ERROR_403_TITLE"/></h3>
                    <p><fmt:message key="ERROR_403_FIRSTMESSAGE"/><br/><fmt:message key="ERROR_403_SECONDMESSAGE"/></p>
                    <a class="btn btn-danger" href="javascript:history.back()"><fmt:message key="ERROR_403_BUTTON"/></a>
                </div>
            </div>
        </div>
    </div>
</tags:links>
