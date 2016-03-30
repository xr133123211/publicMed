<%@ include file="../common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/pages/common/header.jsp">
	<jsp:param name="title" value="用户中心 - 链家网" />
</jsp:include>

<div class="container">
    <div class="user-main">
        <div class="main-left fl">
            <c:import url="../menu.jsp?nav=4"></c:import>
        </div>
                    <div class="record_num fr" id="showTotal"><p>共<span></span>套带看记录</p></div>
        <div class="main-right fr main-right-ex">
                <div class="all-list selected fav-list" style="display:block;" id="lookhistory">
                    
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
    <!--弹层背景-->
    <div id="fade" class="black_overlay"></div>
    <!--举报弹层-->
    <div  id="reportDiv" class="report_content">
        <h1>举报信息</h1>
        <div class="contentp">
            <p>感谢您的举报！</p>
            <p>我们一旦核实为真实举报，系统将自动删除该套房源。</p>
        </div>
        <a href="#" class="btn submitCmt actSubmit1">确认举报</a>
        <a href="javascript:;" class="btn actCancelAdd1">取消</a>
    </div>
    <!--评价弹层-->
    <div id="MyDiv" class="white_content">
        <div class="comment ntComment">
            <div class="comment-list">
                <div class="comment_title">
                    <h1>请为经纪人此次带看服务的质量进行评价:)</h1>
                </div>
                <div class="add_comment">
                    <input name="seeRecordId"  type="hidden">
                    <div class="star-percent1 actSlider" title="给个评分吧~">
                        <div class="attitude">服务态度</div>
                        <div class="star-per"></div>
                        <div class="star-bg" style="width:0"></div>
                        <input id="service" value="0" type="hidden">
                    </div>
                    <div class="star-percent2 actSlider" title="给个评分吧~">
                        <div class="attitude">专业知识</div>
                        <div class="star-per"></div>
                        <div class="star-bg" style="width:0"></div>
                        <input id="skill" value="0" type="hidden">
                    </div>
                    <div class="comment-content">
                        <h1>详细评论</h1>
                        <textarea id="content" maxlength="100" onchange="this.value=this.value.substring(0, 100)" onkeydown="this.value=this.value.substring(0, 100)" onkeyup="this.value=this.value.substring(0, 100)" class="comment-txt">

                        </textarea>
                    </div>
                    <a href="#" class="btn submitCmt dingact">提交评价</a>
                    <a href="javascript:;" class="btn dingcan">取消</a>
                    <span class="error-tips"></span>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!--模板-->
<textarea id="Template" style="display:none">
{#foreach $T as house}
        <div class="look-list">
        <div class="agent">
            <div class="agent_pic">
                <a target="_blank" href="{$T.house.avatar}">
                    <img src="{$T.house.avatar}">
                </a>
            </div>
            <div class="agent_info">
              {#if $T.house.status==1}
                <p>{$T.house.userName}&nbsp;&nbsp;{$T.house.phoneNumber}<a class="lianjiaim-createtalkOld" userCode="{$T.house.lookUserCode }"  style="display: none;padding: 1px 0 !important;" title="在线咨询" ></a>   </p>
                {#else}
                <p>{$T.house.userName}&nbsp;&nbsp;   </p>
                {#/if}
             
                <p class="num"><span>{$P.DateFormat($T.house.lookTime)}</span>带您看了以下<span class="amount"> 1</span>套房源</p>
            </div>
        <!--     <div class="estimate">
                <a name="false" class="btn actAddBtn" href="javascript:;">立即评价</a>
            </div> -->
        </div>
         <ul class="list-bot">
    <li>
       <c:import url="../house/houseTemplate.jsp?type=2"></c:import>
        <a class="btn actAddBtn report" href="javascript:;">举报</a>
    </li>
         </ul>
        </div>
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
//
//    $('.fav-list').on('mouseover','.lj-lazy',function(){
//        self=$(this);
//        picChange(self);
//        self.next('img').hide();
//    });
//    $('.fav-list').on('mouseout','.lj-lazy',function(){
//        self=$(this);
//        picChange(self);
//        self.next('img').show();
//    })
//    function picChange(self){
//        var obj = self.attr('src');
//        self.attr('src',self.next('img').attr('src'));
//        self.next('img').attr('src',obj);
//
//    }

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
	  
  function search(){
	   
	   inputData.pageNo = pageConfig.currentPage;
		inputData.pageSize = pageConfig.pageSize;
		
	$.get("/house/getLookRecord.json?v="+Number(new Date()),inputData,function(result){
		if(result.status == 'ok') {
			   initData.data=result.data;
		        //默认二手房显示
                 $(".main-right .all-list").setTemplateElement("Template");
                 $(".main-right .all-list").setParam('DateFormat', DateFormat);
                 $(".main-right .all-list").processTemplate(initData.data);
		        $('#showTotal span').text(result.recordCount);
                $('#lookhistory .lj-lazy').lazyload();

		        pageConfig.recordCount = result.recordCount;
                pageConfig.pageNo = result.pageNo;
                if(pageConfig.recordCount>pageConfig.pageSize){
                	$('#paginageBox').show();
					$('#paginageBox').pagination(pageConfig);
                }else{
                	$('#paginageBox').hide();
                }
				
		    	if(pageConfig.recordCount==0){
		    		 $(".main-right .all-list").setTemplateElement("template_no");
		    		 $(".main-right .all-list").processTemplate();
		            $('#showTotal span').text(0);
		        }
		    	
   		}
		});
    }
  //弹层
  $('.estimate .actAddBtn').on('click',function(){
      $("#fade").css("height", $(document).height());
     $('#fade').show();
      $('#MyDiv').show();
      $('#MyDiv').css('top',$(window).height()*0.1+$(document).scrollTop()+'px');
      $(".ntComment").find("textarea").focus();
  });
  $(".dingcan").on('click',function() {
      $("#MyDiv").hide();
      $("#fade").hide();
  });
  $('.list-bot .report').on('click',function(){
      $("#fade").css("height", $(document).height());
      $('#fade').show();
      $('#reportDiv').show();
      $('#reportDiv').css('top',$(window).height()*0.1+$(document).scrollTop()+'px');
  });
  $('.actCancelAdd1').on('click',function(){
      $('#reportDiv').hide();
      $('#fade').hide();

  });
  $(".actSlider").mousemove(function(t) {
      var a = $(t.currentTarget),
              i = t.clientX,
              e = a.offset().left + 55,
              s = a.width(),
              n = (i - e) / s * 5 + 1;
              a.find(".star-bg").css("width", Math.floor(n) / 5 * 100 + "%");
              a.find("input").val(Math.floor(n));
  });
   

search();



})
</script>

</body>
</html>
