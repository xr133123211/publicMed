<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="${article.title}"/>
</jsp:include>

<div class="container clearfix">
    <tags:sidebar categories="${categories}" currentCateId="${param.cateId}"/>
    <div class="contentRight">
        <h2 class="mt_15 f14">病历详情</h2>
        <input type="hidden" id="infoId" value="${info.id}"/>
        <div class="mv_10 grey666">
            <a href="/info">首页</a> &gt;&nbsp;&nbsp;<a href="/info/detail?typeId=${info.categoryId}">${info.categoryName}</a> &gt;&nbsp;&nbsp;${info.title}
            <div class="mv_10">
                <div class="mb_20 clearfix">
                    <h3 class="left lineH180"><a href="#" target="_blank" class="f14 bold ">${info.title}</a></h3>
                    <p class="right">
                    <c:if test="${session_user != null}">
			    		<a href="/info/${info.id}/edit" class="btnOpH24 h24Silver in_block ml_5" id="edit_btn">编辑</a>
            		</c:if> 
            		</p>	                       
                </div>
                <p class="grey666 lineH180 In24 f14">${info.content}</p>
                <div class="clearfix mt_20">
                    <div class="right grey999">编辑于
                        <c:if test="${not empty info.updateTime}"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${info.updateTime}"/></c:if>
                    </div>
                </div>
            </div>
        </div>

<jsp:include page="../common/footer.jsp"/>