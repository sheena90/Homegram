<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 게시물 만들기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">   
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div>
		<div class="newPostPhoto">
			<div class="newPostTitle d-flex m-3">
				<div class="col-7 d-flex justify-content-end align-items-center"><b>새 게시물 만들기</b></div>
				<div class="col-5 d-flex justify-content-end align-items-center">
					<button class="btn btn-link" id="nextBtn"><b>다음</b></button>
				</div>
			</div>
			<hr>
			<div class="newPostPhotoMenu">
				<div class="text-center display-1 text-secondary">
					<i class="bi bi-images"></i>
				</div>
				<div class="text-center mt-4">
					<span>사진을 여기에 끌어다 놓으세요</span>
				</div>
				<div class="mt-4 text-center bg-info">
					<div><input type="file" id="fileInput"></div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
		
			$("#nextBtn").on("click", function() {
				
				// 파일 유효성 검사
				//$("#fileInput")[0].files[0]
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 선택해주세요");
					return;
				}
				
				let formData = new FormData();
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post",
					url:"/post/createPhoto",
					data:formData,
					enctype:"multipart/form-data",
					processData:false,
					contentType:false,
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/newPostSentence_view";
						} else {
							alert("사진 업로드 실패");
						}
					},
					error:function() {
						alert("사진 업로드 에러");
					}
				});
			});
		});
	
	</script>

</body>
</html>