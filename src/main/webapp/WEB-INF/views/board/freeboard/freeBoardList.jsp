<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에브리타임</title>

<meta name="referrer" content="origin">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link type="text/css" href="/../resources/css/common.css"
	rel="stylesheet">
<link type="text/css" href="/../resources/css/common.partial.css"
	rel="stylesheet">
<link type="text/css" href="/../resources/css/container.article.css"
	rel="stylesheet">
<link type="text/css" href="/../resources/css/container.community.css"
	rel="stylesheet">
<link type="text/css" href="/../resources/css/container.modal.css"
	rel="stylesheet">
<link href="#" rel="shortcut icon">
<link rel="stylesheet"
	href="/../resources/bootstrap/css/bootstrap-grid.min.css">
<link rel="stylesheet"
	href="/../resources/bootstrap/css/bootstrap-reboot.min.css">
<script type="text/javascript" src="/..resources/js/analytics.js"></script>
<script type="text/javascript"
	src="/../resources/js/extensions.jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="/../resources/js/extensions.underscore-min.js"></script>
<script type="text/javascript" src="/../resources/js/common.js"></script>
<script type="text/javascript"
	src="/../resources/js/extensions.canvas-to-blob.min.js"></script>
<script type="text/javascript"
	src="/../resources/js/extensions.load-image.all.min.js"></script>
<script type="text/javascript" src="/../resources/js/board.index.js"></script>
<script type="text/javascript" src="/../resources/js/community.side.js"></script>
<script type="text/javascript" src="/../resources/js/message.send.js"></script>

