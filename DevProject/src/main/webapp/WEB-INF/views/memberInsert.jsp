<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>InsertMember</h1>
	<form action="/member/redirect" method="post">
		userId: <input type="text" name="userId" value="hong"><br>
		password: <input type="text" name="password" value="1234"><br>
		coin: <input type="text" name="coin" value="100"><br>
		date: <input type="text" name="date" value="2000/10/20"><br>
		 <input type="submit" value="Memberbeans">
	</form>
</body>

</html>