<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="列表"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="#">最新的访问记录<span class="sr-only">(current)</span></a></li>
                <li><a href="#">最新的申请记录</a></li>
                <li><a href="#">权限列表 </a></li>
                <li><a href="#">等待投票</a></li>
                <li><a href="/info">病历信息</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <div class="contentRight">
            <h1 class="page-header">最近访问记录</h1>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>病历类别</th>
                        <th>用户名</th>
                        <th>访问者</th>
                        <th>访问时间</th>
                        <th>授权时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="access" items="${paginate.pageList}">
                        <tr>
                            <td>${access.categoryName}</td>
                            <td>${access.userName}</td>
                            <td>${access.accessName}</td>
                            <td><c:if test="${not empty article.updatedAt}"><fmt:formatDate pattern="yyyy-MM-dd" value="${info.accessTime}"/></c:if></td>
                            <td><c:if test="${not empty article.updatedAt}"><fmt:formatDate pattern="yyyy-MM-dd" value="${info.authTime}"/></c:if></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <app:paginate/>
            </div>
         </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>


