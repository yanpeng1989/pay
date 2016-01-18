<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootstrap Admin</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="../pay/template/lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../pay/template/lib/font-awesome/css/font-awesome.css">
<script src="../pay/template/lib/jquery-1.11.1.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="../pay/template/stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="../pay/template/stylesheets/premium.css">
</head>
<style type="text/css">
.bg {
	background: url("../pay/images/backgroud_2.png") no-repeat;
	font-family: 微软雅黑;
}
</style>
<body class=" theme-blue bg">
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
			<a class="" href="index.do"><span class="navbar-brand"><span class="fa fa-paper-plane"></span> 量子互助</span></a>
		</div>

		<div class="navbar-collapse collapse" style="height: 1px;"></div>
	</div>
	<div class="dialog"
		style="filter: alpha(opacity = 80); -moz-opacity: 0.8; -khtml-opacity: 0.8; opacity: 0.8;">
		<div class="panel panel-default">
			<p class="panel-heading no-collapse" style="font-family: 微软雅黑;">登陆</p>
			<div class="panel-body">
				<form>
					<div class="form-group">
						<label>用户名</label> <input id="username" type="text" class="form-control span12">
					</div>
					<div class="form-group">
						<label>密码</label> <input id="password" type="password" class="form-control span12 form-control">
					</div>
					<div class="form-group">
						<label>验证码</label> <input id="captcha" type="text" class="form-control span12 form-control">
					</div>
					<div class="form-group">
						<img src="${base}/pay/captcha-image.do" id="kaptchaImage"  style="margin-bottom: -3px"/>
     					<a href="#" onclick="changeCode()">看不清?换一张</a>
					</div>
					<a id="sign_in" href="#" class="btn btn-primary pull-right">登陆</a> 
					<label class="remember-me"><input type="checkbox">记住我</label>
					<div class="clearfix"></div>
				</form>
			</div>
		</div>
		<p class="pull-right" style="font-family: 微软雅黑;">
			<a href="sign-up.do" target="blank" style="font-size: .75em; margin-top: .25em;">新建账户</a>
		</p>
		<p>
			<a href="#" style="font-family: 微软雅黑;">忘记密码?</a>
		</p>
	</div>
	<!-- 模态框 Begin-->
	<div id="alert_msg" class="modal fade" >
  		<div class="modal-dialog">
   			<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       				<h4 class="modal-title" style="font-family: 微软雅黑;">登陆失败</h4>
      			</div>
      		<div class="modal-body">
        		<p id="alert_data" style="font-family: 微软雅黑;">您的登陆信息有误，请核实账户后再登陆&hellip;</p>
      		</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
      		</div>
    		</div><!-- /.modal-content -->
  		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!-- 模态框 End-->
	<script src="../pay/template/lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		function show_model(content){
			$("#alert_data").html(content);
			$('#alert_msg').modal('show');
		}
	</script>
	<script type="text/javascript">
		$(function(){
			$("#sign_in").click(
				function(){
					var username=$("#username").val();
					var password=$("#password").val();
					var captcha=$("#captcha").val();
					
					if(username==''){
						show_model("请输入用户名");
						return;
					}else if(password==''){
						show_model("请输入密码");
						return;
					}else if(captcha==''){
						show_model("请输入验证码");
						return;
					}
					
					$.ajax({
						type : "GET",
						contentType : "application/json",
						url : "../pay/login-in.do",
						data : 'sign_id='+username+'&password_1='+password+"&captcha="+captcha,
						dataType : 'json',
						success : function(data) {
							if(data.result=='sign_success'){
								window.location.href = "../pay/index.do";
							}else if(data.result=='sign_unsuccess'){
								show_model("账户不存在或用户名密码错误");
							}else if(data.result=='captcha_error'){
								show_model("验证码错误");
							}else if(data.result=='sign_error'){
								show_model("请输入用户名和密码");
							}
							changeCode();
						},
						error : function(data) {
							show_model("加载失败");
							changeCode();
						}
					});
				}
			);
		});
	</script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
	</script>
	<script type="text/javascript">
		$(function() {
			$('#kaptchaImage').click(function() {//生成验证码  
				$(this).hide().attr('src','${base}/pay/captcha-image.do?'+Math.floor(Math.random() * 100)).fadeIn();
			});
		});

		function changeCode() {
			$('#kaptchaImage').hide().attr('src','${base}/pay/captcha-image.do?' + Math.floor(Math.random() * 100)).fadeIn();
		}
	</script>
</body>
</html>
