<!DOCTYPE html>
<%@ include file="includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>${param.title}-新sh.lianjia.com - 链家</title>
    <link href="${config.publichost}/public/img/favicon.ico" type="image/x-icon" rel=icon>
    <link href="${config.publichost}/public/img/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link rel="stylesheet" href="${config.publichost}/public/css/common.css?v=${config.version}">
    <link type="text/css" rel="stylesheet" href="${config.statichost}/static/css/client.css?v=${config.version}" />
    <link rel="stylesheet" href="${config.publichost}/public/css/weiliao.css?v=${config.version}">

    <script src="${config.publichost}/public/js/jquery/jquery.min.js?v=${config.version}"></script>
    <script src="${config.publichost}/public/js/jquery/jquery-jtemplates.js?v=${config.version}"></script>
    <script src="${config.publichost}/public/js/paginate.js?v=${config.version}"></script>
     <script src="${config.publichost}/public/js/jquery/jquery.lazyload.min.js?v=${config.version}"></script>
     <script src="${config.publichost}/public/js/jquery/jquery-upload-1.0.js?v=${config.version}"></script>
    <script src="${config.publichost}/public/js/jquery/jquery.qrcode.min.js?v=${config.version}"></script>
    <script src="${config.publichost}/public/js/jquery/jQuery.XDomainRequest.js"></script>
    <script>
        var headerParameters = {
            env : '${config.env}',
            webhost : '${config.webhost}',
            publichost : '${config.publichost}',
            statichost : '${config.statichost}',
            managehost:'${config.managehost}',
            uchost : '${config.uchost}',
            agenthost : '${config.agenthost}',
            apihost : '${config.apihost}',
            openhost : '${config.openhost}',
            chathost : '${config.chathost}',
            cityCode : '${config.cityCode}',
            casurl:'${config.casUrl}'
        };
    </script>
    <script src="${config.statichost}/static/js/common.js?v=${config.version}"></script>
</head>
<body>
    <!--begin: header-->
    <header class="lianjia-header" id="lianjia-header" systemid=""></header>
    <script src="${config.publichost}/public/js/lianjia_sh_navbar.js?v=${config.version}"></script>
    <!--end: header-->
