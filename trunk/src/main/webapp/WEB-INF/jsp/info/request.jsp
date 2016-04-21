<%@ include file="/WEB-INF/jsp/common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="新增"/>
</jsp:include>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <div class="contentRight">
        <h2>医疗信息访问申请</h2>
        <form:form modelAttribute="info" method="post">
            <c:if test="${not empty info.id}">
                <form:hidden path="id"/>
            </c:if>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableForm formView">
                <tr>
                    <td width="200" valign="top" class="txtRight">申 请 访 问 用 户：</td>
                    <td valign="top" class="red st">●</td>
                    <td>
                        <form:input path="title" cssClass="txtNew w300"  readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="txtRight">内 容：</td>
                    <td valign="top" class="red st">●</td>
                    <td>
                        <form:textarea path="content" cssClass="bd_ccc" rows="10" cols="80" cssStyle="border-radius:3px"/>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="txtRight">类 型：</td>
                    <td valign="top" class="red st">●</td>
                    <td>
                        <form:select path="typeId"  readonly="true">
                            <form:options items="${categories}" itemValue="id" itemLabel="name"/>
                        </form:select>
                    </td>
                </tr>
            </table>
        </form:form>
        <div class="right">
            <a href="#" class="btn btn-default" onclick="window.location='/info'">取消</a>
            <a href="#" class="btn btn-default" id="artCommit">提交</a>
        </div>
        </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script type="text/javascript">
window.onload=(function(){	
	artCommit.onclick=(function() {
        info.submit();
        return false
    });
})

</script>