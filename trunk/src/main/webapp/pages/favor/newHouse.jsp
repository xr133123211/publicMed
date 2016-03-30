<%@ include file="../common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/pages/common/header.jsp">
	<jsp:param name="title" value="用户中心 - 链家网" />
</jsp:include>

<div class="container">
    <div class="user-main">
        <div class="main-left fl">
            <c:import url="../menu.jsp?nav=2"></c:import>
        </div>
        <div class="main-right fr">
            <div id="allList">
                <div class="title" id="showTotal">共<span>0</span>套 关注房源</div>
                <div class="tab">
                    <span class="actTap">二手房</span>
                    <span class="actTap hover" >新房</span>
                    <span class="actTap">租房</span>
                </div>
                <div class="all-list selected fav-list" style="display:block;" id="ershoufang">
                    <ul class="list-bot">
                    </ul>
                </div>
                <div class="page">
                    <div id="paginageBox" class="page-box"></div>
                </div>
            </div>
        </div>
    </div>

    <!--begin: footer-->
    <%@ include file="../common/footer.jsp" %>
    <!--end: footer-->
</div>
<!--模板-->
<textarea id="Template" style="display:none">
    {#foreach $T as house}
    <li>
        <div class="list">
            <div class="pic-panel">
                {#if $T.house.putAway==1}
                    <a target="_blank" href="{$T.house.houseServerUrl}/ershoufang/{$T.house.houseSellId}.html">
                        <img data-original={$T.house.mainPhotoUrl} src="${config.statichost}/static/img/default_block.png" class="lj-lazy" onerror="${config.statichost}/static/img/default_block.png">
                    </a>
                {#elseif $T.house.putAway==2}
                    <a target="_blank" href="{$T.house.houseServerUrl}/ershoufang/{$T.house.houseSellId}.html">
                        <img data-original={$T.house.mainPhotoUrl} src="${config.statichost}/static/img/default_block.png" class="lj-lazy" onerror="${config.statichost}/static/img/default_block.png">
                    </a>
                {#else}
                    <a href="javascript:;">
                        <img data-original={$T.house.mainPhotoUrl} src="${config.statichost}/static/img/default_block.png" class="lj-lazy" onerror="${config.statichost}/static/img/default_block.png">
                    </a>
                {#/if}
            </div>
            <div class="info-panel">
                <h2>
                    {#if $T.house.putAway==1}
                        <a target="_blank" href="{$T.house.houseServerUrl}/ershoufang/{$T.house.houseSellId}.html">
                            {$T.house.title}
                        </a>
                    {#elseif $T.house.putAway==2}
                        <a target="_blank" href="{$T.house.houseServerUrl}/chengjao/sh{$T.house.houseSellId}.html">
                            {$T.house.title}
                        </a>
                    {#else}
                        <a  href="javascript:;">
                            {$T.house.title}
                        </a>
                    {#/if}
                </h2>
                
                <div class="col-1">
                    <div class="where">
                        <a href="{$T.house.houseServerUrl}/xiaoqu/{$T.house.propertyNo}.html" target="_blank">
                            <span class="region">{$T.house.propertyName}&nbsp;&nbsp;</span>
                        </a>
                        <span class="zone">
                            <span>{$T.house.room}室{$T.house.hall}厅</span>
                        </span>
                        <span class="meters">{$T.house.acreage}平</span>
                        <span>{#if $T.house.face}
                        {$T.house.face}
                         {#/if}  </span>
                    </div>
                    <div class="other">
                        <div class="con">
                            <a href="{$T.house.houseServerUrl}/ershoufang/{$T.house.districtSpelling}/">{$T.house.districtName}</a>
                            <span>/</span>
                            {$T.house.floorTypeName}
                            (共{$T.house.totalFloor}层)
                            
                            {#if $T.house.buildingYear}
                            <span>/</span>
                            {$T.house.buildingYear}年建
                            {#/if}
                        </div>
                    </div>
                    <div class="chanquan">
                        <div class="left agency">
                            <div class="view-label left">
                           
                                	{#if $T.house.schoolRemark}
		    						<span class="fang05"></span>
		    						<span class="fang05-ex"><span>{$T.house.schoolRemark }</span></span>
		    						{#/if}
                                {#if $T.house.metroRemark}
                                     <span class="fang-subway"></span>
                                <span class="fang-subway-ex">
                                    <span>{$T.house.metroRemark}</span>
                                </span>
                                     {#/if}
                                     {#if $T.house.fangBenRemark}
		    										<span class="taxfree"></span>
		    										<span class="taxfree-ex"><span>{$T.house.fangBenRemark }</span></span>
		    						{#/if}
                                  {#if $T.house.isSole}
                               <span class="unique"></span>
		    				  <span class="unique-ex"><span>独家</span></span>
                                {#/if}
                                    {#if $T.house.isKeyHouse}
                                <span class="haskey"></span>
		    						<span class="haskey-ex"><span>有钥匙</span></span>
                                {#/if}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="price">
                        <span class="num">{$T.house.showPrice}</span>万
                    </div>
                    <div class="price-pre">{$T.house.unitPrice.toFixed(0)} 元/m²</div>
                </div>
            </div>
        </div>
        <a class="del-fav actDelFollow" index="{$T.house.houseSellId}">取消关注</a>
    </li>
    {#/for}
</textarea>


<textarea id="template_no" style="display:none">
    <div class="initial">
        <div class="initial-logo"></div>
        <p>还没有关注任何房源哦</p>
    </div>
</textarea>

<script>

$(function() {
    $(".list-bot").setTemplateElement("template_no");
    $(".list-bot").processTemplate();
    $('#showTotal span').text(0);

    //在二手房,新房,租房之间切换
    $('#allList .tab span').click(function(){
        if($(this).text()=='二手房'){
            window.location='/favor/house';
        }
        if($(this).text()=='新房'){
            window.location='/favor/newHouse';
        }
        if($(this).text()=='租房'){
            window.location='/favor/rent';
        }

    });

})
</script>

</body>
</html>
