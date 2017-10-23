<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/header.jsp" />
<style>

.text-center {
    font-size: 35px;
    vertical-align: middle;
    line-height: 200px;
}
.col-sm-8 {
    margin-top: 100px;
    margin-bottom: 30px;
    padding-left: 0px;
    width: 102.66%;
    border-bottom-style: solid;
    border-bottom-width: thin;
    border-bottom-color: silver;
}
h3 {
    margin-bottom: 20px;
}
.article {
    font-size: 13px;
    padding-bottom: 20px;
}
.article-img {
    background-image:
        url("${pageContext.request.contextPath}/resources/img/house.jpg");
    background-position: right bottom;
    background-repeat: no-repeat;
    background-size: 52%;
}
.col-sm-4 { float: right; margin-right: -47px; margin-top: -10px; margin-bottom: 100px;
    
}
.sign{font-size: 21px; margin-top: -20px; }
.ju{font-size: 17px; }

</style>
</head>
<body>
    <jsp:include page="../common/navigation.jsp" />
    <div class="container-fluid">
        <div class="jumbotron bg">
            <div class="txt-center">인사말</div>
        </div>
    </div>
    <ol class="breadcrumb">
      <li class="ml20"><a class="ml10" href="/page/mainPage"><span class="glyphicon glyphicon-home"></span></a></li>
      <li><a href="/intro/greeting">회사소개 </a></li>
      <li><a href="/intro/greeting">인사말</a></li>
    </ol>
    
    <div class="container">
        <div class="col-md-12 mt20">
	        <div class="col-md-7 text-left article-img">
	            <h3>안녕하십니까?</h3>
	            <p class="article fSize15">
			    JJ C&amp;P의 모태는 1995년 B2B 전문 업체로 창립한 크로바 상사입니다.<br>
			    2015년 법인으로 전환 승계하며 JJ C&amp;로 상호를 변경했습니다.<br>
			         현재 JJ C&amp;P는 다양한 제품 구성능력과 신속하고 정확한 서비스를 제공하여 거래업체에 <br>
			        더욱 향상된 부가가치를 제공하는 B2B 전문 업체로 성장해 가고 있습니다. 
			   </p>
			   <p class="article fSize15">
			        항상 <strong class="impact fSize19">"처음과 끝은 같다."</strong>는 마음을 가지고 처음부터 끝까지 한발 앞서 준비하고 <br>
			        남보다 먼저 실천하는 회사로서 거래업체와 <strong class="impact fSize19">함께 성장하는 파트너가 </strong> 되겠습니다.<br>
			        감사합니다.
			   </p>
	        </div>
	        <div class="col-md-5">
	            <table class="table table-striped">
	             <colgroup>
	             <col width="35%">
	             <col width="65%">
	            </colgroup>
	            <tr>
	            <td>기업명(한글)</td>
	            <td>(주)제이제이씨엔피</td>
	            </tr>
	            <tr>
                <td>기업명(영문)</td>
                <td>JJ C&amp;P</td>
                </tr>
                <tr>
                <td>사업자등록번호</td>
                <td>720-81-00103</td>
                </tr>
                <tr>
                <td>대표자명</td>
                <td>박종성</td>
                </tr>
                <tr>
                <td>주소</td>
                <td> 서울특별시 성동구 성수이로 66 서울 숲 <br> 드림타워 1110호 (우편번호: 133827) </td>
                </tr>
                <tr>
                <td>주요상품(상품서비스)</td>
                <td> 그라비아 제조, 인쇄 플라스틱 용기</td>
                </tr>
                <tr>
                <td>전화번호</td>
                <td>02-497-0340</td>
                </tr>
                <tr>
                <td>팩스번호</td>
                <td>02-497-0341</td>
                </tr>
	            </table>
	        </div>
        </div>
        <div class="col-sm-12 text-right">
            <hr/>
            <h5 class="ju">(주)JJ C&amp;P</h5><br>
            <h3 class="sign"><strong>대표이사 박종성</strong></h3>
        </div>
        
    </div>
    <jsp:include page="../common/footer.jsp" />

</body>
</html>