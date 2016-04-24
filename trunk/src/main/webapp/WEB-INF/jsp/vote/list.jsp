<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="列表"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <c:forEach var="user" items="${voters}">
                    <li><a href = "/user/auth/${user.id}?typeId=${auth.type}" class="${currentCateId == category.id ? 'in_block current' : ''}">${user.name}</a></li>
                </c:forEach>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href = "/user/personal/${session_user.id}" class="${currentCateId == category.id ? 'in_block current' : ''}">返回个人中心</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="contentRight">
                <h1 class="page-header">投票信息</h1>
                <div class="mv_10 grey666">
                    <c:forEach items="${paginate.pageList}" var="vote">
                        <div >
                            <p>${vote.voteName}<span class="grey999"><fmt:formatDate value="${vote.authDate}" pattern="a HH:mm:ss.S"/></span></p>
                            <div>
                                <p >评分数：${vote.votePoint}</p>
                                <p >权限数：${vote.voteMax}</p>
                                <p >投票状态：${vote.voteStatus}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <app:paginate/>
            </div>
        </div>
</div>

<!--begin: footer-->
<jsp:include page="../common/footer.jsp"/>
<!--end: footer-->
</body>
</html>
