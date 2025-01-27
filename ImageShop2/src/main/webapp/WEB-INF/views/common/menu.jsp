<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/css/mainhomepage.css">
<script type="text/javascript" src="/js/mainhomepage.js"></script>
<style>
nav ul.sport_event ul {
	display: flex;
	flex-direction: row;
	justify-content: left;
	align-items: center;
}

nav ul.sport_event li {
	padding-top: 10px;
	list-style-type: none;
}

nav ul.sport_event li a {
	padding: 5px;
	text-decoration: none;
	color: black;
}

nav ul.sport_event {
	margin: 0 220px;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}
</style>
<div align="center">
	<table>
		<tr>
			<td width="80"><a href="/"><spring:message code="header.home" /></a></td>
			<!-- 로그인을 하지 않은 경우 true -->
			<sec:authorize access="!isAuthenticated()">
				<!-- 회원 게시판를 메뉴에 추가한다. -->
				<td width="120"><a href="/board/list"><spring:message code="menu.board.member" /></a></td>
				<!-- 공지사항을 메뉴에 추가한다. -->
				<td width="120"><a href="/notice/list"><spring:message code="menu.notice.member" /></a></td>
				<!-- 상품 관리를 메뉴에 추가한다. -->
				<td width="120"><a href="/item/list"><spring:message code="menu.item.member" /></a></td>
			</sec:authorize>

			<!-- 인증된 사용자인 경우 true -->
			<sec:authorize access="isAuthenticated()">
				<!-- 관리자 권한을 가진 사용자인 경우 true -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<!-- 그룹코드 관리를 메뉴에 추가한다. -->
					<td width="120"><a href="/codegroup/list"><spring:message code="menu.codegroup.list" /></a></td>
					<!-- 회원 게시판를 메뉴에 추가한다. -->
					<td width="120"><a href="/board/list"><spring:message code="menu.board.member" /></a></td>
					<!-- 코드 관리를 메뉴에 추가한다. -->
					<td width="120"><a href="/codedetail/list"><spring:message code="menu.codedetail.list" /></a></td>
					<!-- 회원 관리를 메뉴에 추가한다. -->
					<td width="120"><a href="/user/list"><spring:message code="menu.user.admin" /></a></td>
					<!-- 공지사항을 메뉴에 추가한다. -->
					<td width="120"><a href="/notice/list"><spring:message code="menu.notice.member" /></a></td>
					<!-- 상품 관리를 메뉴에 추가한다. -->
					<td width="120"><a href="/item/list"><spring:message code="menu.item.admin" /></a></td>
				</sec:authorize>

				<!-- 회원 권한을 가진 사용자인 경우 true -->
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<!-- 회원 게시판를 메뉴에 추가한다. -->
					<td width="120"><a href="/board/list"><spring:message code="menu.board.member" /></a></td>
					<!-- 공지사항을 메뉴에 추가한다. -->
					<td width="120"><a href="/notice/list"><spring:message code="menu.notice.member" /></a></td>
					<!-- 상품 관리를 메뉴에 추가한다. -->
					<td width="120"><a href="/item/list"><spring:message code="menu.item.admin" /></a></td>
					<!-- 코인 충전과 충전 내역을 메뉴에 추가한다. -->
					<td width="120"><a href="/coin/charge"> <spring:message code="menu.coin.charge" /></a></td>
					<td width="120"><a href="/coin/list"><spring:message code="menu.coin.list" /></a></td>
					<!-- 구매 상품과 구매 내역을 메뉴에 추가한다. -->
					<td width="120"><a href="/useritem/list"><spring:message code="menu.useritem.list" /></a></td>
					<td width="120"><a href="/coin/listPay"><spring:message code="menu.coin.listPay" /></a></td>
				</sec:authorize>
			</sec:authorize>
		</tr>
	</table>
</div>

<hr>