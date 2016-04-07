<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ tag pageEncoding="UTF-8" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="categories" type="java.util.List" required="true" %>
<%@ attribute name="currentCateId" required="true" %>

<div class="left">
    <div class="navLeft mv_10">
        <a href="/info" class="${empty currentCateId ? 'in_block current' : ''}">全部病历</a>
        <c:forEach var="category" items="${categories}">
            <a href="/info/detail?typeId=${category.id}" class="${currentCateId == category.id ? 'in_block current' : ''}">${category.name}</a>
        </c:forEach>
    </div>
<%--
    <c:if test="${session_user != null }"><a href="/info/add" class="ml_5 btnOpH24 h24Silver in_block mr_10 mt_10" id="publish"> + 我要发表</a></c:if>
    <c:if test="${session_user != null && session_user.name=='admin'}"><a href="javascript:void(0);" class="mt_10 btnOpH24 h24Silver in_block " id="addCategory"> + 添加类别</a></c:if>
 --%>
</div>