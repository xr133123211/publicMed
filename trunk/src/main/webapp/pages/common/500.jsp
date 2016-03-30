<%@ include file="../common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/pages/common/header.jsp">
	<jsp:param name="title" value="出错了" />
</jsp:include>

<!--begin: 正文-->
<div class="errorPage">
	<div class="errorWrap">
		<h1>500</h1>
	</div>
	<p class="errorMessageInfo">
		您所要查找的页面出错了，稍安勿躁
		<a href="/" class="btn_goHome ml_20">回首页</a>
	</p>
</div>
<!--end: 正文-->

<!-- footer begin -->
<%@include file="/pages/common/footer.jsp"%>
