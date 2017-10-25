<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="../common/header.jsp"></jsp:include> <!-- 추가해야할 css/js -->
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript">
	    
	    $(function() {
	    
	      google.charts.load('current', {'packages':['corechart']});
	      google.charts.setOnLoadCallback(drawChart);
	
	      function drawChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['Year', '매출액'],
	          ['2011년',  3850],
	          ['2012년',  5100],
	          ['2013년',  5300],
	          ['2014년',  5050],
	          ['2015년',  8020],
	          ['2016년',  8150],
	          ['2017년',  8230]
	        ]);
	
	        var options = {
	          curveType: 'function',
	          legend: { position: 'bottom' },
	          backgroundColor : '#f1f8e9'
	        };
	
	        var chart = new google.visualization.LineChart(document.getElementById('chart'));
	
	        chart.draw(data, options);
	      }
	      
	    });
	    </script>
    
	</head>
	<body>
	    <div class="container-fluid">
		    <jsp:include page="../common/navigation.jsp" />
		    <div class="jumbotron bg">
                <div class="txt-center">매출 현황</div>
            </div>
		    <ol class="breadcrumb">
		      <li class="ml20"><a class="ml10" href="/page/mainPage"><span class="glyphicon glyphicon-home"></span></a></li>
		      <li><a href="/page/salesChart">매출 현황</a></li>
		    </ol>
		    <div class="row mb20">
		    <div class="col-md-2"></div>
		    <div class="col-md-8"><div class="mh500" id="chart"></div></div>
		    <div class="col-md-2"></div>
		    </div>
			<jsp:include page="../common/footer.jsp" />
		</div>
	</body>
</html>
