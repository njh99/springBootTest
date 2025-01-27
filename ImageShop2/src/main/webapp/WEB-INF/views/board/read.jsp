<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/board.css" />
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
			<spring:message code="board.header.read" />
		</h2>
		<form:form modelAttribute="board">
			<form:hidden path="boardNo" />
			<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
			<input type="hidden" id="page" name="page" value="${pgrq.page}">
			<input type="hidden" id="sizePerPage" name="sizePerPage" value="${pgrq.sizePerPage}">
			<table>
				<tr>
					<td><spring:message code="board.title" /></td>
					<td><form:input path="title" readonly="true" /></td>
					<td><font color="red"><form:errors path="title" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.writer" /></td>
					<td><form:input path="writer" readonly="true" /></td>
					<td><font color="red"><form:errors path="writer" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.content" /></td>
					<td><form:textarea path="content" readonly="true" /></td>
					<td><font color="red"><form:errors path="content" /></font></td>
				</tr>
			</table>
		</form:form>
		<div>
			<sec:authentication property="principal" var="pinfo" />
			<!-- principal 정보를 pinfo 변수에 저장 -->
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="button" id="btnEdit">
					<spring:message code="action.edit" />
				</button>
				<button type="button" id="btnRemove">
					<spring:message code="action.remove" />
				</button>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_MEMBER')">
				<c:if test="${pinfo.username eq board.writer}">
					<button type="button" id="btnEdit">
						<spring:message code="action.edit" />
					</button>
					<button type="button" id="btnRemove">
						<spring:message code="action.remove" />
					</button>
				</c:if>
			</sec:authorize>
			<button type="button" id="btnList">
				<spring:message code="action.list" />
			</button>
			<br> <br>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
<script>
	$(document).ready(
			function() {
				let formObj = $("#board");

				// 현재 페이지 번호와 페이징 크기 

				//let pageVal = pageObj.val();
				//let sizePerPageVal = sizePerPageObj.val();

				$("#btnEdit").on(
						"click",
						function() {
							// 현재 페이지 번호와 페이징 크기
							let page = $("#page").val();
							let sizePerPage = $("#sizePerPage").val();

							let boardNo = $("#boardNo").val();
							//let boardNoVal = boardNo.val();
							self.location = "/board/modify?page=" + page
									+ "&sizePerPage=" + sizePerPage
									+ "&boardNo=" + boardNo;
						});
				$("#btnRemove").on("click", function() {
					formObj.attr("action", "/board/remove");
					formObj.submit();
				});
				$("#btnList").on("click", function() {
					self.location = "/board/list";
				});
			});
</script>