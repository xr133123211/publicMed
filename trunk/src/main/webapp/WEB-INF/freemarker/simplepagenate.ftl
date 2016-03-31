<div class="right pageCon2">
    <#if paginate.firstPage>
       <a href="javascript:void(0);" class="grey prev0 min"></a>
    <#else>
        <a href="${url ? replace('<1>', paginate.prePage) }" class="prev min"></a>
    </#if>
    <b>${paginate.pageNo}/${paginate.totalPage}</b>
    <#if paginate.lastPage>
        <a href="javascript:void(0);" class="grey next0">下一页</a>
    <#else>
        <a href="${url ? replace('<1>', paginate.nextPage) }" class="next">下一页</a>
    </#if>
</div>