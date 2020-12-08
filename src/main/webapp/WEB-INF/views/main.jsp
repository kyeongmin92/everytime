<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>에브리타임</title>

<meta name="referrer" content="origin">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="robots" content="noindex">
<link type="text/css" href="/resources/css/common.css" rel="stylesheet">
<link type="text/css" href="/resources/css/common.partial.css"
	rel="stylesheet">
<link type="text/css" href="/resources/css/container.community.css"
	rel="stylesheet">
<link href="#" rel="shortcut icon">
<script type="text/javascript" src="/js/analytics.js"></script>
<script type="text/javascript"
	src="/resources/js/extensions.jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="/resources/js/extensions.underscore-min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/community.side.js"></script>
<script type="text/javascript" src="/resources/js/community.index.js"></script>

<!-- popup -->
<script type="text/javascript">
	/* 창 크기 설정 */
	function setting(w, h) {
		var popupWidth = w;
		var popupHeight = h;
		var popupX = Math.ceil(window.screen.width - popupWidth) / 2;
		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		var popupY = Math.ceil(window.screen.height - popupHeight) / 2;
		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
		var option = "width=" + w + ",height=" + h + ",left=" + popupX
				+ ",top=" + popupY + ",screenX=" + popupX + ",screenY="
				+ popupY + "resizable=no;";
		return option;
	}
	
	/* 쪽지쓰기 버튼 이벤트 */
	function sendmessagePopup() {
		var url = "/message/sendmessagePopup";
		var newOption = setting(504, 413);
		window.open(url, "", newOption);
	}

	/* 내 쪽지함 버튼 이벤트 */
	function myMsgsPopup() {
		var url = "/message/my_receivedMail";

		var newOption = setting(500, 471);

		window.open(url, "", newOption);
	}
