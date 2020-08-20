<%@page import="java.util.List"%>
<%@page import="bean.Drug"%>
<%@page import="dao.DrugDao"%>
<%@page import="dao.DrugDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="https://v3.bootcss.com/favicon.ico">
<title>Dashboard Template for Bootstrap</title>
<!-- Bootstrap core CSS -->
<link href="./static/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet">
<!-- 当前页面用到的自定义样式 -->
<link href="./static/dashboard.css" rel="stylesheet">
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

<link rel="stylesheet" href="./static/pagination.css" />
<style type="text/css">
.table tbody tr td {
	vertical-align: middle;
}
.am-avg-sm-1{
height:100px
}
</style>

</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">药品管理系统</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a id="operatorer" href="/JavaWeb_Day3/login.html"></a></li>
				<li><a href="/JavaWeb_Day3/login.html">注销</a></li>
				
			</ul>
			<form class="navbar-form navbar-right">
				<input class="form-control" placeholder="Search..." type="text">
			</form>
		</div>
	</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="/JavaWeb_Day3/index.html">&nbsp;&nbsp;&nbsp;药&nbsp;&nbsp;&nbsp;品&nbsp;&nbsp;&nbsp;管&nbsp;&nbsp;&nbsp;理
					</a></li>
					<li><a href="/JavaWeb_Day3/senddrug.html">&nbsp;&nbsp;&nbsp;发&nbsp;&nbsp;&nbsp;药&nbsp;&nbsp;&nbsp;管&nbsp;&nbsp;&nbsp;理</a></li>
					<li><a href="/JavaWeb_Day3/backdrug.html">&nbsp;&nbsp;&nbsp;退&nbsp;&nbsp;&nbsp;药&nbsp;&nbsp;&nbsp;管&nbsp;&nbsp;&nbsp;理</a></li>

				</ul>
				
			

			</div>
			<div class="col-sm-12 col-sm-offset-3 col-md-9 col-md-offset-2 main">
				<h1 class="page-header">药品清单</h1>
				

				<!--面板 开始-->
				<div class="panel panel-default">
					<!--<div class="panel-heading"></div>-->
					<div class="panel-body">
						<!--表格上面的那一行-->
						<div class="row">
							<div class="col-md-4">
								<div class="input-group">
									<form action="/JavaWeb_Day3/FindDrugInfo" method="get">
								<input type="text"  class="form-control " name="helpid" placeholder="请输入药品助记码" style="width:160px;display:inline;">
								 <button type="submit" class="btn btn-info" style="display:inline">搜索</button>
								
								</form>
								</div>
								<!-- /input-group -->
							</div>
							<!-- /.col-lg-6 -->
							<div class="col-md-1 pull-right">
								<a id="add" class="btn btn-success pull-right">添加</a>
							</div>
						</div>
						<!--表格上面那一行 结束-->
						<!--表格 开始-->
						<div class="table-box">
							<table class="table table-bordered table-striped" id="table">
								<thead>
									<tr>
										<th class="text-center">药品编码</th>
										<th class="text-center">药品名称</th>
										<th class="text-center">药品规格</th>
										<th class="text-center">药品单位</th>
										<th class="text-center">药品助记码</th>
										<th class="text-center">药品单价</th>
										<th class="text-center">操作</th>
									</tr>
								</thead>
								<tbody id="zhengwen">

								</tbody>
							</table>
						</div>
						<!--表格 结束-->
						<!--分页开始-->
						<div>
							<nav aria-label="Page navigation" class="pull-right">
							
							</nav>
						</div>
						<!--分页结束-->
					</div>
				</div>
				<!--面板 结束-->
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="./static/jquery-3.3.1.js"></script>
	<script src="./static/bootstrap-3.3.7/js/bootstrap.js"></script>
	<script type="text/javascript">
	var u = sessionStorage.getItem("user");
	if(u==null){
		$("#operatorer").text("登录")
	}
	else{
		$("#operatorer").text(u)
	}
	var add = document.getElementById("add")
	add.onclick = function() {
		window.location.href = "/JavaWeb_Day3/add_drug.html";

	}
	var str = "";
	str = '<tr><td align="center">'
			+ <%=request.getAttribute("d")%>[0].code
			+ '</td><td align="center">'
			+ <%=request.getAttribute("d")%>[0].name
			+ '</td><td align="center">'
			+ <%=request.getAttribute("d")%>[0].spec
			+ '</td><td align="center">'
			+ <%=request.getAttribute("d")%>[0].unit
			+ '</td><td align="center">'
			+ <%=request.getAttribute("d")%>[0].helpId
			+ '</td><td align="center">'
			+ <%=request.getAttribute("d")%>[0].price
			+ '</td><td align="center"><a style="margin: 5px;" id ="del" class="btn btn-danger btn-sm" onclick=func("'
			+ <%=request.getAttribute("d")%>[0].helpId
			+ '")>删除</a><a id ="update" class="btn btn-info btn-sm" href="/JavaWeb_Day3/UpdateDrug?helpid='
			+ <%=request.getAttribute("d")%>[0].helpId
			+ '">编辑</a></td></tr>';
	console.log(str)
	$("#zhengwen").html(str);
	
	
	func = function(helpid){
		$.ajax({
            type : "get",
			url : "http://localhost:8080/JavaWeb_Day3/DelteDrug",
			traditional: true,
        	data:{'id':helpid,
        	},
            dataType:"text",
            success : function(flag) {
            	if(flag==1){
            		confirm("删除成功")
                	window.location.href="/JavaWeb_Day3/index.html";
            	}
            	else if(flag==2){
					confirm("您只有发药和退药权限")
					window.location.href="/JavaWeb_Day3/senddrug.html";
				}
            	else{
            		confirm("您没有操作权限，请登录")
            		window.location.href="/JavaWeb_Day3/login.html";
            	}
            	
			},
         	});	
	}
	
	
	
	
	
	</script>
	
	
		



</body>