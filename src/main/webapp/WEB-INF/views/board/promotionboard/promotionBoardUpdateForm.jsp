<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<!DOCTYPE html>
<html>
<link type="text/css" href="/../resources/css/common.css" rel="stylesheet">
<link type="text/css" href="/../resources/css/common.partial.css"
	rel="stylesheet">
<link type="text/css" href="/../resources/css/container.article.css"
	rel="stylesheet">
<link type="text/css" href="/../resources/css/container.community.css"
	rel="stylesheet">
<link type="text/css" href="/../resources/css/container.modal.css"
	rel="stylesheet">
<link href="#" rel="shortcut icon">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">게시글 수정</h2>
		<form action="/board/promotionboard/promotionBoardUpdate">
			<input type="hidden" name="pbno" value="${pbno }" />
			<input type="hidden" name="pageNum" value="${pageNum }" />
			<table class="table table-hover table-bordered">
				<tr>
					<td>제목</td>
					<td>
						<input type="text" value="${promotionboard.ptitle }" name="ptitle" required="required" autofocus="autofocus" />
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>						
							<textarea rows="5" cols="49" required="required" name="pcontents">${promotionboard.pcontents }</textarea>						
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>