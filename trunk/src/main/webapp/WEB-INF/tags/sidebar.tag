<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ tag pageEncoding="UTF-8" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="categories" type="java.util.List" required="true" %>
<%@ attribute name="currentCateId" required="true" %>
<div class="col-sm-3 col-md-2 sidebar">
    <ul class="nav nav-sidebar">
        <c:forEach var="category" items="${categories}">
            <li><a href="/info/detail/${look_user.id}?typeId=${category.id}" class="${currentCateId == category.id ? 'in_block current' : ''}">${category.name}</a></li>
        </c:forEach>
        <c:if test="${session_user!=null&&look_user.id==session_user.id}">
            <li><a href="/user/personal/${session_user.id}">个人中心</a> </li>
        </c:if>


    </ul>
</div>