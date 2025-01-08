<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		let postBtn = document.getElementById("postBtn");
		let putJsonBtn = document.getElementById("putBtn");
		
		postBtn.addEventListener("click", function() {
			let boardNo = document.getElementById("boardNo").value;
			let title = document.getElementById("title").value;
			let content = document.getElementById("content").value;
			let writer = document.getElementById("writer").value;

			let boardObject = {
				boardNo : boardNo,
				title : title,
				content : content,
				writer : writer
			};

			let xhr = new XMLHttpRequest();
			let url = "/board/" + boardNo;
			xhr.open("POST", url, true);
			xhr.setRequestHeader("Content-Type","application/json; charset=utf-8");
			//서버로부터 답변을 받을때 실행하는 콜백함수
			xhr.onload = function() {
				if (xhr.status === 200) {
					let result = xhr.responseText;
					console.log("result: " + result);
					if (result === "SUCCESS") {
						alert("SUCCESS");
					} else {
						// Handle other responses or errors if needed
					}
				} else {
					console.error("Request failed. Status: " + xhr.status);
					// Handle error scenario if needed
				}
			};
			//서버로부터 요청할때 문제점이 발생될때 콜백함수
			xhr.onerror = function() {
				console.error("Request failed. Network error.");
			};

			xhr.send(JSON.stringify(boardObject));
		});
		putBtn.addEventListener("click", function() {
			let boardNo = document.getElementById("boardNo").value;
			let title = document.getElementById("title").value;
			let content = document.getElementById("content").value;
			let writer = document.getElementById("writer").value;

			let boardObject = {
				boardNo : boardNo,
				title : title,
				content : content,
				writer : writer
			};

			let xhr = new XMLHttpRequest();
			let url = "/board/" + boardNo;

			xhr.open("PUT", url, true);
			xhr.setRequestHeader("Content-Type",
					"application/json; charset=utf-8");

			xhr.onload = function() {
				if (xhr.status === 200) {
					let result = xhr.responseText;
					console.log("result: " + result);
					if (result === "SUCCESS") {
						alert("SUCCESS");
					} else {
						// Handle other responses or errors if needed
					}
				} else {
					console.error("Request failed. Status: " + xhr.status);
					// Handle error scenario if needed
				}
			};

			xhr.onerror = function() {

				console.error("Request failed. Network error.");
				// Handle network errors if needed
			};

			xhr.send(JSON.stringify(boardObject));
		});
		//실습하지말 것
		putXmlBtn.addEventListener("click", function() {
			let boardNo = document.getElementById("boardNo").value;
			let title = document.getElementById("title").value;
			let content = document.getElementById("content").value;
			let writer = document.getElementById("writer").value;

			let xmlData = "<Board>";
			xmlData += "<boardNo>" + boardNo + "</boardNo>";
			xmlData += "<title>" + title + "</title>";
			xmlData += "<content>" + content + "</content>";
			xmlData += "<writer>" + writer + "</writer>";
			xmlData += "<regDate>2018-12-10</regDate>"; // Hardcoded regDate as in the original script
			xmlData += "</Board>";

			let xhr = new XMLHttpRequest();
			let url = "/board/" + boardNo;

			xhr.open("PUT", url, true);
			xhr.setRequestHeader("Content-Type",
					"application/xml; charset=utf-8");

			xhr.onload = function() {
				if (xhr.status === 200) {
					let result = xhr.responseText;
					console.log("result: " + result);
					if (result === "SUCCESS") {
						alert("SUCCESS");
					} else {
						// Handle other responses or errors if needed
					}
				} else {
					console.error("Request failed. Status: " + xhr.status);
					// Handle error scenario if needed
				}
			};

			xhr.onerror = function() {
				console.error("Request failed. Network error.");
				// Handle network errors if needed
			};

			xhr.send(xmlData);
		});
	});
</script>
<body>
	<h1>Ajax Home</h1>
	<form>
		boardNo: <input type="text" name="boardNo" value="" id="boardNo"><br>
		title: <input type="text" name="title" value="" id="title"><br>
		content: <input type="text" name="content" value="" id="content"><br>
		writer: <input type="text" name="writer" value="" id="writer"><br>
	</form>
	<div>
		<button id="postBtn">수정(post)</button>
		<button id="putBtn">수정(put)</button>
	</div>
</body>

</html>