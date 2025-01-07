<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<h1>regist page</h1>
	<form method="post" action="/myboard/post">
	<button type="submit" name="modify">등록</button>
	<a href="/myboard/get?list">목록</a>
	</form>
</body>
</html>