<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	
<meta charset="utf-8">
<title>login</title>
	<style>
  body { background-color: skyblue};
  
  }
  </style>
<%@ include file="mydbcon.jsp" %>
	<script>
	function memLogin(){
		
		var member_id = document.pagelogin.member_id.value;
		var member_pw =  document.pagelogin.member_pw.value;
	}
	</script>
	<!-- 관리자 권한 -->
	<script>
		function showlist(){
			var master_id = "master*";
			var controll = document.getElementById('controll').value;
			if(controll != master_id){
				alert("관리자 코드를 다시 입력해주세요.");
				return false;
			} else{
				alert('관리자 페이지로 이동합니다.');
				window.location.href='membership_showlist.jsp';
				return true;
			}
		}
	</script>
</head>
<body>
	<div id="login_table">
	<center>
	<h3>로그인 페이지</h3>
	<form name="pagelogin" action="membership_login_ok.jsp" method=get onSubmit="return  memLogin()">
	
		<table border="1">
			<!-- 아이디를 입력하는 부분 -->
			<tr><td class="info" style="background-color : rgb(111,167,235)"><center>아이디</center></td>
				<td class="input_info">
					<input type="text" name="member_id" id="member_id" placeholder="아이디">
					
				</td>
			</tr>
			<!-- 비밀번호를 입력하는 부분 -->
			<tr><td class="info" style="background-color : rgb(111,167,235)">비밀번호</td>
				<td class="input_info">
					<input type="password" name="member_pw" id="member_pw" placeholder="비밀번호">
				</td>
			</tr>
		</table>
			<input type="submit" value="로그인"><br><br>	
		</form>
		
		<!-- 회원 가입페이지로 이동 -->
		<form action="membership_myself.jsp" method="get" name="join" id="join">
			
			<input type="submit" value="회원가입"><br><br>
		</form>
		
	<!-- 관리자 -->
		회원목록 보기<br>
		<input type='password' class="textbox" name='controll' id='controll' placeholder="마스터 코드"><br>
		<button class="button" onclick="return showlist()">확인</button>
	</div>
	</center>
</body>
</html>