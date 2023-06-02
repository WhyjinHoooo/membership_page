<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="mydbcon.jsp" %>
</script>

  <title>회원 가입</title>
  <style>
  body { background-color: skyblue}
  .info{
  	background-color : rgb(111,167,235);
  }
  </style>
  
  
  
	<script>
	 	/*아이디 점검*/
		function checkedId(id){
			var cnt=0;
			
			var regex=/[a-zA-Z0-9+]*$/;
			
			if(id.length > 8 id.length < 5){
				document.Registform.usr.focus();
				alert('아이디는 5자리 ~ 8자리여야 합니다.');
				return false;
			} else{
				if(regex.test(id)){
					return true;
			}else{
				document.Registform.usr.focus();
				alert('아이디를 다시 확인하세요');
				return false;
				}
			}
		}
		/*비밀번호 점검*/
		function checkPwd(pwd1,pwd2){
			if(pwd1 == pwd2){
				return true;
			} else{
				return fales;
			}
		}
		function handleonChange(e){
			var e = e.value;
			document.registerform.input_info.value=v;
		}
		
		/* SMS 수신 동의 체크 안할 시 no를 전달하기 위함 */
		if(document.getElementById("input_yes1").checked){
			document.getElementById("input_no1").disabled = true;
		}

		/* 이메일 수신 동의 체크 안할 시 no를 전달하기 위함 */
		if(document.getElementById("input_yes2").checked){
			document.getElementById("input_no2").disabled = true;
		}

		function validateUpdate(){
			//console.log('확인');
			/*var id = document.registerform.id(요건 name하고 무조건 같다).value;*/
			var pwd1 = document.update.pwd.value;
			var pwd1 = document.update.check_pwd.value;
			
			var userName = document.update.userName.value;
			var gender = document.update.gender.value;
			
			var birthYear = document.update.birthYear.value;
			var birthMonth = document.update.birthMonth.value;
			var birthDay = document.update.birthDay.value;
			var calendar_type = document.update.calendar_type.value;
			
			var phoneNum1 = document.update.sp1.value;
			var phoneNum2 = document.update.sp2.value;
			var phoneNum3 = document.update.sp3.value;
			
			var info = document.update.info.value;
			var input_info = document.update.input_info.value;
			
			var postcode = document.update.addr_post.value;
			var addressDe = document.update.addr_lot.value;
			var addressRoad = document.update.addr_road.value;
			var addressLast = document.update.addr_rest.value;
			
			/* 모든 항목 중에 입력안한 곳이 있을 시 */
			if(!id || !pwd1 || !pwd2 || !usrname || !gender || !birthYear || !birthMonth || !birthDay || !calendar_type || !phoneNum1 ||
			!phoneNum2 || !phoneNum3 || !info || !input_info || !postcode || !addressDe || !addressRoad || !addressLast){
			alert('모든 항목을 입력해주세요!');
			return false;
			}
			else{
			return true;
			}
			
			
			
		}
	</script>
</head>
<body>
<%
	String member_id = (String)session.getAttribute("member_id");
	String member_pwd = null;
	String member_name = null;	
	String member_gender = null;
	String birth_y = null;
	String birth_m = null;
	String birth_d = null;
	String birth_kind = null;
	String tel = null;
	String sms_al = null;
	String email_id = null;
	String email_domain = null;
	String email_al = null;
	String addr_post = null;
	String addr_lot = null;
	String addr_road = null;
	String addr_rest = null;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM membership_join where member_id='"+member_id+"'";
	
	pstmt = conn.prepareStatement(sql);
	// 4) 실행
	rs = pstmt.executeQuery();
	// 5) 결과를 테이블에 출력
	if(rs.next()) {
		member_pwd = rs.getString("member_pwd");
		member_name = rs.getString("member_name");	
		member_gender = rs.getString("member_gender");
		birth_y = rs.getString("birth_y");
		birth_m = rs.getString("birth_m");
		birth_d = rs.getString("birth_d");
		birth_kind = rs.getString("birth_kind");
		tel = rs.getString("tel");
		sms_al = rs.getString("sms_al");
		email_id = rs.getString("email_id");
		email_domain = rs.getString("email_domain");
		email_al = rs.getString("email_al");
		addr_post = rs.getString("addr_post");
		addr_lot = rs.getString("addr_lot");
		addr_road = rs.getString("addr_road");
		addr_rest = rs.getString("addr_rest");
		
	}else{
		
	}
		
%>	


