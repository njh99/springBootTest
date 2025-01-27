<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" href="/css/mainhomepage.css">
<script type="text/javascript" src="/js/mainhomepage.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a677c879143e176b773c72c8d8d464b9"></script>
<section onload="carousel();">
	<div class="slideshow">
		<div class="slideshow_slides">
			<a href="product.jsp?name=첼시 홈 유니폼"><img class=chelsea src="/image/media/첼시사람유니폼.jpg" alt="1" /></a> <a href="product.jsp?name=토트넘 홈 유니폼"><img src="/image/media/파리생제르망사람유니폼.jpg" alt="2" /></a> <a
				href="product.jsp?name=바르샤 홈 유니폼"><img src="/image/media/바르샤사람유니폼.jpg" alt="3" /></a> <a href="#"><img src="/image/media/토트넘사람유니폼.jpg" alt="4" /></a>
		</div>
		<div class="slideshow_nav">
			<a href="#" class="prev"><i class="fa-solid fa-circle-chevron-left"></i></a> <a href="#" class="next"><i class="fa-solid fa-circle-chevron-right"></i></a>
		</div>
		<div class="slideshow_indicator">
			<a href="#"><i class="fa-regular fa-circle-dot"></i></a> <a href="#"><i class="fa-regular fa-circle-dot"></i></a> <a href="#"><i class="fa-regular fa-circle-dot"></i></a> <a href="#"><i
				class="fa-regular fa-circle-dot"></i></a>
		</div>
	</div>
</section>
<!-- PC ë°°ë1 -->
<div class="floBanPc1 hidden-md hidden-sm hidden-xs">
	<a href="/notice/list" target="_blank"> <img src="/image/media/픽토그램.jpg" width="80px;" height="80px;">
	</a>
</div>
<!-- PC ë°°ë2 -->
<div class="floBanPc2 hidden-md hidden-sm hidden-xs">
	<a href="/coin/listPay" target="_blank"> <img src="/image/media/btn_side_cart.png" width="80px;" height="80px;">
	</a>
</div>

<div id="map" style="width: 500px; height: 400px;"></div>
<script>
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(40.7483674, 73.9856586),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);
</script>