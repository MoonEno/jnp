<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/header.jsp" />
<script type="text/javascript"></script>
<script>
    $(document).ready(function() {
        $('#btnclick').on('click', function() {
            validation();
        });
    });
    function validation() {
        var name = $('#name').val();
        var email = $('#email').val();
        var title = $('#title').val();
        var message = $('#message').val();
        //이름 입력여부 검사
        if (name == "") {
            alert("이름을 입력해주세요");
            name.focus();
            return false;
        }
        ;
        //이름 유효성 검사 (한글과 영문 허용,공백체크)
        var reg_name = /^[가-힣a-zA-Z]+$/;
        if (!reg_name.test(name)) {
            alert("이름형식에 맞지않습니다.\n(한글과 영문 허용,공백체크)");
            name.focus();
            return false;
        }
        ;
        //이메일 입력여부 검사
        if (email == "") {
            alert("이메일을 입력해주세요");
            email.focus();
            return false;
        }
        ;
        //이메일 형식 검사
        var exp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        if (exp.test(email) == false) {
            alert("이메일형식에 맞지않습니다");
            email.focus();
            return false;
        }
        ;
        //제목 입력여부 검사
        if (title == "") {
            alert("제목을 입력해주세요");
            title.focus();
            return false;
        }
        ;
        //내용 입력여부 검사
        if (message == "") {
            alert("메세지를 입력해주세요");
            message.focus();
            return false;
        }
        ;
        //체크박스 유효성 검사
        if (!$('input:checkbox[id="checkbox label"]').is(":checked")) {
            alert("정보수집란에 동의하셔야합니다");
        } else {
            alert("전송완료");
        }
        ;
    };
</script>
<style>
.img {
    background-image:
        url("${pageContext.request.contextPath}/resources/img/img_lights.jpg");
    height: 240px;
    background-size: cover;
    color: white;
    margin-left: -20px;
    margin-right: -20px;
}
.text-center {
    font-size: 35px;
    vertical-align: middle;
    line-height: 200px;
}
.container {
    margin-top:150px; margin-bottom: 100px; padding-left: 150px;
}
.btn { position: absolute; vertical-align: middle; left: 50%; margin-left: -30px; } 
</style>
</head>
<body>
    <jsp:include page="../common/navigation.jsp" />
    <div class="container-fluid">
        <div class="jumbotron img">
            <div class="text-center">메일문의</div>
        </div>
    </div>
    <div class="container">
        <div class="form-group">
            <label class="labels">이름:</label><br> <input type="text"
                class="form-control" id="name" value="" placeholder="  Name">
        </div>

        <div class="form-group">
            <label>Email 주소:</label><br> <input type="text"
                class="form-control" id="email" value=""
                placeholder="  Email Address">
        </div>

        <div class="form-group">
            <label>제목:</label><br> <input type="text"
                class="form-control" id="title" value="" placeholder="  Subject">
        </div>

        <div class="form-group">
            <label>내용:</label><br>
            <textarea class="form-control" rows="5" id="message" placeholder="Message"></textarea>
        </div>
        <div class="form-group">
            <label for="checkbox label"> <input type="checkbox"
                id="checkbox label"> 전송한 메일 회신을 위하여 성명, 이메일, 문의 및 접수 내용에 대한
                정보를 수집하는 데에 동의합니다. <br />(원칙적으로 이용목적이 달성된 후에는 관련법령 또는 회사 내부 방침에 따라서
                보존할 필요가 있는 경우를 제외하고는 지체없이 파기됩니다.)
            </label>
        </div>
        <div class="btn">
        <button type="button" class="btn btn-primary" id="btnclick">Send Message</button>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />

</body>
</html>