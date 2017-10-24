<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="common/header.jsp"></jsp:include> <!-- 추가해야할 css/js -->
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
	    <div class="container-fluid">
		<jsp:include page="common/navigation.jsp" />
		<div class="main">
			<div class="jumbotron jumbotron-custom row">
			    <div class="col-md-2"></div>
			    <div class="welcome col-md-4">
				    <h2 class="display-3"> Welcome Jnp Company</h2>
				    <br>
	                <p class="lead"> The club isn't the best place to find a lover <br>
	                So the bar is where I go <strong>Me and My Friends</strong> at the table doing shots</p>
			    </div>
			    <div class="col-md-4">
			    <img alt="" src="/resources/img/jjcnpLogo.png">
			    </div>
			    <div class="col-md-2"></div>
			</div>
			
			<div class="contents">
			<div></div>
			</div>
        </div>		
		<jsp:include page="common/footer.jsp" />
	   </div>
	</body>
</html>