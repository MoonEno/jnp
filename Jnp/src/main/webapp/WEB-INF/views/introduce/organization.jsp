<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../common/header.jsp"></jsp:include> <!-- 추가해야할 css/js -->
    </head>
    <body>
        <div id="contents">
	        <jsp:include page="../common/navigation.jsp" />
		        <div class="jumbotron bg">
		            <div class="txt-center">조직현황</div>
		        </div>
			    <ol class="breadcrumb">
			      <li class="ml20"><a class="ml10" href="/page/mainPage"><span class="glyphicon glyphicon-home"></span></a></li>
			      <li><a href="/intro/greeting">회사소개 </a></li>
			      <li><a href="/intro/organization">조직현황</a></li>
			    </ol>
	        <div class="container">
		        <div class="contents centered">
	            <img class="organicImg" src="/resources/img/organism.png">
		        </div>
	        </div>
		        <jsp:include page="../common/footer.jsp" />
	    </div>
    </body>
</html>