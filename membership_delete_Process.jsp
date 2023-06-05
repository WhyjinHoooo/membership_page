<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
    
<%@page session="true" %> 
   
<!DOCTYPE html>
<html>
<head>
<style>
	body{
		background-color: skyblue;
		font-color: navy;
	}
	h1 {
 		 color: navy;
 		 margin-left: 20px;
	}
</style>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%

	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/campusdb";
	String id = "root"; //MySQL에 접속을 위한 계정의 ID
	String pwd = "jinsang1027#"; //MySQL에 접속을 위한 계정의 암호
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, id, pwd);
	
	String delete_pwd = request.getParameter("delete_pwd");
	String member_id = (String)session.getAttribute("member_id");
	
	String sql = "SELECT member_pwd FROM membership_join WHERE member_id='"+member_id+"'"; 
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	String member_pwd = null;
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		member_pwd=rs.getString("member_pwd");
	}
	
	if(!delete_pwd.equals(member_pwd)){
		out.println("<script>alert('비밀번호가 틀렸습니다. 다시 입력해주세요.'); location.href='membership_delete.jsp'</script>");
	} else{
		String sql2 = "DELETE FROM membership_join WHERE member_pwd='"+delete_pwd+"'";
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		pstmt2.executeUpdate(); 
		out.println("<script>location.href='membership_delete_success.jsp'</script>");
	}
	%>
</body>
</html>