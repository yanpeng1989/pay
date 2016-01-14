<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.main {
	margin: 0 auto;
}

.logo {
	margin-left: 20px;
	width: 150px;
	font-size: 24px;
	color: #FFFFFF;
}

.logo:hover {
	color: #EE252D;
}

.user {
	color: #FFFFFF;
	font-size: 18px;
	margin-right: 30px;
}
.user-center{
	width: 135px;
	margin-right: 30px;
}
.user-center:hover{
	background-color: #444444;
	width: 135px;
}
</style>
<jsp:include page="head.jsp"></jsp:include>
<body>
	<div class="main">
		<div style="">
			<nav class="navbar navbar-default">
				<div class="container-fluid" style="background-color: #61708F;">
					<div class="navbar-header">
						<a class="navbar-brand logo" href="#"><span class="icon-home logo">&nbsp;&nbsp;量子</span></a>
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown user-center"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false"><span class="user">个人中心 <span class="icon-menu3"></span></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
