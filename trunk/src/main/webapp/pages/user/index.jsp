<%@ include file="../common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/pages/common/header.jsp">
	<jsp:param name="title" value="用户中心 - 链家网" />
</jsp:include>

<div class="container">
    <div class="user-main">
        <div class="main-left fl">
          <c:import url="../menu.jsp?nav=1"></c:import>
        </div>
        <div class="main-right fr">
            <div id="allList">
                <div class="title">您关注的房源/小区最新动态</div>
                <div class="tab">
                    <span class="actTap actSetArgs <c:if test="${empty dynamic}">hover</c:if>">全部</span>
                    <span class="actTap actSetArgs <c:if test="${dynamic==1}">hover</c:if>" >调价</span>
                    <span class="actTap actSetArgs <c:if test="${dynamic==2}">hover</c:if>">新上</span>
                    <!-- <span class="actTap actSetArgs saveArgs">搜索条件提醒</span> -->
                </div>
                <div class="all-list">
                    <ul></ul>
                    <div class="page">
                        <div id="paginageBox" class="page-box"></div>
                    </div>
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
           {#if $T.house.dynamicType == 1}     
                <div class="list-title">
              <span class="xs">
           		新上
			</span>
              {$P.DateFormat($T.house.createTime)}，您关注的该小区有套新上房源，详情如下

          </div>
          {#elseif $T.house.dynamicType == 2}
           <div class="list-title">
              <span class="xs">
           		调价
			</span>
              {$P.DateFormat($T.house.createTime)}，您关注的该房源有价格变动，详情如下
          </div>
                 {#/if}

   <c:import url="../house/houseTemplate.jsp?type=0"></c:import>
      </li>
      {#/for}
</textarea>
<textarea id="template_no" style="display:none">
    <div class="initial">
        <div class="initial-logo"></div>
        <p>没发现有动态哦</p>
    </div>
</textarea>

<script>

$(function() {
    $('.all-list').on('mouseover','.lj-lazy',function(){
        console.log('over')
        self=$(this);
        picChange(self);
        self.next('img').hide();
    });
    $('.all-list').on('mouseout','.lj-lazy',function(){
        self=$(this);
        picChange(self);
        self.next('img').show();
    })
    function picChange(self){
        var obj = self.attr('src');
        self.attr('src',self.next('img').attr('src'));
        self.next('img').attr('src',obj);

    }
	$('.main-left ul li').click(function(){
        $(this).addClass('hover');
        $(this).siblings().removeClass('hover');
    })
	 var initData = {
				data:{}
		};
	
	 var inputData={
	 };
		 inputData.type="${dynamic}";
	
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
 
    /*** date format ***/
    function DateFormat(date, symbol){
        if(typeof date == "string"){
            var date = date.replace(/-/g, '/').replace(/年/g, '/').replace(/月/g, '/');//replace为了兼容IE8及以下
        }
        var symbol = symbol || '-';
        var d = new Date(date);
        var year = d.getFullYear();
        var month = d.getMonth()+1;
        var day = d.getDate();
        return (year + symbol + (month>=10 ? month : ('0'+month)) + symbol +  (day>=10 ? day : ('0'+day)));
    }
    
    /*** date diff ***/
    function DateDiff(date){
    	 var d = new Date(date);
    	var now = new Date();
    	var one_day=1000*60*60*24;
    	var twoHours=1000*60*60*2;
    	var difference = (now.getTime()-d.getTime());
    	if(difference>one_day){
    		return DateFormat(date);
    	}else if(difference>twoHours){
    		return Math.floor(difference/(1000*60*60))+'小时之前';
    	}else{
    		return "刚刚";
    	}
    }

  function search(){
	   
	   inputData.pageNo = pageConfig.currentPage;
		inputData.pageSize = pageConfig.pageSize;
		
	$.get("/dynamic/getDynamicList.json?v="+Number(new Date()),inputData,function(result){
		if(result.status == 'ok') {
			   initData.data=result.data;

			   setSpecifyTemplate("Template",initData.data)	;
                 $('.all-list .lj-lazy').lazyload();
		        
		        pageConfig.recordCount = result.recordCount;
                pageConfig.pageNo = result.pageNo;
                if(pageConfig.recordCount>pageConfig.pageSize){
					$('#paginageBox').pagination(pageConfig);
					$('#paginageBox').show();
                }else{
                	$('#paginageBox').hide();
                }
		    	if(pageConfig.recordCount==0){
		    		setSpecifyTemplate("template_no", initData.data);
		        }
   		}
		});
    }
	
  $('#allList .tab span').click(function(){
      $(this).addClass('hover');
      $(this).siblings().removeClass('hover');
      if($(this).text()=='全部'){
    	  delete  inputData.type;
    	  setCurrentPage(1);
      }
      if($(this).text()=='调价'){
        inputData.type=2;
        setCurrentPage(1);
        }
      if($(this).text()=='新上'){
    	  inputData.type=1;
    	  setCurrentPage(1);
    	  }
      if($(this).text()=='搜索条件提醒'){
    	  inputData.type=3;
    	  setCurrentPage(1);
    	  }
  });

search();

function setSpecifyTemplate(tem,data){
   
	$(".all-list ul").setTemplateElement(tem);
	$(".all-list ul").setParam('DateFormat', DateFormat);
	$(".all-list ul").setParam('DateDiff', DateDiff);
    $(".all-list ul").processTemplate(data);
 
}



})
</script>
</body>
</html>
