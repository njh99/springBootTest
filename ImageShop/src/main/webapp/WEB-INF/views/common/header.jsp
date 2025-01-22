<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://kit.fontawesome.com/6498553759.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="mainhomepage.css" />
  <script src="mainhomepage.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="/css/mainhomepage.css">
  <script type="text/javascript" src="/js/mainhomepage.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Kablammo&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/01ba7af47f.js" crossorigin="anonymous"></script>
<style type="text/css">
main{
display: flex;
justify-content: center;
align-items: center;
}
</style>
<nav class="nav_naver">
       <div class="dropdown1">
  <button onclick="myFunction()" class="dropbtn1"><i class="fa-solid fa-bars"></i></button>
  <div id="myDropdown" class="dropdown-content1">
   <a href="/"><i class="fa-solid fa-house"></i><spring:message code="header.home" />
    <a href="/codegroup/list"><i class="fa-solid fa-user"></i><spring:message code="menu.codegroup.list" /></a>
    <a href="/codedetail/list"><i class="fa-solid fa-magnifying-glass"></i><spring:message code="menu.codedetail.list" /></a>
  	<a href="/user/list"><i class="fa-solid fa-shield-halved"></i><spring:message code="menu.user.admin" /></a>
  </div>
</div>
      
      <div class="nav_naver_font">
          <a class="naver_logo" href="cart.jsp"><i class="fa-solid fa-basket-shopping"></i></a>
          <a class="sport_logo" href="cart.jsp">CART</a>
      </div>
        </nav>
        <nav class="top_menu">
    <div class="header-logo">
      <i class="fa-solid fa-layer-group"></i>
      <a href="mainhomepage.jsp">아직 미정</a>
    </div>
    <ul class="header-menu">
      <li class="dropdown">
        <a href="#" class="dropbtn"><img src="/image/media/LaLiga_EA_Sports_2023_Vertical_Logo.svg.png"alt="laliga" class="la"></img></a>
        <div class="dropdown-content">
          <a href="product.jsp?name=바르샤 홈 유니폼">바르셀로나</a>
          <a href="product.jsp?name=레알 홈 유니폼">레알 마드리드</a>
          <a href="product.jsp?name=ATM 홈 유니폼">ATM</a>
        </div>
      </li>
      <li class="dropdown">
        <a href="#" class="dropbtn"><img src="/image/media/pl-main-logo.png"alt="laliga" class="epl"></img></a>
        <div class="dropdown-content">
          <a href="product.jsp?name=맨시티 홈 유니폼">맨체스터 시티</a>
          <a href="product.jsp?name=첼시 홈 유니폼">첼시</a>
          <a href="product.jsp?name=아스날 어웨이 유니폼">아스날</a>
          <a href="product.jsp?name=맨유 어웨이 유니폼">맨체스터 유나이티드</a>
          <a href="product.jsp?name=토트넘 홈 유니폼">토트넘</a>
        </div>
      </li>
      <li class="dropdown">
        <a href="#" class="dropbtn"><img src="/image/media/bundesliga-logo.png"alt="laliga" class="bun"></img></a>
        <div class="dropdown-content">
          <a href="product.jsp?name=바이언 어웨이 유니폼">바이에르 뮌헨</a>
          <a href="product.jsp?name=도르트문트 홈 유니폼">도르트문트</a>

        </div>
      </li>
      <li class="dropdown">
        <a href="#" class="dropbtn"><img src="/image/media/Serie_A_logo_2022.svg.png"alt="laliga" class="bun"></img></a>
        <div class="dropdown-content">
          <a href="product.jsp?name=인테르 홈 유니폼">인테르</a>
          <a href="product.jsp?name=AC밀란 홈 유니폼">AC밀란</a>
          
        </div>
      </li>
    </ul>
    <ul class="header-icons">
      <li>
        <a href="login.jsp">LOGIN</a>
      </li>
    </ul>
	</nav>

<hr>