<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에브리타임</title>

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

<script type="text/javascript">
	$(function() {
		$('#promotionReplyListDisp')
				.load(
						'/board/promotionboard/promotionReplyList/pbno/${promotionboard.pbno}/pageNum/${pageNum}');

		$('#deleteBtn').click(function() {
			alert("삭제하시겠습니까?");
		});

		$('#prInsert').click(function() {
			var sendData = $('#prm').serialize() + "&pageNum=${pageNum}";
			$.post('/board/promotionboard/prInsert', sendData, function(data) {
				alert('댓글이 작성 되었습니다');
				$('#promotionReplyListDisp').html(data);

				prm.prcontents.value = "";
			});
		});
	});
</script>
<style>
#recbutton {
	border: 1px solid white;
	width: 120px;
	height: 40px;
	cursor: pointer;
	color: red;
}

#recform {
	display: inline-block;
	white-space: nowrap;
}
</style>
<script>
	function recFunc() {
		alert("추천");
		window.location.href = "/board/promotionboard/prRec";
	};
</script>

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
					<a href="/../message/my_receivedMail" title="쪽지함" class="icon message">쪽지함</a>
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
					<li><a href="/board/freeboard/freeBoardList" data-id="389131"
						class="new active">자유게시판</a></li>
					<li><a href="#" data-id="258914" class="new">비밀게시판</a></li>
					<li><a href="#" data-id="389411">졸업생게시판</a></li>
					<li><a href="#" data-id="389220" class="new">새내기게시판</a></li>
					<li><a href="#" data-id="389359" class="new">장터게시판</a></li>
					<li><a href="/board/promotionboard/promotionBoardList" data-id="367503">홍보게시판</a></li>
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

	<div class="container" align="center">
		<h2 class="text-primary">게시글 상세 내역</h2>
		<table class="table table-striped table-bordered">
			<tr>
				<td>제목</td>
				<td>${promotionboard.ptitle }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${promotionboard.pnickname }</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${promotionboard.preadcount }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><pre>${promotionboard.pcontents }</pre></td>
			</tr>
			<tr>
				<td>댓글수</td>
				<td>${promotionboard.pcommentCount }</td>
			</tr>
			<tr>
				<td>추천수</td>
				<td>${promotionboard.precommendation}</td>
			</tr>
			<tr>
				<td colspan="2"><a href="/board/promotionboard/promotionBoardList"
					class="btn btn-info">게시글 목록</a> <c:if
						test="${ member.nickname == promotionboard.pnickname }">
						<a
							href="/board/promotionboard/promotionBoardUpdateForm/pbno/${promotionboard.pbno }/pageNum/${pageNum}"
							class="btn btn-warning">수정</a>
						<a
							href="/board/promotionboard/promotionBoardDelete/pbno/${promotionboard.pbno }/pageNum/${pageNum}"
							class="btn btn-danger" id="deleteBtn">삭제</a>
					</c:if>


					<form
						action="/board/promotionboard/prRec/pbno/${promotionboard.pbno}/pageNum/${pageNum}"
						id="recform">
						<input type="hidden" name="prbno" value="${promotionboard.pbno}" />
						<button type="submit" id="recbutton">
							게시글추천
							<svg width="3em" height="3em" viewBox="0 0 16 16"
								class="bi bi-hand-thumbs-up" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  								<path fill-rule="evenodd"
									d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16v-1c.563 0 .901-.272 1.066-.56a.865.865 0 0 0 .121-.416c0-.12-.035-.165-.04-.17l-.354-.354.353-.354c.202-.201.407-.511.505-.804.104-.312.043-.441-.005-.488l-.353-.354.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581 0-.211-.027-.414-.075-.581-.05-.174-.111-.273-.154-.315L12.793 9l.353-.354c.353-.352.373-.713.267-1.02-.122-.35-.396-.593-.571-.652-.653-.217-1.447-.224-2.11-.164a8.907 8.907 0 0 0-1.094.171l-.014.003-.003.001a.5.5 0 0 1-.595-.643 8.34 8.34 0 0 0 .145-4.726c-.03-.111-.128-.215-.288-.255l-.262-.065c-.306-.077-.642.156-.667.518-.075 1.082-.239 2.15-.482 2.85-.174.502-.603 1.268-1.238 1.977-.637.712-1.519 1.41-2.614 1.708-.394.108-.62.396-.62.65v4.002c0 .26.22.515.553.55 1.293.137 1.936.53 2.491.868l.04.025c.27.164.495.296.776.393.277.095.63.163 1.14.163h3.5v1H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
							</svg>
						</button>
					</form></td>

			</tr>
		</table>

		<!-- 댓글 작성 폼 -->
		<form name="prm" id="prm">
			<input type="hidden" name="prbno" value="${promotionboard.pbno }" />
			<h3>댓글 작성</h3>
			<input type="hidden" name="prnickname" value="${member.nickname}" />
			<table class="table table-hover">
				<tr>
					<td>댓글</td>
					<td><textarea name="prcontents" id="" cols="30" rows="3"></textarea>
					</td>
					<td colspan="2"><input type="button" value="댓글 입력"
						id="prInsert" size="4" /></td>
				</tr>
			</table>
		</form>
		<div id="promotionReplyListDisp"></div>
	</div>


</body>
</html>