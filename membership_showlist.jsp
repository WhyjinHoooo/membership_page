<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
    
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
<title>showList</title>
</head>
<body>
<center><h1>회원정보</h1></center>

<%
	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/campusdb";
	String id = "root"; //MySQL에 접속을 위한 계정의 ID
	String pwd = "jinsang1027#"; //MySQL에 접속을 위한 계정의 암호
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, id, pwd);
	%>
	
	<center>
	<table border=1>
	<tr style="text-align:center";>
		<td>아이디</td><td>이름</td><td>성별</td><td>출생년</td><td>출생월</td><td>출생일</td><td>전화번호</td><td>sms수신여부</td><td>이메일ID</td><td>도매인 주소</td><td>이메일 수신여부</td><td>우편번호</td><td>지번주소</td><td>도로명주소</td><td>상세주소</td>
	</tr>
	<% 	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql ="SELECT * FROM membership_join";
	pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		String member_id = rs.getString("member_id");
		String member_name = rs.getString("member_name");
		String member_gender = rs.getString("member_gender");
		String birth_y = rs.getString("birth_y");
		String birth_m = rs.getString("birth_m");
		String birth_d = rs.getString("birth_d");
		String tel = rs.getString("tel");
		String sms_al = rs.getString("sms_al");
		String email_id = rs.getString("email_id");
		String email_domain = rs.getString("email_domain");
		String email_al = rs.getString("email_al");
		String addr_post = rs.getString("addr_post");
		String addr_lot = rs.getString("addr_lot");
	 	String addr_road = rs.getString("addr_road");
		String addr_rest = rs.getString("addr_rest");
	%>
	
	<tr style="text-align:center;background-color: rgb(111,167,235)">
		<td><%=member_id %></td>
		<td><%=member_name %></td>
		<td><%=member_gender%></td>
		<td><%=birth_y%></td>	
		<td><%=birth_m%></td>
		<td><%=birth_d%></td>
		<td><%=tel%></td>
		<td><%=sms_al%></td>
		<td><%=email_id%></td>	
		<td><%=email_domain%></td>
		<td><%=email_al%></td>
		<td><%=addr_post%></td>
		<td><%=addr_lot%></td>
		<td><%=addr_road%></td>	
		<td><%=addr_rest%></td>
	</tr>
	<% 
	}
	%>
	</table>
	</center>
	
	<center>
		<form action="membership_logout.jsp" method="get" name="logout" id="logout">
		<br><br><input type="submit" value="관리자 로그아웃"><br><br>
		</form>
	</center>
	
	<form neme="SearchForm" action="membership_search.jsp">
		<center>
			회원을 검색하세요.<br>
			<input type="text" name="search_user_Name" id="search_user_Name" placeholder="이름"><br><br>
			<input type="text" name="search_user_gender" id="search_user_gender" placeholder="성별(male,female)"><br><br>
			<input type="text" name="search_user_birthY" id="search_user_birthY" placeholder="출생년도"><br><br>
			<input type="text" name="search_user_birthM" id="search_user_birthM" placeholder="출생월"><br><br>
			<input type="text" name="search_user_birthD" id="search_user_birthD" placeholder="출생일"><br><br>
			<input type="text" name="search_user_tel" id="search_user_tel" placeholder="전화번호(010,011,016)"><br><br>
			<input type="text" name="search_user_emailD" id="search_user_emailD" placeholder="이메일 도메인(naver,gmail)"><br><br>
			<input type="submit" value="검색하기">
		</center>
	</form>
</body>
</html>