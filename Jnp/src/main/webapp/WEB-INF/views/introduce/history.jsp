<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../common/header.jsp"></jsp:include> <!-- 추가해야할 css/js -->
    </head>
    <body>
    
        <div class="container-fluid">
        <jsp:include page="../common/navigation.jsp" />
	        <div class="jumbotron bg">
	            <div class="txt-center">연혁</div>
	        </div>
		    <ol class="breadcrumb">
		      <li class="ml20"><a class="ml10" href="/page/mainPage"><span class="glyphicon glyphicon-home"></span></a></li>
		      <li><a href="/intro/greeting">회사소개 </a></li>
		      <li><a href="/intro/history">연혁</a></li>
		    </ol>
	        <div class="contents">
		        <h2 class="ac mb20">미래로의 도약, 끊임없이 성장하는 &nbsp;<img alt="" src="/resources/img/logo.png">&nbsp;의 역사입니다.</h2>
		        <div class="col-md-3"></div>
		        <div class="col-md-6">
			        <table class="table table-striped historyTable mt20">
			            <colgroup>
			            <col width="20%">
			            <col width="80%">
			            </colgroup>
			            <tr>
				            <td class="year">2016.06</td>
				            <td class="tableData"> 크로바상사 폐업, 제이제이씨엔피로 통합 사업승계</td>
				        </tr>
				        <tr>
	                        <td class="year">2015.05</td>
	                        <td class="tableData"> (주)제이제이씨엔피 설립 기존 사업 법인으로 전환 승계 <br>  진성실업 폐업, 제이제이씨엔피로 통합 사업승계</td>
	                    </tr>
	                    <tr>
	                        <td class="year">2014.12</td>
	                        <td class="tableData"> 남양유업, 서울우유, 씨제이제일제당, 롯데푸드, 풀무원다논 납품</td>
	                    </tr>
	                    <tr>
	                        <td class="year">2012.07</td>
	                        <td class="tableData"> 씨제이 제일제당 협력업체 등록 <br> 롯데삼강 협력업체 등록</td>
	                    </tr>
	                    <tr>
	                        <td class="year">2011.01</td>
	                        <td class="tableData"> 서울우유 , 남양유업납품 <br>  진성실업 설립</td>
	                    </tr>
	                    <tr>
	                        <td class="year">2010.01</td>
	                        <td class="tableData"> 서울우유, 남양유업납품<br>  내셔날플라스틱(롯데칠성) 파라솔 납품 <br>  다논코리아 협력업체 등록</td>
	                    </tr>
	                    <tr>
	                        <td class="year">2009.05</td>
	                        <td class="tableData"> 롯데슈퍼 협력업체 등록</td>
	                    </tr>
	                    <tr>
                            <td class="year">2008.07</td>
                            <td class="tableData"> 서울우유 협력업체 등록</td>
                        </tr>
                        <tr>
                            <td class="year">2006.04</td>
                            <td class="tableData"> 대우조선 납품</td>
                        </tr>
                        <tr>
                            <td class="year">1997.03</td>
                            <td class="tableData"> 주연컴퓨터 납품</td>
                        </tr>
                        <tr>
                            <td class="year">1996.02</td>
                            <td class="tableData"> 삼육두유 납품 , 정식품 납품</td>
                        </tr>
                        <tr>
                            <td class="year">1995.04</td>
                            <td class="tableData"> 크로바상세 설립 <br> 남양유업 협력업체 등록</td>
                        </tr>
			        </table>
			    </div>
			    <div class="col-md-3"></div>
	        </div>
	        <jsp:include page="../common/footer.jsp" />
        </div>
    </body>
</html>