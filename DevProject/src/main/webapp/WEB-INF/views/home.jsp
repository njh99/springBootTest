<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨트롤러에서 메시지 소스 사용</title>
</head>
<body>
	<h1>
		환영합니다.<br>
		<spring:message code="welcome.message" /><br>
		<spring:message code="welcome.message" arguments="홍길동" />
	</h1>
	<P>The time on the server is ${serverTime}.</P>
</body>
</html>