<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<c:url value='/css/main.css' />" rel="stylesheet" />
<link href="<c:url value='/css/bootstrap-theme.css' />" rel="stylesheet" />
<link href="<c:url value='/css/bootstrap.css' />" rel="stylesheet" />
<script src="<c:url value='/js/jquery-2.1.4.js' />"></script>
<script src="<c:url value='/js/bootstrap.js' />"></script>
<title>index</title>
</head>
<body>
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
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox">Remember me
						</label>
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
