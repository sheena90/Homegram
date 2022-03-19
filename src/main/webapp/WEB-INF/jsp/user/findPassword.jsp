<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정 · Homegram </title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">   
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<div class="d-flex justify-content-between align-items-end pt-3">
			<span class="logo display-2">Homegram</span>
		</div>
		<hr>
		<div class="findPasswordSpace mt-5">
			<section class="findPasswordSection">
				<form id="loginForm">
				<div class="mt-4 mb-4 text-center">
					<img width="120" alt="로그인 아이콘" src="https://cdns.iconmonstr.com/wp-content/assets/preview/2019/96/iconmonstr-cat-4.png">
				</div>
				<div>
					<div>
						<h4 class="text-center">로그인에 문제가 있나요?</h4>
					</div>
					<div class="text-center mt-3 mb-5">
						<span class="text-secondary">이메일 주소를 입력하시면 계정에 다시 액세스할 수 있는 링크를 보내드립니다.</span>
					</div>
				</div>
				<div>
					<input type="text" class="form-control mt-2" placeholder="이메일">
					
					<button type="submit" class="button btn btn-block mt-3 mb-5">로그인 링크 보내기</button>
				</div>
				<div class="line">
					또는
				</div>
				<div class="text-center mt-3 mb-5">
					<a href="/user/signup_view" class="font-weight-bold text-dark">새 계정 만들기</a>
				</div>
				</form>
			</section>
		</div>
		<div class="findPasswordBackLogin mt-2 mb-5 d-flex align-items-center justify-content-center">
			<a href="/user/signin_view" class="font-weight-bold text-dark">로그인으로 돌아가기</a>
		</div>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

</body>
</html>