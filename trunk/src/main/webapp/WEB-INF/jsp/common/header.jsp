<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>共享医疗信息</title>
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/dashboard.css" rel="stylesheet">
    <script type="text/javascript" src="/static/js/portal.js"></script>
    <script type="text/javascript" src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="/static/js/ed.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>

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
    <title>列表页</title>
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
        <div class="navbar-header">
               <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                   <span class="sr-only">Toggle navigation</span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
               </button>
            <a class="navbar-brand" href="#">共享医疗信息</a>
        </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="btn btn-link" id="search_btn">搜索</a></li>
                    <c:if test="${session_user == null}">
                        <li><a href="/user/login">登录</a></li>
                        <li><a href="/user/register">注册</a></li>
                        <li><a href="/user/temp">临时登陆</a></li>
                    </c:if>
                    <c:if test="${session_user != null}">
                        <li><a href="/user/personal/${session_user.id}">欢迎，${session_user.name}</a></li>
                        <li><a href="/user/logout" >退出</a></li>
                    </c:if>
                </ul>
                <form class="navbar-form navbar-right">
                    <input type="text" class="form-control" placeholder="搜索用户名" id="search_form">
                </form>
            </div>
        </div>
        </nav>
<script type="text/javascript">
    function search(){
        var content = document.getElementById("search_form").value;
        location.href='/search/'+ content;
    }
    $(function(){
        $("#search_btn").click(function(){
            search();
        });
    });
</script>

