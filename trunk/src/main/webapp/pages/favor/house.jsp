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
                    <span class="actTap  hover">二手房</span>
                    <span class="actTap" >新房</span>
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
        <c:import url="../house/houseTemplate.jsp?type=1"></c:import>
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
//    $('.list-bot').on('mouseover','.lj-lazy',function(){
//        self=$(this);
//        picChange(self);
//        self.next('img').hide();
//    });
//    $('.list-bot').on('mouseout','.lj-lazy',function(){
//        self=$(this);
//        picChange(self);
//        self.next('img').show();
//    });
//    function picChange(self){
//        var obj = self.attr('src');
//        self.attr('src',self.next('img').attr('src'));
//        self.next('img').attr('src',obj);
//    }
    var initData = {
        data:{}
    };
    var inputData={};
	 
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
		
	    $.get("/favor/getMyFavorHouseList.json?v="+Number(new Date()),inputData,function(result){
		    if(result.status == 'ok') {
                initData.data=result.data;

		        //默认二手房显示
		        $(".list-bot").setTemplateElement("Template");
		        $(".list-bot").processTemplate(initData.data);
                $('#ershoufang .lj-lazy').lazyload();
		        $('#showTotal span').text(result.recordCount);

		        pageConfig.recordCount = result.recordCount;
                pageConfig.pageNo = result.pageNo;
                if(pageConfig.recordCount>pageConfig.pageSize){
                	$('#paginageBox').show();
					$('#paginageBox').pagination(pageConfig);
                }else{
                	$('#paginageBox').hide();
                }
				
		    	if(pageConfig.recordCount==0){
		            $(".list-bot").setTemplateElement("template_no");
		            $(".list-bot").processTemplate();
		            $('#showTotal span').text(0);
		        }
		    	 //二手房显示 取消关注
		        $('.main-right .list-bot li').on('mouseover',function(){
		            $(this).find('.del-fav').show();
		        });
		        $('.main-right .list-bot li').on('mouseout',function(){
		            $(this).find('.del-fav').hide();
		        });
		        //二手房 点击取消关注
		        $('#ershoufang .del-fav').click(function(){
		        	var index = Number($(this).attr("index"));
		        	delList(index);
		        });
   		    }
		});
    }
	
    function delList(id){
        $.post("/favor/delFavorHouse.json?id="+id,null,function(result){
            if(result.status == 'ok') {
                search();
            }
        });
    }
   
  
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

    search();
});
</script>

</body>
</html>