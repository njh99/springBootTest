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
			<spring:message code="auth.header.logout" />
		</h2>
		<form action="/auth/logout" method="post">
			<sec:csrfInput />
			<button>
				<spring:message code="action.logout" />
			</button>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>