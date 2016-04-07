<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="${article.title}"/>
</jsp:include>

<div class="container clearfix">
    <input id="infoId" value="${info.id}"/>
    <tags:sidebar categories="${categories}" currentCateId="${param.cateId}"/>
    <div class="contentRight">
        <h2 class="mt_15 f14">病历详情</h2>
        <input type="hidden" id="infoId" value="${info.id}"/>
        <div class="mv_10 grey666">
            <a href="/info">首页</a> &gt;&nbsp;&nbsp;<a href="/article?cateId=${info.categoryId}">${info.categoryName}</a> &gt;&nbsp;&nbsp;${article.title}
            <div class="mv_10">
                <div class="mb_20 clearfix">
                    <h3 class="left lineH180"><a href="#" target="_blank" class="f14 bold ">${info.title}</a></h3>
                    <p class="right">
                    <c:if test="${session_user != null}">
			    		<a href="/info/${info.id}/edit" class="btnOpH24 h24Silver in_block ml_5" id="edit_btn">编辑</a>
                        <a href="javascript:void(0);" class="btnOpH24 h24Silver in_block ml_5" id="btnDel">删除</a>
            		</c:if> 
            		</p>	                       
                </div>
                <p class="grey666 lineH180 In24 f14">${info.content}</p>
                <div class="clearfix mt_20">
                    <div class="right grey999">编辑于
                        <c:if test="${not empty info.updateTime}"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${info.updateTime}"/></c:if>
                    </div>
                </div>
            </div>
        </div>

        <c:forEach items="${comments}" var="comment">
            <div class="r mt_10">
                <p><a href="/column/personal/${comment.userId}" target="_blank" class="bold">${comment.username}</a><span class="grey999 ml_10"><fmt:formatDate value="${comment.createdAt}" pattern="a HH:mm:ss.S"/></span></p>
                <div class="mt_15" id="${comment.id}">
                    <p>${comment.content}</p>
                    <c:if test="${SESSION_USER!=null&&comment.userId==SESSION_USER.id}">
                    <p class="mt_5"><a href="#" onclick = "editcomment(${comment.id})" >编辑</a><a href="#" class="red ml_10" onclick="deletecomment(${comment.id})">删除</a></p>
                    </c:if>

                </div>
            </div>
        </c:forEach>
        <div class="txtRight">
            <a href="/article/${article.id}/comment/list">全部评论>></a>
        </div>

        <div id="rdiv">
        <c:if test="${SESSION_USER != null}">
            <div class="bg_eee pd_20 mt_20">            	
                <p class="bold pd_10">回复：</p>                
                <input id="commentBox" type="textarea" path="content" rows="10" cols="95"/>
                <p class="mt_20"><a href="#" class="btnOpH24 h24Blue in_block" id="submit_comment">提交</a></p>
            </div>
        </c:if>
        </div>
    </div>	
</div>

<script type="text/javascript" >
$(function(){

    $("#btnDel").click(function(){
        if(!confirm("确定删除吗？")) {
            return false;
        }

        var url = '/article/' + $("#articleId").val();
        ajaxDelete({
               url:url,
               ok: function(data) {
                   alert("删除成功");
                   window.location.href = "/article";
               },

               fail: function(data){
                    alert(data.message);
               }
            }
        );

    });

    $("#submit_comment").click(function(){
    	var jsonObj = {"content":$("#commentBox").val(), "articleId":$("#articleId").val()};
    	var jsonStr = JSON.stringify(jsonObj);
    	ajaxPost({
            url:'/article/'+ $("#articleId").val() +'/comment/add',
            dataType:"json",      
            contentType:'application/json;charset=utf-8',
            data: jsonStr,     
            ok: function(data){
                
                window.location.reload();
            },
            fail:function(data){            	
                alert(data.message);
            }
        });
    });

    $("#getJson").click(function() {
        window.open('/article/' + $("#articleId").val() + '/getJson3');
    });

    $("#ssubmit_comment").click(function() {
    	var jsonObj = {"content":$("#commentBox").val(), "articleId":"42"};
    	var jsonStr = JSON.stringify(jsonObj);
    	alert(jsonStr);
        ajaxPost({
            url:'/testJson',
            dataType:"json",      
            contentType:'application/json;charset=utf-8',
            data: jsonStr,     
            ok:function(data) {
                alert("ok1");
            },
            fail:function(data) {
				alert(data);
            }
        });
	    });
});
</script>
<jsp:include page="../common/footer.jsp"/>