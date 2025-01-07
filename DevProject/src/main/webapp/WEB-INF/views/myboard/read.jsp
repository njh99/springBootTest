<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<h1>Read page</h1>
	<form action="/myboard/get">
		<button type="submit" name="modify">수정</button>
		<button type="submit" name="remove">삭제</button>
	</form>
	<a href="/myboard/get?list">목록</a>
	
</body>
</html>