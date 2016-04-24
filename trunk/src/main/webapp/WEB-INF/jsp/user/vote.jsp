<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="列表"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="/user/org/${session_user.id}">权限列表</a></li>
                <li class="active"><a href="/user/vote">等待投票<span class="sr-only">(current)</span></a></li>
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
                        <th>申请机构</th>
                        <th>投票</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="vote" items="${paginate.pageList}">
                        <tr>
                            <td>${vote.categoryName}</td>
                            <td>${vote.userName}</td>
                            <td><a >${vote.orgName}</a> </td>
                            <c:if test="${vote.status==0}">
                            <td><a href="/user/vote/detail/${vote.accessId}">投票</a></td>
                            </c:if>
                            <c:if test="${vote.status==1}">
                                <td><a href="/user/vote/detail/${vote.accessId}">已投票</a></td>
                            </c:if>
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


