<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>临时登陆</title>
    <link type="text/css" rel="stylesheet" href="/static/css/main.css" />
    <link type="text/css" rel="stylesheet" href="/static/css/old_login.css" />
</head>

<body>
<div class="container">
    <div class="line pb_10 clearfix">
        <a href="#" class="new_logo"></a>
    </div>

    <div class="loginBox">
        <div class="clearfix">
            <div class="corner"></div>
            <h1>临时登陆</h1>
            <div class="corner tr"></div>
        </div>
        <div class="con">
            <form:form modelAttribute="user" method="post">
                <table width="100%">
                    <tr>
                        <td>用户名 <form:errors path="name" cssClass="red ml_10"/><br />
                            <form:input path="name" maxlength="20" cssClass="txt tt160"/>

                        </td>
                    </tr>
                    <tr>
                        <td>电话号码 <form:errors path="phone" cssClass="red ml_10"/><br />
                            <form:input path="phone" cssClass="txt tt160"/>
                        </td>
                    </tr>
                    <tr>
                        <td>用户类型
                            <form:select path="type"><br/>
                                <form:options items="${categories}" itemValue="id" itemLabel="name"/>
                            </form:select>
                        </td>
                    </tr>
                    <tr><td height="10"></td></tr>
                    <tr>
                        <td>
                            <input type="submit" id="register" value="" title="登陆" class="btn_login" style="vertical-align:middle"/>
							<span>
								&nbsp;&nbsp;<span id="errorMsg" class="red">${errormsg}</span>
								<b class="green hideit" id="loginig">正在登陆中...</b>
							</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="pt_10">
                        </td>
                    </tr>
                </table>
            </form:form>
        </div>
        <div class="clearfix">
            <div class="corner btm bl"></div>
            <div class="btmC">&nbsp;</div>
            <div class="corner btm br"></div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>