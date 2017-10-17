<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="../common/header.jsp"></jsp:include>
</head>
<body>
<div id="container">
<jsp:include page="../common/navigation.jsp" />
<hr/>
<section class="contents">
<article>
    <div class="round-box bold ptb20">
        <p class="ac fBold">잘못된 요청입니다.</p>
        <div class="mt20">
            <a href="javascript:goHome();" class="btn btn-red layer w100p">첫 화면으로 이동하기</a>
        </div>
    </div>
</article>
</section>
<hr/>
<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
</body>
</html>