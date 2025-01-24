<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/item.css" />
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
			<spring:message code="item.header.read" />
		</h2>
		<form:form modelAttribute="item" action="buy">
			<form:hidden path="itemId" />
			<form:hidden path="pictureUrl" />
			<form:hidden path="previewUrl" />
			<table>
				<tr>
					<td><spring:message code="item.itemName" /></td>
					<td><form:input path="itemName" /></td>
					<td><font color="red"><form:errors path="itemName" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="item.itemPrice" /></td>
					<td><form:input path="price" />&nbsp;원</td>
					<td><font color="red"><form:errors path="price" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="item.preview" /></td>
					<td><img src="display?itemId=${item.itemId}" width="210"></td>
				</tr>
				<tr>
					<td><spring:message code="item.itemDescription" /></td>
					<td><form:textarea path="description" /></td>
					<td><font color="red"><form:errors path="description" /></font></td>
				</tr>
			</table>
		</form:form>
		<!-- 구매하기 버튼 추가 -->
		<button type="submit" id="btnBuy">
			<spring:message code="action.buy" />
		</button>
		<button type="submit" id="btnList">
			<spring:message code="action.list" />
		</button>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
<script>
	$(document).ready(function() {
		var formObj = $("#item");
		// 구매하기 버튼 이벤트 처리
		$("#btnBuy").on("click", function() {
			formObj.submit();
		});
		$("#btnList").on("click", function() {
			self.location = "/item/list";
		});
	});
</script>