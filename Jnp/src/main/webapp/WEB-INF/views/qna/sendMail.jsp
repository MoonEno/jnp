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
        function validation() {

            //이름 입력여부 검사
            if ($('#name').val() == "") {
                alert("이름을 입력해주세요");
                $('#name').focus();
                return false;
            };
            //이름 유효성 검사 (한글만 허용,공백체크,2자이상4자이하)
            var reg_name = /^[가-힣]{2,4}$/;

            if (!reg_name.test($('#name').val())) {
                alert("이름형식에 맞지않습니다.\n(한글만 공백없이 2자이상 4자이하 입력가능)");
                $('#name').focus();
                return false;
            };
            //이메일 입력여부 검사
            if ($('#email').val() == "") {
                alert("이메일을 입력해주세요");
                $('#email').focus();
                return false;
            };
            //이메일 형식 검사
            var exp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

            if(exp.test($('#email').val())==false){
                alert("이메일형식에 맞지않습니다");
                $('#email').focus();
                return false;
            };
            //제목 입력여부 검사
            if ($('#title').val() == "") {
                alert("제목을 입력해주세요");
                $('#title').focus();
                return false;
            };
            //내용 입력여부 검사
            if ($('#message').val() == "") {
                alert("메세지를 입력해주세요");
                $('#message').focus();
                return false;
            } 
            //체크박스 유효성 검사
            if(!$('input:checkbox[id="checkbox label"]').is(":checked")){
                alert("정보수집란에 동의하셔야합니다");
            }else {
                alert("전송완료");
            };
        }
        $('#btnclick').on('click', function() {
            validation();
        });

    });
</script>
</head>
<body>
    <div class="container">
        <jsp:include page="../common/navigation.jsp" />
        <form id="customer">
            <label for="label">이름:</label><br> <input type="text"
                class="text-controll" id="name" value="" placeholder="Name">
    <div class="form-email">
        <label for="label">Email 주소:</label><br> <input type="text"
            class="text-controll" id="email" value="" placeholder="Email Address">
    </div>
    <div class="form-title">
        <label for="label">제목:</label><br> <input type="text"
            class="text-controll" id="title" value="" placeholder="Subject">
    </div>
    <div class="form-message">
        <label for="label">내용:</label><br>
        <textarea style="resize:none;" class="text-controll" id="message" placeholder="Message" rows="5"></textarea>
    </div>
    </form>
    <div class="form-agree">
        <label for="checkbox label"> 
        <input type="checkbox" id="checkbox label"> 전송한 메일 회신을 위하여 성명, 이메일, 문의 및 접수 내용에 대한
            정보를 수집하는 데에 동의합니다. (원칙적으로 이용목적이 달성된 후에는 관련법령 또는 회사 내부 방침에 따라서 보존할 필요가
            있는 경우를 제외하고는 지체없이 파기됩니다.)
        </label>
    </div>
    <input type="submit" class="btn" id="btnclick" value="Send Message">
    </div>
</body>
</html>