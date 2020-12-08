<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>판매하기 - 에브리타임 책방</title>
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
<script type="text/javascript"
	src="../resources/js/assets/canvas-to-blob.min.js"></script>
<script type="text/javascript"
	src="../resources/js/assets/load-image.all.min.js"></script>
<script type="text/javascript" src="../resources/js/assets/sell.js"></script>
<script>
	$(function() {
		$("#search")
				.click(
						function() {
							$
									.ajax(
											{
												method : "POST",
												url : "https://dapi.kakao.com/v3/search/book?target=title&size=20", // 전송 주소
												data : {
													query : $("#bookName")
															.val()
												}, // 보낼 데이터
												headers : {
													Authorization : "KakaoAK 293654733c566c2df57a50fda13d9eaa"
												},
											})
									.done(
											function(data) { // 응답이 오면 처리를 하는 코드
												console.log(data);
												var array = new Array;
												for (let i = 0; i < data.documents.length; i++) {
													array[i] = data.documents[i];
													$("#book")
													.append("<form action='bookSellForm'>"
																	+ "ISBN : <input readonly id='isbn' name='isbn' value='"+array[i].isbn+ "'/><br/>"
																	+ "책 제목 : <input readonly id='title' name='title' value='"+array[i].title+"'/><br/>"
																	+ "저자 : <input readonly id='authors' name='authors' value='"+array[i].authors+"'/><br/>"
																	+ "출판사 : <input readonly id='publisher' name='publisher' value='"+array[i].publisher+"'/><br/>"
																	+ "가격 : <input readonly id='price' name='price' value='"+array[i].price+"'/><br/>"
																	+ "옮긴이 : <input readonly id='translators' name='translators' value='"+array[i].translators+"'/><br/>"
																	+ "출판일 : <input readonly id='datetime' name='datetime' value='"+array[i].datetime+"'/><br/>"																			
																	+ "<input type='hidden' id='thumbnail' name='thumbnail' value='"+array[i].thumbnail+"'></input><br/>"
																	+ "<img src='"+array[i].thumbnail+"'/>"
																	+ "<input type='submit' value='선택'/><br/></form>");
												}
												$('#search').click(function() {
													
													$('#book').empty();
													$("#book")
													.append("<form action='bookSellForm'>"
																	+ "ISBN : <input readonly id='isbn' name='isbn' value='"+array[i].isbn+ "'/><br/>"
																	+ "책 제목 : <input readonly id='title' name='title' value='"+array[i].title+"'/><br/>"
																	+ "저자 : <input readonly id='authors' name='authors' value='"+array[i].authors+"'/><br/>"
																	+ "출판사 : <input readonly id='publisher' name='publisher' value='"+array[i].publisher+"'/><br/>"
																	+ "가격 : <input readonly id='price' name='price' value='"+array[i].price+"'/><br/>"
																	+ "옮긴이 : <input readonly id='translators' name='translators' value='"+array[i].translators+"'/><br/>"
																	+ "출판일 : <input readonly id='datetime' name='datetime' value='"+array[i].datetime+"'/><br/>"																			
																	+ "<input type='hidden' id='thumbnail' name='thumbnail' value='"+array[i].thumbnail+"'></input><br/>"
																	+ "<img src='"+array[i].thumbnail+"'/>"
																	+ "<input type='submit' value='선택'/><br/></form>");
													

												});
												
												
											});
						});


	});
</script>
</head>
<body>

	
<div id="title">
	<a href="/" class="logo"><img
		src="../resources/images/assets/logo.png" alt="에브리타임 책방"></a>
</div>
	

	

	
<div class="container" align="center">
	<input type="text" id="bookName"/>
	<input type="button" id="search" value="검색"/>
</div>

<div class="container" id="booklist">
	<p></p>
</div>

<div id="book" class='container'>

</div>


	<div id="bar">
		<nav>
			<a href="/" class="home"><span class="icons home-darkgray-16"></span><span
				class="text">홈</span></a> <a href="/bookSell" class="sell"><span
				class="icons sell-darkgray-16"></span><span class="text">판매하기</span></a>
			<a href="/my" class="my"><span class="icons my-darkgray-16"></span><span
				class="text">마이페이지</span></a> <a href="../member/logout" class="my"><span
				class="icons logout-darkgray-16"></span><span class="text">로그아웃</span></a>

		</nav>
	</div>

	<script type="text/javascript">
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'https://www.google-analytics.com/analytics.js', 'ga');
		ga('create', 'UA-82918907-1', 'auto');
		ga('send', 'pageview');
	</script>
</body>
</html>

