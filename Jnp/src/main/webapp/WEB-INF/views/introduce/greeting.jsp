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
        <div class="col-sm-8 text-left article-img">
            <h3>안녕하십니까?</h3>
            <p class="article">
                모든 산업이 치열한 글로벌 경쟁이되고 있는 시점에 저희 <b>(주)JJ C&P는</b><br> 오직 최고의 품질과
                품격 높은 제품을 생산하겠다는 일념하에 땀 흘리며 연구하고 있습니다.<br> 1996년 창사이래 그 동안 많은
                협력업체의 변함없는 신뢰와 고객분들의 성원에 힘입어<br> 최신형 Dry Lamination Machine과 봉투
                가공기,레이져 Scoring 설비등의 도입과 더불어<br> 국내뿐만 아니라 북중미와 동남아등에 다양한 제품을
                수출하며 포장 전문 기업으로<br> 자리매김 하고 있습니다.
            </p>
            <p class="article">
                아울러 저희 <b>(주)JJ C&P</b> 전 임직원은 현재에 만족하지 않고 고객의 NEEDS를 최우선으로 생각하며<br>
                최적화된 품질의 고기능성 제품과 정확한 납품으로 고객 만족을 위해 최선을 다하고 있습니다.
            </p>
            <p class="article">
                또한, 언제나 고객 만족과 가치 창조를 목표로 저희 <b>(주)JJ C&P는</b> 지속적인 신제품 연구 및<br>
                꾸준한 제품 개발에 매진하며 항상 책임을 다하는 자세로 포장산업을 선도하는 기업이 되도록<br> 항상 노력을
                다하겠습니다.
            </p>
            <p class="article">
                변함없는 성원과 격려를 부탁드리며, 항상 여러분 가정의 행복을 기원합니다.<br> 감사합니다.
            </p>
        </div>
        
            <div class="col-sm-4 text-right">
            <h5 class="ju">(주)JJ C&P</h5><br>
            <h3 class="sign">대표이사 문석호</h3>
            </div>
        
    </div>
    <jsp:include page="../common/footer.jsp" />

</body>
</html>