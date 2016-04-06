<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="列表"/>
</jsp:include>

<div class="container clearfix">
    <tags:sidebar categories="${categories}" currentCateId="${param.cateId}"/>

    <div class="contentRight">
        <h2 class="mt_15 f14">权限列表</h2>
        <div class="navTab2th mt_15 clearfix" id="test">
            <a href="/info" id ="newest"   >最新的访问记录</a>
            <a href="/info/apply"  id ="apply" >最新的申请记录</a>
            <c:if test="${session_user != null }">
            <a href="/info/assign/${session_user.id }"  id ="mine"  >权限分配</a>
            </c:if>
            <c:if test="${session_user != null }">
                <a href="/info/vote/${session_user.id }"  id ="mine"  >等待投票</a>
            </c:if>
        </div>
        <table width="100%" cellspacing="0" class="tableListNew mt_10">
            <tr class="trHead">
                <td width="200" ><a href="">病历类别</a></td>
                <td width="120" ><a href="">用户名</a></td>
                <td width="120" ><a href="">访问者</a></td>
                <td width="80" ><a href="">访问时间</a></td>
                <td width="80" ><a href="">授权时间</a></td>
            </tr>
            <c:forEach var="access" items="${paginate.pageList}">
                <tr class="tr">
                    <td>${access.categoryName}</td>
                    <td>${access.userName}</td>
                    <td>${access.accessName}</td>
                    <td><c:if test="${not empty article.updatedAt}"><fmt:formatDate pattern="yyyy-MM-dd" value="${info.accessTime}"/></c:if></td>
                    <td><c:if test="${not empty article.updatedAt}"><fmt:formatDate pattern="yyyy-MM-dd" value="${info.authTime}"/></c:if></td>
                </tr>
            </c:forEach>
        </table>
        <app:paginate/>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>
<script>
$(function(){
    var url = GetUrlRelativePath();
    if (url.indexOf('hot')>=0) set('famous');
    else if(url.indexOf('personal')>=0) set('mine');
    else set('newest');
});

function GetUrlRelativePath()
{
	var url = document.location.toString();
	var arrUrl = url.split("//");

	var start = arrUrl[1].indexOf("/");
	var relUrl = arrUrl[1].substring(start);//stop省略，截取从start开始到结尾的所有字符

	if(relUrl.indexOf("?") != -1){
	relUrl = relUrl.split("?")[0];
	}
	return relUrl;
}
function set(id){
	var ele = document.getElementById(id);
	ele.classname="current";   
	ele.innerHTML+='<span class="num numRed" id=nums>${paginate.totalCount}</span>';
}


</script>
   

