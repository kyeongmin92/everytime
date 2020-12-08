<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>에브리타임</title>
  <meta charset="utf-8">
  <meta name="referrer" content="origin">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="robots" content="noindex">
  <link type="text/css" href="../resources/css/register.css" rel="stylesheet">
  <link href="/favicon.ico" rel="shortcut icon">
  <script type="text/javascript" src="../resources/js/extensions.jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="../resources/js/extensions.underscore-min.js"></script>
  <script type="text/javascript" src="../resources/js/common.js"></script>
  <script type="text/javascript" src="../resources/js/register.info.js"></script>
</head>
<script type="text/javascript">
	function idChk() {
		if (!frm.id.value) { alert("아이디 입력하고 중복체크하시오");
			frm.id.focus(); return false;			
		}
		$.post('idChk','id='+frm.id.value, function(data) {
			$('#disp').html(data);
		});
	}
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호와 암호 확인이 다릅니다");
			frm.password.focus(); frm.password.value="";
			return false;
		}
	}
</script>
<body>

<form id="container" data-adagreement="1" data-redirecturl="/"
	onsubmit="return chk()" method="post" name="frm" action="/member/register">
    <h2>회원 정보</h2>
    <div class="input">
      <div class="label"><label>아이디</label><p>영문, 숫자, 4~20자</p></div>
      <input type="text" name="id" maxlength="20" placeholder="아이디" autocomplete="off">
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
      <div class="label"><label>닉네임</label><p>커뮤니티 활동에 필요</p></div>
      <input type="text" name="nickname" maxlength="10" placeholder="닉네임" autocomplete="off">
      <div class="caution"></div>
    <div class="input">
      <div class="label"><label>이메일</label><p>아이디/비밀번호 찾기에 필요</p></div>
      <input type="email" name="email" placeholder="이메일" autocomplete="off">
      <div class="caution"></div>
    </div>
    </div>
    <div class="input">
    	<div class="label"><label >학원명</label></div>
    	<input type="text" name="academyname" maxlength="20" placeholder="학원명" autocomplete="off"/>
    </div>
    <input type="submit" value="회원가입">
  </form>
</body>
</html>