function deletecomment(id){
	if(!confirm("确定删除吗？")) {
        return false;
    }

    var url = '/article/comment/delete/' + id;
    ajaxDelete({
           url:url,
           ok: function(data) {
               
               window.location.reload();
           },

           fail: function(data){
                alert(data.message);
           }
        }
    );

}
function updatecomment(id,content){
	alert("233");	
}
function editcomment(id){
	var elements = document.getElementById(id).getElementsByTagName("p");
	var comment = elements[0];
	var op = elements[1];
	var content = comment.firstChild.nodeValue ;
	if(content)
	{		
		comment.innerHTML = "<input id=comment type='text' value='"+content+"'/>" ;
		var click = 'onclick = "update('+id+')"';
		op.innerHTML = 
		'<p class="mt_5"><a href="#" '+click+'>提交</a><a href="#" class="red ml_10" onclick="cancel()">取消</a></p>';
	}
	
}

function update(id){
	var elements = document.getElementById(id).getElementsByTagName("input");
	var comment = elements[0];
	var content = comment.value;
	if(!content){
		alert('评论不能为空');
		return;
	}else{
		var jsonObj = {"id":id,"content":content};
		var jsonStr = JSON.stringify(jsonObj);
		ajaxPost({
            url:'/article/comment/edit',
            dataType:"json",      
            contentType:'application/json;charset=utf-8',
            data: jsonStr,     
            ok: function(data){
                window.location.reload();
            },
            fail:function(data){            	
                alert("提交失败");
            }
        });
	}
	
}
function cancel(){
	window.location.reload();
}

function showPopupDiv(div_id) {
    var div_obj = $(div_id);
    //窗口宽度,高度
    var winWidth = $(window).width();
    var winHeight = $(window).height();
    //弹出的div的宽度,高度
    var popHeight = div_obj.height();
    var popWidth = div_obj.width();
    div_obj.animate({ opacity: "show", left: (winWidth-popWidth) / 2, top: (winHeight-popHeight)/2,width:popWidth,height:popHeight}, 300);         
}       
function hidePopupDiv(div_id) {
    $(div_id).animate({opacity: "hide" }, 300);
}


