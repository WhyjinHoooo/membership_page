<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if(data.buildingName !== '' && data.apartment === 'Y'){
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if(extraRoadAddr !== ''){
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }
      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
      if(fullRoadAddr !== ''){
        fullRoadAddr += extraRoadAddr;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
      document.getElementById('roadAddress').value = fullRoadAddr;
      document.getElementById('jibunAddress').value = data.jibunAddress;

      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if(data.autoRoadAddress) {
        //예상되는 도로명 주소에 조합형 주소를 추가한다.
        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

      } else if(data.autoJibunAddress) {
          var expJibunAddr = data.autoJibunAddress;
          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
      } else {
          document.getElementById('guide').innerHTML = '';
      }
      
     
    }
  }).open();
}

function fn_overlapped(){
    var _id=$("#_member_id").val();
    if(_id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"overlapped.jsp",
       dataType:"json",
       data: {id:_id},
       success:function (data,textStatus){
    	   
    //	   alert(data.result);
    	   
          if(data.result=='false'){
       	    alert("사용할 수 있는 ID입니다.");
       	    $('#btnOverlapped').prop("disabled", true);
       	    $('#_member_id').prop("disabled", true);
       	    $('#member_id').val(_id);
          }else{
        	  alert("사용할 수 없는 ID입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");
       },
       complete:function(data,textStatus){
          //alert("작업을완료 했습니다");
       }
    });  //end ajax	 
 }	
</script>


<!--
  <title>회원 가입</title>
	<script>
		function validateForm(){
			var id = document.registerform.id.value;
			
			var pwd1 = document.registerform.pwd1.value;
			var userName = document.registerform.userName.value;
			var gender = document.registerform.gender.value;
			
			var birthYear = document.registerform.birthYear.value;
			var birthMonth = document.registerform.birthMonth.value;
			var birthDay = document.registerform.birthDay.value;
			
			var callNumF = document.registerform.callNumF.value;
			var callNumM = document.registerform.callNumM.value;
			var callNumE = document.registerform.callNumE.value;
			
			var phoneNum1 = document.registerform.phoneNum1.value;
			var phoneNum2 = document.registerform.phoneNum2.value;
			var phoneNum3 = document.registerform.phoneNum3.value;
			
			var calendar_type = document.registerform.calendar_type.value;
			var calendar_solar = document.registerform.calendar_solar.value;
			var calendar_lunar = document.registerform.calendar_lunar.value;
			
			var email = document.registerform.email.value;
			var emailId = document.registerform.emailId.value;
			var edomain = document.registerform.edomain.value;
			
			
			var address = document.registerform.address.value;
			var postcode = document.registerform.postcode.value;
			var addressDe = document.registerform.addressDe.value;
			var addressRoad = document.registerform.addressRoad.value;
			var addressLast = document.registerform.addressLast.value;
			
			
			return true;
			
		}
	</script>
	-->
