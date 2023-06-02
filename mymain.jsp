<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
		body { background-color: rgb(111,167,235)}
		h1 {
			color: navy;
  			
		}
	</style>

<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h1>main</h1>
</ecnter>
<%

String member_id = (String)session.getAttribute("member_id");
String member_pw = (String)session.getAttribute("member_pw");
%>
<center>
Your ID <h3><%=member_id %></h3><br>
</center>
	
	<table>
		<tr><td><form action="membership_logout.jsp" method="get" name="logout" id="logout">
			<input type="submit" value="로그아웃">
		</form></td></tr>
	
		<tr><td><form action="myupdate.jsp" method="get" name="Update" id="Update">
			<input type="submit" value="업데이트">
		</form></td></tr>
	
		<tr><td><form action="membership_delete.jsp" method="get" name="Update" id="Update">
			<input type="submit" value="회원탈퇴">
		</form></td></tr>
	</table>
</body>
</html>