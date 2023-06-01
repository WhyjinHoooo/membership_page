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
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>회원가입 완료</h1>
<% 

	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/campusdb";
	String id = "root"; //MySQL에 접속을 위한 계정의 ID
	String pwd = "jinsang1027#"; //MySQL에 접속을 위한 계정의 암호
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, id, pwd);

	String usr_id = request.getParameter("id");
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
	/*String email = front + "@" + rear; //이메일 @붙여서 합치기*/
	
	String sql = "INSERT INTO usrregist VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	try{
		

		pstmt.setString(1,usr_id);
		pstmt.setString(2,usr_pwd);
		pstmt.setString(3,usrname);
		pstmt.setString(4,gender);
		pstmt.setString(5,year);
		pstmt.setString(6,month);
		pstmt.setString(7,day);
		pstmt.setString(8,kind);
		pstmt.setString(9,tel);
		pstmt.setString(10,sms_al);
		pstmt.setString(11,email_front);
		pstmt.setString(12,email_rear);
		pstmt.setString(13,email_al);
		pstmt.setString(14,addr_post);
		pstmt.setString(15,addr_lot);
		pstmt.setString(16,addr_road);
		pstmt.setString(17,addr_rest);
		
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
	
	
</body>
</html>