</head>
<body>
	
	<!-- =================================================================== --> 
	<h3>필수입력사항</h3>
	<form action="regist_ok.jsp" method="get">
	<div id="datail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">아이디</td>
					<td>
						<input type=text name="_member_id" id="_member_id" size="20" />
						<input type="hidden" name="member_id" id="member_id" />
					
						<input type="button" id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" />
					</td>	 
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">비밀번호</td>
					<td><input name="member_pw" type="password" size="20" /></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">비밀번호 확인</td>
					<td><input name="member_confirm_pw" type="password" size="20"></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이름</td>
					<td><input name="member_name" type="text" size="20" /></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">성별</td>
					<td><input type="radio" name="member_gender" value="female" />
						여성<span style="padding-left:120px"></span>
						<input type="radio" name="member_gender" value="male" checked />남성
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">법정생년월일</td>
					<td>
					<select name="member_birth_y">
					
						<c:forEach var="year" begin="1" end="100">
							<c:choose>
								<c:when test="${year==80}">
									<option values="${1920+year }" selected>${ 1920+year} </option>
								</c:when>
								<c:otherwise>
									<option values="${ 1920+year}" > ${ 1920+year}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>		 
					</select>년
					<select name="member_birth_m">
						<c:forEach var="month" begin="1" end="12">
							<c:choose>
								<c:when test="${month==5 }">
									<option values="${month }" selected>${month }</option>
								</c:when>
								<c:otherwise>
									<option value="${month }" > ${month }</option>
								</c:otherwise>
							</c:choose>		
						</c:forEach>		
					</select>월
					<select name="member_birth_d">
						<c:forEach var="day" begin="1" end="31">
							<c:choose>
								<c:when test="${day==10 }">
									<option values="${day }" selected>${day }</option>
								</c:when>
								<c:otherwise>
									<option value="${day }" > ${day }</option>
								</c:otherwise>
							</c:choose>		
						</c:forEach>
					</select>일 <span style="padding-left: 50px"></span>
						<input type="radio" name="member_birth_gn" value="2" checked>양력
							<span style="padding-left:50px"></span>
						<input type="radio" name="member_birth_gn" value="1">음력
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">전화번호</td>
					<td><select name="tel1">
						<option>없음</option>
						<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
							<option value="0502">0502</option>
							<option value="0503">0503</option>
							<option value="0505">0505</option>
							<option value="0506">0506</option>
							<option value="0507">0507</option>
							<option value="0508">0508</option>
							<option value="070">070</option>
						</select> -<input size="10px" type="type" name="tel2"> - <input size="10px" type="text" name="tel3">
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_line">휴대전화</td>
					<td><select name="hp1">
							<option>없음</option>
							<option selected value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> - <input size="10px" type="text" name="hp2"> - <input size="10px" type="text" name="hp3"><br> <br>
						<input type="checkbox" name="smssts_yn" value="Y" checked />쇼핑몰에서 발송하는 SMS소식을 수신합니다.</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이메일<br>(e-mail)</td>
					<td><input size="10px" type="text" name="email1" /> @ <input size="10px" type="text" name="email2">
						<select name="email2" onchange="" title="직접입력">
							<option value="non">직접입력</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="naver.com">naver.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="paran.com">paran.com</option>
							<option value="nate.com">nate.com</option>
							<option value="google.com">google.com</option>								<option value="gmail.com">gmail.com</option>
							<option value="empal.com">empal.com</option>
							<option value="korea.com">korea.com</option>
							<option value="freechal.com">freechal.com</option>
						</select><br> <br> <input type="checkbox" name="emailsts_yn" value="Y" checked />쇼핑몰에서 발송하는 e-mail을 수신합니다.</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td>
						<input type="text" id="zipcode" name="zipcode" size="10"><a href="javascript:execDaumPostcode()">우편번호검색</a>	
						<br>
						<p>
						지번 주소: <br><input type="text" id="roadAddress"	 name="roadAddress" size="50"><br><br>
						도로명 주소: <input type="text" id="jibunAddress" name="jibunAddress" size="50"><br><br>
						나머지 주소: <input type="text" name="namujiAddress" size="50" />
						</p>
					</td>
				</tr>
			</tbody>	
	 	</table>
	 </div>	
	 <div class="clear">
	 <br><br>
	 <table align=center>
	 	<tr>
	 		<td>
	 		<input type="submit" value="회원가입">
	 		<input type="submit" value="다시입력">
	 		</td>
	 	</tr>
	 </table>
	 </div>		 
	 </form>
	<!-- =================================================================== -->
	<!--  
	<form name = "registerform" action = "./regist_ok.jsp" onSubmit = "return validateForm()">
	<table border="1">
	<tr>
		<th><label for="id">아이디</label></th>
		<th>
		<input type = "text" id = "id" name = "id">
		<button type="button" onclick=checkDuplicate()>중복확인</button><br>
		</th>
	</tr>
		
	<tr>
		<th><label for="pwd1">비밀번호</label></th>
		<th><input type="password" name="pwd1" id="pwd1"><br></th>
	</tr>
	
	<tr>	
		<th><label for="userName">이름</label></th>
		<th><input type="text" name="userName" id="userName"><br></th>
	</tr>
	
	<tr>
		<th><label for="gender">성별</label></th>
		<th><input id="male" type="radio" name="gender" value="male" >
		<label for="male">남성</label>
		<input id="female" type="radio" name="gender" value="female" >
		<label for="femame">여성</label><br></th>
	</tr>	
	
	<tr>
		<th><label for="birthYear">법정생년월일</label></th>
			<th><select id="birthYear">
				<option value="">출생년도</option>
				<option value="2000">2000</option>
				<option value="1999">1999</option>
				<option value="1998">1998</option>
				<option value="1997">1997</option>
				<option value="1996">1996</option>
				<option value="1995">1995</option>
				<option value="1994">1994</option>
				<option value="1993">1993</option>
				<option value="1992">1992</option>
				<option value="1991">1991</option>
				<option value="1990">1990</option>
				<option value="1989">1989</option>
			</select>
		<label>년</label>
			<select id="birthMonth">
				<option value="">출생월</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
		<label>월</label>
			<select id="birthDay">
				<option value="">출생일</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">23</option>
				<option value="25">24</option>
				<option value="25">25</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
				<option value="29">29</option>
				<option value="30">30</option>
				<option value="31">31</option>
			</select>
			<label>일</label>
			
			<input type="radio" id="calendar_solar" name="calendar_type" value="solar" >
			<label for="calendar_solar">양력</label>
			<input type="radio" id="calendar_lunar"  name="calendar_type" value="lunar" >
			<label for="calendar_lunar">음력</label><br></th>
		</tr>	
		
		<tr>	
		<th><label for="callNumF">전화번호</label></th>
		<th>
			<select id="callNum">
				<option value="">없음</option>
				<option value="031">031</option>
				<option value="051">051</option>
				<option value="02">02</option>
			</select>
		<label>-</label>
		<input type="text" id="callNumM" pattern="[0-9]{3}">
		<label>-</label>	
		<input type="text" id="callNumE" pattern="[0-9]{4}"><br></th>
		<!-- 
			<input name="phoneNum1" id="phoneNum1" type="text">
		<label>-</label>
			<input name="phoneNum2" id="phoneNum2" type="text"><br>	
			
		</tr>	
		<tr>	
		<th><label for="phoneNum1">휴대폰번호</label></th>
			<th><select id="phoneNum1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select>
		<label>-</label>	
			<input name="phoneNum2" id="phoneNum2" type="text" pattern="[0-9]{4}">
		<label>-</label>
			<input name="phoneNum3" id="phoneNum3" type="text" pattern="[0-9]{4}">
			</th>
		</tr>	
		
		<tr>
			<th><label for="email">이메일</label></th>
			<th>
				<input id="emailId" name="emailId">
				<label>@</label>
				<input id="edomain" name="edomain">
					<select id="edomain" name="edomain" onchange="toogleEnainInput()">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gamil.com">gmail.com</option>
					</select>
			
			</th>
		</tr>
		
		
		<tr>
		<th><label for="address">주소</label></th>
			
			<th>
			<label for="postcode"></label>		
			<input type="text" id="postcode" name="postcode">
			<button type="button" onclick="">우편번호검색</button><br>
			<label for="addressDe">지번 주소:</label>
			<input type="text" id="addressDe" name="addressDe"><br><br>
			<label for="addressRoad">도로명 주소:</label>
			<input type="text" id="addressRoad" name="addressRoad"><br><br>
			<label for="addressLast">나머지 주소:</label>
			<input type="text" id="addressLast" name="addressLast"><br>
			</th>
		</tr>
	</table>
	<input type="submit" value="register">	
	</form>
	-->
</body>
</html>