var SUCCESS = "success";
var ERROR = "error";
var NONE = "none";
var FAIL = "fail";
var OK = "ok";

var __is_IE = (navigator.appName == "Microsoft Internet Explorer");


/**
 * 将指定层里面的所有input转换成json格式
 * @param form
 */
function form2json(form) {
    var txt = '';
    form = '#' + form;
    $(form).find('input[type="hidden"]').each(function() {
        if ($(this).attr('name')) {
            txt += '"' + $(this).attr('name') + '":"' + serialize($(this).val()) + '",';
        }
    });
    //input text
    $(form).find('input[type="text"]').each(function() {
        if ($(this).attr('name')) {
            txt += '"' + $(this).attr('name') + '":"' + serialize($(this).val()) + '",';
        }
    });
    //checkbox
    var chknames = '';
    $(form).find('input[type="checkbox"]').each(function() {
        if (this.name) {
            if (this.checked) {
                if (chknames.toUpperCase().indexOf(this.name.toUpperCase()) >= 0) {
                    var reg = new RegExp('"' + this.name + '":' + '"(.+?)",', 'i');
                    txt = txt.replace(reg, '"' + this.name + '":' + '"$1,' + this.value + '",');
                } else {
                    chknames += this.name + ',';
                    txt += '"' + this.name + '":"' + this.value + '",';
                }
            }
        }
    });
    //radio
    var rdnames = '';
    $(form).find('input[type="radio"]').each(function() {
        if (this.name) {
            if (this.checked) {
                if (rdnames.toUpperCase().indexOf(this.name.toUpperCase()) >= 0) {
                    var reg = new RegExp('"' + this.name + '":' + '"(.+?)",', 'i');
                    txt = txt.replace(reg, '"' + this.name + '":' + '"' + this.value + '",');
                } else {
                    rdnames += this.name + ',';
                    txt += '"' + this.name + '":"' + this.value + '",';
                }
            }
        }
    });

    //textArea
    $(form).find('textArea').each(function() {
        if ($(this).attr('name')) {
            txt += $(this).attr('name') + ':"' + serialize($(this).val()) + '",';
        }
    });
    //select
    $(form).find('select').each(function() {
        if ($(this).attr('name')) {
            var value = '';
            if ($(this).attr('selectedIndex') >= 0) {
                value = this.options[this.selectedIndex].value;
            }
            txt += $(this).attr('name') + ':"' + serialize(value) + '",';
        }
    });
    //file
    txt = txt.replace(/,$/, '');
    return '{' + txt + '}';
}

