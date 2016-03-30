<%@ include file="../common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/pages/common/header.jsp">
  <jsp:param name="title" value="用户中心 - 链家网" />
</jsp:include>

<div class="container">
  <div class="user-main">
    <div class="main-left fl">
      <c:import url="../menu.jsp?nav=1"></c:import>
    </div>
    <div class="main-right fr">
      <div class="title">我的账户信息</div>
      <div class="tab">
        <span class="hover actTap">修改密码</span>
        <span class="actTap" >上传头像</span>
        <span class="actTap">修改昵称</span>
      </div>
      <form action="/client/password/" method="post" id="updatePwd">
        <ul class="change-pwd">
          <li>
            <span>输入旧密码：</span>
            <input type="password" name="password" id="password" placeholder="请输入密码" validate="notNull,minLength" validatedata="minLength=6" validatename="密码">
          </li>
          <li>
            <span>设置新密码：</span>
            <input type="password" name="newPassword" id="password1" placeholder="请输入新密码" validate="notNull,minLength" validatedata="minLength=6" validatename="密码">
          </li>
          <li>
            <span>确认新密码：</span>
            <input type="password" placeholder="请确认新密码" validate="notNull,isSame" validatedata="isSame=#password1" validatename="确认新密码">
          </li>
          <li>
            <span></span><a class="actSubmit lj-btn">保存修改</a>
          </li>
        </ul>
      </form>
    </div>
  </div>


     <!--begin: footer-->
    <%@ include file="../common/footer.jsp" %>
    <!--end: footer-->
</div>


<script>
  $(function() {

    //在二手房,新房,租房之间切换
    $('.user-main .tab span').click(function(){
      if($(this).text()=='修改密码'){
        window.location='/user/client';
      }
      if($(this).text()=='上传头像'){
        window.location='/user/setPic';
      }
      if($(this).text()=='修改昵称'){
        window.location='/user/setNickname';
      }

    });

  })
</script>

</body>
</html>
