<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호와 암호 확인이 다릅니다");
			frm.password.focus();
			frm.password.value = "";
			return false;
		}
	}
</script>
</head>
<body>
<form id="container" data-adagreement="1" data-redirecturl="/"
	onsubmit="return chk()" method="post" name="frm">
    <h2>회원 정보 수정</h2>
    <div class="input">
      <div class="label"><label>아이디</label><p>영문, 숫자, 4~20자</p></div>
      <input type="text" name="userid" maxlength="20" placeholder="아이디" autocomplete="off" value="${member.id }">
      <div class="caution"></div>
    </div>
    <div class="input">
      <div class="label"><label>비밀번호</label><p>4~20자</p></div>
      <input type="password" name="password" maxlength="20" placeholder="비밀번호">
      <div class="caution"></div>
      <input type="password" name="password2" maxlength="20" placeholder="비밀번호 확인">
      <div class="caution"></div>
    </div>
    <div class="input">
      <div class="label"><label>이메일</label></div>
      <input type="email" name="email" placeholder="이메일" autocomplete="off">
      <div class="caution"></div>
    </div>
    <div class="input">
      <div class="label"><label>닉네임</label><p>커뮤니티 활동에 필요</p></div>
      <input type="text" name="nickname" maxlength="10" placeholder="닉네임" autocomplete="off">
      <div class="caution"></div>
    </div>
    <div class="input">
    	<div class="label"><label >학원명</label></div>
    	<input type="text" name="academyname" maxlength="20" placeholder="학원명" autocomplete="off"/>
    </div>
    <input type="submit" value="수정">
  </form>

  <script type="text/javascript">
    var _serverTime = 1604572463616;
    var _clientTime = new Date().getTime();
    var _diffTime = _clientTime - _serverTime;
    var _apiServerUrl = 'https://api.everytime.kr';
  </script>
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-22022140-4"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'UA-22022140-4');
  </script>
</body>
</html>