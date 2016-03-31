<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>${param.title} - 德佑地产</title>
    <link type="text/css" rel="stylesheet" href="http://dui.dooioo.com/public/css/main.css">
    <link type="text/css" rel="stylesheet" href="http://dui.dooioo.com/public/css/headerNew.css">
    <script type="text/javascript" src="/static/js/portal.js"></script>
    <script type="text/javascript" src="/static/js/jquery-1.7.2.js"></script>
     <script type="text/javascript" src="/static/js/ed.js"></script>
    <c:if test="${ not empty param.css}">
        <c:forEach var="css" items="${fn:split(param.css, ',')}">
            <c:if test="${not empty css && !fn:contains(css,'http://')}">
                <link type="text/css" rel="stylesheet" href="/static/css/${css}">
            </c:if>
            <c:if test="${not empty css && fn:contains(css,'http://')}">
                <link type="text/css" rel="stylesheet" href="${css}">
            </c:if>
        </c:forEach>
    </c:if>
    <title>列表页-德佑地产</title>
</head>

<body>
<div class="headerWrap">
    <div class="header clearfix">
		<span class="left">
			<a href="#" class="logo_mini left"></a>
        </span>		
        <span class="ml_10 in_block f24 mr_20 mt_5 left" style="color:#FFF;font-family:'微软雅黑'">快速入手</span>
        <input id=key type="text" class="searchBoxTop left ml_5 mt_8 grey999" value="输入问题关键词，如：产品线、技术分享等…" onfocus="clearTxtMsg($(this),'输入问题关键词，如：产品线、技术分享等…', 'grey999')" ondrop="clearTxtMsg($(this),'输入问题关键词，如：产品线、技术分享等…', 'grey999')" onblur="showTxtMsg($(this),'输入问题关键词，如：产品线、技术分享等…', 'grey999')">
        <input id=search type="button" class="searchBtnTop left mt_8" value="" >
		<span class="right mt_10 pt_5">

            <c:if test="${SESSION_USER_V2 == null}">
			    <a href="/user/login" class="white mr_10">登录</a><a href="/user/register" class="white ">注册</a>
            </c:if>
            <c:if test="${SESSION_USER_V2 != null}">
                <a href="/column/personal/${SESSION_USER_V2.id}" id=personal class="white ">欢迎，${SESSION_USER_V2.name}</a>
                <a href="/user/logout" class="white ml_10">退出</a>
            </c:if>
		</span>
    </div>
</div>
<script type="text/javascript">
$(function(){
	 $("#personal").click(function(){
		 return true;
	 });
});

$(function(){
	 $("#key").click(function(){
		 document.getElementById("key").value="";
	 });
});

$(function(){
	 $("#search").click(function(){

		 var content = document.getElementById("key").value;
		 location.href='/article/search/'+ content;
		
	 });
});
</script>