<center>
	<h1>정보수정</h1>
	<form name = "update" action = "membership_update.jsp" onSubmit = "return validateUpdate()">
	<table border="1">
	<!-- 아이디 -->
	<tr><td class="info">아이디</td>
		<td class="input_info">
			<input type = "text" name = "id" value='<%=member_id %>' placeholder="아이디를 입력하세요">
		</td>
	</tr>
	<!-- 비밀번호 -->	
	<tr><td class="info">비밀번호</td>
		<td class="input_info">
			<input type="password" name="pwd" value='<%=member_pwd %>' placeholder="비밀번호를 입력하세요">
		</td>
	</tr>
	<tr><td class="info">비밀번호확인</td>
		<td class="input_info">
			<input type="password" name="check_pwd" value='<%=member_pwd %>'>
		</td> 
	</tr>
	<!-- 이름 -->
	<tr><td class="info">이름</td>	
		<td class="input_info">
			<input type="text" name="userName" value='<%=member_name %>'>
		</td>
	</tr>
	<!-- 성별 -->
	<tr><td class="info">성별</td>
		<td class="input_info">
			<input type="radio" name="gender" value="male" 
			<% if(member_gender.equals("male")) out.print("checked"); %> >남성
			<input type="radio" name="gender" value="female" 
			<% if(member_gender.equals("female")) out.print("checked"); %> >여성
		</td>
	</tr>	
	<!-- 생년월일 -->
	<tr><td class="info">법정생년월일</td>
		<td class="input_info">
			<select name="birthYear">
				<script>
				for(var i = 2023 ; i >=1920 ; i--){
					if(i == <%=birth_y %> ){
						document.write("<option selected=''selected>"+i+"</option>");
					}
					else{document.write("<option>"+i+"</option>");}
				}
				</script>
			</select>년
			<select name="birthMonth">
				<script>
				for(var i = 12 ; i >=1 ; i--){
					if(i == <%=birth_m %>){
						document.write("<option selected=''selected>"+i+"</option>");
					}
					else{document.write("<option>"+i+"</option>");}
				}
				</script>
			</select>월
			<select name="birthDay">
				<script>
				for(var i = 31 ; i >=1 ; i--){
					if(i == <%=birth_d %>){
						document.write("<option selected=''selected>"+i+"</option>");
					}
					else{document.write("<option>"+i+"</option>");}
				}
				</script>
			</select>일
				<input type="radio" name="calendar_type" value="2" 
				<% if(birth_kind.equals("2")) out.print("checked"); %>>양력
				<input type="radio" name="calendar_type" value="1"
				<% if(birth_kind.equals("1")) out.print("checked"); %>>음력
			</td>
		</tr>	
		<!-- 휴대전화 -->	
		<tr><td class="info">휴대전화</td>
		<td class="input_info">
			<select name="sp1">
				<option selected="selected" value="null">선택</option>
				<option>010</option>
				<option>011</option>
				<option>016</option>
			</select>
			<input type="text" name="sp2">	
			<input type="text" name="sp3"/><br>
			<input type="checkbox" name="sms_al" value="y" id="input_yes1"/
			<% if(sms_al.equals("y")) out.print("checked"); %>>SMS 광고 수신을 동의합니다.
			<input type="hidden" name="sms_al" value="n" id="input_no1"
			<% if(sms_al.equals("n")) out.print("checked"); %>>
		</td>
		</tr>
		<!-- 이메일 -->
		<tr>
			<td class="info">이메일</td>
			<td class="input_info">
				<input type="text" name="info" value='<%=email_id%>'>
				@<input type="text" name="input_info" value='<%=email_domain%>'>
					<select name="input_info2" onchange="handleonChange(this);">
						<option selected="selected" value="null">직접입력</option>
						<option value="naver.com"&gtnaver.com></option>
						<option value="gamil.com"&gtgmail.com></option>
					</select><br>
					<input type="checkbox" name="email_al" value="y" id="input_yes2"/
					<% if(email_al.equals("y")) out.print("checked"); %>>e-mail광고 수신을 동의합니다.
					<input type="hidden" name="sms_al" value="n" id="input_no2"
					<% if(email_al.equals("n")) out.print("checked"); %>>
			</td>
		</tr>
		<!-- 주소 -->
		<tr>
		<td class="info">주소</td>
			<td class="input_info">
			우편번호<br><input type="text" name="addr_post" value=<%=addr_post %>><br>
			지번주소<br><input type="text" name="addr_lot" value=<%=addr_lot %>><br>
			도로명 주소<br><input type="text" name="addr_road" value=<%=addr_road %>><br>
			나머지 주소<br><input type="text" name="addr_rest" value=<%=addr_rest %>>
			</td>
		</tr>
	</table align=center>
	<input type="submit" value="업데이트">	
	</form>
	
</center>
</body>
</html>