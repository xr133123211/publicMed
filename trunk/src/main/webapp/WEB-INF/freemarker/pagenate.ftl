<#--list paginate.pageList as list> 
${list } 
</#list-->
<div class="pageNew txtRight mt_10">
<#assign fPage = 9 />
<#if paginate.firstPage>
    <a href="javascript:void(0);" class="in_block btn prev"></a>
<#else>
    <a href="${url ? replace('<1>', paginate.prePage) }" class="in_block btn prev"></a>
</#if>
<#list 4..1 as page>
    <#if paginate.pageNo - page &gt; 0>
        <#assign fPage = fPage - 1 />
        <a href="${url ? replace('<1>', paginate.pageNo - page) }" class="in_block">${paginate.pageNo - page}</a>
    </#if>
</#list>
<#if paginate.totalPage &gt; 0>
	<#if paginate.pageNo == 1 >
		<b class="in_block">1</b>
	<#else>
		<b class="in_block">${paginate.pageNo}</b>
	</#if>
</#if>
<#list 1..fPage as page>
    <#if paginate.pageNo + page lte paginate.totalPage>
        <a href="${url ? replace('<1>', paginate.pageNo + page) }" class="in_block">${paginate.pageNo + page}</a>
    </#if>
</#list>
<#if paginate.lastPage>
    <a href="javascript:void(0);" class="in_block btn next"></a>
<#else>
    <a href="${url ? replace('<1>', paginate.nextPage) }" class="in_block btn next"></a>
</#if>
</div>