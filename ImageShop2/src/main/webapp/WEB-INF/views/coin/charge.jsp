<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/coin.css" />
<meta charset="UTF-8">
<script type="text/javascript" src="/css/codegroup.css"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Image Shop</title>
<!--  <script type="text/javascript" src="/js/test.js"></script> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />
	<jsp:include page="/WEB-INF/views/common/carousel.jsp" />
	<div align="center">
		<h2>
			<spring:message code="coin.header.chargeCoin" />
		</h2>
		<form:form modelAttribute="chargeCoin" action="charge">
			<table>
				<tr>
					<td><spring:message code="coin.amount" /></td>
					<td><form:input path="amount" /></td>
					<td><font color="red"><form:errors path="amount" /></font></td>
				</tr>
			</table>
		</form:form>
		<div>
			<button type="button" id="btnCharge">
				<spring:message code="action.charge" />
			</button>
			<button type="button" id="btnList">
				<spring:message code="action.list" />
			</button>

		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
<script>
	$(document).ready(function() {
		var formObj = $("#chargeCoin");
		$("#btnCharge").on("click", function() {
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "list";
		});
	});
</script>