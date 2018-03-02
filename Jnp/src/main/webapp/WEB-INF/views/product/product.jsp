<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<jsp:include page="../common/header.jsp"></jsp:include> <!-- 추가해야할 css/js -->
		<script type="text/javascript">
		var line = '${value}';
		var imgUrl = "";
		
		$(function(){
		    
			if (line == "vinyl") {
				getList('vinyl');
			} else if (line=="paper") {
				getList('paper');
			} else {
			    getList('etc');
			}
 			
			$('.item').matchHeight();
			
			$('.tab .tablink').click(function() {
		        $('.tab .tablink').removeClass('active');
		        $(this).toggleClass('active'); 
			});
		});
		
		function getList(value) {
			
			$('.list').empty();
			
			var url = "";
			var gubn = ".JPG";
			
			if (value == "vinyl") {
				url = "/resources/data/vinyl.json";
				imgUrl = "vinyl";
				$('#btnVinyl').addClass('active');
			} else if (value == "paper"){
				url = "/resources/data/paper.json";
				imgUrl = "paper";
				$('#btnPaper').addClass('active');
			} else {
			    url = "/resources/data/etc.json";
			    imgUrl = "etc";
			    gubn = ".png";
			}
			
		
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
	                        listHtml += '<img class="imgSet" src="/resources/img/product/'+ imgUrl + idx + gubn + '"/></div>';
	                        listHtml += '<div class="bgSky mt10 mh75 wMax250 mAuto pt20 txtMd" style="cursor: pointer;" onclick="popUp(' + index + ',&#39;'+ value +'&#39;)"><p class="fSize15">상세보기</p></div>';
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
		
		function popUp(idx, value) {
		    var gubn = '.JPG';
		    
		    if (value == "etc") {
		        gubn = ".png";
		    }
		    
		    if(idx < 10) {
		    	idx = "00" + idx;
		    }
		    else if (idx < 99) {
		    	idx = "0" + idx ;
		    }
			var nameKor = $('#nameKor'+idx).val();

			$('.modal-header').after().html('<h4 class="modal-title txtCenter fSize22">'+nameKor + '</h4> <button type="button" class="close" data-dismiss="modal">&times;</button>');
			
			var bodyHtml = '';
			
			
			bodyHtml += '<div class="txtCenter">';
			bodyHtml += '<img class="imgSet" src="/resources/img/product/'+ imgUrl + idx + gubn +'" alt="비닐 기획팩"/></div>';
			bodyHtml += '<div class="bdr1 mt20">';
			bodyHtml += '<div class="mb15"></div>'
			bodyHtml += '<p class="fSize15"> 제품명(한글) :' + nameKor + '</p>';
			$('.modal-body').after().html(bodyHtml);
			$("#myModal").modal();
		}
		
		</script>
	</head>
	<body>
	    <div class="container-fluid">
		<jsp:include page="../common/navigation.jsp" />
	        <div class="jumbotron productBg">
	            <div class="txt-center">제품소개</div>
	        </div>
			<ol class="breadcrumb">
	            <li class="ml20"><a class="ml10" href="/page/mainPage"><span class="glyphicon glyphicon-home"></span></a></li>
	            <li><a href="/product/product">제품소개</a></li>
	        </ol>

        <div class="tab centered fSize16 fBold">
          <button class="tablink" id="btnVinyl" onclick="getList('vinyl')">비닐 기획팩</button>
          <button class="tablink" id="btnPaper" onclick="getList('paper')">종이 기획팩</button>
          <button class="tablink" id="btnEtc" onclick="getList('etc')">기타</button>
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