/**
	前提条件
		需要验证的字段必须有name属性
		
	流程
		遍历所有的输入字段
		根据字段的指定规则， 进行验证
		错误消息处理
		
		控件触发事件，对触发事件的控件进行验证	
		
	验证的支持度：
		同一个容器中，多个字段验证的错误提示
		字段隐藏时， 不验证； 但如果字段配置属性alwaysCheck为true， 则无论显示与否都需验证
**/


(function($){

	/** ----- 绑定到form表单的jquery对象方法 ----- **/
	$.fn.validate = function(opts){
		opts = $.extend({
			elContainerSelector: 'td',
			errorClass: 'ErrMsgNew',
			ruleConfigName: 'rule',
			groupByName: 'groupby',
			errorSelectorName: 'errorSelector',
			scroll: true
		}, opts || {});
	
		return new $.fn.validate.validator($(this), opts);
	};
	
	
	/** ------ 错误处理模块 ----- **/
	var errorProcessModule = {
		setErrMsg: function($element, message, opts){
			opts = this._preProcessOpts(opts);
			var firstEl = $element.eq(0), 
				elContainer = $element.attr('errorContainerId') ? $('#' + $element.attr('errorContainerId')) : firstEl.closest(opts.elContainerSelector),
				errorObj = elContainer.find('.'+opts.errorClass);
			
			elContainer.find('.'+opts.errorClass).remove();
			elContainer.append($('<p class="'+opts.errorClass+'">' + this._getErrorContent(firstEl, message, opts.useCustomMsg) + '</p>'));
		},
		clearErrMsg: function($element, opts){
			opts = this._preProcessOpts(opts);
			setTimeout(function(){
				$element.eq(0).closest(opts.elContainerSelector).find('.'+opts.errorClass).remove();
			}, 200);
		},
		_getErrorContent: function(firstEl, message, useCustomMsg){		//获取错误消息内容
			if(useCustomMsg && firstEl.attr('title')){
				return firstEl.attr('title');
			}
			return firstEl.attr('title') ?  ('"'+firstEl.attr('title')+'" '+message) : message;
		},
		_preProcessOpts: function(opts){
			opts = opts || {};
			if(!opts.errorClass){
				opts.errorClass = 'ErrMsgNew';
			}
			if(!opts.elContainerSelector){
				opts.elContainerSelector = 'td';
			}
			
			return opts;
		}
	};
	
	
	/** ------ 控件类型处理模块 ----- **/
	var ctrlTypeProcessorModule = {
		getCtrlTypeConfig: function($element){
			if( $element.is(':text') || $element.is(':password') || $element.is(':file') || 
						$element.is('textarea') || $element.is('input[type=hidden]') || $element.is('input[type=number]') ){
				
				return {ctrlType: 'text', eventType: 'change'};
			}
			if( $element.is(':radio') ){
				return {ctrlType: 'radio', eventType: 'change'};
			}
			if( $element.is(':checkbox') ){
				return {ctrlType: 'checkbox', eventType: 'change'};
			}
			if( $element.is('select') ){
				return {ctrlType: 'select', eventType: 'change'};
			}
			
			throw 'name为 "'+$element.attr('name')+'"的控件类型无法识别，请联系管理员.';
		}
	};
	
	
	//验证规则处理模块
	var ruleProcessorModule = {
		ctrlTypeModule: ctrlTypeProcessorModule,
		commonValidate: function($element, reg){
			var value = $.trim($element.eq(0).val());
			if( value === '' ){
				return true;
			}
			return reg.test(value);
		},
		ruleConfig: {
			'required': {
				validate: function($element){
					var ctrlType = ruleProcessorModule.ctrlTypeModule.getCtrlTypeConfig($element).ctrlType;
					if( ctrlType == 'radio' || ctrlType === 'checkbox'){
						return $element.filter(':checked').length > 0;
					}
					
					var firstEl = $element.eq(0);
					if( ctrlType == 'select' ){
						return (firstEl.val() !== '');
					}
					
					//文本框有默认值
					if( firstEl.attr('defaultText') != undefined ){
						if(firstEl.attr('defaultText') == $.trim(firstEl.val())){
							return false;
						}
					}
					
					return $.trim( firstEl.val() ) !== '';
				},
				message: '必填'
			},
			'integer': {
				validate : function($element){
					return ruleProcessorModule.commonValidate($element, /^\d+$/);
				},
				message: '必须是正整数'
			},
			'number1': {
				validate : function($element){
					return ruleProcessorModule.commonValidate($element, /^\d+(\.\d{1})?$/);
				},
				message: '必须是正数字， 最多1位小数'
			},
			'number2': {
				validate : function($element){
					return ruleProcessorModule.commonValidate($element, /^\d+(\.\d{1,2})?$/);
				},
				message: '必须是正数字， 最多2位小数'
			},
			'number3': {
				validate : function($element){
					return ruleProcessorModule.commonValidate($element, /^\d+(\.\d{1,3})?$/);
				},
				message: '必须是正数字， 最多3位小数'
			},
			'number4': {
				validate : function($element){
					return ruleProcessorModule.commonValidate($element, /^\d+(\.\d{1,4})?$/);
				},
				message: '必须是正数字， 最多4位小数'
			},
			'number5': {
				validate : function($element){
					return ruleProcessorModule.commonValidate($element, /^\d+(\.\d{1,5})?$/);
				},
				message: '必须是正数字， 最多5位小数'
			},
			'number6': {
				validate : function($element){
					return ruleProcessorModule.commonValidate($element, /^\d+(\.\d{1,6})?$/);
				},
				message: '必须是正数字， 最多6位小数'
			},
			'letter': {
				validate : function($element){
					return ruleProcessorModule.commonValidate($element, /^[a-zA-Z0-9]*$/);
				},
				message: '必须是字母'
			},
			'telephone': {
				validate : function($element){
					return ruleProcessorModule.commonValidate($element, /^[\d-]+$/);
				},
				message: '不是有效的电话号码'
			},
			'moblie': {
				validate : function($element){
					return ruleProcessorModule.commonValidate($element, /^1[3|4|5|7|8][0-9]\d{8}$/);
				},
				message: '不是有效的手机号码'
			},
			'validJsonChar': {
				validate : function($element){
					if( $.trim($element.eq(0).val()) === '' ){
						return true;
					}
					return !ruleProcessorModule.commonValidate($element, /[\\\b\t\n\f\r\"]+/g);
				},
				message: '不能输入半角的反斜杠、双引号和换行'
			},
			'idcard': {
				validate: function($element){
					if($.trim($element.val()) === ''){
						return true;
					}
					
					num = $element.val().toUpperCase();
				    if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))) {      
				        return false;         
				    }
				    var len, re; len = num.length; if (len == 15) {
				        re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/); 
				        var arrSplit = num.match(re);
				        var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]); 
				        var bGoodDay; bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
				        if (!bGoodDay) {         
				            return false;
				        } else {       
				            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);         
				            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');      
				            var nTemp = 0, i;            
				            num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);           
				            for(i = 0; i < 17; i ++) {                 
				                nTemp += num.substr(i, 1) * arrInt[i];        
				            }
				            num += arrCh[nTemp % 11]; 
				            return true;
				        }
				    }
				    if (len == 18) {
				        re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/); 
				        var arrSplit = num.match(re);
				        var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]); 
				        var bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4])); 
				        if (!bGoodDay) { 
				            return false; 
				        }
				        else { 
				            var valnum; 
				            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
				            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
				            var nTemp = 0, i; 
				            for(i = 0; i < 17; i ++) { 
				                nTemp += num.substr(i, 1) * arrInt[i];
				            } 
				            valnum = arrCh[nTemp % 11]; 
				            if (valnum != num.substr(17, 1)){
				                return false; 
				            } 
				            return true; 
				        } 
				    }
				    
				    return false;
				},
				message: '不是有效的身份证号'
			}
		}
	};
	
	
	/** ----- 验证器 ----- **/
	$.fn.validate.validator = function($form, opts){
		this.$form = $form;
		this.elements = {};
		this.errors = {};
		this.bindEvent = {};
		this.elNames = [];
		this.opts = opts;
		
		this._initialize();
	}
	
	$.fn.validate.validator.prototype = {
		contructor: $.fn.validate.validator,
		rules: ruleProcessorModule,
		errorProcessor: errorProcessModule,
		ctrlTypeProcessor: ctrlTypeProcessorModule,
		validateForm: function(){										//验证表单所有元素
			//绑定事件
			this.bindElementWithEvent();
			
			var checkResult = true;
			for(var i=0, len=this.elNames.length; i<len; i++){
				checkResult = this.validateElement(this.elements[this.elNames[i]]) && checkResult;
			}
			
			//focus到第一个验证不通过的字段
			for(var elName in this.errors){
				this.focusFirstInvalidField(this.$form.find('[name=' + elName + ']'));
				break;
			}
			
			return checkResult;
		},
		validateElement: function($element){			//分组验证
			var closestCon = $element.closest(this.opts.elContainerSelector),
				groupEls = closestCon.find('['+this.opts.groupByName+']'),
	            me = this,
	            errorEl = $element,
	            isValid = true;
	       
	        if( groupEls.length > 0 ){                    //有groupby属性：即一个td中包含多个控件的情况
	        	$.each(me._getCtrlNames(groupEls), function(i, name){
	        		var el = closestCon.find('[name="'+name+'"]');
	        		if( !me._validateElement(el) ){
	                       errorEl = el;
	                       return (isValid = false);
	                  }
	        	});
	        }else{                                             //一个td容器中，只有一个控件
	             isValid = me._validateElement( $element );
	        }
	       
	        isValid ? me.errorProcessor.clearErrMsg(errorEl, me.opts) : me.errorProcessor.setErrMsg(errorEl, me.errors[errorEl.attr('name')], me.opts);
	       
	        return isValid;
		},
		refresh: function(){								//重新加载表单，主要针对动态添加字段的情况
			this._initialize();
		},
		addRule: function(ruleName, ruleInfo){				//供插件使用者，添加自定义规则
			var ruleConfig = this.rules.ruleConfig;
			for(var rule in ruleConfig){
				if( ruleName === rule ){
					console.log('addRule方法抛异常， 规则名为："'+ ruleName +'" 的规则已经存在， 请重新命名规则名。');
					return ;
				}
			}
			ruleConfig[ruleName] = ruleInfo;
		},
		clearErrMsg: function(){
			this.$form.find('.' + this.opts.errorClass).remove();
		},
		_validateElement: function($element){				//验证单个表单元素
			var arrRules = this._parseRules($element);
			
			//处理字段无需验证的情况
			if( (($element.attr('alwaysCheck') === undefined || $element.attr('alwaysCheck') == 'false') && $element.is(':visible') === false ) ){
				return true;
			}
			
			//给当前元素绑定事件
			this._bindElementWithEvent($element);
			
			
			//根据验证规则验证字段的有效性
			var elName = $.trim($element.attr('name'));
			for(var i=0; i<arrRules.length; i++){
				if( this.rules['ruleConfig'][arrRules[i]]['validate']($element) === false){
					this.errors[elName] = this.rules['ruleConfig'][arrRules[i]].message;
					return false;
				}
			}

			delete this.errors[elName];
			return true;
		},
		_parseRules: function($element){						//解析字段的验证规则
			for(var i=0, len=$element.length; i<len; i++){
				var $el = $element.eq(i), 
					ruleName = this.opts.ruleConfigName;
					
				if( $el.attr(ruleName) !== undefined && $.trim($el.attr(ruleName)) !== ''){
					return $.trim($el.attr(ruleName)).split(/\s+/);
				}
			}
			
			return [];
		},
		_bindElementWithEvent: function($element){			//给元素绑定事件
			var elName = $.trim($element.attr('name')),
				me = this;
			
			if( !me.bindEvent[elName] ){
				me.bindEvent[elName] = true;
				
				this.$form.delegate('[name="'+elName+'"]', me.ctrlTypeProcessor.getCtrlTypeConfig($element).eventType, function(){
					me.validateElement(me.$form.find('[name="'+elName+'"]'));
				});
			}
		},
		_initialize: function(){											//初始化， 获取所有的表单元素
			var me = this, uniqueContainer = {};
			
			me.elements = {};
			me.elNames = [];
			me.errors = {};
			me.$form.find(':text, :password, :file, :radio, :checkbox, select, textarea, input[type=hidden], input[type=number]').filter('[rule]').each(function(){
				var elName = $.trim($(this).attr('name'));
				if( elName ){
					if( !(elName in uniqueContainer) ){
						me.elNames.push( elName );
						me.elements[elName] = me.$form.find('[name="'+elName+'"]');
					}
					uniqueContainer[elName] = true;
				}
			});
		},
		_getCtrlNames: function(allElements){
			var names = [],
				name = '';
			
			allElements.each(function(){
				name = $.trim($(this).attr('name'));
				if($.inArray(name, names) === -1){
					names.push(name);
				}
			});
			
			return names;
		},
		bindElementWithEvent: function(){					//绑定事件到元素对象上是
			var me = this;
			for(var elName in this.elements){
				me._bindElementWithEvent(this.elements[$.trim(elName)]);
			}
		},
		focusFirstInvalidField: function(focusField){		//focus到第一个节点
			if( focusField !== null){
				focusField.focus();
				
				if(this.opts.scroll){
					$("html, body").scrollTop(focusField.closest(this.opts.elContainerSelector).offset().top - 50);
				}
			}
		}
	}
}(jQuery));