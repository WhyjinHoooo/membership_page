<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="utf-8">
<%@ include file="mydbcon.jsp" %>

<title>Insert title here</title>
</head>
<body>

	<h1>로그인 완료</h1>

<%
	String member_id = request.getParameter("member_id");
	String member_pw = request.getParameter("member_pw");
 	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
 
	String sql = "SELECT * FROM membership_join where member_id='"+member_id+"' and member_pwd='"+member_pw+"'";
	
	pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	 
	if(rs.next()){
		session.setAttribute("member_id",member_id);
		session.setAttribute("member_pw",member_pw);
%>
	<script>
	alert('로그인 성공!');
	window.location.href='mymain.jsp';
	</script>
<%
	}
	else{
%>	
<script>
alert('다시 입력해주세요.');
history.back();
</script>
<%
	}
%>
</body>
</html>