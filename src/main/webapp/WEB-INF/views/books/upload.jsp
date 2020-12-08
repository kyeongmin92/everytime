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
<form action="/books/imageNameUpdate">
		<p><input type="text" name="listnum" value="${book.listnum}" /></p>
		<!-- 로컬에 저장된 이미지 이름 -->	
		<!-- 1. '/'로 잘라낸 값을 keywordArr에 저장한다. --> 
		<c:set var="keywordArr" value="${fn:split(book.images,',')}"></c:set>
		<!-- 2. keywordArr 값을 forEach를 이용해서 출력한다. --> 
		<c:forEach var="word" items="${keywordArr}" varStatus="status" end="3">
		<!-- 키워드1 키워드2 키워드3 키워드4 가 출력된다. -->
		
    	<p><input type="text" name="imgfile${status.index +1 }" value="${word}" /></p>  
    	
		</c:forEach>
		<input type="submit" value="ok">
		
</form>		

</body>
</html>