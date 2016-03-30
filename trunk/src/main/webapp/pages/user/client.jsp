<%@ include file="../common/includes.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/pages/common/header.jsp">
    <jsp:param name="title" value="用户中心 - 链家网" />
</jsp:include>
<link rel="stylesheet" href="${config.statichost}/static/css/client/cropper.css">
<link rel="stylesheet" href="${config.statichost}/static/css/client/main.css">

<div class="container">
    <div class="user-main">
        <div class="main-left fl">
            <c:import url="../menu.jsp?nav=7"></c:import>
        </div>
        <div class="main-right fr">
            <div class="title">我的账户信息</div>
            <div class="tab">

                <span class="hover actTap" >上传头像</span>
                <span class="actTap">修改昵称</span>
                <span class="actTap">修改密码</span>
            </div>
            <form id="updatePwd" style="display: none" class="js_module">
                <ul class="change-pwd">
                    <li class="js_ajaxError ErrMsgNew" style="display: none"></li>
                    <li>
                        <span>输入旧密码：</span>
                        <input type="password" name="password" id="password" placeholder="请输入密码" rule="notNull maxThanSix" validatename="密码">
                    </li>
                    <li>
                        <span>设置新密码：</span>
                        <input type="password" name="newPassword" id="password1" placeholder="请输入新密码" rule="notNull maxThanSix" class="js_comparePwdFrom" validatename="密码">
                    </li>
                    <li>
                        <span>确认新密码：</span>
                        <input type="password" placeholder="请确认新密码" name="confirmNewPassword" class="js_comparePwdTo" rule="notNull compareIsSame" validatename="确认新密码">
                    </li>
                    <li>
                        <span></span><a class="actSubmit lj-btn"  id="passSubmit">保存修改</a>
                    </li>
                </ul>
            </form>
            <form id="updateName" style="display: none" class="js_module">
                <ul class="change-pwd">
                    <li class="js_ajaxError ErrMsgNew" style="display: none"></li>
                    <li>
                        <span>设置昵称：</span>
                        <input  id="nickname" placeholder="请输入昵称" maxlength="14" name="nickname" rule="notNull" validatename="昵称">
                    </li>
                    <li>
                        <span></span><a class="actSubmit lj-btn" id="nameSubmit">保存修改</a>
                    </li>
                </ul>
            </form>
            <div id="updatePortrait" class="change-portrait js_module">
                <div class="js_ajaxError ErrMsgNew" style="display: none"></div>
                <div class="update">
                       <div class="js_uploadContainer">
                            <input type="file" id="inputImage" class="js_trueUpload hideit" accept="image/jpeg,image/png" multiple>
                            <a href="javascript:;" class="btn-normal btn-green in_block  js_fakeUpload" style="margin:10px">选择图片</a>
                        </div> 
                <div class="preview">
                    <div class="fl" id="label">
                        <div class="img-container" style='width:273px;height:273px;'>
                            <img id="image" src="" alt="Picture" style="display:none">
                        </div>
                        <label>只支持jpg、png格式,大小不能超过1M</label>
                        <img src="${config.statichost}/static/img/default-pic.png" class="null">

                    </div>
                    <div class="fr">
                        <p>预览</p>
                        <div class="preview-box" id="show_edit">
                            <div class="preview-3x img-preview"><img src="${config.statichost}/static/img/default-avatar-big.png"></div>
                            <div class="preview-2x img-preview"><img src="${config.statichost}/static/img/default-avatar-middle.png"></div>
                            <div class="preview-1x img-preview"><img src="${config.statichost}/static/img/default-avatar-small.png"></div>
                            <div>
                            <span class="text-3">120px*120px</span>
                            <span class="text-2">80px*80px</span>
                            <span class="text-1">34px*34px</span>
                            </div>

                        </div>
                        <button id="uploadBtn" class="btn-normal btn-green in_block" style="margin:10px;display: none">确定</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<iframe src="http://user.lianjia.com" style="height: 0px" ></iframe>
