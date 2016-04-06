<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录 - public medicine</title>
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
            <h1>登录</h1>
            <div class="corner tr"></div>
        </div>
        <div class="con">
            <form:form modelAttribute="user" method="post" onsubmit="return chk_loginForm()">
                <input type="hidden" name="redirectUrl" value="${param.ref}"/>
                <table width="100%">
                    <tr>
                        <td>用户名<form:errors path="name" cssClass="red ml_10"/><br/>
                            <input type="text" class="txt tt160" name="name" id="name" value="${param.name}" />
                        </td>
                    </tr>
                    <tr><td height="10"></td></tr>
                    <tr>
                        <td>
                            <div class="clearfix">
                                <span class="left">密码<form:errors path="password" cssClass="red ml_10"/><br/></span>
                            </div>
                            <input type="password" class="txt tt160" name="password" id="password" value="${param.password}" />
                        </td>
                    </tr>
                    <tr><td height="10"></td></tr>
                    <tr>
                        <td>
                            <input type="submit" id="login" value="" title="登录" class="btn_login" style="vertical-align:middle"/>
							<span>
								&nbsp;&nbsp;<span id="errorMsg" class="red">${errormsg}</span>
								<b class="green hideit" id="loginig">正在登录中...</b>
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

<!--begin: footer-->
<div class="footer clearFix">&copy;2016 public Medicine </div>


<!--end: footer-->
<script type="text/javascript" language="javascript">
    //表单验证
    //modify space&blank verify
    function chk_loginForm(){
        var regD = /^\d+$/;
        var user = document.getElementById("name");
        var password = document.getElementById("password");
        if(user.value==''){
            alert("请输入用户名");
            user.focus();
            return false;
        }

        if(password.value==''){
            alert("请输入密码");
            password.focus();
            return false;
        }
        if (user.value.indexOf(' ') >=0||password.indexOf(' ')>=0) {
            alert("输入有空格！");
            return false;
        }
        $('#login').addClass('hideit');
        $('#loginig').show();
        $('#errorMsg').hide();
        return true;
    }
</script>
</body>
</html>
