<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<c:url value='/css/bootstrap-theme.css' />" rel="stylesheet" />
<link href="<c:url value='/css/bootstrap.css' />" rel="stylesheet" />
<script src="<c:url value='/js/jquery-2.1.4.js' />"></script>
<script src="<c:url value='/js/bootstrap.js' />"></script>
<title>captcha</title>
</head>
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
<body>	  
     <label>
     	验证码:<input name="kaptcha" type="text" id="kaptcha" maxlength="4" />
     </label>  
     <br/>  
     <img src="${base}/pay/captcha-image.do" id="kaptchaImage"  style="margin-bottom: -3px"/>
     <a href="#" onclick="changeCode()">看不清?换一张</a>
</body>
</html>
