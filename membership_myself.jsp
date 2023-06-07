<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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

		function validateForm(){
			//console.log('확인');
			/*var id = document.registerform.id(요건 name하고 무조건 같다).value;*/
			var id = document.registerform.id.value;
			
			var pwd1 = document.registerform.pwd.value;
			var pwd1 = document.registerform.check_pwd.value;
			
			var userName = document.registerform.userName.value;
			var gender = document.registerform.gender.value;
			
			var birthYear = document.registerform.birthYear.value;
			var birthMonth = document.registerform.birthMonth.value;
			var birthDay = document.registerform.birthDay.value;
			var calendar_type = document.registerform.calendar_type.value;
			
			var phoneNum1 = document.registerform.sp1.value;
			var phoneNum2 = document.registerform.sp2.value;
			var phoneNum3 = document.registerform.sp3.value;
			
			var info = document.registerform.info.value;
			var input_info = document.registerform.input_info.value;
			
			var postcode = document.registerform.addr_post.value;
			var addressDe = document.registerform.addr_lot.value;
			var addressRoad = document.registerform.addr_road.value;
			var addressLast = document.registerform.addr_rest.value;
			
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
<center>
	<h1>필수입력사항</h1>
	<form name = "registerform" action = "membership_ok.jsp" onSubmit = "return validateForm()">
	<table border="1">
	<!-- 아이디 -->
	<tr><td class="info">아이디</td>
		<td class="input_info">
			<input type = "text" name = "id" placeholder="아이디를 입력하세요">
		</td>
	</tr>
	<!-- 비밀번호 -->	
	<tr><td class="info">비밀번호</td>
		<td class="input_info">
			<input type="password" name="pwd" placeholder="비밀번호를 입력하세요">
		</td>
	</tr>
	<tr><td class="info">비밀번호확인</td>
		<td class="input_info">
			<input type="password" name="check_pwd">
		</td> 
	</tr>
	<!-- 이름 -->
	<tr><td class="info">이름</td>	
		<td class="input_info">
			<input type="text" name="userName">
		</td>
	</tr>
	<!-- 성별 -->
	<tr><td class="info">성별</td>
		<td class="input_info">
			<input type="radio" name="gender" value="male" >남성
			<input type="radio" name="gender" value="female" >여성
		</td>
	</tr>	
	<!-- 생년월일 -->
	<tr><td class="info">법정생년월일</td>
		<td class="input_info">
			<select name="birthYear">
				<script>
				for(var i = 2023 ; i >=1920 ; i--){
					document.write("<option>"+i+"</option>");
				}
				</script>
			</select>년
			
			<select name="birthMonth">
				<script>
				for(var i = 12 ; i >=1 ; i--){
					document.write("<option>"+i+"</option>");
				}
				</script>
			</select>월
			
			<select name="birthDay">
				<script>
				for(var i = 31 ; i >=1 ; i--){
					document.write("<option>"+i+"</option>");
				}
				</script>
			</select>일
			
				<input type="radio" name="calendar_type" value="2">양력
				<input type="radio" name="calendar_type" value="1">음력
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
			<input type="text" name="sp2"/>	
			<input type="text" name="sp3"/><br>
			<input type="checkbox" name="sms_al" value="yes" id="input_yes1"/>SMS 광고 수신을 동의합니다.
			<input type="hidden" name="sms_al" value="no" id="input_no1">
		</td>
		</tr>
		<!-- 이메일 -->
		<tr>
			<td class="info">이메일</td>
			<td class="input_info">
				<input type="text" name="info"/>
				@<input type="text" name="input_info">
					<select name="input_info2" onchange="handleonChange(this);">
						<option selected="selected" value="null">직접입력</option>
						<option value="naver.com"&gtnaver.com></option>
						<option value="gamil.com"&gtgmail.com></option>
					</select><br>
					<input type="checkbox" name="email_al" value="yes" id="input_yes2"/>e-mail광고 수신을 동의합니다.
					<input type="hidden" name="sms_al" value="no" id="input_no2">
			</td>
		</tr>
		<!-- 주소 -->
		
		<tr>
		<td class="info">주소</td>
			<td class="input_info">
			우편번호<br><input type="text" name="addr_post"/><br>
			지번주소<br><input type="text" name="addr_lot"/><br>
			도로명 주소<br><input type="text" name="addr_road"/><br>
			나머지 주소<br><input type="text" name="addr_rest"/>
			</td>
		</tr>
	</table>
	<input type="submit" value="회원가입">	
	</form>
	
</center>
</body>
</html>