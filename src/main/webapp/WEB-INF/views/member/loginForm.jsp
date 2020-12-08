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
<link type="text/css" href="../resources/css/common.css" rel="stylesheet">
<link type="text/css" href="../resources/css/main.common.css"
	rel="stylesheet">
<link type="text/css" href="../resources/css/main.login.css"
	rel="stylesheet">
<link href="/favicon.ico" rel="shortcut icon">
<script type="text/javascript"
	src="../resources/js/extensions.jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="../resources/js/extensions.underscore-min.js"></script>
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript"
	src="../resources/js/extensions.jquery.placeholder.min.js"></script>
<script type="text/javascript" src="../resources/js/main.login.js"></script>
</head>
<body>

	<div id="container" class="login">
		<h1 class="logo">
			<a href="/">에브리타임</a>
		</h1>
		<form action="/member/login" method="post">
			<p class="input">
				<input type="text" name="id" maxlength="20" class="text"
					placeholder="아이디">
			</p>
			<p class="input">
				<input type="password" name="password" maxlength="20" class="text"
					placeholder="비밀번호">
			</p>
			<input type="hidden" name="redirect" value="/">
			<p class="submit">
				<input type="submit" value="로그인" class="text">
			</p>
			<label class="autologin"><input type="checkbox"
				name="autologin" value="1">로그인 유지</label>
			<p class="find">
				<a href="#">아이디/비밀번호 찾기</a>
			</p>
			<p class="register">
				<span>에브리타임에 처음이신가요?</span> <a href="/member/registerForm">회원가입</a>
			</p>
		</form>
	</div>
	<address>
		<ul class="links">
			<li><a href="#">이용약관</a></li>
			<li><a href="#">개인정보처리방침</a></li>
			<li><a href="#">문의하기</a></li>
			<li class="copyright"><a href="/">&copy; 에브리타임</a></li>
		</ul>
	</address>
</body>
</html>