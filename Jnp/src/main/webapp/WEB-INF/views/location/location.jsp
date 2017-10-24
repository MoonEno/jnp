<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="../common/header.jsp"></jsp:include> <!-- 추가해야할 css/js -->
		<style>
	      #map {
	        height: 70%;
	      }
	      html, body {
		        height: 70%;
		        margin: 0;
		        padding: 0;
          }
        </style>
	</head>
	<body>
	    <div class="container-fluid">
		    <jsp:include page="../common/navigation.jsp" />
		    <div class="jumbotron bg">
                <div class="txt-center">오시는 길</div>
            </div>
		    <ol class="breadcrumb">
		      <li class="ml20"><a class="ml10" href="/page/mainPage"><span class="glyphicon glyphicon-home"></span></a></li>
		      <li><a href="/page/location">오시는 길</a></li>
		    </ol>
		    <h2 class="ac ptb20 mb20">"방문을 환영합니다."</h2>
		    <div class="row mb20">
		    <div class="col-md-2"></div>
		    <div class="col-md-8"><div class="mh500" id="map"></div></div>
		    <div class="col-md-2"></div>
		    </div>
<!-- 		    <div class="row mt20">
			    <div class="col-md-2"></div>
	            <div class="col-md-8">
		            <div class="row">
			            <div class="col-sm-2"></div>
			            <div class="col-sm-8">
				            <table class="table">
					             <colgroup>
						             <col width="20%">
						             <col width="80%">
					             </colgroup>
					             <tr class="bg-info">
			                         <td><img src="/resources/img/icon/locationX2.png"></td>
			                         <td><p class="md"> 위치 : 서울특별시 성동구 성수이로66 서울숲 드림타워 1101호</p>
		                         </tr>
					             <tr class="bg-success">
						             <td><img src="/resources/img/icon/busX2.png"></td>
						             <td><p class="md"> 버스 : </p>
					             </tr>
					             <tr class="bg-success">
						             <td><img src="/resources/img/icon/subwayX2.png"></td>
						             <td><p class="md">지하철 : </p></td>
					             </tr>
				            </table>
			            </div>
			            <div class="col-sm-2"></div>
		            </div>
	            </div>
                <div class="col-md-2"></div>
		    </div> -->
			<jsp:include page="../common/footer.jsp" />
		</div>
	   <script>
		      var map;
		      var center = {lat : 37.540916, lng: 127.055882};
		      
		      function initMap() {
		          map = new google.maps.Map(document.getElementById('map'), {
		          center: center,
		          zoom: 17
		      });
		      var marker = new google.maps.Marker({
		          position: center,
		          map: map
		        });
		      
		      
		      
		    }
	   </script>
	   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAd3PTEqm3GliYPfIshTkFtgRyzxHN6loU&callback=initMap" async defer></script>
	</body>
</html>
