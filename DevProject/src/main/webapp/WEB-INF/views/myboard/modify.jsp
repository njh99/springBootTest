<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify page</title>
</head>
<body>
	<h1>modify page</h1>
	<form method="post" action="/myboard/post">
		<button type="submit" name="modify">수정</button>
	</form>
	<a href="/myboard/get?list">목록</a>
</body>
</html>