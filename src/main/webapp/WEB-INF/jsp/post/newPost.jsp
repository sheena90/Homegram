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
					<button class="btn btn-link" id="uploadBtn"><b>공유하기</b></button>
				</div>
			</div>
			<hr>
			<div class="uploadBox border rounded bg-white">
				<div class="text-center display-1 text-secondary">
					<a href="#" id="imageIcon"><i class="bi bi-images text-secondary"></i></a>
				</div>
				<div class="text-center mt-4">
					<span>사진을 선택하세요</span>
				</div>
				<div class="mt-4 text-center d-none">
					<div><input type="file" id="fileInput"></div>
				</div>
				<div class="mt-3">
					<textarea class="form-control w-100 border-0 non-resize" rows="5" cols="2000" placeholder="문구 입력..." id="contentInput"></textarea>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() { 
			
			// 업로드 버튼 이벤트 등록
			$("#uploadBtn").on("click", function() {
				
				let content = $("#contentInput").val().trim();
				
				
				// 파일 유효성 검사
				//$("#fileInput")[0].files[0]
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 선택해주세요");
					return;
				}
				
				let formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post",
					url:"/post/create",
					data:formData,
					enctype:"multipart/form-data",
					processData:false,
					contentType:false,
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/mainContent_view";
						} else {
							alert("업로드 실패");
						}
					},
					error:function() {
						alert("업로드 에러");
					}
				});
			});
			
			
			// 이미지 아이콘 이벤트 등록
			$("#imageIcon").on("click", function() {
				// fileInput 클릭된 효과
				$("#fileInput").click();
			});
			
		});
	
	</script>

</body>
</html>