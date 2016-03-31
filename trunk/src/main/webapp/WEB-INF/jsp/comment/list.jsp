<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="列表"/>
</jsp:include>

<div class="container clearfix">
    <tags:sidebar categories="${categories}" currentCateId="${param.cateId}"/>

    <div class="contentRight">
        <h2 class="mt_15 f14">评论列表</h2>
        <div class="mv_10 grey666">
            <c:forEach items="${paginate.pageList}" var="comment">
                <div class="r mt_10">
                    <p><a href="http://130.dooioo.com/home/85318" target="_blank" class="bold"></a>${comment.username} 
                    <span class="grey999"><fmt:formatDate value="${comment.createdAt}" pattern="a HH:mm:ss.S"/></span></p>
                    <div id="${comment.id}" class="mt_15">
                        <p >${comment.content}</p>
                        <c:if test="${SESSION_USER_V2!=null&&comment.userId==SESSION_USER_V2.id}">
                        <p class="mt_5"><a href="#"  onclick="editcomment(${comment.id})" >编辑</a><a href="#" class="red ml_10" onclick="deletecomment(${comment.id})">删除</a></p>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>
        <app:paginate/>
    </div>
</div>

<!--begin: footer-->
<jsp:include page="../common/footer.jsp"/>
<!--end: footer-->
</body>
</html>
