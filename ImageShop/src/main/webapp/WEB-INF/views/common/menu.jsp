<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	<nav>
		<ul class="sport_event">
			<li><a href="/"><spring:message code="header.home" /></li>
			<li><a href="/codegroup/list"><spring:message code="codegroup.header.list" /></li>
			<!-- 코드 관리를 메뉴에 추가한다. -->
			<li><a href="/codedetail/list"><spring:message code="menu.codedetail.list" /></a></li>
			<li><a href="">야구</a></li>
			<li><a href="">해외야구</a></li>
			<li><a href="">축구</a></li>
			<li><a href="">해외축구</a></li>
			<li><a href="">농구</a></li>
			<li><a href="">배구</a></li>
			<li><a href="">N골프</a></li>
			<li><a href="">일반</a></li>
		</ul>
	</nav>
</div>
<hr>