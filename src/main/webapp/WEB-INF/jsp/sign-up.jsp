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
<link rel="stylesheet" type="text/css" href="../pay/template/stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="../pay/template/stylesheets/premium.css">
</head>
<style type="text/css">
.bg {
	background: url("../pay/images/backgroud_2.jpg") no-repeat;
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
			<a class="" href="index.do"><span class="navbar-brand"><span class="fa fa-paper-plane"></span>  量子</span></a>
		</div>
		<div class="navbar-collapse collapse" style="height: 1px;"></div>
	</div>
	<div class="dialog" style="filter: alpha(opacity = 70); -moz-opacity: 0.7; -khtml-opacity: 0.7; opacity: 0.7;">
		<div class="panel panel-default">
			<p class="panel-heading no-collapse" style="font-family: 微软雅黑;">注册</p>
			<div class="panel-body" >
				<form>
					<div class="form-group">
						<label>手机号</label> <input id="tel" type="text" class="form-control span12" placeholder="手机号">
					</div>
					<div class="form-group">
						<label>登陆账号</label> <input id="sign_id" type="text" class="form-control span12" placeholder="登陆账号">
					</div>
					<div class="form-group">
						<label>姓名</label> <input id="username" type="text" class="form-control span12" placeholder="姓名">
					</div>
					<div class="form-group">
						<label>身份号</label> <input id="card_id" type="text" class="form-control span12" placeholder="推荐人">
					</div>
					<div class="form-group">
						<label>密码</label> <input id="password" type="password" class="form-control span12" placeholder="密码">
					</div>
					
					<div class="form-group">
						<label>验证码</label> <input id="captcha" type="text" class="form-control span12" placeholder="验证码">
					</div>
					<div class="form-group">
						<img src="${base}/pay/captcha-image.do" id="kaptchaImage"  style="margin-bottom: -3px"/>
     					<a href="#" onclick="changeCode()">看不清?换一张</a>
					</div>
					<div class="form-group">
						<a id="sign_up" class="btn btn-primary pull-right">注册</a> <label class="remember-me">
						<a href="" style="font-family: 微软雅黑;">量子互助条款</a></label>
					</div>
					<div class="clearfix"></div>
				</form>
			</div>
		</div>
		<p>
			<a href="#" style="font-size: .75em; margin-top: .25em;">关于我们</a>
		</p>
	</div>
	<!-- 模态框 Begin-->
	<div id="alert_msg" class="modal fade" >
  		<div class="modal-dialog">
   			<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       				<h4 class="modal-title" style="font-family: 微软雅黑;">注册通知</h4>
      			</div>
      		<div class="modal-body">
        		<p id="alert_data" style="font-family: 微软雅黑;">&hellip;</p>
      		</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
      		</div>
    		</div><!-- /.modal-content -->
  		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!-- 模态框 End-->
	<script type="text/javascript">
		function show_model(content){
			$("#alert_data").html(content);
			$('#alert_msg').modal('show');
		}
	</script>
	<script type="text/javascript">
	$(function(){
		$(function(){
			$("#sign_up").click(
				function(){
					var tel=$("#tel").val();
					var sign_id=$("#sign_id").val();
					var username=$("#username").val();
					var password=$("#password").val();
					var card_id=$("#card_id").val();
					var captcha=$("#captcha").val();
					
					if(tel==''){
						show_model("请输入手机号");
						return;
					}else if(sign_id==''){
						show_model("请输入登陆账号");
						return;
					}else if(username==''){
						show_model("请输入姓名");
						return;
					}else if(card_id==''){
						show_model("请输入个人身份证号");
						return;
					}else if(password==''){
						show_model("请输入密码");
						return;
					}else if(captcha==''){
						show_model("请输入验证码");
						return;
					}
					var params="tel="+tel+"&sign_id="+sign_id+"&username="+username+"&password="+password+"&recommend_id="+recommend_id+"&captcha="+captcha;
					$.ajax({
						type : "GET",
						contentType : "application/json",
						url : "../pay/login-up.do",
						data : params,
						dataType : 'json',
						success : function(data) {
							if(data.result=='success'){
								window.location.href = "../pay/index.do";
							}else if(data.result=='exist'){
								show_model("登陆账号已存在，请换一个登陆账号");
							}else if(data.result=='captcha_error'){
								show_model("验证码错误");
							}else if(data.result=='error'){
								show_model("注册失败");
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
	});
	</script>
	<script src="../pay/template/lib/bootstrap/js/bootstrap.js"></script>
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
