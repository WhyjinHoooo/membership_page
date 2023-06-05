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
		<td>아이디</td><td>이름</td><td>성별</td><td>출생년</td><td>출생월</td><td>출생일</td><td>전화번호</td><td>이메일ID</td><td>도매인 주소</td><td>우편번호</td><td>지번주소</td><td>도로명주소</td><td>상세주소</td>
	</tr>
	<!-- 검색 조건 : 이름에서 성subtitle(0,1)로 추출V, 성별V, 출생년도(나이),
	출생월(몇 월생인지)V,출생일V,전화번호(010 또는 011 사용하는 사람)split("-")으로 구분V, 이메일의 도메인이 네이버,구글인지V -->
	<% 	
	PreparedStatement pstmt = null;         
	ResultSet rs = null;
	
	String sql ="SELECT * FROM membership_join";
	pstmt = conn.prepareStatement(sql);
	
	rs = pstmt.executeQuery();
	
	String search_user_Name = request.getParameter("search_user_Name");
	//String search_user_firstName = search_user_Name.substring(0,1); //이름의 성을 저장
	String search_user_gender = request.getParameter("search_user_gender"); //성별을 저장
	String search_user_birthY = request.getParameter("search_user_birthY"); // 출생년도를 저장
	String search_user_birthM = request.getParameter("search_user_birthM"); // 출생월(을)를 저장
	String search_user_birthD = request.getParameter("search_user_birthD"); // 출생일(을)를 저장
	String search_user_tel = request.getParameter("search_user_tel"); // 전화번호를 저장
	String search_user_emailD = request.getParameter("search_user_emailD"); // 이메일 도메인을 저장(naver,gmail)
	//String[] value = search_user_tel.split("-"); //저장된 전화번호를 '-'로 구분해서 010/011/016,????,????로 배열에 저장
	
	while (rs.next()) {
		String member_id = rs.getString("member_id");
		String member_name = rs.getString("member_name");
		String member_gender = rs.getString("member_gender");
		String birth_y = rs.getString("birth_y");
		String birth_m = rs.getString("birth_m");
		String birth_d = rs.getString("birth_d");
		String tel = rs.getString("tel");
		String email_id = rs.getString("email_id");
		
		String email_domain = rs.getString("email_domain");
		String[] email_domain_detail = email_domain.split("\\.");
		
		String addr_post = rs.getString("addr_post");
		String addr_lot = rs.getString("addr_lot");
	 	String addr_road = rs.getString("addr_road");
		String addr_rest = rs.getString("addr_rest");
	%>
	
	<%
	if ((search_user_Name != null && member_name.equals(search_user_Name)) || (search_user_gender != null && member_gender.equals(search_user_gender)) 
			|| (search_user_birthY != null && birth_y.equals(search_user_birthY)) || (search_user_birthM != null && birth_m.equals(search_user_birthM)) 
			|| (search_user_birthD != null && birth_d.equals(search_user_birthD)) || (search_user_tel != null && tel.substring(0,3).equals(search_user_tel))
			|| (search_user_emailD != null && email_domain_detail[0].equals(search_user_emailD)) ) {
		//if((search_user_Name != null && member_name.equals(search_user_Name)) && (search_user_gender != null && member_name.equals(search_user_gender)) ) {
	%>
	<tr style="text-align:center;background-color: rgb(111,167,235)">
		<td><%=member_id %></td>
		<td><%=member_name %></td>
		<td><%=member_gender%></td>
		<td><%=birth_y%></td>	
		<td><%=birth_m%></td>
		<td><%=birth_d%></td>
		<td><%=tel%></td>
		<td><%=email_id%></td>	
		<td><%=email_domain%></td>
		<td><%=addr_post%></td>
		<td><%=addr_lot%></td>
		<td><%=addr_road%></td>	
		<td><%=addr_rest%></td>
	</tr>
	<%
		}
	}
	%>
	</table>
	</center>

</body>
</html>