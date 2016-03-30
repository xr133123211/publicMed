<%@ include file="common/includes.jsp" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Cache-Control" content="no-transform" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta name="format-detection" content="telephone=no" />
	<link href="${config.publichost}/public/img/favicon.ico" type="image/x-icon" rel=icon>
	<link href="${config.publichost}/public/img/favicon.ico" type="image/x-icon" rel="shortcut icon">
	<title>上海二手房_上海二手房推荐-上海链家网</title>
	<meta name="keywords" content="上海二手房,上海二手房出售,上海二手房买卖,上海二手房交易,上海二手房价格,上海二手房信息。" />
	<meta name="description" content="链家上海二手房网在上海二手房市场用户口碑极佳，为上海二手房用户使用率和满意度极好的网络二手房交易及信息平台，同时也是上海二手房用户重点推荐使用的网站。链家上海二手房网提供上海二手房最新房源，房源真实可靠无虚假无重复，让每一个用户安心满意的进行上海二手房交易，营造最值得用户信赖的上海二手房交易平台。" />
	<link rel="stylesheet" href="${config.publichost}/public/css/common.css?${config.version}">
	<link rel="stylesheet" href="${config.publichost}/public/css/weiliao.css?${config.version}">
	<link rel="stylesheet" href="${config.statichost}/static/css/home.css?${config.version}">
	<!--[if lt IE 9]>
	<script type="text/javascript" src="${config.publichost}/public/js/html5.js"></script>
	<![endif]-->
	<script>
		var headerParameters = {
			env : '${config.env}',
			publichost : '${config.publichost}',
			statichost : '${config.statichost}',
			managehost : '${config.managehost}',
			webhost : '${config.webhost}',
			uchost : '${config.uchost}',
			agenthost : '${config.agenthost}',
			apihost : '${config.apihost}',
			openhost : '${config.openhost}',
			chathost : '${config.chathost}',
			loginhost:'${config.loginhost}',
			cityCode : '${config.cityCode}',
			lianjiaSource:'${config.lianjiaSource}',
			lianjiaSignature:'${config.lianjiaSignature}',

			hasFixBar : true //是否有右侧边栏
		}
	</script>

	<script src="${config.publichost}/public/js/jquery/jquery.min.js"></script>
	<script src="${config.publichost}/public/js/jquery/jQuery.XDomainRequest.js"></script>
	<script src="${config.publichost}/public/js/jquery/jquery.qrcode.min.js"></script>
	<script src="${config.publichost}/public/js/jquery/jquery-upload-1.0.js"></script>
	<script src="${config.publichost}/public/js/jquery/jquery-jtemplates.js"></script>
	<script src="${config.statichost}/static/js/common.js?${config.version}"></script>

</head>

