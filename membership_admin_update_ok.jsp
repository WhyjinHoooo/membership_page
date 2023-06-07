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
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>업데이트 완료</h1>
<%

	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/campusdb";
	String id = "root"; //MySQL에 접속을 위한 계정의 ID
	String pwd = "jinsang1027#"; //MySQL에 접속을 위한 계정의 암호
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, id, pwd);
	
	String member_id =(String)session.getAttribute("admin_edit_Name");
	
	String usr_pwd = request.getParameter("pwd");
	String usrname = request.getParameter("userName");
	String gender = request.getParameter("gender");
	String year = request.getParameter("birthYear");
	String month = request.getParameter("birthMonth");
	String day = request.getParameter("birthDay");
	String kind = request.getParameter("calendar_type"); //양력,음력
	String num1 = request.getParameter("sp1"); //010
	String num2 = request.getParameter("sp2"); //1111
	String num3 = request.getParameter("sp3"); //1111
	String sms_al = request.getParameter("sms_al"); //sms 수신 동의 여부(yes, no)
	String email_front = request.getParameter("info"); // @ 앞에 이메일
	String email_rear = request.getParameter("input_info"); //@ 뒤의 이메일
	String email_al = request.getParameter("email_al"); //email 수신 동의 여부(yes, no)
	String addr_post = request.getParameter("addr_post"); //우편번호
	String addr_lot = request.getParameter("addr_lot"); //지번주소
	String addr_road = request.getParameter("addr_road"); //도로명 주소
	String addr_rest = request.getParameter("addr_rest"); //상세 주소

	String tel = num1 + "-" + num2 + "-" + num3; //전화번호 - 붙여서 합치기
	
	String sql = "UPDATE membership_join SET member_pwd='"+usr_pwd+"',member_name='"+usrname+"', member_gender='"+gender+"',birth_y='"+year
	+"',birth_m='"+month+"',birth_d='"+day+"', birth_kind='"+kind+"',tel='"+tel+"',sms_al='"+sms_al+"',email_id='"+email_front
	+"',email_domain='"+email_rear+"',email_al='"+email_al+"',addr_post='"+addr_post+"',addr_lot='"+addr_lot+"',addr_road='"+addr_road
	+"',addr_rest='"+addr_rest+"' WHERE member_id='"+member_id+"'";
			
												
	
	
	/*String sql = "UPDATE membership_join SET member_pwd=?, member_name=?, member_gender=?, " +
                 "birth_y=?, birth_m=?, birth_d=?, birth_kind=?, tel=?, sms_al=?, email_id=?, " +
                 "email_domain=?, email_al=?, addr_post=?, addr_lot=?, addr_road=?, addr_rest=? " +
                 "WHERE member_id=?";*/
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	try{
		pstmt.executeUpdate();
	}catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(pstmt!=null && !pstmt.isClosed()) {
					pstmt.close();
				}
			}catch(SQLException e) {
					e.printStackTrace();
			}
		}
%>
		<script>
		alert("회원정보가 수정되었습니다. 관리자 페이지로 돌아갑니다..");
		window.location.href='membership_showlist.jsp';
		</script>
</body>
</html>