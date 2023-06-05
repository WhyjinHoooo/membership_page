<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
	<style>
		body{
			background-color: skyblue;
			font-color: navy;
		}
		h1{
			color: navy;
			margin-left: 20px;
		}
	</style>
<head>
<meta charset="utf-8">
<title>탈퇴</title>
</head>
<body>

	<%
	String member_id =(String)session.getAttribute("member_id");
	%>
	<form name="DeleteForm" action="membership_delete_Process.jsp">
		<center>
			<h1><%=member_id%></h1>탈퇴를 진행하겠습니다.<br><br>
			본인 확인을 위해 비밀번호를 입력하세요.<br><br>
			<input type="password" name="delete_pwd" id="delete_pwd"><br><br>
			<input type="submit" value="탈퇴하기">
		</center>
	</form>
</body>
</html>