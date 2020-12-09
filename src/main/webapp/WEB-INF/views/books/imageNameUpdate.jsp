<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		
		location.href="/books/books";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("이미지 업로드 실패"); //에러 페이지 만들기
		history.go(-1);
	</script>
</c:if>
</body>
</html>