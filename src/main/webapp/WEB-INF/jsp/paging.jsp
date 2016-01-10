<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<c:url value='/css/bootstrap-theme.css' />" rel="stylesheet" />
<link href="<c:url value='/css/bootstrap.css' />" rel="stylesheet" />
<script src="<c:url value='/js/jquery-2.1.4.js' />"></script>
<script src="<c:url value='/js/bootstrap.js' />"></script>
<title>paging</title>
</head>
<script type="text/javascript">
$(function(){
	$("li").click(function(){
		var paging = $(this).attr('id');
		$("#paging").val(paging);
		alert($("#paging").val());
	});
});
</script>
<body style="text-align: center;">
	<input type="hidden" name="paging" id="paging" value="" />
	<div style="margin: 0 auto; width: 980px;">
		<table class="table table-hover">
			<tr>
				<th>ID</th>
				<th>标题</th>
				<th>内容</th>
				<th>时间</th>
			</tr>
			<c:forEach var="news" items="${list}">
				<tr>
					<td>${news.id}</td>
					<td>${news.title}</td>
					<td>${news.content}</td>
					<td>${news.temps}</td>
				</tr>
			</c:forEach>
		</table>
		<nav>
			<ul class="pagination">
				<li class="disabled"><a href="" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
				<li class="active"><a href="#">1</a></li>				
				<c:choose>
   					<c:when test="${number>25}"> 
     					<c:forEach var="number" begin="2" end="24" step="1">
						<li id="${number}"><a href="#" >${number} </a></li>
						</c:forEach>      
   					</c:when>
   					<c:otherwise> 
     					<c:forEach var="number" begin="2" end="${number}" step="1">
						<li id="${number}"><a href="#">${number}</a></li>
						</c:forEach>
   					</c:otherwise>
				</c:choose>
				<li><a href="" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
			</ul>
		</nav>
	</div>
</body>
</html>
