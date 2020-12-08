<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../resources/js/analytics.js"></script>
<script src="../resources/js/js"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'UA-22022140-4');
</script>

<meta name="referrer" content="origin">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="naver-site-verification"
	content="7366738375e320e44bd1c743b364db13086a7b0e">
<link rel="shortcut icon" href="https://everytime.kr/favicon.ico">
<title>내 정보 - 에브리타임</title>
<meta data-vue-meta="ssr" name="robots" content="noindex">
<link data-vue-meta="ssr" rel="preload"
	href="../resources/css/06120e1dea0c25bff10b.css" as="style">
<link data-vue-meta="ssr" rel="preload"
	href="../resources/js/27822707936c11d99371.js" as="script">
<link data-vue-meta="ssr" rel="preload"
	href="../resources/css/3486d6a4ee769b24932f.css" as="style">
<link data-vue-meta="ssr" rel="preload"
	href="../resources/js/4cc5dfc69896be9c902c.js" as="script">
<link data-vue-meta="ssr" rel="stylesheet"
	href="../resources/css/9fc4a99517b44451708c.css">
<script data-vue-meta="ssr"
	src="../resources/js/8f9dc74ed2d52ef78a57.js"></script>
<script data-vue-meta="ssr"
	src="../resources/js/bbd6e3b1091719ef10c5.js"></script>
<script data-vue-meta="ssr"
	src="../resources/js/b67f8ef83fedca8548e2.js"></script>
<script data-vue-meta="ssr"
	src="../resources/js/23c32f7b0e4f7bc381be.js"></script>
<link rel="stylesheet" type="text/css"
	href="../resources/css/3486d6a4ee769b24932f.css">
<script charset="utf-8" src="../resources/js/4cc5dfc69896be9c902c.js"></script>
<link rel="stylesheet" type="text/css"
	href="../resources/css/06120e1dea0c25bff10b.css">
<script charset="utf-8" src="../resources/js/27822707936c11d99371.js"></script>
<script charset="utf-8" src="../resources/js/8fc9644612a1a1900eb2.js"></script>
</head>
<body>

	<div data-v-cd48e290="">
		<header data-v-78651b21="" data-v-cd48e290="">
			<div data-v-78651b21="" class="head">
				<div data-v-78651b21="" class="wrap">
					<div data-v-78651b21="" class="logo">
						<a data-v-78651b21="" href="/main"><img data-v-78651b21=""
							src="../resources/images/nav.logo.png"></a>
						<h1 data-v-78651b21="">
							<p data-v-78651b21="" class="subname">에브리타임</p>
							<p data-v-78651b21="" class="name">일산학원</p>
						</h1>
					</div>
					<nav data-v-78651b21="">
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="#"> 게시판 </a>
						</div>
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="#"> 시간표 </a>
						</div>
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="#"> 강의평가 </a>
						</div>
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="#"> 학점계산기 </a>
						</div>
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="#"> 친구 </a>
						</div>
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="#"> 책방 </a>
						</div>
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="#"> 캠퍼스픽 </a>
						</div>
					</nav>
					<div data-v-78651b21="" class="account">
						<a data-v-78651b21="" href="../message/my_receivedMail"
							title="쪽지함" class="icon message"> 쪽지함 </a> <a data-v-78651b21=""
							href="/member/mypage" title="내 정보" class="icon my"> 내 정보 </a>
					</div>
				</div>
				<div data-v-78651b21="" class="backdrop"></div>
			</div>
			<div data-v-78651b21="" class="navbar">
				<a data-v-78651b21="" class="hamburger">메뉴 열기</a>
				<h1 data-v-78651b21="">내 정보</h1>
			</div>
		</header>
		<div data-v-cd48e290="" class="container">
			<section data-v-cd48e290="">
				<div data-v-cd48e290="" class="title">
					<h1 data-v-cd48e290="">내 정보</h1>
					<a data-v-cd48e290="" href="/member/logout" class="logout">로그아웃</a>
				</div>
				<div data-v-cd48e290="" class="profile">
					<img data-v-cd48e290="" src="../resources/images/0.png">
					<h3 data-v-cd48e290="">${member.id }</h3>
					<p data-v-cd48e290="">
						<span data-v-cd48e290="">${member.nickname }</span> / <span
							data-v-cd48e290="">${member.academyname }</span>
					</p>
					<p data-v-cd48e290="">
						<span data-v-cd48e290="">일산학원</span> <span data-v-cd48e290="">16</span>학번
					</p>
				</div>
			</section>
			<section data-v-cd48e290="">
				<h2 data-v-cd48e290="">계정</h2>
				<a data-v-cd48e290="" href="#" class="item">학교 인증</a> <a
					data-v-cd48e290="" href="#" class="item">비밀번호 변경</a> <a
					data-v-cd48e290="" href="#" class="item">이메일 변경</a>
			</section>
			<section data-v-cd48e290="">
				<h2 data-v-cd48e290="">커뮤니티</h2>
				<a data-v-cd48e290="" href="#" class="item">닉네임 설정</a> <a
					data-v-cd48e290="" href="#" class="item">이용 제한 내역</a> <a
					data-v-cd48e290="" href="#" class="item">게시판 관리</a> <a
					data-v-cd48e290="" href="#" class="item">커뮤니티 이용규칙</a>
			</section>
			<section data-v-cd48e290="">
				<h2 data-v-cd48e290="">이용 안내</h2>
				<a data-v-cd48e290="" href="#" class="item">문의하기</a> <a
					data-v-cd48e290="" href="#" class="item">공지사항</a> <a
					data-v-cd48e290="" href="#" class="item">서비스 이용약관</a> <a
					data-v-cd48e290="" href="#" class="item">개인정보 처리방침</a>
			</section>
			<section data-v-cd48e290="">
				<h2 data-v-cd48e290="">기타</h2>
				<a data-v-cd48e290="" href="#" class="item">정보 동의 설정</a> <a
					data-v-cd48e290="" href="/member/delete" class="item">회원 탈퇴</a>
			</section>
		</div>
		<footer data-v-20651ef4="" data-v-cd48e290="">
			<a data-v-20651ef4="" href="#"> 이용약관 </a> <a data-v-20651ef4=""
				href="#"> 개인정보처리방침 </a> <a data-v-20651ef4="" href="#"> 커뮤니티이용규칙
			</a> <a data-v-20651ef4="" href="#"> 문의하기 </a> <a data-v-20651ef4=""
				href="#" class="copyright"> © 에브리타임 </a>
		</footer>
	</div>


</body>
</html>