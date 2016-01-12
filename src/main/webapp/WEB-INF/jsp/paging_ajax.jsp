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
				for ( var i = 0; i < data.length; i++) {
					alert(data[i].id + '+' + data[0].name);
				}
			},
			error : function(data) {
				alert("加载失败" + data.msg);
				s
			}
		});
	});
</script>
<body style="text-align: center;">
	<input type="hidden" name="paging" id="paging" value="" />
	<div style="margin: 0 auto; width: 980px;"></div>
</body>
</html>
