<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="列表"/>
</jsp:include>

<div class="container clearfix">
    <tags:sidebar categories="${categories}" currentCateId="${param.cateId}"/>

    <div class="contentRight">
        <h2 class="mt_15 f14">文章列表</h2>
        <div class="navTab2th mt_15 clearfix" id="test">
            <a href="/article" id ="newest"   >最新的
            </a>
            <a href="/column/hot"  id ="famous" >最受欢迎的</a>
            <c:if test="${SESSION_USER_V2 != null }">
            <a href="/column/personal/${SESSION_USER_V2.id }"  id ="mine"  >我的文章</a>
            </c:if>
        </div>
        <table width="100%" cellspacing="0" class="tableListNew mt_10">
            <tr class="trHead">
                <td width="380" ><a href="/article?cateId=${category.id}&sortKey=title">标题</a></td>
                <td width="100" ><a href="/article?cateId=${category.id}&sortKey=userid">作者</a></td>
                <td width="100" ><a href="/article?cateId=${category.id}&sortKey=categoryId">类别</a></td>
                <td width="80" ><a href="/article?cateId=${category.id}&sortKey=createdAt">创建时间</a></td>
                <td width="80" ><a href="/article?cateId=${category.id}&sortKey=updatedAt">更新时间</a></td>
            </tr>
            <c:forEach var="article" items="${paginate.pageList}">
                <tr class="tr">
                    <td><a href="/article/${article.id}">${article.title}</a></td>
                    <td>${article.username}</td>
                    <td>${article.categoryName}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${article.createdAt}"/></td>
                    <td><c:if test="${not empty article.updatedAt}"><fmt:formatDate pattern="yyyy-MM-dd" value="${article.updatedAt}"/></c:if></td>
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
   

