<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<style>
#startrunning{
	visibility: hidden;
}
</style>
</head>
<body onload="submit()">
<script type="text/javascript">
    function submit()
    {
        document.getElementById("startrunning").click(); // Simulates button click
        document.submitForm.submit(); // Submits the form without the button
    }
</script>

<form action="/books/imageNameUpdate" id="submitForm" method="get">
		<p><input type="hidden" name="listnum" value="${book.listnum}" /></p>
		<!-- 로컬에 저장된 이미지 이름 -->	
		<!-- 1. '/'로 잘라낸 값을 keywordArr에 저장한다. --> 
		<c:set var="keywordArr" value="${fn:split(book.images,',')}"></c:set>
		<!-- 2. keywordArr 값을 forEach를 이용해서 출력한다. --> 
		<c:forEach var="word" items="${keywordArr}" varStatus="status" end="3">
		<!-- 키워드1 키워드2 키워드3 키워드4 가 출력된다. -->
		
    	<p><input type="hidden" name="imgfile${status.index +1 }" value="${word}" /></p>  
    	
		</c:forEach>
		<button id="startrunning">go</button>		
</form>		

</body>
</html>