<style>
input[type=submit] {
	padding: 5px 15px;
	background: white;
	border: 0 none;
	cursor: pointer;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

.mButton {
	margin: 10px 0;
	padding: 0 4px 0 0;
	text-align: right;
}
</style>
</head>
<body>
	<nav>
		<div class="wrap">
			<div id="logo">
				<a href="/main"><img src="/../resources/images/nav.logo.png"></a>
				<p>
					<span class="name multiple">에브리타임</span><span class="subname">일산학원</span>
				</p>
			</div>
			<div id="account">
				<c:if test="${not empty member.id }">
					<a href="/../message/my_receivedMail" title="쪽지함"
						class="icon message">쪽지함</a>
					<a href="/../member/mypage" title="내 정보" class="icon my">내 정보</a>
				</c:if>
				<c:if test="${empty member.id }">
					<a href="/../member/loginForm" class="button">로그인</a>
					<a href="/../member/registerForm" class="button red">회원가입</a>'
			</c:if>
			</div>
			<ul id="menu">
				<li class="active"><a href="#">게시판</a></li>
				<li><a href="#">시간표</a></li>
				<li><a href="#">강의평가</a></li>
				<li><a href="#">학점계산기</a></li>
				<li><a href="#">친구</a></li>
				<li><a href="/../books//books">책방</a></li>
				<li><a href="#">캠퍼스픽</a></li>
			</ul>
		</div>
	</nav>
	<div id="submenu">
		<div class="wrap">
			<div class="divider"></div>
			<div class="group">
				<ul>
					<li><a href="#" data-id="389131" class="new active">자유게시판</a></li>
					<li><a href="#" data-id="258914" class="new">비밀게시판</a></li>
					<li><a href="#" data-id="389411">졸업생게시판</a></li>
					<li><a href="#" data-id="389220" class="new">새내기게시판</a></li>
					<li><a href="#" data-id="389359" class="new">장터게시판</a></li>
					<li><a href="/board/promotionboard/promotionBoardList"
						data-id="367503">홍보게시판</a></li>
					<li><a href="#" data-id="418833">동아리·학회</a></li>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
					<li><a href="#" data-id="258916">정보게시판</a></li>
					<li><a href="#" data-id="389307">취업·진로</a></li>
				</ul>
			</div>
		</div>
		<input type="hidden" id="communityCampusId" value="113">
	</div>

	<div id="container" class="article">
		<input type="hidden" id="isUser" value="1"> <input
			type="hidden" id="boardId" value="389131">
		<aside class="none">
			<div class="title">
				<a class="hamburger"></a>
				<h1>
					<a href="/board/freeboard/freeBoardList">자유게시판</a>
				</h1>
			</div>
		</aside>
		<div class="wrap title">
			<h1>
				<a href="/board/freeboard/freeBoardList">자유게시판</a>
			</h1>
			<hr>
		</div>
		<div class="wrap articles">
			<a role="button" data-toggle="collapse" data-parent="#accordion"
				href="#newArticle" aria-expanded="false" id="writeArticleButton">새
				글을 작성해주세요!</a>

			<form action="/board/freeboard/insert" class="write">
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">

					<div class="panel panel-default">

						<div id="newArticle" class="panel-collapse collapse"
							role="tabpanel">
							<div class="panel-body">
								<div>
									<input type="hidden" name="fnickname"
										value="${member.nickname}" /><br /> <input type="text"
										name="ftitle" required="required" autofocus="autofocus"
										placeholder="글 제목 입력" class="title" />
								</div>
								<div>
									<textarea name="fcontents" required="required"
										placeholder="여기를 눌러서 글을 작성할 수 있습니다. 
										
[커뮤니티 이용규칙 준수] 
커뮤니티 이용규칙 전문을 반드시 숙지하신 후 글을 작성해 주세요. 이용규칙을 위반한 경우 작성한 게시물이 삭제되거나, 글쓰기 제한 등의 제재가 가해질 수 있습니다. 

자세한 내용은 홈 탭 우측 상단의 [내 정보] > [커뮤니티 이용규칙]을 참고하시기 바랍니다. 

[홍보 게시물 작성 금지] 
1. 링크 클릭, 학교 대항전, 추천인 입력 
2. 글 작성·계정 공유 요청 등 게시물 대리 작성 행위 
3. 공동구매, 펀딩, 기부금품 요청 행위 
4. 그 외 모든 직간접적 광고·홍보·판매 행위 

[선거, 정당·정치인 관련 게시물 작성 금지] 
1. 정당·정치인, 선거 후보자 및 관련자에 대한 비방, 비하, 모욕 
2. 선거 후보자에 대한 지지·홍보 및 선거운동 활동 
3. 여론조사 결과 인용 

[커뮤니티 이용규칙에 어긋나는 행위 금지] 
1. 게시판의 스크린샷, 게시물 내용 유출 
2. 욕설, 비하, 음란물, 개인정보가 포함된 게시물 게시 
3. 특정인이나 단체/지역을 비방하는 행위 
4. 기타 약관 및 현행법에 어긋나는 행위"></textarea>

								</div>
								<div class="mButton">
									<input type="submit" value="확인" class="submit" />
								</div>
							</div>
						</div>
					</div>
				</div>

			</form>


			<c:forEach var="freeBoardList" items="${freeBoardList}">
				<article>
					<a class="article"
						href="/board/freeboard/freeBoardListView/fbno/${freeBoardList.fbno}/pageNum/${pb.currentPage}">
						<h2 class="medium">${freeBoardList.ftitle }</h2>
						<p class="small">${freeBoardList.fcontents }</p> <time
							class="small">${freeBoardList.fregdate }</time>
						<h3 class="small">${freeBoardList.fnickname }</h3>
						<ul class="status">
							<li title="공감" class="vote"><svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-hand-thumbs-up"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  								<path fill-rule="evenodd"
										d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16v-1c.563 0 .901-.272 1.066-.56a.865.865 0 0 0 .121-.416c0-.12-.035-.165-.04-.17l-.354-.354.353-.354c.202-.201.407-.511.505-.804.104-.312.043-.441-.005-.488l-.353-.354.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581 0-.211-.027-.414-.075-.581-.05-.174-.111-.273-.154-.315L12.793 9l.353-.354c.353-.352.373-.713.267-1.02-.122-.35-.396-.593-.571-.652-.653-.217-1.447-.224-2.11-.164a8.907 8.907 0 0 0-1.094.171l-.014.003-.003.001a.5.5 0 0 1-.595-.643 8.34 8.34 0 0 0 .145-4.726c-.03-.111-.128-.215-.288-.255l-.262-.065c-.306-.077-.642.156-.667.518-.075 1.082-.239 2.15-.482 2.85-.174.502-.603 1.268-1.238 1.977-.637.712-1.519 1.41-2.614 1.708-.394.108-.62.396-.62.65v4.002c0 .26.22.515.553.55 1.293.137 1.936.53 2.491.868l.04.025c.27.164.495.296.776.393.277.095.63.163 1.14.163h3.5v1H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
							</svg>${freeBoardList.frecommendation }</li>
							<li title="댓글" class="comment"><svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-chat" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
  								<path fill-rule="evenodd"
										d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
							</svg>${freeBoardList.fcommentCount }</li>
							<li title="조회수"><svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-eye" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
  								<path fill-rule="evenodd"
										d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.134 13.134 0 0 0 1.66 2.043C4.12 11.332 5.88 12.5 8 12.5c2.12 0 3.879-1.168 5.168-2.457A13.134 13.134 0 0 0 14.828 8a13.133 13.133 0 0 0-1.66-2.043C11.879 4.668 10.119 3.5 8 3.5c-2.12 0-3.879 1.168-5.168 2.457A13.133 13.133 0 0 0 1.172 8z" />
 								<path fill-rule="evenodd"
										d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
							</svg> ${freeBoardList.freadcount }</li>
						</ul>
					</a>
					<div class="comments"></div>
				</article>
			</c:forEach>

			<div class="clearBothOnly"></div>
			<!-- search -->
			<form action="/board/freeboard/freeBoardList/pageNum/1" method="get">
				<select name="search">
					<c:forTokens var="item" items="all,fnickname,ftitle,fcontents"
						delims="," varStatus="i">
						<c:if test="${freeboard.search==item }">
							<option value="${item }" selected="selected">${tit[i.index]}</option>
						</c:if>
						<c:if test="${freeboard.search!=item }">
							<option value="${item }">${tit[i.index]}</option>
						</c:if>
					</c:forTokens>
				</select> <input type="text" name="keyword" placeholder="검색어를 입력하세요."
					value="${freeboard.keyword }"> <input type="submit"
					value="확인">
			</form>

			<!-- pagenation -->
			<div align="center">
				<ul class="pagination">
					<c:if test="${pb.startPage > pb.pagePerBlock}">
						<li class="page-item"><a class="page-link"
							href="/board/freeboard/freeBoardList/pageNum/1?search=${freeboard.search}&keyword=${freeboard.keyword}">
								<svg width="1em" height="1em" viewBox="0 0 16 16"
									class="bi bi-chevron-double-left" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
 									 <path fill-rule="evenodd"
										d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
 									 <path fill-rule="evenodd"
										d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z" />
								</svg>
						</a></li>
						<li class="page-item"><a class="page-link"
							href="/board/freeboard/freeBoardList/pageNum/${pb.startPage-1}?search=${freeboard.search}&keyword=${freeboard.keyword}">
								<svg width="1em" height="1em" viewBox="0 0 16 16"
									class="bi bi-chevron-compact-left" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
  									<path fill-rule="evenodd"
										d="M9.224 1.553a.5.5 0 0 1 .223.67L6.56 8l2.888 5.776a.5.5 0 1 1-.894.448l-3-6a.5.5 0 0 1 0-.448l3-6a.5.5 0 0 1 .67-.223z" />
								</svg>
						</a></li>
					</c:if>

					<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
						<c:if test="${i==pb.currentPage}">
							<li class="active page-item"><a class="page-link"
								href="/board/freeboard/freeBoardList/pageNum/${i}?search=${freeboard.search}&keyword=${freeboard.keyword}">${i}</a></li>
						</c:if>
						<c:if test="${i!=pb.currentPage}">
							<li class="page-item"><a class="page-link"
								href="/board/freeboard/freeBoardList/pageNum/${i}?search=${freeboard.search}&keyword=${freeboard.keyword}">${i}</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${pb.endPage < pb.totalPage }">
						<li class="page-item"><a class="page-link"
							href="/board/freeboard/freeBoardList/pageNum/${pb.endPage+1}?search=${freeboard.search}&keyword=${freeboard.keyword}">
								<svg width="1em" height="1em" viewBox="0 0 16 16"
									class="bi bi-chevron-compact-right" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
  									<path fill-rule="evenodd"
										d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
								</svg>
						</a></li>
						<li class="page-item"><a class="page-link"
							href="/board/freeboard/freeBoardList/pageNum/${pb.totalPage}?search=${freeboard.search}&keyword=${freeboard.keyword}">
								<svg width="1em" height="1em" viewBox="0 0 16 16"
									class="bi bi-chevron-double-right" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
  									<path fill-rule="evenodd"
										d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z" />
  									<path fill-rule="evenodd"
										d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z" />
								</svg>
						</a></li>
					</c:if>
				</ul>
			</div>

		</div>

		<hr>
		<div class="rightside">
			<div class="card">
				<div class="board">
					<h3>
						<a>실시간 인기 글</a>
					</h3>
					<a class="article" href="#">
						<p class="title">예과 2학년</p>
						<p class="small">화이팅!</p>
						<h4>자유게시판</h4>
						<ul class="status">
							<li class="vote active">7</li>
							<li class="comment active">9</li>
						</ul>
						<hr>
					</a><a class="article" href="#">
						<p class="title">타임 매직!</p>
						<p class="small">
							한달 기념 QnA를 할까 생각중이라고 저번에 글을 썼더니 그 글에 질문을 하시는 분이... 꽤 있더라구요...<br>이번엔
							진짜 한달 기념 QnA
						</p>
						<h4>자유게시판</h4>
						<ul class="status">
							<li class="vote active">4</li>
							<li class="comment active">9</li>
						</ul>
						<hr>
					</a>
				</div>
			</div>
			<div class="card">
				<div class="board">
					<h3>
						<a href="#">HOT 게시물<span>더 보기</span></a>
					</h3>
					<a class="list" href="#"><time>11/07 02:32</time>
						<p>스펙타클 안가요</p>
						<hr></a><a class="list" href="#"><time>11/06 18:29</time>
						<p>학교가 발전하려면 근처 원룸들 다 탱크로 밀어버려야함</p>
						<hr></a><a class="list" href="#"><time>11/05 19:09</time>
						<p>간호대 부심의 실체가 뭔지 알아?</p>
						<hr></a><a class="list" href="#"><time>11/04 21:24</time>
						<p>ㄹㅇ</p>
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
		<form id="abuseForm" class="modal">
			<a title="닫기" class="close"></a>
			<h3>신고 사유 선택</h3>
			<ul>
				<li><a data-reason="1">게시판 성격에 부적절함</a></li>
				<li><a data-reason="2">욕설/비하</a></li>
				<li><a data-reason="3">음란물/불건전한 만남 및 대화</a></li>
				<li><a data-reason="4">상업적 광고 및 판매</a></li>
				<li><a data-reason="5">유출/사칭/사기</a></li>
				<li><a data-reason="6">낚시/놀람/도배</a></li>
				<li><a data-reason="7">정당/정치인 비하 및 선거운동</a></li>
			</ul>
		</form>
		<form id="manageMoimForm" class="modal">
			<a title="닫기" class="close"></a>
			<h3>게시판 설정</h3>
			<p>
				<label>소개</label> <input type="text" name="info" class="text">
			</p>
			<p class="hide">
				<label>인기 글 금지</label> <input type="checkbox"
					id="manageMoimForm_is_not_selected_hot_article"
					name="is_not_selected_hot_article"><label
					for="manageMoimForm_is_not_selected_hot_article" class="checkbox">글이
					공감을 받아도 인기 글 및 HOT 게시물에 선정되지 않음</label>
			</p>
			<input type="button" value="게시판 양도" class="button light floatLeft">
			<input type="button" value="게시판 삭제" class="button light floatLeft">
			<input type="submit" value="수정" class="button">
		</form>
		<form id="transferMoimForm" class="modal">
			<a title="닫기" class="close"></a>
			<h3>게시판 양도</h3>
			<p>
				<label>양도인 비밀번호</label> <input type="password"
					name="transferer_password" class="text">
			</p>
			<p>
				<label>피양도인 아이디</label> <input type="text" name="transferee_userid"
					class="text">
			</p>
			<input type="submit" value="양도 요청" class="button">
		</form>
		<form id="attachThumbnailForm" class="modal">
			<a title="닫기" class="close"></a>
			<h3>첨부된 이미지</h3>
			<p>
				<label>설명 추가</label>
				<textarea name="caption" class="text"
					placeholder="이 이미지에 대한 설명을 입력하세요."></textarea>
			</p>
			<input type="button" value="첨부 삭제" class="button light floatLeft">
			<input type="submit" value="설명 저장" class="button">
		</form>
		<form id="messageSend" class="modal">
			<a title="닫기" class="close"></a>
			<h3>쪽지 보내기</h3>
			<p>
				<textarea name="message" class="text" placeholder="내용을 입력해주세요."></textarea>
			</p>
			<input type="submit" value="전송" class="button">
		</form>
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


</body>
</html>