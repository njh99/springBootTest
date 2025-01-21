<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://kit.fontawesome.com/6498553759.js" crossorigin="anonymous"></script>
<style>
ul.nav_icon {
	display: flex;
	flex-direction: row;
	justify-content: right;
	align-content: center;
}

ul.nav_icon li {
	list-style-type: none;
}

ul.nav_icon li a {
	padding: 10px;
	text-decoration: none;
	color: black;
	font-size: 18px;
}
</style>
<div align="right">
	<ul class="nav_icon">
		<li><a href="/user/register"> <spring:message code="header.joinMember" /></a></li>
		<li><a href="#"><i class="fa-regular fa-circle-user"></i></a></li>
		<li><a href="#"><i class="fa-regular fa-comment-dots"></i></a></li>
		<li><a href="#"><i class="fa-regular fa-bell"></i></a></li>
		<li><a href="#"><i class="fa-regular fa-envelope"></i></a></i></li>
		<li><a href="#"><i class="fa-solid fa-bars"></i></a></li>
	</ul>
</div>
<hr>