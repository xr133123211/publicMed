<%@ include file="../common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/pages/common/header.jsp">
  <jsp:param name="title" value="用户中心 - 链家网" />
</jsp:include>

<div class="container">
  <div class="user-main">
    <div class="main-left fl">
      <c:import url="../menu.jsp?nav=5"></c:import>
    </div>
    <div class="main-right fr">
      <div class="title">我的委托</div>
    	<div class="initial">
        <div class="initial-logo"></div>
        <p>没发现有动态哦</p>
    </div>
    </div>
  </div>


   <!--begin: footer-->
    <%@ include file="../common/footer.jsp" %>
    <!--end: footer-->
</div>




</body>
</html>
