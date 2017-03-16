<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$("#publishTaskForm").on("submit", function() {
		var publishTimes=$(".hidden").attr("val");
		if(publishTimes>=5){
			$(".publish").addClass("disabled");
			alert("发布失败，最多可发布5个,您今日已达上限");
			$(".description").val("");
			$(".pay").val(""); 
		}
		else{
			$(this).ajaxSubmit({
			success : function() {
				alert("发布成功！获得10积分");
				$(".listContent").load("toGoodsList.action");
			},
			resetForm : true
			});
		}
		return false;
	});
	
	$(".accept").off();
	$(".accept").on("click", function() {
		var acceptTimes=$(".hidden2").attr("val");
		if(acceptTimes>=3){
			$(".accept").addClass("disabled");
			alert("接收失败，最多可接收3个,您今日已达上限");
		}
		else {
			var id = $(this).attr("val");
			var url = "acceptGoods.action";
			$.post(url, {
				id : id
			}, function() {
				alert("成功接收任务！获得15积分");
				$(".listContent").load("toGoodsList.action");
			});
		}
	});
	
	$(".collect").off();
	$(".collect").on("click", function() {	
			var id = $(this).attr("val");
			if($(this).text().trim()=="收藏"){
				var url = "collectGoods.action";
				$.post(url, {id : id}, function() {
					alert("您成功收藏任务");
					$(".listContent").load("toGoodsList.action");
				});
			}else if($(this).text().trim()=="已收藏") {
				var url = "cancelCollectGoods.action";
				$.post(url, {id : id}, function() {
					alert("您取消收藏任务");
					$(".listContent").load("toGoodsList.action");
				});
			}
	});
</script>

    
    <script type="text/javascript">


     function g_AjxUploadImg(btn, img, hidPut) {  
    var button = btn, interval;  
    new AjaxUpload(button, {  
        action: '/Common/UploadHandler.ashx?fileType=img',  
        data: {},  
        name: 'myfile',  
        onSubmit: function(file, ext) {  
            if (!(ext && /^(jpg|JPG|png|PNG|gif|GIF)$/.test(ext))) {  
                alert("您上传的图片格式不对，请重新选择！");  
                return false;  
            }  
        },  
        onComplete: function(file, response) {  
            flagValue = response;  
            if (flagValue == "1") {  
                alert("您上传的图片格式不对，请重新选择！");  
            }  
            else if (flagValue == "2") {  
                alert("您上传的图片大于200K，请重新选择！");  
            }  
            else if (flagValue == "3") {  
                alert("图片上传失败！");  
            }  
            else {  
                hidPut.value = response;  
                img.src = g_AjxTempDir + response;  
            }  
        }  
    });  
}  

     </script>
<div class="row publishBox" style="border: 1px solid #ccc">

	<form class="form-horizontal" action="publishGoods.action" method="post" id="publishTaskForm" enctype="multipart/form-data">
		<input type="hidden" value="${pageBean.allRow }" class="allRow">
		<input type="hidden" value="${pageBean.pageSize }" class="pageSize">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">商品描述:</label>
			<div class="col-sm-10">
				<textarea  class="form-control description" name="description">请输入商品的描述内容。。。</textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">商品图片:</label>
			<img alt="" src="" style="width:100px;height: 100px" >
			  <input type="file" name="file" value="file">
			   
			
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">商品价格:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control pay" name="price">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit"  value="发布" class="btn btn-success publish"> 
			</div>
		</div>
		<input type="hidden" val="${user.publishTimes }" class="hidden">
		<input type="hidden" val="${user.acceptTimes }" class="hidden2">
	</form>
</div>

	<div class="taskContent">
		<c:forEach items="${goodsList }" var="t">
			<c:if test="${empty t.buy_user }">
				<div class="row" style="border: 1px solid #ccc">
					<div>发布者：${t.sell_user.username }</div>
					<div class="pull-right">发布日期：${t.publisurDate }</div> 
					<div>商品描述：${t.description }</div>
					<div>商品图片：
					<img alt="" src="${t.goods_photo }" style="width: 100px;height: 100px">
					</div>
					<div>商品价格：${t.price }</div>
				    <div style="color:red">商品状态：${t.state }</div>
				    <c:if test="${t.sell_user.username!=user.username }">
						<a class="btn btn-primary  accept pull-right" val="${t.id }">我接收</a>
						<a class="btn btn-danger collect pull-right" val="${t.id }">
							<c:set var="flag" value="false"></c:set>
							  <c:forEach items="${t.goods_users}" var="u">
								   <c:if test="${u.collect_goods_user.id==user.id && u.collect_goods.id==t.id}">
								    <c:set var="flag" value="true"></c:set>   
								   </c:if>
							  </c:forEach>
							  <c:if test="${flag==true}">已收藏</c:if> 
							  <c:if test="${flag==false}">收藏</c:if>
						</a>
						<div class="pull-right btn">已收藏${t.collectTimes>0?t.collectTimes:0 }次</div>
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
							联系对方
						</button>
					</c:if>
				</div>
			</c:if>
		</c:forEach>
	</div>
