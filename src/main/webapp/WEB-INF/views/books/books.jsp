<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>에브리타임 책방</title>
<meta charset="utf-8">
<meta name="referrer" content="origin">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="naver-site-verification"
	content="b9d866b15d44c9243c600cc22295794f83391370">
<link rel="stylesheet" type="text/css"
	href="../resources/css/assets/style.css">
<script type="text/javascript"
	src="../resources/js/assets/jquery-3.1.0.min.js"></script>
<script type="text/javascript"
	src="../resources/js/assets/underscore-min.js"></script>
<script type="text/javascript" src="../resources/js/assets/common.js"></script>
<script type="text/javascript" src="../resources/js/assets/index.js"></script>
   
</head>
<body>
	<header>
		<div id="title">
			<a href="/" class="logo"><img
				src="../resources/images/assets/logo.png" alt="에브리타임 책방"></a>
		</div>
		<div id="search">
			<form>
				<input id="bookName" type="text" name="keyword" placeholder="구매할 책을 검색하세요!"
					autocomplete="off"/>
				<div class="searchbutton">
					<button>검색<span class="icons search-darkgray-16"></span></button>
				</div>
			</form>
		</div>
	</header>
	<div id="items">
		<div class="header">
		
		<p></p>
		</div>
	</div>
<!-- 	<div id="loading">
		<img src="../resources/images/assets/loading.svg">
	</div> -->
	<div id="bar">
		<nav>
			<a href="/" class="home"><span class="icons home-darkgray-16"></span><span
				class="text">홈</span></a> <a href="/books/bookSell" class="sell"><span
				class="icons sell-darkgray-16"></span><span class="text">판매하기</span></a>
			<a href="../member/mypage" class="my"><span class="icons my-darkgray-16"></span><span
				class="text">마이페이지</span></a> <a href="../member/logout" class="my"><span
				class="icons logout-darkgray-16"></span><span class="text">로그아웃</span></a>

		</nav>
	</div>
	
	
			
<c:forEach var="booklist" items="${booklist }">
<div class="container">				
<p>책 제목 :${booklist.title}</p>
<p>저자 : ${booklist.authors}</p>
<p>출판일 : ${booklist.publistdate}</p>
<p>가격 : ${booklist.price} , ${booklist.sellprice}</p>
<p>내용 : ${booklist.contents}</p>

<h2>쪽지쓰기 message</h2>

<h2>label 책상태</h2>
<p>밑줄 : ${booklist.underline}</p>
<p>필기 : ${booklist.writing}</p>
<p>커버 : ${booklist.cover}</p>
<p>이름기입 : ${booklist.nameentry}</p>
<p>페이지 변색 : ${booklist.pagecolor}</p>
<p>페이지 훼손 : ${booklist.pagestate}</p>
<img src="${booklist.imgfile1}" style="height:189px; width:266px"/>
<img src="${booklist.imgfile2}" style="height:189px; width:266px"/>
<img src="${booklist.imgfile3}" style="height:189px; width:266px"/>

<h2>label 거래수단</h2>
<p>택배 : ${booklist.delivery}</p>
<p>직거래 : ${booklist.directdeal}</p>
<p>장소 : ${booklist.location}</p>
<hr />
</div>
	</c:forEach>	
	


	
	<div id="bottom">
		<ul class="links">
			<li class="copyright"><a href="#">에브리타임</a></li>
			<li><a href="#">문의하기</a></li>
			<li><a href="#">커뮤니티이용규칙</a></li>
			<li><a href="#">개인정보처리방침</a></li>
		</ul>

	</div>
</body>
</html>


