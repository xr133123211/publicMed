<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="列表"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="">搜索结果</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <div class="contentRight">
            <h1 class="page-header">搜索用户列表</h1>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>病历类别</th>
                        <th>用户名</th>
                        <th>访问</th>
                        <th>授权</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="info" items="${paginate.pageList}">
                        <tr>
                            <td>${info.categoryName}</td>
                            <td>${info.username}</td>
                            <td>
                                <c:if test="${session_user.type !=0 }">
                                <a href="/info/detail/${info.userId}?typeId=${info.categoryId}">访问</a>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${session_user.type ==0 }">
                                <a href="/user/auth/${info.userId}?typeId=${info.categoryId}">授权</a>
                                </c:if>
                            </td>
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