<body>
	<!--begin: 正文-->
	<div class="header lj-lazy" data-original="${config.statichost}/static/img/home/bannerV2.jpg">
		<div class="wrapper clear">
			<div class="fl">
				<a href="/" title="链家网" class="logo"></a>
				<span class="exchange js_exchange"><i></i>上海</span>
			</div>

			<!-- 选择城市时的弹窗 begin -->
			<div class="city-change animated js_citychange">
				<div class="title">
					请选择城市
					<span class="close js_close"></span>
				</div>
				<ul>
					<li><a href="http://bj.lianjia.com/"><i></i>北京</a></li>
					<li><a href="http://tj.lianjia.com/"><i></i>天津</a></li>
					<li><a href="/" class="check"><i></i>上海</a></li>
					<li><a href="http://cd.lianjia.com/"><i></i>成都</a></li>
					<li><a href="http://nj.lianjia.com/"><i></i>南京</a></li>
					<li><a href="http://hz.lianjia.com/"><i></i>杭州</a></li>
					<li><a href="http://qd.lianjia.com/"><i></i>青岛</a></li>
					<li><a href="http://dl.lianjia.com/"><i></i>大连</a></li>
					<li><a href="http://xm.lianjia.com/"><i></i>厦门</a></li>
					<li><a href="http://wh.lianjia.com/"><i></i>武汉</a></li>
					<li><a href="http://sz.lianjia.com/"><i></i>深圳</a></li>
					<li><a href="http://cq.lianjia.com/"><i></i>重庆</a></li>
					<li><a href="http://cs.lianjia.com/"><i></i>长沙</a></li>
					<li><a href="http://xa.lianjia.com/"><i></i>西安</a></li>
					<li><a href="http://jn.lianjia.com/"><i></i>济南</a></li>
					<li><a href="http://sjz.lianjia.com/"><i></i>石家庄</a></li>
				</ul>
			</div>
			<!-- 选择城市时的弹窗 end -->

			<div class="fr" id="lianjia-header" scheme="home">
			</div>
			<script src="${config.publichost}/public/js/lianjia_sh_navbar.js?${config.version}"></script>

			<!--[if lte IE 8]>
			<div class="old-browser-popup" id="old" >
				亲，您当前正在使用旧版本的IE浏览器，为了保证您的浏览体验，链家网建议您使用：<label class="chrome-borwser-ico"></label><a href="http://rj.baidu.com/soft/detail/14744.html?ald" target="_blank">谷歌浏览器</a>&nbsp;或&nbsp;&nbsp;<label class="firefox-borwser-ico"></label><a href="http://rj.baidu.com/soft/detail/11843.html?ald" target="_blank">火狐浏览器</a>
				<span id="oldclose"></span>
			</div>
			<![endif]-->

			<div class="clear"></div>
			<div class="header-wrap">
				<div class="wrap-ico"></div>
				<div class="house-num">
					<ul>
						<li style="height: 35px;">上海真实在售二手房 ${totalInfo.saleTotal} 套</li>
					</ul>
				</div>
				<div class="search-box-wrap" log-mod="search">
					<div class="search-box-con">
						<div class="menu">
							<ul class="clear">
								<li class="check tab js_menu_tab" searchtype="ershoufang" actdata="channel=site" data-type="请输入区域、板块或小区名开始找房" formact="/ershoufang/rs"><span>找二手房</span></li>
								<li class="tab js_menu_tab" searchtype="xiaoqu" actdata="channel=xiaoqu" data-type="请输入小区名开始查找小区" formact="/xiaoqu/rs"><span>找小区</span></li>
							</ul>
							<i class="js_menu_tab_arrow"></i>
						</div>

						<div class="search clear">
							<div class="box">
								<form id="formSearch"  class="clear" action="/ershoufang/rs" method="post">
									<input type="text" style="display:none"/>
									<input value="" maxlength="20" class="text left txt autoSuggest js_menu_autoSuggest" name="keyword" autocomplete="off" placeholder="请输入区域、板块或小区名开始找房" id="keyword-box" popdiv="suggestion">
									<input class="btn home-ico ico-search left" id="btn_topSearch" type="button" value="开始找房" daty-id="310000">
									<div id="userNews" class="savesearch">

									</div>
								</form>
								<div id="suggest-cont" class="suggest-wrap" style="width: 646px;display:none">
									<%--<div class="title js_suggestion_title">你可能在找</div>--%>
									<ul style="width:100%" class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content" id="suggestion" style="display:none">

									</ul>
								</div>
							</div>
							<!-- <div class="ditu"><a href="/ditu/" target="_blank"><img src="${config.statichost}/static/img/home/ditu.png"></a></div> -->
							<div class="sug-tips" id="hot-sug">
								<ul id="ershoufang">
									<div class="js_history js_history_ershoufang">
										<li class="hot-name">
											<span class="hot-tips">搜索历史</span>
											<span class="del js_delHisSuggest" style="display: inline;">清空</span>
										</li>
										<div class="list js_suggestList">

										</div>
									</div>

									<div class="js_hot js_hot_ershoufang">
										<li class="hot-name">
											<span class="hot-tips">热门搜索</span>
											<span class="del">清空</span>
										</li>
										<div class="list js_suggestList">
											<c:forEach items="${lj:getHotList('ershoufang')}" var="hot">
												<li><a href="${hot.url}">${hot.showName}</a></li>
											</c:forEach>
										</div>
									</div>
								</ul>

								<ul id="xiaoqu">
									<div class="js_history js_history_xiaoqu">
										<li class="hot-name">
											<span class="hot-tips">搜索历史</span>
											<span class="del js_delHisSuggest" style="display: inline;">清空</span>
										</li>
										<div class="list js_suggestList">

										</div>
									</div>
									<div class="js_hot js_hot_xiaoqu">
										<li class="hot-name">
											<span class="hot-tips">热门搜索</span>
											<span class="del">清空</span>
										</li>
										<div class="list js_suggestList">
											<c:forEach items="${lj:getHotList('xiaoqu')}" var="hot">
												<li><a href="${hot.url}">${hot.showName}</a></li>
											</c:forEach>
										</div>
									</div>
								</ul>
							</div>
						</div>

						<div class="pen">
							<a href="http://www.lianjia.com/zhuanti/baodan/#310000">
								<img src="${config.statichost}/static/img/home/phpL58jg71456379190.png" height="16">链家购房安心承诺 亿元保单
							</a>
						</div>

					</div>


				</div>

			</div>
			<%--<div class="wrap-video">
				<div class="video-open">
					<img src="http://static1.ljcdn.com/pc/asset/img/home/icon_play.png?_v=20160226183832" alt="上海链家APP, 开启移动找房之旅">上海链家APP, 开启移动找房之旅
				</div>
				<div class="pen">
					<a href="http://www.lianjia.com/zhuanti/baodan/#310000">
						<img src="${config.statichost}/static/img/home/phpL58jg71456379190.png">链家购房安心承诺 亿元保单
					</a>
				</div>
			</div>--%>
		</div>
	</div>

	<div class="home-nav">
		<ul>
			<li>
				<div class="title">找二手房</div>
				<a target="_blank" href="/ershoufang/" title="二手房"><div class="nav-icos nav-ico ico01-1"><i></i></div></a>
				<div class="cunn">真实房源，无重复<a target="_blank" href="/ershoufang/" title="二手房">去找房</a></div>
			</li>
			<li>
				<div class="title">找小区</div>
				<a target="_blank" href="/xiaoqu/" title="小区"><div class="nav-ico ico05"><i></i></div></a>
				<div class="cunn">寻找您关注的小区<a target="_blank" href="/xiaoqu/" title="找小区">找小区</a></div>
			</li>
			<li class="last">
				<div class="title">链家理财</div>
				<a href="https://licai.lianjia.com/" target="_blank" title="去理财" rel="nofollow"><div class="nav-ico ico04"><i></i></div></a>
				<div class="cunn">年息7.8%+中融信本息保障<a href="https://licai.lianjia.com/" target="_blank" title="去理财" rel="nofollow">去理财</a></div>
			</li>
			<div class="clear"></div>
		</ul>
	</div>

	<!-- 市场行情 -->
	<div class="data lj-lazy" data-original="${config.statichost}/static/img/home/dataV2.jpg">
		<div class="main">
			<div class="title">上海市${cityMonth.month}月二手房市场行情</div>
			<div class="data-price">
				<div class="deal-price">
						<span>
							<a href="javascript:;">
                                <label class="dataAuto" style="visibility: visible;">
                                    <c:if test="${totalInfo.dealAvgPrice!=null}">${totalInfo.dealAvgPrice}</c:if>
                                    <c:if test="${totalInfo.dealAvgPrice==null}">0.0</c:if>
                                </label>
                            </a>
                            <c:if test="${totalInfo.changeRate!=0}">
							<i class="${totalInfo.changeRate>0?'up':(totalInfo.changeRate<0?'down':'')}"></i>
                            </c:if>
						</span>
					<p>二手房源成交均价(元/㎡)</p>
				</div>
				<div class="listing-price">
						<span>
							<a href="javascript:;">
                                <label class="dataAuto" style="visibility: visible;">
                                <c:if test="${cityMonth.saleAvgPrice!=null}">${cityMonth.saleAvgPrice}</c:if>
                                <c:if test="${cityMonth.saleAvgPrice==null}">0.0</c:if>
                                </label>
                            </a>
                            <c:if test="${cityMonth.saleAvgPrice!=cityMonth.lastSaleAvgPrice}">
							    <i class="${cityMonth.saleAvgPrice>cityMonth.lastSaleAvgPrice?'up':'down'}"></i>
                            </c:if>
						</span>
					<p>二手房源挂牌均价(元/㎡)</p>
				</div>
			</div>
			<ul>
				<li>
					<a href="javascript:;">
						<div class="bg"></div>
						<span>
                            <label>
                            <c:if test="${userHouseRatio!=null}">${userHouseRatio}</c:if>
                            <c:if test="${userHouseRatio==null}">0.0</c:if>
                            </label>
                            <c:if test="${userHouseRatio!=null&&lastUserHouseRatio!=null&&userHouseRatio!=lastUserHouseRatio}">
                                <i class="${userHouseRatio>lastUserHouseRatio?'up':'down'}"></i>
                            </c:if>
                        </span>
						<p>昨日新增客房比</p>
					</a>
				</li>
				<li>
					<a href="javascript:;">
						<div class="bg"></div>
						<span>
                            <label>
                                <c:if test="${cityMonth.dealCount!=null}">${cityMonth.dealCount}</c:if>
                                <c:if test="${cityMonth.dealCount==null}">0</c:if>
                            </label>
                            <c:if test="${cityMonth.dealCount!=cityMonth.lastDealCount}">
							    <i class="${cityMonth.dealCount>cityMonth.lastDealCount?'up':'down'}"></i>
                            </c:if>
                        </span>
						<p>上月成交量(套)</p>
					</a>
				</li>
				<li class="last">
					<a href="javascript:;">
						<div class="bg"></div>
						<span>
                            <label>
                                <c:if test="${lookCount1Day!=null}">${lookCount1Day}</c:if>
                                <c:if test="${lookCount1Day==null}">0</c:if>
                            </label>
                            <c:if test="${lookCount1Day!=null&&lastLookCount1Day!=null&&lookCount1Day!=lastLookCount1Day}">
                                <i class="${lookCount1Day>lastLookCount1Day?'up':'down'}"></i>
                            </c:if>
                        </span>
						<p>昨日房源带看量(次)</p>
					</a>
				</li>
			</ul>
			<div class="clear"></div>
		</div>
	</div>

	<!-- 下载区 -->
	<div class="hand-lianjia lj-lazy" data-original="${config.statichost}/static/img/home/bg-app.jpg">
		<div class="wrapper">
			<div class="fl">
				<div class="titles"></div>
				<p>
					上海链家APP二手房成交量、成交金额双双引领市场，更多用户选择，引领上海！更多真房源，上新快、推荐准。亿元五大保障，购房更安心。手机匿名微聊，防骚扰、更私密！上海链家APP陪你，开启全新购房之旅！
				</p>
				<div class="download clear">
					<div class="hand-app">
						<a href="http://sh.lianjia.com/app/download_ios?source=pcsy" class="ios" target="_blank" rel="nofollow"></a>
						<%--<span class="ios">ios版即将推出<br>敬请期待</span>--%>
						<a href="http://sh.lianjia.com/app/download_ar?source=pcsy" class="android" rel="nofollow"></a>
					</div>
					<%--<div class="erweima"><img src="${config.statichost}/static/img/home/erweima.png"></div>--%>
					<div class="erweima">
						<div class="js_downAppEwmStatic_img" source="jtewm" ewmimgw="102" ewmimgh="102"></div>
					</div>
					<%--<div class="video-img-btn" id="code_video">
						<img class="video-img-btn-bg" src="${config.statichost}/static/img/video-entrance/video-img-btn.png" alt="开启移动找房之旅">
						<img class="video-btn-normal" src="${config.statichost}/static/img/video-entrance/video-btn-normal.png" alt="开启移动找房之旅">
					</div>--%>
				</div>

				<div class="clear"></div>
			</div>
			<div class="fr phone"></div>
		</div>
	</div>

	<!-- 二手房推荐 -->
	<div class="ershoufang" id="ershoufanglist">
		<div class="wrapper">
			<div class="fl">
				<div class="name"></div>
				<p>好房源那么多，我们为你精选，链家网会越来越懂你<a href="/ershoufang/">更多上海二手房</a></p>
			</div>
			<div class="clear"></div>

			<ul>
				<c:forEach items="${recomList}" var="item">
					<li>
						<a href="/ershoufang/${item.cityCode}${item.nearHouseId}.html" target="_blank">
							<div>
								<img src="${item.mainPhotoUrl}">
								<span class="price">${item.showPrice}万</span>
								<div class="bottom">
									<p class="p01">${item.title}</p>
								</div>
								<div class="tips">
									<%--<span class="ico"></span>--%>
									<p>
										<span>${item.propertyName}</span>
										<span>${item.room}室${item.hall}厅</span>
										<span>${item.acreage}平</span>
									</p>
									<label></label>
								</div>
							</div>
						</a>
					</li>
				</c:forEach>
				<div class="clear"></div>
			</ul>


		</div>
	</div>

	<div class="s-truth lj-lazy" data-original="${config.statichost}/static/img/home/truth-bg.jpg">
		<div class="wrapper">
			<div class="fl">
				<div class="truth-txt"></div>
			</div>
			<div class="truth-search">
				<p>真实房源、真实委托、真实价格！<br>链家郑重向用户承诺：上海链家网全渠道真实房源，假一赔百！</p>
				<div class="search-box">
					<div class="serach-inp">
						<input type="text" class="tex" id="truth" placeholder="请输入房源编号查询真伪...">
						<span class="sub" id="searchHouse"></span>
					</div>
					<div class="result-box js_truthResultBox" daty-id="310000">

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="trust wrapper">
		<ul>
			<li>
				<span><img src="${config.statichost}/static/img/home/trust_1.png"></span>
				<p>真实价格 真实房源</p>
				<label>链家承诺，假一赔百</label>
			</li>
			<li>
				<span><img src="${config.statichost}/static/img/home/trust_2.png"></span>
				<p>海量房源 覆盖全城</p><label>房源信息最权威覆盖最广</label>
			</li>
			<li>
				<span><img src="${config.statichost}/static/img/home/trust_3.png"></span>
				<p>万名置业顾问 专业服务</p>
				<label>百万家庭的信赖之选</label>
			</li>
			<li>
				<span><img src="${config.statichost}/static/img/home/trust_4.png"></span>
				<p>安心承诺 保驾护航</p>
				<label>亿元保障赔付 助你购买安心房</label>
			</li>
		</ul>
	</div>

	<div class="overlayBg js_mask"></div>

	<div class="savelist"></div>

	<!--end: 正文-->
	<jsp:include page="common/footer.jsp">
		<jsp:param name="homeSearch" value="1"/>
	</jsp:include>
	<script src="${config.statichost}/static/js/home_search.js?${config.version}"></script>
	<script src="${config.statichost}/static/js/home.js?${config.version}"></script>
	<!-- 视频入口浮层 -->
	<%--<div class="video-box" id="video-box">
		<div class="video-bg"></div>
		<div class="video-embed">
			<div class="video-title">
				上海链家APP·开启移动找房之旅!
					<span class="video-app-download">
						<a href="http://www.lianjia.com/client/" target="_blank">
							<img src="http://static.ljcdn.com/pc/asset/img/video-entrance/video-logo-app.png?_v=20151230193746" class="video-logo-app">
							<span>马上去下载</span>
						</a>
					</span>
			</div>
			<img id="video-close" class="video-close" src="http://static.ljcdn.com/pc/asset/img/video-entrance/video-close.png?_v=20151230193746" alt="关闭" />
			<embed src="http://static.video.qq.com/TPout.swf?vid=k0172rnl5o4&auto=0" allowFullScreen="true" quality="high" width="650" height="455" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" flashvars="autoplay=1&amp;"></embed>
		</div>
	</div>
	--%>
	<script  type="text/javascript">
		//视频相关 顶部搜索处和底部二维码扫码处

		/*var oWrap_video_all = document.getElementById('wrap-video-all');
		var code_video = document.getElementById('code_video');

		oWrap_video_all.onclick = function(){
			var oVideo_box = document.getElementById('video-box');
			var oVideo_close = document.getElementById('video-close');
			oVideo_box.style.display = "block";
			oVideo_close.onclick = function(){
				oVideo_box.style.display = "none";
			}
		}

		code_video.onclick = function(){
			var oVideo_box = document.getElementById('video-box');
			var oVideo_close = document.getElementById('video-close');
			oVideo_box.style.display = "block";
			oVideo_close.onclick = function(){
				oVideo_box.style.display = "none";
			}
		}*/
	</script>
</body>
</html>
