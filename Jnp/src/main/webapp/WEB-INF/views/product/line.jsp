<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="../common/header.jsp"></jsp:include> <!-- 추가해야할 css/js -->
		<script type="text/javascript">
		
		var line = "${value}";
		
		$(function(){
			
			/** 제품 & 식품에 따른 jumbotrom wording 변경 **/
			if (line == "product") {
				$('.display-3').text("Product Line");
				$('.lead').html("item that ideally satisfies a market's want or need <br/> a deliverable or set of deliverables that contribute to a business solution");
			} else {
				$('.display-3').text("Food Line");
				$('.lead').html("any substance consumed to provide nutritional support for an organism <br/> It is usually of plant or animal origin, and contains essential nutrients");
			}
			getList();
			
			$('.item').matchHeight();
		});
		
		function getList() {
			
			$('.list').empty();
			
			var url = "";
			var imgUrl = "";
			
			if (line == "product") {
				url = "/resources/data/product.json";
				imgUrl = "kpop00";
			} else {
				url = "/resources/data/food.json"
				imgUrl = "pop00";
			}
			
			var listHtml = '';
			
	         $.ajax({
	               url:  url,
	               dataType : "text",
	               success: function(data) {
	            	   $.each(JSON.parse(data), function(index, entry) {
	            		    index = index+1;
	                        listHtml += '<div class="item item-'+ index +'">';
	                        listHtml += '<img src="/resources/img/'+ imgUrl + index +'.PNG"/>';
	                        listHtml += '<p>' + index + '위곡 <br> ' + entry["name"] + ": " + entry["song"] + '</p></div>'
	                    });
	            	   $('.list').after().html(listHtml);
	               }, 
	               error: function(data) {
	            	   console.log("error" , data);
	               }
	            }); 
			
		}
		
		</script>
	</head>
	<body>
	    <div class="container-fluid">
		<jsp:include page="../common/navigation.jsp" />
		<div class="header">
		    <h2 class="display-3"></h2>
		    <p class="lead"></p>
		    <hr/>
		</div>
		<div class="contents centered">
		  <div class="box-area list">
		  </div>
		</div>
		<jsp:include page="../common/footer.jsp" />
		</div>
	</body>
</html>