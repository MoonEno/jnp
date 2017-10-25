<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="../common/header.jsp"></jsp:include> <!-- 추가해야할 css/js -->
		<script type="text/javascript">
		
		var line = "${value}";
		var imgUrl = "";
		
		$(function(){
            
			if (line == 'plastic') {
				getHeader('plastic');
			} else {
				getHeader('paper');
			}
			
			$('.item').matchHeight();
			
			$('.tab .tablink').click(function() {
		        $('.tab .tablink').removeClass('active');
		        $(this).toggleClass('active'); 
			});
			
		});
		
		function getHeader(value) {
			 
			$('.symbol').empty();
			
			 var symbolHtml = '';
	            
	            /** 제품 & 식품에 따른 jumbotrom wording 변경 **/
	            if (value == "plastic") {
	                $('.display-3').text("PlasticLine");
	                $('.lead').html("a deliverable or set of deliverables that contribute to a business solution");
	                
	                symbolHtml += '<div class="col-md-3"><img src="/resources/img/icon/global.png"/></div>';
	                symbolHtml += '<div class="col-md-3"><img src="/resources/img/icon/leesin.png"/></div>';
	                symbolHtml += '<div class="col-md-3"><img src="/resources/img/icon/watch.png"/></div>';
	                symbolHtml += '<div class="col-md-3"><img src="/resources/img/icon/boxes.png"/></div>';
	                
	                $('.symbol').html(symbolHtml);
	            } else {
	                $('.display-3').text("Paper Line");
	                $('.lead').html("It is usually of plant or animal origin, and contains essential nutrients");
	                
	                symbolHtml += '<div class="col-md-4"><img src="/resources/img/icon/watch.png"/></div>';
	                symbolHtml += '<div class="col-md-4"><img src="/resources/img/icon/foodline.png"/></div>';
	                symbolHtml += '<div class="col-md-4"><img src="/resources/img/icon/add.png"/></div>';
	                
	                $('.symbol').html(symbolHtml);
	            }
	            
	            if (value == 'plastic') {
	            	getList('plastic');
	            } else {
	            	getList('paper');
	            }
			
		}
		
		function getList(value) {
			
			$('.list').empty();
			
			var url = "";
			
			if (value == "plastic") {
				url = "/resources/data/plastic.json";
				imgUrl = "plastic00";
				$('#btnPlastic').addClass('active');
			} else {
				url = "/resources/data/paper.json"
				imgUrl = "paper00";
				$('#btnPaper').addClass('active');
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
	                        listHtml += '<h3>'+ entry["nameKor"] +'</h3>';
	                        listHtml += '<img class="imgSet" src="/resources/img/product/'+ imgUrl + index +'.png"/></div>';
	                        listHtml += '<div class="bgSky mt10 mh75 pt20 txtMd" style="cursor: pointer;" onclick="popUp('+index+')"><p class="fSize15">상세보기</p></div>';
	                        listHtml += '<input type="hidden" id="nameKor'+index+'" value="'+entry["nameKor"]+'"></input>';
	                        listHtml += '<input type="hidden" id="nameEng'+index+'" value="'+entry["nameEng"]+'"></input>';
	                        listHtml += '<input type="hidden" id="desc'+index+'" value="'+entry["desc"]+'"></input>';
	                        listHtml += '</div></div>';
	                    });
	            	   $('.list').after().html(listHtml);
	               }, 
	               error: function(data) {
	            	   console.log("error" , data);
	               }
	            }); 
			
		}
		
		function popUp(value) {
			var nameKor = $('#nameKor'+value).val();
			var nameEng = $('#nameEng'+value).val();
			var nameDesc = $('#desc'+value).val();
			
			$('.modal-header').after().html('<h4 class="modal-title txtCenter fSize22">'+nameKor + '</h4> <button type="button" class="close" data-dismiss="modal">&times;</button>');
			
			var bodyHtml = '';
			
			bodyHtml += '<div class="txtCenter">';
			bodyHtml += '<img class="imgSet" src="/resources/img/product/'+ imgUrl + value +'.png" alt="비닐 기획팩"/></div>';
			bodyHtml += '<div class="bdr1 mt20">';
			bodyHtml += '<div class="mb15"></div>'
			bodyHtml += '<p class="fSize15"> 기계명(한글) :' + nameKor + '</p>';
			bodyHtml += '<p class="fSize15"> 기계명(영문) :' + nameEng + '</p>';
			bodyHtml += '<p class="fSize15">' + nameDesc + '</p></div>';
			$('.modal-body').after().html(bodyHtml);
			$("#myModal").modal();
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
		<ol class="breadcrumb">
            <li class="ml20"><a class="ml10" href="/page/mainPage"><span class="glyphicon glyphicon-home"></span></a></li>
            <li><a href="/business/mainBiz">주요사업</a></li>
        </ol>
        <div class="tab centered fSize16 fBold">
          <button class="tablink" id="btnPlastic" onclick="getHeader('plastic')">비닐 기획팩</button>
          <button class="tablink" id="btnPaper" onclick="getHeader('paper')">종이 기획팩</button>
        </div>
		  
		<div class="contents ac mt20 centered">
			<div class="row list">
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
		</div>
		
		<div class="modal fade" id="myModal" role="dialog">
		   <div class="modal-dialog">
		     <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		      </div>
		      <div class="modal-body">
		      
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		    
		  </div>
		</div>
		
	</body>
</html>