</script>
</head>
<body>
	<nav>
		<div class="wrap">
			<div id="logo">
				<a href="#"><img src="/resources/images/nav.logo.png"></a>
				<p>
					<span class="name multiple">에브리타임즈</span><span class="subname">일산학원</span>
				</p>
			</div>
			<div id="account">
				<c:set var="id" value="${member.id }" />
				<c:if test="${not empty member.id }">
					<div style="height: 187px;">

						<a href="javascript:myMsgsPopup();"
							style="font-size: 13px; color: #7d7d7d">쪽지함</a> <a
							href="javascript:sendmessagePopup();"
							style="font-size: 13px; color: #7d7d7d">쪽지쓰기</a> <a
							href="/mypage">내 정보</a>


					</div>

				</c:if>
				<c:if test="${empty id }">
					<a href="/member/loginForm" class="button">로그인</a>
					<a href="/member/registerForm" class="button red">회원가입</a>'
			</c:if>
			</div>
			<ul id="menu">
				<li class="active"><a href="#">게시판</a></li>
				<li><a href="#">시간표</a></li>
				<li><a href="#">강의평가</a></li>
				<li><a href="#">학점계산기</a></li>
				<li><a href="#">친구</a></li>
				<li><a href="/books/books">책방</a></li>
				<li><a href="#">캠퍼스픽</a></li>
			</ul>
		</div>
	</nav>
	<div id="submenu">
		<div class="wrap">
			<ul>
				<li><a href="/board/freeboard/freeBoardList" data-id="393887" class="new">자유게시판</a></li>
				<li><a href="#" data-id="260228" class="new">비밀게시판</a></li>
				<li><a href="#" data-id="412760">새내기게시판</a></li>
				<li><a href="#" data-id="260230">정보게시판</a></li>
				<li><a href="/board/promotionboard/promotionBoardList" data-id="367769">홍보게시판</a></li>
				<li><a href="#" data-id="419094">동아리·학회</a></li>
				<li><a href="#" class="search">게시판 찾기</a></li>
			</ul>
			<hr>
		</div>
		<input type="hidden" id="communityCampusId" value="379">
	</div>
	<div id="container" class="community">
		<aside class="none">
			<form class="search">
				<input type="search" name="keyword" class="text"
					placeholder="전체 게시판의 글을 검색하세요!">
			</form>
			<div class="title">
				<a class="hamburger"></a>
				<h1>한국방송통신대 에브리타임</h1>
				<ol class="buttons">
					<li><a href="/member/loginForm">로그인</a></li>
				</ol>
			</div>
		</aside>
		<div class="banners">
			<a href="#"><img
				src="resources/images/20201101_jobfairfic_home.jpg"></a>
		</div>
		<div class="leftside">
			<div class="card pconly">

				<c:if test="${empty id }">
					<form class="login">
						<h3>
							커뮤니티 이용을 위해<br> <strong>로그인</strong>이 필요합니다!
						</h3>
						<a href="/member/loginForm" class="button login">로그인</a> <a
							href="/member/registerForm" class="button register">에브리타임 회원가입</a>
					</form>
				</c:if>
				<c:if test="${not empty id }">
					<form class="logged">
						<img src="https://cf-fpi.everytime.kr/0.png" class="picture">
						<p class="nickname">${member.id }</p>
						<p class="school">${member.nickname }</p>
						<ul class="buttons">
							<li><a href="/member/mypage">내 정보</a></li>
							<li><a href="/member/logout">로그아웃</a></li>
						</ul>
						<hr>
						<div class="card">
							<div class="menus">
								<a href="/myarticle" class="myarticle">내가 쓴 글</a> <a
									href="/mycommentarticle" class="mycommentarticle">댓글 단 글</a> <a
									href="/myscrap" class="myscrap">내 스크랩</a>
								<hr>
							</div>
						</div>
					</form>
				</c:if>

			</div>
			<div class="card">
				<div class="banner">
					<a href="#"><img src="resources/images/20201028_ipad_card.jpg"></a>
				</div>
			</div>
			<div class="card">
				<div class="banner">
					<a href="#"><img
						src="resources/images/20201102_unity_Lego_card.png"></a>
				</div>
			</div>
			<div class="card">
				<div class="banner">
					<a href="#"><img
						src="resources/images/20201102_tourbiz_card.jpg"></a>
				</div>
			</div>
		</div>
		<div class="rightside">
			<form class="search">
				<input type="text" name="keyword" placeholder="전체 게시판의 글을 검색하세요!"
					class="text">
			</form>
			<div class="card">
				<div class="board">
					<h3>
						<a href="#">HOT 게시물<span>더 보기</span></a>
					</h3>
					<a class="list"><time>05/25 04:59</time>
						<p>인증 후 이용가능</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="#">BEST 게시판<span>더 보기</span></a>
					</h3>
				</div>
			</div>
		</div>
		<div class="main">
			<div class="card">
				<div class="board">
					<h3>
						<a href="/board/freeboard/freeBoardList">자유게시판</a>
					</h3>
					<a class="list" href="#"><time>11/04 18:30</time>
						<p>과제가 너무 재밌어요</p>
						<hr></a><a class="list" href="#"><time>11/04 01:40</time>
						<p>대학영어 과제</p>
						<hr></a><a class="list" href="#"><time>11/03 13:36</time>
						<p>f받으려고 하는데</p>
						<hr></a><a class="list" href="#"><time>11/02 16:40</time>
						<p>지누션의 말해줘를 학생의 심정으로 개사해봤습니다</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="#">비밀게시판</a>
					</h3>
					<div class="needauth">
						<p>
							로그인을 한 학생들만<br>이용할 수 있어요!
						</p>
						<a class="button" href="/member/loginForm">로그인</a>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="#">새내기게시판</a>
					</h3>
					<a class="article" href="#"><p>
							안녕하세요! 청소년교육과 1학년 2학기 입학한 20살 새내기입니다! 잘부탁드립니다.<br>평소 활동하고
							새로운 사람을 만나는 것을 좋아해 여러가지
						</p> <time>10/17 21:27</time>
						<ul class="status">
							<li class="vote active">1</li>
							<li class="comment active">0</li>
						</ul>
						<hr></a><a class="article" href="#"><p>미디어 영상학과 1학년 1학기
							교재 판매합니다.</p> <time>09/15 17:48</time>
						<ul class="status">
							<li class="vote active">0</li>
							<li class="comment active">0</li>
						</ul>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="#">정보게시판</a>
					</h3>
					<a class="list" href="#"><time>03/14 19:54</time>
						<p>지역대학, 학습관 와이파이 (전국 공통)</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="/board/promotionboard/promotionBoardList">홍보게시판</a>
					</h3>
					<a class="list" href="#"><time>10/17 21:49</time>
						<p>서울시에서 진행하는 MBTI모임</p>
						<hr></a><a class="list" href="#"><time>08/12 14:48</time>
						<p>제주청년농부와 함께 영농창업 준비해요:)</p>
						<hr></a><a class="list" href="#"><time>05/04 22:50</time>
						<p>연구참여자 모집 (만원 상당 상품권 증정)</p>
						<hr></a><a class="list" href="#"><time>03/03 16:40</time>
						<p>번역기 모음 사이트를 만들었어요.</p>
						<hr></a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="#">동아리·학회</a>
					</h3>
					<a class="list" href="#"><time>06/13 04:26</time>
						<p>React 같이 공부하실 학우 구합니다!</p>
						<hr></a><a class="list" href="#"><time>19/04/04 15:36</time>
						<p>영상동아리 한번 모집해보려 합니다!</p>
						<hr></a>
				</div>
			</div>
			<hr>
			<div class="bookstore">
				<a class="item" href="#"><div class="image"
						style="background-image: url(&quot;https://cf-cii.everytime.kr/9394d19a93cb53a81211043c07da93df703a677442d1ccf233ceb09c3865c0ef/1603893149386_0_thumb.jpg&quot;);"></div>
					<h4>국제경영의이해(2학기, 워크북포함)</h4> <span class="price">7,000원</span></a><a
					class="item" href="https://bookstore.everytime.kr/"><div
						class="image"
						style="background-image: url(&quot;https://cf-cii.everytime.kr/af1acac05850d5a6569a2c24d7c9674562cdbaba8a52fb603ca930f0a4583a44/1602937572740_0_thumb.jpg&quot;);"></div>
					<h4>시뮬레이션(2학기, 워크북포함)</h4> <span class="price">12,000원</span></a><a
					class="item" href="https://bookstore.everytime.kr/"><div
						class="image"
						style="background-image: url(&quot;https://cf-cii.everytime.kr/ab4d648ad79fa67b4e1e87b13baf0bcb8652282449c0309d4f82b73e76c64c0b/1602937498311_0_thumb.jpg&quot;);"></div>
					<h4>UNIX시스템(2학기, 워크북포함)</h4> <span class="price">12,000원</span></a><a
					class="item" href="https://bookstore.everytime.kr/"><div
						class="image"
						style="background-image: url(&quot;https://cf-cii.everytime.kr/58b4ec1d31cd2fb3a632836aa946eb8188ee05c3c25a37d07a9c5fe2d8df039a/1602937381076_0_thumb.jpg&quot;);"></div>
					<h4>컴파일러구성(2학기, 워크북포함)</h4> <span class="price">11,000원</span></a>
			</div>
		</div>
	</div>
	<div id="bottom">
		<ul class="links">
			<li><a href="#">이용약관</a></li>
			<li><a href="#">개인정보처리방침</a></li>
			<li><a href="#">커뮤니티이용규칙</a></li>
			<li><a href="#">공지사항</a></li>
			<li><a href="#">문의하기</a></li>
			<li class="copyright"><a href="#">© 에브리타임</a></li>
		</ul>
	</div>
	<script type="text/javascript">
		var _serverTime = 1604556816282;
		var _clientTime = new Date().getTime();
		var _diffTime = _clientTime - _serverTime;
		var _apiServerUrl = 'https://api.everytime.kr';
	</script>
	<script src="/resources/js/js"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
		gtag('config', 'UA-22022140-4');
	</script>
</body>
</html>