function serialize(text) {
    text = text.replace(/(")/g, "\\\"");
    return text;
}


/**
 * 解析URL
 * @param url
 */
function parseURL(url) {
    var a = document.createElement('a');
    a.href = url;

    return {
        source:url,
        protocol:a.protocol.replace(':', ''),
        host:a.hostname,
        port:a.port,
        query:a.search,
        params:(function () {

            var ret = {},
                    seg = a.search.replace(/^\?/, '').split('&'),
                    len = seg.length, i = 0, s;
            for (; i < len; i++) {
                if (!seg[i]) {
                    continue;
                }
                s = seg[i].split('=');
                ret[s[0]] = s[1];
            }

            return ret;

        })(),

        file:(a.pathname.match(/\/([^\/?#]+)$/i) || [, ''])[1],
        hash:a.hash.replace('#', ''),
        path:a.pathname.replace(/^([^\/])/, '/$1'),
        relative:(a.href.match(/tps?:\/\/[^\/]+(.+)/) || [, ''])[1],
        segments:a.pathname.replace(/^\//, '').split('/')
    };
}

/**
 * 替换当前链接中指定的的URL参数为空
 * @param newParams 需要替换的参数, {param: paramValue}
 */
function replaceLocalUrlParams(newParams) {
    var myUrl = parseURL(window.location.href);
    return replaceUrlParams(myUrl, newParams);
}

/**
 * 将URL中指定的参数，替换成空
 * @param myUrl 需要替换的URL
 * @param newParams 需要替换的参数, {param: paramValue}
 */
function replaceUrlParams(myUrl, newParams) {
    for (var x in newParams) {
        var hasInMyUrlParams = false;
        for (var y in myUrl.params) {
            if (x.toLowerCase() == y.toLowerCase()) {
                myUrl.params[y] = newParams[x];
                hasInMyUrlParams = true;
                break;
            }
        }
        //原来没有的参数则追加
        if (!hasInMyUrlParams) {
            myUrl.params[x] = newParams[x];
        }
    }

    var _result = myUrl.protocol + "://" + myUrl.host;
    if (myUrl.port != '' && myUrl.port != 0) {
        _result += ":" + myUrl.port;
    }
    _result += myUrl.path + "?";

    for (var p in myUrl.params) {
        _result += (p + "=" + myUrl.params[p] + "&");
    }
    if (_result.substr(_result.length - 1) == "&") {
        _result = _result.substr(0, _result.length - 1);
    }
    return _result;
}

/**
 * 移除URL所有参数
 */
function removeAllParams() {
    var sourceUrl = "";
    var newUrl = "";
    var url = parseURL(window.location.href);
    var indexParam = window.location.href.indexOf("?");
    if (indexParam != -1) {
        sourceUrl = window.location.href.substring(0, indexParam);
    } else {
        return false;
    }
    newUrl = sourceUrl;
    if (url.params['style'] != undefined && url.params['style'] != '') {
        newUrl = replaceUrlParams(parseURL(sourceUrl), {style:url.params['style']});
    }
    window.location.href = newUrl;
    return false;
}
/**
 * 将当前链接中的指定的参数置为空，多个参数以","分隔
 * @param paramFields
 */
function removeParams(paramFields) {
    var url = window.location.href;
    var params = paramFields.split(",");
    for (var i = 0; i < params.length; i++) {
        url = removeOneParam(url, params[i]);
    }
    return url;
}

function removeOneParam(url, paramField) {
    // 为了方便处理，分别在参数部分开头（即？之后）和末位添加&符号
    url = url.replace(/\?/, "?&");
    url = url.replace(/$/, "&");
    // 搜索匹配参数并替换
    var reg = new RegExp("&" + paramField + "=.*?&", "gi");
    url = url.replace(reg, "&");
    // 删除之前添加的&符号
    url = url.replace(/\?&/, "?");
    url = url.replace(/&{1}$/, "");
    url = url.replace(/\?$/, "");
    return url;
}

/**
 * 构造 ajaxGet, ajaxPost, ajaxDelete, ajaxPut方法
 * 在jquery ajax 基础的再次封装，返回值只接收json格式的
 * demo:
 * ajaxDelete({
 *      url:url,
 *      ok: function(data) {
 *          alert("ok");
 *      },
 *
 *      fail: function(data){
 *          alert(data.message);
 *      }
 *  });
 *
 * @type {Array}
 */
var methods = ["ajaxGet", "ajaxPost", "ajaxDelete", "ajaxPut"];
for(var i = 0; i < methods.length; i ++) {
    (function(_i){
        var method = methods[_i];
        window[methods[_i]] = function(options) {
            $.ajax({
                type:  methods[_i].replace("ajax", ""),
                url:   options.url,
                cache: options.cache || false,
                data:  options.data  || undefined,
                async: options.async == undefined ? true : options.async,
                dataType:'json',
                contentType : options.contentType || undefined,

                success:function (data) {
                    var status = data.status;
                    if(status == 'ok') {
                        options.ok(data);
                    } else if (status == 'fail') {
                        options.fail(data);
                    } else {
                        alert(status + " - 你的操作出现异常状态，请重试或报修！");
                    }
                },
                error:function (jqXHR) {
                    errorStatus = jqXHR.status;
                    if(errorStatus == 404) {
                        alert(jqXHR.status + ", 你请求的操作不存在！");
                    } else if (errorStatus == 403) { //未登录
                        //showPopupDiv($('#loginLayer'));
                        return false;
                    } else if (errorStatus == 500) {
                        alert(jqXHR.status + ", 你请求的出现错误了，请重试或报修！");
                    } else {
                        alert(jqXHR.status + ", 你请求的出现错误了，请重试或报修！");
                    }
                },
                complete:function (jqXHR) {
                    if (jqXHR == null)
                        return;
                    if (jqXHR.status == 403) { //未登录
                        showPopupDiv($('#loginLayer'));
                    }
                }
            });
        }
    })(i);
}

/**
 * 判断是否登录
 * @param response
 */
function isLogin(response) {
    if (response == null)
        return false;

    if (response.status == 403) {
        showPopupDiv($('#loginLayer'));
        return false;
    }
    return true;
}

/**
 * 判断session是否超时
 * 内部用ajax向服务端请求 "/testSession"
 */
function sessionTimeout() {
    var sessionTimeout = false;
    $.ajax({
        type:'GET',
        url:'/testSession',
        async:false,
        success:function () {
            sessionTimeout = false;
        },
        error:function () {
            sessionTimeout = true;
        },
        complete:function (jqXHR) {
            if (jqXHR == null)
                return;
            if (jqXHR.status == 403) {
                sessionTimeout = true;
            }
        }
    });
    return sessionTimeout;
}

/**
 * 添加所有字符
 * @param s1 原始字符
 * @param s2 需要替换
 */
String.prototype.replaceAll = function (s1, s2) {
    return this.replace(new RegExp(s1, "gm"), s2);
};

/**
 * 判断是否为空
 * @param s
 */
function isEmpty(s) {
    s = $.trim(s);
    return s == "" || s == undefined;
}

/**
 * 让指写的节点显示
 * removeClass("hideit");
 * @param o
 */
function show(o) {
    o.removeClass("hideit");
}

function showById(id) {
    show($("#" + id));
}

/**
 * 让指定的节点隐藏
 * addClass("hideit");
 * @param o
 */
function hidden(o) {
    o.addClass("hideit");
}
function hiddenById(id) {
    hidden($("#" + id));
}

function view_submit_doing(id) {
    $("#" + id).removeClass("fBlue60")
            .addClass("fGray60")
            .attr("disabled", "disabled")
            .val("提交中..");
}

function view_submit_reset(id) {
    $("#" + id).removeClass("fGray60")
            .addClass("fBlue60")
            .removeAttr("disabled")
            .val("确定");
}

function decURL(url){
    var path = url.substring(0, url.lastIndexOf("/")+1);
    var filename = url.substring(url.lastIndexOf("/")+1,url.length-4);
    var arrStr = filename.split("");
    for(var i=0; i<arrStr.length; i++){
        if(arrStr[i] != "_"){
            arrStr[i] = HexToDec(arrStr[i])-5;
        }
    }
    return path + arrStr.toString().replace(/,/g, "") + ".wav";
}


var regD = /^\d+$/;
var regEnD = /^[a-zA-Z0-9]*$/;
var regTel = /^[\d-]+$/;
var regSum = /^\d+(\.\d{1,4})?$/;
var regSum2 = /^\d+(\.\d{1,2})?$/;
var regDD = /^\d+(\.\d{1})?$/;
var regDate = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
var regUrl = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
var regFloat = /^\d+(.[0-9]*)?$/;
var reqTrustNo=/^[\u4e00-\u9fa5]\d{10}$/;
