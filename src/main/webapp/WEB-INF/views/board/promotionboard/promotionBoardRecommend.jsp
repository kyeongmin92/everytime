<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("추천 완료");
		location.href="/board/promotionboard/promotionBoardListView/pbno/${pbno}/pageNum/${pageNum}";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("추천 취소");
		location.href="/board/promotionboard/promotionBoardListView/pbno/${pbno}/pageNum/${pageNum}";
	</script>
</c:if>

</body>
</html>