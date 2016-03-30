<%@ include file="../common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/pages/common/header.jsp">
	<jsp:param name="title" value="用户中心 - 链家网" />
</jsp:include>

<div class="container">
    <div class="user-main">
        <div class="main-left fl">
            <c:import url="../menu.jsp?nav=3"></c:import>
        </div>
        <div class="main-right fr">
            <div id="allList">
                <div class="title" id="showTotal">共<span>0</span>个 关注小区</div>
                <div class="community-list">
                    <ul>
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
           <a href="{$T.house.houseServerUrl}/xiaoqu/{$T.house.propertyNo}.html" target="_blank" class="fl pic">
               <img data-original="{$T.house.hotImage}"src="${config.statichost}/static/img/default_block.png" class="lj-lazy" onerror="${config.statichost}/static/img/default_block.png">
           </a>
           <div class="fr all-info">
               <div class="fl basic-info">
                   <p class="name"><a href="{$T.house.houseServerUrl}/xiaoqu/{$T.house.propertyNo}.html" target="_blank">{$T.house.propertyName}</a></p>
                   <p class="region">[
                         <a href="{$T.house.houseServerUrl}/xiaoqu/{$T.house.districtSpelling}" target="_blank">{$T.house.districtName} </a>
                         <a href="{$T.house.houseServerUrl}/xiaoqu/{$T.house.plateSpelling}" target="_blank">{$T.house.plateName} </a>
                   ]</p>
               
                   <p class="total">出售<a href="{$T.house.houseServerUrl}/ershoufang/q{$T.house.propertyNo}">{#if $T.house.saleTotal}{$T.house.saleTotal}{#else}0{#/if}</a>
                       <label>|</label>出租<a href="http://sh.lianjia.com/zufang/c5011000016384/">{#if $T.house.rent}{$T.house.rent}{#else}0{#/if}</a>
                   </p>
               </div>
               <div class="fr price-info">
                   <div class="fl average-price">
                       成交均价
                       <span>
                      
                       {#if $T.house.dealAvgPrice>0}
                      <label>   {$T.house.dealAvgPrice.toFixed(0)}</label>元/平
                        {#else}
                       暂无均价
                         {#/if} </span>
                   </div>
                   <div class="fr gains">
                       跌涨幅
                       <span>环比上月
                     {#if $T.house.changeRate>0}   <i style="color: #fe5123;">↑</i><label style="color: #fe5123;">{$T.house.changeRate.toFixed(2)}%</label>
                      {#elseif $T.house.changeRate<0}
                       <i style="color:#008000;">↓</i><label style="color:#008000;">{$T.house.changeRate*(-1).toFixed(2)}%</label>
                      {#else}
                           持平
                     {#/if}</span>
                   </div>
               </div>
               <div class="clear"></div>
           </div>
           <a class="del-fav actDelFollow" index="{$T.house.propertyNo}">取消关注</a>
       </li>
    {#/for}
</textarea>
<textarea id="template_no" style="display:none">
    <div class="initial">
        <div class="initial-logo"></div>
        <p>还没有关注任何小区哦</p>
    </div>
</textarea>


<script>

$(function() {


	 var initData = {
				data:{}
		};
	 var inputData={
	 };
	 
	  //初始化页码数据
    var pageConfig = {
        recordCount: 0,
        pageSize: 4,
        currentPage: 1,
        displayNum: 5,
        clickCallback: setCurrentPage
    };
    //翻页事件
    function setCurrentPage(currentPage){
        pageConfig.currentPage = currentPage;
        search();
    }
   
	  
  function search(){
	   
	   inputData.pageNo = pageConfig.currentPage;
		inputData.pageSize = pageConfig.pageSize;
		
	$.get("/favor/getMyFavorPropertyList.json?v="+Number(new Date()),inputData,function(result){
		if(result.status == 'ok') {
			   initData.data=result.data;
		        if(result.recordCount>0){
		            $(".community-list ul").setTemplateElement("Template");
		            $(".community-list ul").processTemplate(initData.data);
                    $('.community-list .lj-lazy').lazyload();
		            pageConfig.recordCount = result.recordCount;
	                pageConfig.pageNo = result.pageNo;
	                if(pageConfig.recordCount>pageConfig.pageSize){
						$('#paginageBox').pagination(pageConfig);
	                }else{
	                	$('#paginageBox').hide();
	                }
		        }else{
		            $(".community-list ul").setTemplateElement("template_no");
		            $(".community-list ul").processTemplate();
		        }

		        $('#showTotal span').text(result.recordCount);

		    	 //关注小区显示 取消关注
        $('.main-right .list-bot li,.main-right .community-list li').on('mouseover',function(){
            $(this).find('.del-fav').show();
        });
        $('.main-right .list-bot li,.main-right .community-list li').on('mouseout',function(){
            $(this).find('.del-fav').hide();
        });
		        //小区 点击取消关注
		        $('.del-fav').click(function(){
		        	var index = Number($(this).attr("index"));
		        	delList(index);
		        });
   		}
		});
    }
	
  function delList(id){
	   $.post("/favor/delFavorProperty.json?id="+id,null,function(result){
		   if(result.status == 'ok') {
			   search();
		   }
	   });
  }
   

search();



})
</script>

</body>
</html>
