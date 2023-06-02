<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Log out</title>
</head>
<body>

	<script>
		alert("로그아웃 되었습니다. 로그인 페이지로 돌아갑니다.");
		window.location.href='membership_login.jsp';
		session.removeAttribute("member_id");
		session.removeAttribute("member_pw");
	</script> 
	
</body>
</html>