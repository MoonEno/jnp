<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/header.jsp" />
<style>
.col-sm-12 {
    text-align: center;
    margin-bottom: 50px;
    margin-top: 100px;
    font-size: 23px;
}
.text {
    font-size: 13px;
    font-weight: 300;
    line-height: 23px;
    color: #555555;
    position: relative;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
}
.btn {
    margin-left: 50%;
    padding: 12px 16px;
    margin-top: 20px;
    margin-bottom: 20px;
}
</style>
</head>
<body>
    <div class="container-fluid">
    <jsp:include page="../common/navigation.jsp" />
        <div class="jumbotron bg">
            <div class="txt-center">CI</div>
        </div>
	    <ol class="breadcrumb">
	      <li class="ml20"><a class="ml10" href="/page/mainPage"><span class="glyphicon glyphicon-home"></span></a></li>
	      <li><a href="/intro/greeting">회사소개 </a></li>
	      <li><a href="/intro/ci">CI</a></li>
	    </ol>
    <div class="col-sm-12"><h1>저희 JJ C&amp;P의 CI를 소개합니다.</h1></div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-2">
            <img class="cnpLogo"
                src="${pageContext.request.contextPath}/resources/img/jjcnp.png">
        </div>
        
        <div class="col-md-3 text">
            <p class="fSize15">JJ C&P의 코퍼리트 심볼마크는 JJ C&P을 대표하는 상징적인 조형으로서 JJ C&P의 코퍼리트 아이덴티피케이션
                디자인 시스템의 가장 중요한 핵 입니다.</p>
            <p class="fSize15">심볼의 전체적인 Green 컬러는 환경과 21C의 프로세스를 상징하는 대표적 컬러이며 그라비어의 전문성과
                전체적인 원활한 시스템이 고품질의 결과만을 고객에게 제공한다는 JJ C&P의 곧은 의지를 내포하고 있습니다.</p>
            <p class="fSize15">워드마크를 섬세하게 감싸고 있는 정제되고 증후한 타원 형상은 미래의 프린팅 문화를 고객과 함께 이뤄 나간다는
                JJ C&P의 역동적이며 진취적인 기업의 모습이 내재되어 있습니다.</p>
        </div>
        <div class="col-md-3 text">
            <p class="fSize15">
                회오리 모양의 원은 첫머리에 시작되는 일진의 'ㅇ'을 나타내며,그라비어의 근본인 회전하는 동판을 나타냅니다.<br>타사와
                달리 JJ C&P만의 차별화이며 서비스 정신을 가 지고 그 결실을 맺자는 JJ C&P의 의지를 상징합니다.
            </p>
            <p class="fSize15">또한 영문 워드마크의 형태로 취하여 누구나 JJ C&P을 쉽게 식별 할 수가 있습니다.</p>
            <p class="fSize15">정교한 프린팅과 기술, 선진 프로세스 문화를 정착시키며 '업체의 만족이 곧 JJ C&P의 기쁨(곡선의 웃음)으로
                돌 아온다'는 JJ C&P의 기업의지와 구성원과의 화합과 협력을 바탕으로 영구적인 기업성장의 의미를 담고 있습니다.</p>
        </div>
        <div class="col-md-2"></div>
    </div>
    
    <button type="button" class="btn btn-primary">AI 파일 다운로드</button>
    <jsp:include page="../common/footer.jsp" />
    </div>
</body>
</html>