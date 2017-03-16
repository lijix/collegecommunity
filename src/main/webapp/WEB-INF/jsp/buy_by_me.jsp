<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="buyList">
		<c:forEach items="${buyList }" var="a">
			<div class="row" style="border: 1px solid #ccc">
				<div>${a.sell_user.username }</div>
			 	<div class="pull-right"> ${a.publisurDate }</div>
				<div>${a.description }</div>
				<div>
					<img alt="商品图片" src="${a.goods_photo }"style="width: 100px;height: 100px">
</div>
				<div>${a.price }</div>
				<div style="color:red">${a.state }</div> 
				<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
					联系对方
				</button>
			</div>
		</c:forEach>
	</div>
