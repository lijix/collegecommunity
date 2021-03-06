<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>杰普科技-信息管理</title>
<link rel="stylesheet" type="text/css" href="theme/1/css/common.css">
<link rel="stylesheet" type="text/css" href="theme/1/css/style.css">
<link rel="stylesheet" type="text/css" href="theme/1/css/table.css">
<link rel="stylesheet" type="text/css" href="theme/1/css/icon.css">
<link rel="stylesheet" type="text/css" href="theme/1/css/EditingArea.css">
<link rel="stylesheet" type="text/css"
	href="theme/1/jquery-easyui-themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="theme/1/css/easyui-tabs.css">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="theme/1/js/base.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>

<style type="text/css">

.divtable {
	padding-bottom: 30px;
}
</style>
<script type="text/javascript" >
$(function(){
	$(".baseUI li").off("click");
	$(".baseUI li").on("click",function(){
		var cate = $(this);
		if(!cate.hasClass("active")){
			cate.addClass("active");
			cate.siblings().removeClass("active");
		}
		var url = cate.attr("url");
		$(".rightContent").load(url);
	});
	//默认激发第一个li
	$(".baseUI li:first").trigger("click");
});
	
	
</script>
</head>
<body>
	<div class="main">
		<div id="top">
			<div class="top">
				<div class="t_logo"></div>
				<div class="t_sign">
					<span>你好，管理员</span><a href="toIndex.action" class="t_exit">退出</a>
				</div>
			</div>
		</div>
		<div id="cont">
			<div class="centent">
				<div class="left">
					<ul class="baseUI">
					<!-- 地址 -->
						<li url="manager/toArticleList.action">
							<a href="javascript:void(0);">
								<em class="base_basicset"></em>
								<span>信息管理</span>
							</a>
						</li>
						<li url="manager/toArticlePublisur.action">
							<a href="javascript:void(0);">
								<em class="base_roll">
								</em><span>信息发布</span>
							</a>
						</li>
						<li url="manager/toCategoryManager.action">
							<a href="javascript:void(0);">
								<em class="base_userset"></em>
								<span>栏目管理</span>
							</a>
						</li>
						<li url="manager/toAddCategory.action">
							<a href="javascript:void(0);">
								<em class="base_auth">
								</em><span>添加栏目</span>
							</a>
						</li>
						<li url="manager/toBaseSet.action">
							<a href="javascript:void(0);">
								<em class="base_sys"></em>
							<span>系统设置</span></a>
						</li>
					</ul>
				</div>
				<div class="right" style="height: 530px; overflow: auto;">
					<!-- 内容加载区 -->
					<div class="rightContent" style="padding: 10px;">
						
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div id="foot">
			<a href="#">上海杰普软件科技有限公司</a>
		</div>
	</div>
</body>
</html>
