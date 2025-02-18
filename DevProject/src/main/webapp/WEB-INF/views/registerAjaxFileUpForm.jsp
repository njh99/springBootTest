<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드 Ajax 방식 요청 처리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#inputFile").on("change", function(event) {
			console.log("change");
			console.log(event);
			var files = event.target.files;
			var file = files[0];
			console.log(file);
			var formData = new FormData();
			formData.append("file", file);
			$.ajax({
				type : "post",
				url : "/uploadAjax",
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				success : function(data) {
					alert(data);
				}
			});
		});
	});
</script>
</head>
<body>
	<h2>파일업로드 Ajax 방식 요청 처리</h2>
	<div>
		<input type="file" id="inputFile" multiple>
	</div>
</body>
</html>