<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="footer clearFix">2016 南京大学 </div>

</body>
</html>

<!--begin: popup layer - add new article start -->
<div class="popLayer w550" id="layer_new_category">
    <div class="popTitle clearfix">
        <h1>添加类别</h1>        
        <div class="cls"><a href="#" class="xx" id="publishClose"></a></div>
    </div>
    <div class="popCon">
        <form action="/category" method="post" id="form_newArticle" class="form">
            <table width="500" border="0" cellpadding="0" cellspacing="0" class="tableForm formView">
                <tr>
                    <td valign="top">名 称：</td>
                    <td valign="top" class="red st">●</td>
                    <td><input type="text" name='article.title' class="txtNew w150" id="categoryName"><form:errors path="newform" cssClass="red ml_10"/><br /></td>
                </tr>
            </table>
        </form>
    </div>
    <div class="popBtn"><a href="#this" class="btnOpH24 h24Silver in_block" id="publishCancel">取消</a><a href="#this" class="btnOpH24 h24Blue in_block ml_5" id="submitCategory">确定</a></div>
</div>

<!--end: popup layer - add new article start -->

<script type="text/javascript">

$(function(){
    $('#submitCategory').click(function(){
		var val = document.getElementById("categoryName").value;
		var jsonObj = {"name":val};
		var jsonStr = JSON.stringify(jsonObj);
		ajaxPost({
            url:'/category',
            dataType:"json",      
            contentType:'application/json;charset=utf-8',
            data: jsonStr,     
            ok: function(data){
                
                window.location.reload();
            },
            fail:function(data){            	
                alert("请验证管理员身份");
            }
        });
    	return false
    });

    $('#addCategory').click(function(){
        showPopupDiv($('#layer_new_category'));
        return false
    });
    $('#publishClose, #publishCancel').live('click', function(){
        hidePopupDiv($('#layer_new_category'));
        return false
    });
});
</script>

