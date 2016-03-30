<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/includes.jsp"%>
<!--begin:导航-->
            <div class="name"></div>
            <c:if test="${not empty session_user.ucAvatar}">
            <script>
            $(".name").css('background-image', 'url(${session_user.ucAvatar})');
            </script>
            </c:if>
           
            <div class="user-name">欢迎你，${session_user.displayName}</div>
            <ul>
                <li  class="${param.nav==1?'hover':''}"><a href="/index">首页</a></li>
                <li  class="${param.nav==2?'hover':''}"><a href="/favor/house">关注的房源</a></li>
                <li  class="${param.nav==3?'hover':''}"><a href="/favor/property">关注的小区</a></li>
                 <li class="${param.nav==4?'hover':''}"><a href="/house/history">看房记录</a></li>
              <li  class="${param.nav==5?'hover':''}"><a href="/user/delegation">我的委托</a></li>
                <li class="${param.nav==7?'hover':''}"><a href="/user/client">编辑资料</a></li>
            </ul>
 <!--end:导航-->
        