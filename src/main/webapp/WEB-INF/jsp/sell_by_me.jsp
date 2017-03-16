<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(".finish").off();
	$(".finish").on("click", function() {
		var cate=$(this);
		var id = $(this).attr("val");
		var url = "finishGoodsSell.action";
		$.post(url, {id : id}, function() {
			alert("完成任务,获得20积分");
			$(".listContent").load("toSellByMe.action");		
	});
});	
	
	$(".unfinish").off();
	$(".unfinish").on("click", function() {
		var cate=$(this);
		var id = $(this).attr("val");
		var url = "unfinishGoods.action";
		$.post(url, {id : id}, function() {
			alert("对方没有完成任务,失去15积分");
			$(".listContent").load("toSellByMe.action");		
	});
});	
	
	$(".cancel").off();
	$(".cancel").on("click", function() {
		var id = $(this).attr("val");
		var url = "deleteGoods.action";
		$.post(url, {id : id}, function() {
			alert("取消任务,失去10积分");
			$(".listContent").load("toSellByMe.action");		
	});
});
</script>
	<div class="sellList">
		<c:forEach items="${sellList }" var="p">
			<div class="row" style="border: 1px solid #ccc">
				<div>${p.sell_user.username }</div>
			 	<div class="pull-right">${p.publisurDate }</div>
				<div>${p.description }</div>
				<div>
<img alt="商品图片" src="${p.goods_photo }"style="width: 100px;height: 100px">
</div>
				<div>${p.price }</div>
				<div style="color:red">${p.state }</div> 		
				<c:if test="${!empty p.buy_user.username }">
					${p.buy_user.username }
					<a class="finish pull-right" style="cursor:pointer" val="${p.id }">${p.state eq'已完成'||p.state eq'未完成'?"":"完成"}</a>
					<a class="unfinish pull-right" style="cursor:pointer" val="${p.id }">${p.state eq'已完成'||p.state eq'未完成'?"":"未完成"}</a>
				</c:if>
				<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
					联系对方
				</button>
				<c:if test="${p.state eq'未接收' }">
					<a class="pull-right cancel"  val="${p.id }">取消</a>
				</c:if>
			</div>
		</c:forEach>
	</div>
