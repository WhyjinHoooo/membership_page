<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="utf-8">
<%@ include file="mydbcon.jsp" %>

<script>

function updateMem(member_id)
{
	alert("회원정보를 수정합니다.");	
	//alert(id);
	
	window.location.replace("membership_admin_update.jsp?member_id="+member_id);
	
}


function deleteMem(member_id)
{
	alert("delete");
	//alert(id);
	
	window.location.replace("delete.jsp?member_id="+member_id);
}

</script>

<title>Insert title here</title>
</head>
<body>

<%
	//String member_id = request.getParameter("member_id");
	//String member_pw = request.getParameter("member_pw");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM membership_join";
	
	pstmt = conn.prepareStatement(sql);
	// 4) 실행
	rs = pstmt.executeQuery();
	// 5) 결과를 테이블에 출력

	out.println("<table border=1>");
	out.println("<tr><td>아이디</td><td>이름</td><td>성별</td><td>출생년</td><td>출생월</td><td>출생일</td><td>전화번호</td><td>sms수신여부</td><td>이메일ID</td><td>도매인 주소</td><td>이메일 수신여부</td><td>우편번호</td><td>지번주소</td><td>도로명주소</td><td>상세주소</td><td>Update</td><td>Delete</td></tr>");
	
	while(rs.next()) {
		
		out.println("<tr>");
		
		out.println("<td>"+rs.getString("member_id")+"</td>");
		out.println("<td>"+rs.getString("member_name")+"</td>");	
		out.println("<td>"+rs.getString("member_gender")+"</td>");	
		out.println("<td>"+rs.getString("birth_y")+"</td>");
		out.println("<td>"+rs.getString("birth_m")+"</td>");	
		out.println("<td>"+rs.getString("birth_d")+"</td>");
		out.println("<td>"+rs.getString("tel")+"</td>");
		out.println("<td>"+rs.getString("sms_al")+"</td>");
		out.println("<td>"+rs.getString("email_id")+"</td>");
		out.println("<td>"+rs.getString("email_domain")+"</td>");
		out.println("<td>"+rs.getString("email_al")+"</td>");
		out.println("<td>"+rs.getString("addr_post")+"</td>");
		out.println("<td>"+rs.getString("addr_lot")+"</td>");
		out.println("<td>"+rs.getString("addr_road")+"</td>");
		out.println("<td>"+rs.getString("addr_rest")+"</td>");
		
		out.println("<td><input type=button value=Update onClick=updateMem('"+rs.getString("member_id")+"');></td>");		
		out.println("<td><input type=button value=Delete onClick=deleteMem('"+rs.getString("member_id")+"');></td>");			
		out.println("</tr>");
		
	}
	
	out.println("</table>");
%>		
</body>
</html>