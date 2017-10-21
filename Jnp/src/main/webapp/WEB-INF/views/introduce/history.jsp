<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../common/header.jsp"></jsp:include> <!-- 추가해야할 css/js -->
    </head>
    <body>
    
        <div class="container-fluid">
        <jsp:include page="../common/navigation.jsp" />
            <div class="container-fluid">
		        <div class="jumbotron bg">
		            <div class="txt-center">연혁</div>
		        </div>
            </div>
		    <ol class="breadcrumb">
		      <li class="ml20"><a class="ml10" href="/page/mainPage"><span class="glyphicon glyphicon-home"></span></a></li>
		      <li><a href="/intro/greeting">회사소개 </a></li>
		      <li><a href="/intro/history">연혁</a></li>
		    </ol>
	        <div class="contents ac mt20 centered">
	                  콘텐츠
	        </div>
	        <jsp:include page="../common/footer.jsp" />
        </div>
    </body>
</html>