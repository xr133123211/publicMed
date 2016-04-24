<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="列表"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="/user/personal/${session_user.id}">最新的访问记录</a></li>
                <li class="active"><a href="/user/requestList">最新的申请记录<span class="sr-only">(current)</span></a></li>
                <li><a href="/user/tempList">临时申请记录</a></li>
                <li><a href="/user/auth_list">权限分配列表</a></li>
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
                        <th>医疗机构</th>
                        <th>申请时间</th>
                        <th>给予授权</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="auth" items="${paginate.pageList}">
                        <tr>
                            <td>${auth.categoryName}</td>
                            <td>${auth.orgName}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${auth.trustDate}"/></td>
                            <td><a href="/user/auth/${auth.org_id}?typeId=${auth.type}">修改授权</a></td>
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


