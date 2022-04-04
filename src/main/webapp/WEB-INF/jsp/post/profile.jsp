<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${userName } · Homegram 사진</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">   
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<div class="mainContentHeader"> <!-- 추후 header로 수정 예정 -->
			<div class="d-flex justify-content-between align-items-center bg-white">
				<div>
					<img width="200" alt="logo" src="/static/image/logo4.PNG">
				</div>
				<div>
					<input type="text" placeholder="검색" class="form-control">
				</div>
				<div class="d-flex">
					<h4>
						<a href="/post/mainContent_view" class="mr-2 text-dark"> 
							<i class="bi bi-house-door-fill mr-3"></i>
						</a> 
						<a href="/post/newPost_view" class="mr-2 text-dark"> 
							<i class="bi bi-plus-square mr-3"></i>
						</a> 
						<a href="#" class="mr-2 text-dark"> 
							<i class="bi bi-heart mr-3"></i>
						</a> 
					</h4>
					<!-- 유저 아이콘에 대한 dropdown 적용 : 프로필, 로그아웃 -->
					<div class="dropdown d-flex align-items-center">
						<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false" class="mr-2 text-dark"> 
							<h4><i class="bi bi-person-circle mr-3"></i></h4>
						</a>
						
						<ul class="dropdown-menu dropdown-menu-right mt-2" aria-labelledby="dropdownMenuLink">
							<li><a class="dropdown-item" href="#">프로필</a></li>
							<li><hr class="dropdown-divider"></li>
							<c:if test="${not empty userName }">
							<li>
								<a class="dropdown-item text-primary" href="/user/sign_out">로그아웃</a>
							</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<hr>
		
		<div class="m-auto w-75 mt-4">
			<div class="d-flex align-items-center">
			
				<!-- 프로필 사진 -->
				<div class="profileBox">
					<img class="profile" src="${postProfile }">
				</div>
				
				<!-- 프로필 편집 및 기타 정보 -->
				<div class="ml-5">
					<div class="ml-5 mb-4 d-flex align-items-center">
						<span class="profileFont text-secondary">${userLoginId }</span>
						<button id="editBtn" class="btn btn-sm ml-5 mr-2">프로필 편집</button>
						<input type="file" id="profileInput">
						<i class="bi bi-gear profileFont"></i>
					</div>
					<div class="ml-5 mb-4">
						<span class="mr-5">게시물 0</span>
						<span class="mr-5">팔로워 0</span>
						<span>팔로우 0</span>
					</div>
					<div class="ml-5">
						<b>${userName }</b>
					</div>
				</div>			
			</div>
		</div>
		
		<div class="mt-5">
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#editBtn").on("click", function() {
				
				let formData = new FormData();
				formData.append("file",$("#profileInput")[0].files[0]);
				
				$.ajax({
					type:"post",
					url:"/post/profile",
					data:formData,
					enctype:"multipart/form-data",
					processData:false,
					contentType:false,
					success:function(data) {
						if(data.result == "success") {
							alert("편집 성공");
							location.reload();
						} else {
							alert("편집 실패");
						}
					},
					error:function() {
						alert("편집 에러");
					}
				});
			});
		});
	
	</script>
	
	
</body>
</html>