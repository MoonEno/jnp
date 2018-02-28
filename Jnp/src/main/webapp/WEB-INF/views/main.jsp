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
		<jsp:include page="common/navigation.jsp" />
		    <div class="wrap">
		    
				<div>
				    <img alt="" src="/resources/img/main.jpg" class="mainImg" >
				</div>
				
				<div>
				    <div class="ac mtb4p"><p class="fSize50 fBold"> INTRODUCE </p></div>
						<video class="wMax mlr10p" autoplay="autoplay" loop="loop" muted="muted" volumn="0">
						    <source src="/resources/img/video.mp4">
						</video>
				</div>
				
			</div>
		<jsp:include page="common/footer.jsp" />
	</body>
</html>