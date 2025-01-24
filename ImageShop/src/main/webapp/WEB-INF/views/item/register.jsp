<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
			<spring:message code="item.header.register" />
		</h2>
		<form:form modelAttribute="item" action="register" enctype="multipart/form-data">
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
					<td><spring:message code="item.itemFile" /></td>
					<td><input type="file" name="picture" /></td>
					<td></td>
				</tr>
				<tr>
					<td><spring:message code="item.itemPreviewFile" /></td>
					<td><input type="file" name="preview" /></td>
					<td></td>
				</tr>
				<tr>
					<td><spring:message code="item.itemDescription" /></td>
					<td><form:textarea path="description" /></td>
					<td><form:errors path="description" /></td>
				</tr>
			</table>
		</form:form>

		<div>
			<button type="submit" id="btnRegister">
				<spring:message code="action.register" />
			</button>
			<button type="submit" id="btnList">
				<spring:message code="action.list" />
			</button>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			var formObj = $("#item");
			$("#btnRegister").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				self.location = "list";
			});
		});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>