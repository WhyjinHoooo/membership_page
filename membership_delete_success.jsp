<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>탈퇴 성공</title>
</head>
<body>
<%
	String member_id = (String)session.getAttribute("member_id");
%>

	<%
		session.removeAttribute("member_id");
	%>
		<script>
		alert("탈퇴가 성공적으로 완료되었습니다. 로그인페이지로 돌아갑니다.");
		window.location.href='membership_login.jsp';
		</script>
</body>
</html>