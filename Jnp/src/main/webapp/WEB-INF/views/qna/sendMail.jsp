<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../common/header.jsp"/>
</head>
<body>
	<div class="container">
		<form id="customer">
			<div class="form-name">
				<label for="label">이름:</label><br> <input type="text"
					class="text-controll" placeholder="Name">
			</div>
			<div class="form-email">
				<label for="label">Email 주소:</label><br> <input type="text"
					class="text-controll" placeholder="Email Address">
			</div>
			<div class="form-title">
				<label for="label">제목:</label><br> <input type="text"
					class="text-controll" placeholder="Subject">
			</div>
			<div class="form-message">
				<label for="label">내용:</label><br>
				<textarea class="text-controll" placeholder="Message" rows="5"></textarea>
			</div>
		</form>
		<div class="form-agree">
			<label for="checkbox label"> <input type="checkbox"
				id="checkbox label"> 전송한 메일 회신을 위하여 성명, 이메일, 문의 및 접수 내용에 대한
				정보를 수집하는 데에 동의합니다. (원칙적으로 이용목적이 달성된 후에는 관련법령 또는 회사 내부 방침에 따라서 보존할
				필요가 있는 경우를 제외하고는 지체없이 파기됩니다.)
			</label>
		</div>
		<input type="submit" class="btn" value="Send Message">
	</div>
</body>
</html>