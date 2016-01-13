<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<c:url value='/css/bootstrap-theme.css' />" rel="stylesheet" />
<link href="<c:url value='/css/bootstrap.css' />" rel="stylesheet" />
<script src="<c:url value='/js/jquery-2.1.4.js' />"></script>
<script src="<c:url value='/js/bootstrap.js' />"></script>
<title>paging_ajax</title>
</head>
<script type="text/javascript">
	$(function() {
		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : "../pay/paging_ajax_do.do",
			data : "number=10",
			dataType : 'json',
			success : function(data) {
				var result='';
				for ( var i = 0; i < data.length; i++) {
					var string="<tr><td>"+data[i].id+"<td>"+data[i].title+"<td>"+data[i].content+"<td>"+data[i].temps;
					result=result+string; 
				}
				$("#test").append(result);
				alert(result);
			},
			error : function(data) {
				alert("加载失败");
			}
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
<body style="text-align: center;">
	<input type="hidden" name="paging" id="paging" value="" />
	<div style="margin: 0 auto; width: 980px;" id="main">
		<table id="test" class="table table-hover">
			<tr >
				<th>ID</th>
				<th>标题</th>
				<th>内容</th>
				<th>时间</th>
			</tr>
		</table>
	</div>
	<div class="main_contain">
		<form class="form-horizontal">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Name</label>
				<div class="col-sm-10" style="width: 200px">
					<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10" style="width: 200px">
					<input type="password" class="form-control" id="inputPassword3" placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Captcha</label>
				<div class="col-sm-10" style="width: 200px">
					<input type="password" class="form-control" id="inputPassword3" placeholder="Captcha">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Captcha</label>
				<div class="col-sm-10" style="width: 200px">
					<img src="${base}/pay/captcha-image.do" id="kaptchaImage"  style="margin-bottom: -3px"/>
					<a href="#" onclick="changeCode()">看不清?换一张</a>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox">Remember me</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Sign in</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
