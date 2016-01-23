<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>量子基金互助</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="../pay/template/lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../pay/template/lib/font-awesome/css/font-awesome.css">

<script src="../pay/template/lib/jquery-1.11.1.js" type="text/javascript"></script>

<script src="../pay/template/lib/jQuery-Knob/js/jquery.knob.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$(".knob").knob();
	});
</script>


<link rel="stylesheet" type="text/css" href="../pay/template/stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="../pay/template/stylesheets/premium.css">

</head>
<body class=" theme-blue">

	<!-- Demo page code -->

	<script type="text/javascript">
		$(function() {
			var match = document.cookie.match(new RegExp('color=([^;]+)'));
			if (match)
				var color = match[1];
			if (color) {
				$('body').removeClass(function(index, css) {
					return (css.match(/\btheme-\S+/g) || []).join(' ')
				})
				$('body').addClass('theme-' + color);
			}

			$('[data-popover="true"]').popover({
				html : true
			});

		});
	</script>
	<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.navbar-default .navbar-brand,.navbar-default .navbar-brand:hover {
	color: #fff;
}
</style>

	<script type="text/javascript">
		$(function() {
			var uls = $('.sidebar-nav > ul > *').clone();
			uls.addClass('visible-xs');
			$('#main-menu').append(uls.clone());
		});
	</script>

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

	<!-- Le fav and touch icons -->
	<link rel="shortcut icon" href="../assets/ico/favicon.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">


	<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
	<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
	<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
	<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
	<!--[if (gt IE 9)|!(IE)]><!-->

	<!--<![endif]-->

	<div class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="" href="index.do"><span class="navbar-brand"><span class="fa fa-paper-plane"></span>&nbsp;&nbsp;量子互助</span></a>
		</div>

		<div class="navbar-collapse collapse" style="height: 1px;">
			<ul id="main-menu" class="nav navbar-nav navbar-right">
				<li class="dropdown hidden-xs"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span
						class="glyphicon glyphicon-user padding-right-small" style="position: relative; top: 3px;"></span>${name} <i
						class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="./">我的账户</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">资料修改</li>
						<li><a href="./">个人资料修改</a></li>
						<li><a href="./">密码修改</a></li>
						<li><a tabindex="-1" href="./">密保修改</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="sign-in.do">退出</a></li>
					</ul></li>
			</ul>
		</div>
	</div>


	<div class="sidebar-nav">
		<ul>
			<li><a href="#" data-target=".dashboard-menu" class="nav-header" data-toggle="collapse"><i
					class="fa fa-fw fa-dashboard"></i>我的市场<i class="fa fa-collapse"></i></a></li>
			<li><ul class="dashboard-menu nav nav-list collapse in">
					<li class="active"><a href="../pay/index.do"><span class="fa fa-caret-right"></span>个人中心</a></li>
					<li><a href="../pay/membership.do"><span class="fa fa-caret-right"></span>直推会员统计</a></li>
				</ul></li>
			<li><a href="#" data-target=".accounts-menu" class="nav-header collapsed" data-toggle="collapse"><i
					class="fa fa-fw fa-briefcase"></i>交易管理 <span class="label label-info">+1</span></a></li>
			<li><ul class="accounts-menu nav nav-list collapse">
					<li><a href="../pay/match-status.do"><span class="fa fa-caret-right"></span>匹配详情</a></li>
					<li><a href="../pay/account-transfer.do"><span class="fa fa-caret-right"></span>账户转账</a></li>
				</ul></li>
			<li><a href="#" data-target=".accounts-menu-2" class="nav-header collapsed" data-toggle="collapse"><i
					class="fa fa-fw fa-briefcase"></i>资金管理 <span class="label label-info">+2</span></a></li>
			<li><ul class="accounts-menu-2 nav nav-list collapse">
					<li><a href="../pay/fund.do"><span class="fa fa-caret-right"></span>资金明细</a></li>
					<li><a href="../pay/bonus.do"><span class="fa fa-caret-right"></span>奖金明细</a></li>
				</ul></li>

			<li><a href="#" data-target=".legal-menu" class="nav-header collapsed" data-toggle="collapse"><i
					class="fa fa-fw fa-legal"></i>会员资料<i class="fa fa-collapse"></i></a></li>
			<li><ul class="legal-menu nav nav-list collapse">
					<li><a href="../pay/user.do"><span class="fa fa-caret-right"></span>交易资料</a></li>
					<li><a href="../pay/reset-password.do"><span class="fa fa-caret-right"></span>密码修改</a></li>
					<li><a href="../pay/protect-password.do"><span class="fa fa-caret-right"></span>密保修改</a></li>
				</ul></li>
			<li><a href="../pay/guestbook.do" class="nav-header"><i class="fa fa-fw fa-question-circle"></i>留言反馈</a></li>
			<li><a href="../pay/faq.do" class="nav-header"><i class="fa fa-fw fa-comment"></i>常见问题</a></li>
			<li><a href="../pay/news.do" class="nav-header"><i class="fa fa-fw fa-heart"></i>新闻公告</a></li>
		</ul>
	</div>

	<div class="content">
		<div class="header">
			<div class="stats">
				<p class="stat">
					<span class="label label-info">5</span>消息
				</p>
				<p class="stat">
					<span class="label label-success">27</span>通知
				</p>
				<p class="stat">
					<span class="label label-danger">15</span>公告
				</p>
			</div>
			<h1 class="page-title">提供帮助</h1>
			<ul class="breadcrumb">
				<li><a href="#">主页</a></li>
				<li class="active">提供帮助</li>
			</ul>
		</div>
		<div class="main-content">
			<div class="btn-toolbar list-toolbar">
				<a href="../pay/receive-help.do">
					<button class="btn btn-success btn-lg">
						<i class="fa fa-plus"></i>申请接受帮助
					</button>
				</a>
			</div>
			<hr/>
			<form class="form-inline">
				<div class="form-group">
					<label class="sr-only"></label>
					<p class="form-control-static">输入金额：</p>
				</div>
				<div class="form-group" style="width: 15%;"> 
					<input type="password" class="form-control" style="width: 90%;" placeholder="金额在100-100000之间">
				</div>
				<div class="form-group">
					<label class="sr-only"></label>
					<p class="form-control-static">输入诚意金号码：</p>
				</div>
				<div class="form-group" style="width: 15%;"> 
					<input type="text" class="form-control" style="width: 80%;" placeholder="输入诚意金号码">
				</div>
				<button type="submit" class="btn btn-default">提交</button>
			</form>
			<hr/>
			<div class="panel panel-default">
				<label class="panel-heading" style="font-family: 微软雅黑;">未完成提供帮助的订单</label>
				<table class="table">
					<thead>
						<tr>
							<th>订单号</th>
							<th>金额</th>
							<th>时间</th>
							<th>受助人编号</th>
							<th>去转款</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>1000</td>
							<td>2015-12-13</td>
							<td>123456</td>
							<td><a href="account-transfer.do"><i class="fa fa-pencil"></i></a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="panel panel-default">
				<label class="panel-heading" style="font-family: 微软雅黑;">已完成提供帮助的订单</label>
				<table class="table">
					<thead>
						<tr>
							<th>订单号</th>
							<th>金额</th>
							<th>时间</th>
							<th>受助人编号</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>1000</td>
							<td>2015-12-13</td>
							<td>123456</td>
						</tr>
						<tr>
							<td>2</td>
							<td>1000</td>
							<td>2015-12-13</td>
							<td>123456</td>
						</tr>
						<tr>
							<td>3</td>
							<td>1000</td>
							<td>2015-12-13</td>
							<td>123456</td>
						</tr>
						<tr>
							<td>4</td>
							<td>1000</td>
							<td>2015-12-13</td>
							<td>123456</td>
						</tr>
						<tr>
							<td>5</td>
							<td>1000</td>
							<td>2015-12-13</td>
							<td>123456</td>
						</tr>
						<tr>
							<td>6</td>
							<td>1000</td>
							<td>2015-12-13</td>
							<td>123456</td>
						</tr>
					</tbody>
				</table>
			</div>
			<footer>
				<hr>

				<!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
				<p class="pull-right">
					A <a href="">Free Bootstrap Theme</a> by <a href="http://www.portnine.com" target="_blank">Portnine</a>
				</p>
				<p>
					© 2014 <a href="http://www.portnine.com" target="_blank">Portnine</a>
				</p>
			</footer>
		</div>
	</div>


	<script src="../pay/template/lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
	</script>


</body>
</html>
