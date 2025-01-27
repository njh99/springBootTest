<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>
<!--  <script type="text/javascript" src="/js/test.js"></script> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />
	<jsp:include page="/WEB-INF/views/common/carousel.jsp" />

	<div align="center">
		<h2>
			<spring:message code="auth.header.login" />
		</h2>
		<h2>
			<c:out value="${error}" />
		</h2>
		<h2>
			<c:out value="${logout}" />
		</h2>
		<form method="post" action="/login">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" name="rememberme">
					<spring:message code="auth.rememberMe" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button>
							<spring:message code="action.login" />
						</button></td>
				</tr>
			</table>
			<sec:csrfInput />
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>