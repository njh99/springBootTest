<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/coin.css" />
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />
	<div align="center">
		<h2>
			<spring:message code="coin.header.list" />
		</h2>
		<table border="1">
			<tr>
				<th align="center" width="80"><spring:message code="coin.no" /></th>
				<th align="center" width="320"><spring:message code="coin.amount" /></th>
				<th align="center" width="180"><spring:message code="coin.regdate" /></th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="3"><spring:message code="common.listEmpty" /></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="chargeCoin">
						<tr>
							<td align="center">${chargeCoin.historyNo}</td>
							<td align="left">${chargeCoin.amount}</td>
							<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${chargeCoin.regDate}" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
	var result = "${msg}";
	if (result === "SUCCESS") {
		alert("<spring:message code='common.processSuccess' />");
	}
</script>