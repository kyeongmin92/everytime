<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>쪽지 보내기 완료</title>
</head>
<body>

<c:if test="${result>0 }">
<script type="text/javascript"> 
alert("쪽지 보내기 완료~!");
location.href="/sendmessagePopup";
</script>
</c:if>

<c:if test="${result==0 }">
<script type="text/javascript"> 
alert("입력실패,,,,,,,,,,,,");
history.go(-1);
</script>
</c:if>
</body>
</html>