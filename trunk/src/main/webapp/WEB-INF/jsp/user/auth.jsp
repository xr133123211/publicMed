<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="新增"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <div class="contentRight">
        <h2>医疗信息授权</h2>
        <form:form modelAttribute="auth" method="post">
            <c:if test="${not empty auth.id}">
                <form:hidden path="id"/>
            </c:if>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableForm formView">
                <tr>
                    <td width="200" valign="top" class="txtRight">授 权 机 构：</td>
                    <td valign="top" class="red st">●</td>
                    <td>
                        ${auth.orgName}
                    </td>
                </tr>
                <tr>
                    <td width="200" valign="top" class="txtRight">信 息 类 别：</td>
                    <td valign="top" class="red st">●</td>
                    <td>
                        ${auth.categoryName}
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="txtRight">权 值：</td>
                    <td valign="top" class="red st">●</td>
                    <td>
                        <form:select path="weight"  readonly="true">
                            <form:options items="${weights}"/>
                        </form:select>
                    </td>
                </tr>
            </table>
        </form:form>
        <div class="right">
            <a href="/search/${auth.orgName}" class="btn btn-default" >取消</a>
            <a href="#" class="btn btn-default" id="authCommit">提交</a>
        </div>
        </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script type="text/javascript">
window.onload=(function(){
    authCommit.onclick=(function() {
        auth.submit();
        return false
    });
})

</script>