<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="列表"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="">权限列表<span class="sr-only">(current)</span></a></li>
                <li><a href="/user/vote">等待投票</a></li>
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
                        <th>医疗机构</th>
                        <th>授权状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="auth" items="${paginate.pageList}">
                        <tr>
                            <td>${auth.categoryName}</td>
                            <td>${auth.userName}</td>
                            <td>${auth.orgName}</td>
                            <td><a href="/info/detail/${auth.user_id}?typeId=${auth.type}">${auth.authStatus}</a></td>
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


