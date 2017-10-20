<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="../common/header.jsp"></jsp:include> <!-- 추가해야할 css/js -->
		<script type="text/javascript">
		
		var line = "${value}";
		
		$(function(){
            
            var symbolHtml = '';
            
			/** 제품 & 식품에 따른 jumbotrom wording 변경 **/
			if (line == "product") {
				$('.display-3').text("Product Line");
				$('.lead').html("a deliverable or set of deliverables that contribute to a business solution");
				
			    symbolHtml += '<div class="col-md-3"><img src="/resources/img/icon/global.png"/></div>';
			    symbolHtml += '<div class="col-md-3"><img src="/resources/img/icon/leesin.png"/></div>';
			    symbolHtml += '<div class="col-md-3"><img src="/resources/img/icon/watch.png"/></div>';
			    symbolHtml += '<div class="col-md-3"><img src="/resources/img/icon/boxes.png"/></div>';
			    
			    $('.symbol').html(symbolHtml);
			} else {
				$('.display-3').text("Food Line");
				$('.lead').html("It is usually of plant or animal origin, and contains essential nutrients");
				
                symbolHtml += '<div class="col-md-4"><img src="/resources/img/icon/watch.png"/></div>';
                symbolHtml += '<div class="col-md-4"><img src="/resources/img/icon/foodline.png"/></div>';
                symbolHtml += '<div class="col-md-4"><img src="/resources/img/icon/add.png"/></div>';
                
                $('.symbol').html(symbolHtml);
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
	                        listHtml += '<div class="col-sm-6 col-md-4 item-'+ index +'">';
	                        listHtml += '<div class="thumbnail">';
	                        listHtml += '<div class="caption">';
	                        listHtml += '<h3>'+ entry["song"] +'</h3>';
	                        listHtml += '<img class="imgSet" src="/resources/img/'+ imgUrl + index +'.PNG"/></div>';
	                        listHtml += '<div class="bgSky mt10 mh75 txtMd" style="cursor: pointer;" onclick="test('+index+')">자세히보기</div>';
	                        listHtml += '<input type="hidden" id="name'+index+'" value="'+entry["name"]+'"></input>';
	                        listHtml += '<input type="hidden" id="song'+index+'" value="'+entry["song"]+'"></input>';
	                        listHtml += '</div></div>';
	                    });
	            	   $('.list').after().html(listHtml);
	               }, 
	               error: function(data) {
	            	   console.log("error" , data);
	               }
	            }); 
			
		}
		
		function test(value) {
			var thisName = $('#name'+value).val();
			var thisSong = $('#song'+value).val();
			alert(thisName+ "이(가) 부른 " + thisSong + " 입니다.");
		}
		
		</script>
	</head>
	<body>
	    <div class="container-fluid">
		<jsp:include page="../common/navigation.jsp" />
		<div class="jumbotron jumbotron-custom row">
		    <div class="col-md-2"></div>
			<div class="col-md-8">
			    <h2 class="display-3 ac"></h2>
			    <p class="lead ac"></p>
			    <hr/>
			    <div class="symbol col-md-12">
			    </div>
			</div>
			 <div class="col-md-2"></div>
		</div>
		<div class="contents ac mt20 centered">
			<div class="row list">
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
		</div>
	</body>
</html>