<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="mydbcon.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%
	String admin_ban_id = request.getParameter("admin_ban_id");
	String admin_ban_pwd = request.getParameter("admin_ban_pwd");
	
	String sql = "SELECT member_id, member_pwd FROM membership_join WHERE member_id ='"+ admin_ban_id +"'";
	
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	String member_id = null;
	String member_pwd = null;
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		member_id = rs.getString("member_id");
		//out.println("<script>alert('"+member_id+"');</script>"); 검사
		member_pwd = rs.getString("member_pwd");
		
	}
	
	if(!admin_ban_id.equals(member_id) && !admin_ban_pwd.equals(member_pwd) ){
		out.println("<script>alert('아이디와 비밀번호가 틀렸습니다. 다시 입력해주세요.'); location.href='membership_showlist.jsp'</script>");
	} else{
		String sql2 = "DELETE FROM membership_join WHERE member_pwd ='"+admin_ban_pwd+"' AND member_id = '"+admin_ban_id+"'";
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		pstmt2.executeUpdate();
		out.println("<script>alert('탈퇴되었습니다.');location.href='membership_showlist.jsp'</script>");
	}
%>


</body>
</html>