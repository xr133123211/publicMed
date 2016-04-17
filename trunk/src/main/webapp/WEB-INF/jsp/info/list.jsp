<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="列表"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
    <tags:sidebar categories="${categories}" currentCateId="${param.cateId}"/>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <div class="contentRight">
            <h1 class="page-header"><c:if test="${session_user != null}">${session_user.name}</c:if>病历信息</h1>
        </div>
    </div>

</div>

<jsp:include page="../common/footer.jsp"/>


