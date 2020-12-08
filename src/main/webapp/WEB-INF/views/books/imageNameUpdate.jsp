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
update page
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("수정 성공 ㅋㅋ");
		
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("수정 실패  ! 에궁");
		history.go(-1);
	</script>
</c:if>
<p>${booksell.imgfile1 }</p>
<p>${booksell.imgfile2 }</p>
<p>${booksell.imgfile3 }</p>
<p>${booksell.listnum}</p>
</body>
</html>