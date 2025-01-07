<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이곳은 메인페이지 입니다.</h1>
	<h3>버튼을 클릭해주세요</h3>
	<form action="/myboard/register">
		<input type="submit" value="register(get)">
	</form>
	<form action="/myboard/register" method="post">
		<input type="submit" value="register(post)">
	</form>
	<form action="/myboard/modify">
		<input type="submit" value="modify(get)">
	</form>
	<form action="/myboard/modify" method="post">
		<input type="submit" value="modify(post)">
	</form>
	<form action="/myboard/remove" method="post">
		<input type="submit" value="remove(post)">
	</form>
	<form action="/myboard/list" method="get">
		<input type="submit" value="list(get)">
	</form>
</body>
</html>