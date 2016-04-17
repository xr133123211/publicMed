<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="${article.title}"/>
</jsp:include>
<div class="container-fluid">
    <div class="row">
        <tags:sidebar categories="${categories}" currentCateId="${param.cateId}"/>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <div class="contentRight">
                    <h2 class="mt_15 f14">病历详情</h2>
                    <input type="hidden" id="infoId" value="${info.id}"/>
                    <div class="mv_10 grey666">
                        <a href="/info">首页</a> &gt;&nbsp;&nbsp;<a href="/info/detail?typeId=${info.categoryId}">${info.categoryName}</a> &gt;&nbsp;&nbsp;${info.title}
                        <div class="mv_10">
                            <div class="mb_20 clearfix">
                                <h3>${info.title}
                                    <c:if test="${session_user != null}">
                                        <a type="button" class="btn btn-default"  href="/info/${info.id}/edit">编辑</a>
                                    </c:if>
                                </h3>
                            </div>
                            <p>${info.content}</p>
                            <span/>
                            <div class="right grey999">编辑于
                                <c:if test="${not empty info.updateTime}"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${info.updateTime}"/></c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>