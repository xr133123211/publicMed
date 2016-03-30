<%@ include file="includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!--begin: 底部-->
    <div class="lianjia-footer-simple">北京链家房地产经纪有限公司 | 网络经营许可证 京ICP备11024601号-12<br>© Copyright©2010-2015 链家网Lianjia.com版权所有&nbsp;</div>
    <!--end: 底部-->
<!-- 微聊 -->
	<div class="lianjiaim im-fold">
		<div class="lianjiaim-shandow clear">
			<!--列表页-->
			<div class="lianjiaim-wrap">
				<div class="lianjiaim-head">
					<span>咨询经纪人</span>
					<span class="lianjiaim-head-num" style="display: none;">0</span>
					<a class="lianjiaim-head-closebtn" title="收起">收起</a>
				</div>
				<div class="lianjiaim-body">
					<%--<ul class="pp" style="display: none;"></ul>--%>
					<ul style="display: none;">

					</ul>
					<div class="lianjiaim-noagent" style="display: none;">
						<div class="noagent-sub">您还没有登陆,先去登陆/注册吧</div>
						<div><a href="javascript:;" class="js_login">登录/注册</a></div>
					</div>
					<div class="lianjiaim-noagent-nobody" style="display: none;">
						<div class="noagent-title">没有聊过的经纪人</div>
						<div class="noagent-sub">不暴露手机号在线咨询经纪人</div>
					</div>
				</div>
			</div>

			<div class="lianjiaim-window im-online" style="display: none;">
				<div class="lianjiaim-wintitle">
					<i>在线</i>
					<span class="im-wt-name"></span>
					<a href="javascript:;" class="im-wt-closebtn" title="关闭">关闭</a>
				</div>
				<div class="lianjiaim-wincont">
					<div class="im-wc-hint">
						<span class="agentName"></span><span class="agentContent"></span>
						<a href="javascript:;" class="im-wt-closebtn2" title="关闭" style="display: none">关闭</a>
					</div>
					<div class="im-wc-chat">
						<p class="chat-tophint">聊天的时候，经纪人无法知道您的手机号！</p>
						<ul id="print-wall" class="print-wall">

						</ul>
					</div>
				</div>
				<div class="im-wc-input">
					<div class="im-input-container" data-role="im-input-container">
						<textarea name="" id="input-send" placeholder="点击输入您想要咨询的问题…" autofocus="autofocus" spellcheck="false"></textarea>
						<div class="js_uploadContainer pl_20">
							<input type="hidden" name="attachIds" class="js_attachIds">
							<input type="file" class="js_trueUpload hideit" accept="image/jpeg,application/pdf" multiple>
							<a class="im-input-insertpic js_fakeUpload" title="插入图片">插入图片</a>
						</div>
					</div>
					<div class="im-btn-container">
						<span style="display: inline-block;width: 200px;height: 30px;margin-top: 10px;"><a href="${config.webhost}/client?source=pcwl" target="_blank"><img src="${config.publichost}/public/img/weiliao/weiliao_guanggao.png" style="width:100%;height: 100%;"/></a></span>
						<input type="button" value="发送" id="send-btn">
					</div>
				</div>
			</div>
		</div>
		<!--经纪人名片-->
		<div class="lianjiaim-personcard" style="display: none;">
			<div class="im-personcard-top clear">
				<div class="im-personcard-avatar">
					<img src="" alt="" width="78" height="78">
				</div>
				<div class="im-personcard-detail">
					<div class="im-personname-wrap">
						<span class="im-personname"></span>
						<span class="im-gray position"></span>
					</div>
					<div>
						<span class="im-gray">主营板块：</span>
						<span class="im-pcard-district"></span>
					</div>
					<div>
						<span class="im-gray">所属门店：</span>
						<span class="im-pcard-store"></span>
					</div>
					<div>
						<span class="im-gray">从业年限：</span>
						<span class="im-pcard-workage"></span>
					</div>
				</div>
			</div>
			<div class="im-personcard-bottom">
				<table>
					<tbody>
					<tr>
						<td>
							<span>累计成交：</span>
							<span class="im-red im-pcard-totaldeal" ></span>
						</td>
						<td>
							<span>月总带看：</span>
							<span class="im-red im-pcard-monthshow"></span>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>

	</div>



<!--列表模板-->
 		<textarea id="weiliaotem" style="display:none">
			{#foreach $T as tag}
			<li class="lianjiaim-body-item" alias="{$T.tag.objectId}" name="{$T.tag.user.clientId}">
				<div class="im-item-show clear">
					<table>
						<tbody>
						<tr>
							<td class="im-item-avatar">
								{#if $T.tag.user.agent}
								<img class="lj-lazy" src="{$T.tag.user.ucAvatar}" alt=""
									 width="40" height="40" onerror="this.src='${config.publichost}/public/img/weiliao/noimg.jpg'">
								{#else}
								<img class="lj-lazy" src="{$T.tag.user.ucAvatar}" alt=""
									 width="40" height="40" onerror="this.src='${config.publichost}/public/img/weiliao/sprite_user.png'">
								{#/if}
								<i style="display: none;">{$T.tag.num}</i>
							</td>
							<td class="im-item-cont">
								<span class="name">{$T.tag.user.displayName}</span>
								<span class="text">{$T.tag.message}</span>
							</td>
						</tr>
						</tbody>
					</table>
					<div class="im-item-time">{$T.tag.updatedAt}</div>
					<a class="im-item-delbtn" title="删除">×</a>
				</div>
				<div class="im-item-delete clear">
					<div>
						<span class="title">确定删除？</span>
						<span class="cont">删除后将不可恢复</span>
					</div>
					<div class="im-item-delbtnwrap">
						<a class="im-btn js_confirm" title="确定">确定</a>
						<a class="im-btn js_cancle" title="取消">取消</a>
					</div>
				</div>
			</li>
			{#/for}
		  </textarea>

<!-- 微聊  end-->

<script src="${config.publichost}/public/js/passport.js?v=${config.version}"></script>
<script src="${config.publichost}/public/js/weiliao/AV.realtime.js?v=${config.version}"></script>
<script src="${config.publichost}/public/js/weiliao/weiliaocommon.js?v=${config.version}}"></script>
<script src="${config.publichost}/public/js/weiliao/weiliao.js?v=${config.version}"></script>
<script src="${config.publichost}/public/js/user.js?v=${config.version}"></script>
<script src="${config.publichost}/public/js/ljubt.min.js?v=${config.version}"></script>
</body>
</html>