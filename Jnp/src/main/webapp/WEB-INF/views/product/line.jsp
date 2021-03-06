<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="../common/header.jsp"></jsp:include> <!-- 추가해야할 css/js -->
		<script type="text/javascript">
		
		var line = "${value}";
		var imgUrl = "line";
		
		$(function(){
		   
		    getList();
		    
		});
		
		function getList() {
			
			$('.list').empty();
			
			var url = "/resources/data/line.json";
			var listHtml = '';
			var idx;
	         $.ajax({
	               url:  url,
	               dataType : "text",
	               success: function(data) {
	            	   $.each(JSON.parse(data), function(index, entry) {
	            		    index = index + 1; 
	            		    if(index < 10) {
	            		    	idx = "00" + index ;
	            		    }
	            		    else if (index < 99) {
	            		    	idx = "0" + index ;
	            		    }
	                        listHtml += '<div class="col-sm-6 col-md-4 item-'+ index +'">';
	                        listHtml += '<div class="mtb50">';
	                        listHtml += '<div class="caption">';
	                        listHtml += '<h3>'+ entry["nameKor"] +'</h3>';
	                        listHtml += '<img class="lineImg" src="/resources/img/product/'+ imgUrl + idx +'.jpg"/></div>';
	                        listHtml += '<div class="bgSky mt10 mh75 wMax250 mAuto pt20 txtMd" style="cursor: pointer;" onclick="popUp('+index+')"><p class="fSize15">상세보기</p></div>';
	                        listHtml += '<input type="hidden" id="nameKor'+idx+'" value="'+entry["nameKor"]+'"></input>';
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
		    if(value < 10) {
		    	value = "00" + value;
		    }
		    else if (value < 99) {
		    	value = "0" + value ;
		    }
			var nameKor = $('#nameKor'+value).val();

			$('.modal-header').after().html('<h4 class="modal-title txtCenter fSize22">'+nameKor + '</h4> <button type="button" class="close" data-dismiss="modal">&times;</button>');
			
			var bodyHtml = '';
			
			bodyHtml += '<div class="txtCenter">';
			bodyHtml += '<img class="imgSet" src="/resources/img/product/'+ imgUrl + value +'.jpg" alt="생산라인"/></div>';
			bodyHtml += '<div class="bdr1 mt20">';
			bodyHtml += '<div class="mb15"></div>'
			bodyHtml += '<p class="fSize15"> 기계명(한글) :' + nameKor + '</p>';
			$('.modal-body').after().html(bodyHtml);
			$("#myModal").modal();
		}
		
		</script>
	</head>
	<body>
	    <div class="container-fluid">
		<jsp:include page="../common/navigation.jsp" />
	        <div class="jumbotron productBg">
	            <div class="txt-center">생산라인 소개</div>
	        </div>
			<ol class="breadcrumb">
	            <li class="ml20"><a class="ml10" href="/page/mainPage"><span class="glyphicon glyphicon-home"></span></a></li>
	            <li><a href="/product/product">생산라인 소개</a></li>
	        </ol>

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