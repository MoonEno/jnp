<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/header.jsp" />
<script type="text/javascript" src="webapp/js/jquery-3.2.1.min.js"></script>

<script>
 var name = $('#name').val();
var email = $('#email').val();
var title = $('#title').val();
var message = $('#message').val();

$('#click').on('click',function(){
	  if(!name){
		  alert("이름을 입력해주세요");
		  $('#name').focus();
	  }else if(!email){
		  alert("이메일을 입력해주세요");
          $('#email').focus();
	  }else if(!title){
		  alert("제목을 입력해주세요");
          $('#title').focus();
	  }else if(!message){
		  alert("메세지를 입력해주세요");
          $('#message').focus();
	  }else{
		  alert("전송완료");
       	   };
});
$('#btnclick').on('click',function(){
	  alert("dddd");
});

/* document.getElementById('click').addEventListener('click',function(){
	alert("dddd");
}); */
</script>
</head>
<body>
	<div class="container">
	<jsp:include page="../common/navigation.jsp"/>
		<form id="customer">
				<label for="label">이름:</label><br>
				 <input type="text" class="text-controll" id="name" placeholder="Name">
			</div>
			<div class="form-email">
				<label for="label">Email 주소:</label><br>
				 <input type="text" class="text-controll" id="email" placeholder="Email Address">
			</div>
			<div class="form-title">
				<label for="label">제목:</label><br> 
				<input type="text" class="text-controll" id="title" placeholder="Subject">
			</div>
			<div class="form-message">
				<label for="label">내용:</label><br>
				<textarea class="text-controll" id="message" placeholder="Message" rows="5"></textarea>
			</div>
		</form>
		<div class="form-agree">
			<label for="checkbox label"> <input type="checkbox"
				id="checkbox label"> 전송한 메일 회신을 위하여 성명, 이메일, 문의 및 접수 내용에 대한
				정보를 수집하는 데에 동의합니다. (원칙적으로 이용목적이 달성된 후에는 관련법령 또는 회사 내부 방침에 따라서 보존할
				필요가 있는 경우를 제외하고는 지체없이 파기됩니다.)
			</label>
		</div>
		<input type="submit" class="btn" id="btnclick" value="Send Message">
	</div>
</body>
</html>