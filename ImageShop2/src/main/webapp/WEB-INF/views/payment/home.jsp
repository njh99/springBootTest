<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
</head>
<body>
	<!-- 할인 쿠폰 -->
	<div>
		<input type="checkbox" id="coupon-box" /> <label for="coupon-box"> 5,000원 쿠폰 적용 </label>
	</div>
	<!-- 결제 UI, 이용약관 UI 영역 -->
	<div id="payment-method"></div>
	<div id="agreement"></div>
	<!-- 결제하기 버튼 -->
	<button id="payment-button">결제하기</button>

	<script>
		const coupon = document.getElementById("coupon-box");
		const button = document.getElementById("payment-button");
		const amount = 50000;

		// 구매자의 고유 아이디를 불러와서 customerKey로 설정하세요.
		// 이메일・전화번호와 같이 유추가 가능한 값은 안전하지 않습니다.
		const widgetClientKey = "test_ck_Ba5PzR0ArnWERvBBpZ0x8vmYnNeD";
		const customerKey = "eLy0W2Y4zkMBa-gyyi-vt";
		const paymentWidget = PaymentWidget(widgetClientKey, customerKey); // 회원 결제
		// const paymentWidget = PaymentWidget(widgetClientKey, PaymentWidget.ANONYMOUS) // 비회원 결제

		const paymentMethodWidget = paymentWidget.renderPaymentMethods(
				"#payment-method", {
					value : amount
				}, {
					variantKey : "DEFAULT"
				});

		paymentWidget.renderAgreement("#agreement", {
			variantKey : "AGREEMENT"
		});

		coupon.addEventListener("change", function() {
			if (coupon.checked) {
				paymentMethodWidget.updateAmount(amount - 5000);
			} else {
				paymentMethodWidget.updateAmount(amount);
			}
		});

		button.addEventListener("click", function() {
			// 결제를 요청하기 전에 orderId, amount를 서버에 저장하세요.
			// 결제 과정에서 악의적으로 결제 금액이 바뀌는 것을 확인하는 용도입니다.
			paymentWidget.requestPayment({
				orderId : "YfkWsJE9KmOxevPn5AEqo",
				orderName : "토스 티셔츠 외 2건",
				successUrl : window.location.origin + "/success",
				failUrl : window.location.origin + "/fail",
				customerEmail : "customer123@gmail.com",
				customerName : "김토스",
				customerMobilePhone : "01012341234",
			});
		});
	</script>
</body>
</html>