<!--begin: footer-->
<%@ include file="../common/footer.jsp" %>
<!--end: footer-->
<script src="${config.statichost}/static/js/lj_validation.js?${config.version}"></script>
</div>

<script>

    $(function() {
        function ajaxLoading(dom){
            if(dom.hasClass('disable')){
                return false;
            }
            dom.addClass('disable');
            dom.text('提交中');
        }



        var console = window.console || { log: function () {} };
        function getCookie(cookie_name){
            var allcookies = document.cookie;
            var cookie_pos = allcookies.indexOf(cookie_name);
            if (cookie_pos != -1){
                cookie_pos += cookie_name.length + 1;
                var cookie_end = allcookies.indexOf(";", cookie_pos);
                if (cookie_end == -1){
                    cookie_end = allcookies.length;
                }
                var value = unescape(allcookies.substring(cookie_pos, cookie_end));
            }
            return value;
        }
        var options = {
            aspectRatio: 10 / 10,
            preview: '.img-preview',
            zoomable:false,
            cropBoxResizable:false,
            crop: function (e) {
            }
        };

        var uuid = getCookie("lianjia_uuid");
        var $inputImage = $('#inputImage');
        var $image = $('#image');
        $image.on({
        }).cropper(options);
        var URL = window.URL || window.webkitURL;
        var blobURL;
        if (URL) {
            $inputImage.change(function () {
                var files = this.files;
                var file;
                if (files && files.length) {
                    file = files[0];
                    if (/^image\/((png)|(jpeg))$/.test(file.type) && file.size/1024<1024) {
                        $('#uploadBtn').show();
                        $('.preview .fl .null,.preview .fl label').hide();
                        blobURL = URL.createObjectURL(file);
                        $image.one('built.cropper', function () {
                            URL.revokeObjectURL(blobURL);
                        }).cropper('reset').cropper('replace', blobURL);
                        $inputImage.val('');
                    } else {
                        window.alert('请选择小于1M的图片');
                    }
                    $inputImage.val('');
                } else {
                    window.alert('Please choose an image file.');
                }
            }
            );
        } else {
            $inputImage.prop('disabled', true).parent().addClass('disabled');
        }

        $('.user-main .tab span').click(function(){
            $('.js_ajaxError').hide();
            if($(this).text()=='修改密码'){
                $(this).addClass('hover').siblings().removeClass('hover');
                $('#updatePwd').css('display','block');
                $('#updateName').css('display','none');
                $('#updatePortrait .update').css('display','none');
            }
            if($(this).text()=='上传头像'){
                $(this).addClass('hover').siblings().removeClass('hover');
                $('#updatePwd').css('display','none');
                $('#updateName').css('display','none');
                $('#updatePortrait .update').css('display','block');
            }
            if($(this).text()=='修改昵称'){
                $(this).addClass('hover').siblings().removeClass('hover');
                $('#updatePwd').css('display','none');
                $('#updateName').css('display','block');
                $('#updatePortrait .update').css('display','none');
            }

        });
        /* 设置昵称*/
        function updateNickName(dom,btnText){
            var inputData={};
            inputData.uuid= getCookie("lianjia_uuid");
            inputData.token= getCookie("lianjia_token");
            inputData.nickname= 	$('#nickname').val();
            $.post("/user/updateNickName.json?v="+Number(new Date()),inputData,function(result){
                dom.removeClass('disable');
                dom.text(btnText);
                if(result.status == 'ok') {
                    window.location.reload();
                }else{
                    dom.parents('.js_module').find('.js_ajaxError').text('修改昵称失败').show();
                    //alert('保存失败');
                }
            });
        }
        /* 设置密码*/
        function updatePassword(dom,btnText){

            var inputData={};
            inputData.uuid= getCookie("lianjia_uuid");
            inputData.token= getCookie("lianjia_token");
            inputData.password= 	$('#password').val();
            inputData.newPassword=$('#password1').val();
            $.post("/user/updatePwd.json?v="+Number(new Date()),inputData,function(result){
                dom.removeClass('disable');
                dom.text(btnText);

                if(result.errno === 0){
                    window.location.reload();
                }else{
                	if(result.data&&result.data.data.msg){
                    dom.parents('.js_module').find('.js_ajaxError').text(result.data.data.msg).show();
                	}else{
                		 dom.parents('.js_module').find('.js_ajaxError').text("修改密码失败！").show();
                	}
                    //alert('保存失败');
                }
            });
        }

        /* 设置头像*/
        function updateAvatar(dom,btnText){
            var inputData={};
            var CanvasData= $image.cropper('getCroppedCanvas');
            inputData.uuid= getCookie("lianjia_uuid");
            inputData.token= getCookie("lianjia_token");
            inputData.url= CanvasData.toDataURL("image/jpeg",0.8);
            inputData.width=CanvasData.width;
            inputData.height=CanvasData.height;
            inputData.src_x="NaN"
            inputData.src_y="NaN";
            inputData.isLow="false";
            $.post("/user/updateAvatar.json?v="+Number(new Date()),inputData,function(result){
                dom.removeClass('disable');
                dom.text(btnText);

                if(result.status == 'ok') {
                    window.location.reload();
                }else{
                    dom.parents('.js_module').find('.js_ajaxError').text('上传失败').show();
                }
            });
        }

        var pswValidator = $('#updatePwd').validate({elContainerSelector:'li'});
        if(!pswValidator.rules.ruleConfig.maxThanSix){
            pswValidator.addRule('maxThanSix',{
                validate: function(element){
                    var value = $.trim(element.val());
                    if( value === '' ){
                        return true;
                    }
                    return value.length >= 6;
                },
                message: '密码最小长度为6'
            });
        }
        if(!pswValidator.rules.ruleConfig.notNull){
            pswValidator.addRule('notNull',{
                validate: function(element){
                    this.message = element.attr('validatename') + '不能为空';
                    return $.trim(element.val()) !== "";
                }
                //,message: '密码不能为空'
            });
        }

        if(!pswValidator.rules.ruleConfig.compareIsSame){
            pswValidator.addRule('compareIsSame',{
                validate: function(element){
                    var value = $.trim(element.val());
                    if( value === ''){
                        return true;
                    }

                    var compareValFrom = $.trim(element.parents('form').find('.js_comparePwdFrom').val());
                    var compareValTo = $.trim(element.parents('form').find('.js_comparePwdTo').val());
                    return compareValFrom === compareValTo;
                }
                ,message: '确认新密码输入不一致'
            });
        }


        $('#passSubmit').click(function(){
            var self = $(this);
//            $('.js_ajaxError').hide();//ajax报错的层隐藏
            if (pswValidator.validateForm()){
                ajaxLoading(self);//处理防重复提交
                updatePassword(self, '保存修改');
            }

        });

        var nicknameValidator = $('#updateName').validate({elContainerSelector:'li'});

        $('#nameSubmit').click(function(){
            var self = $(this);
//            $('.js_ajaxError').hide();//ajax报错的层隐藏
            if (nicknameValidator.validateForm()){
                ajaxLoading(self);//处理防重复提交
                updateNickName(self, '保存修改');
            }
        });
        $('#uploadBtn').click(function(){
            var self = $(this);
//            $('.js_ajaxError').hide();//ajax报错的层隐藏
            ajaxLoading(self);//处理防重复提交
            updateAvatar(self, '确定');
        });
        
        $('#updatePortrait .js_fakeUpload').click(function(){
        	$('#updatePortrait .js_trueUpload').trigger('click');
        });
    })
</script>
<script src="${config.statichost}/static/js/client/cropper.js"></script>
</body>
</html>
