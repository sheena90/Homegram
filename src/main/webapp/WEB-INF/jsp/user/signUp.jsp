<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">   
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="/static/css/style.css" type="text/css">
    
</head>
<body>
	<div id="wrap">
		<div class="space mt-5">
		
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
			
			<section>
				<div class="text-center text-secondary">
					친구들의 온라인 집들이에 초대합니다.
				</div>
				<div class="mt-3">
					<button type="button" class="otherLoginBtn btn form-control">KakaoTalk으로 로그인</button>
				</div>
				<div class="line">
					또는
				</div>
				<div>
					<div class="input-group">
						<input type="text" id="loginIdInput" class="form-control mt-2" placeholder="아이디">
						<div class="input-group-append">
							<button type="button" id="duplicateBtn" class="btn btn-secondary mt-2">중복확인</button>
						</div>						
					</div>
					<div class="d-none" id="possibleText"><small class="text-success">사용 가능한 아이디입니다.</small></div>
					<div class="d-none" id="impossibleText"><small class="text-danger">중복된 아이디입니다.</small></div>
					<input type="password" id="passwordInput" class="form-control mt-2" placeholder="비밀번호">
					<input type="password" id="passwordConfirmInput" class="form-control mt-2" placeholder="비밀번호 확인">
					<input type="text" id="nameInput" class="form-control mt-2" placeholder="성명">
					<input type="text" id="emailInput" class="form-control mt-2" placeholder="이메일 주소">
					
					<button type="button" id="signUpBtn" class="button btn btn-block mt-3 mb-5">가입</button>
				</div>
			</section>
		</div>
		<div class="login mt-2 mb-5 d-flex align-items-center justify-content-center">
			계정이 있으신가요? 
			<a href="/user/signin_view" class="font-weight-bold">로그인</a>
		</div>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />

	</div>


	<script>
		$(document).ready(function() {
			// 중복 체크를 했는지 여부 저장하는 변수
			var isChecked = false;
			
			// 중복된 상태인지 확인하는 변수
			var isDuplicate = true;
			
			$("#signUpBtn").on("click", function(e) {
				
				e.preventDefault();
				
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				// 유효성 검사
				if(loginId == "") {
					alert("아이디를 입력하세요.");
					return;
				}
				
				if(isChecked == false) {
					alert("중복 확인을 진행해 주세요.");
					 return;
				}
				
				if(isDuplicate) {
					alert("아이디가 중복되었습니다.");
					 return;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				if(password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				
				if(name == "") {
					alert("성명을 입력하세요.");
					return;
				}
				
				if(email == "") {
					alert("메일주소를 입력하세요.");
					return;
				}
				
				// ajax를 통한 api 호출
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"loginId":loginId, "password":password, "name":name, "email":email},
					success:function(data) {
						if(data.result == "success") {
							// 회원가입 성공
							alert("성공적으로 가입되었습니다.");
						} else {
							alert("가입에 실패되었습니다.");
						}
						
					},
					error:function() {
						alert("가입 에러 발생");
					}
				});
			});
				
				
			// 중복 체크
			$("#duplicateBtn").on("click", function() {
					
				let loginId = $("#loginIdInput").val();
					
				if(loginId == "") {
					alert("아이디를 입력하세요.");
					return;
				}
					
				$.ajax({
					type:"get",
					url:"/user/duplicate_id",
					data:{"loginId":loginId},
					success:function(data) {
						// 중복체크 완료
						isChecked = true;
								
						//안내 텍스트를 숨기기
						$("#possibleText").addClass("d-none");
						$("#impossibleText").addClass("d-none");
								
						if(data.duplicate) {
							// 중복 안내 텍스트를 보여주기
							$("#impossibleText").removeClass("d-none");
						} else {
							// 사용 가능 안내 텍스트를 보여주기
							$("#possibleText").removeClass("d-none");
						}
								
						isDuplicate = data.duplicate;
					},
					error:function() {
						alert("중복확인 에러 발생");
					}
				});
			});
			
			// 중복 체크 후, id를 통한 이벤트 등록
			$("#loginIdInput").on("input", function() {
				// 중복 확인에 대한 변수 값 초기화
				isChecked = false;
				isDuplicate = true;
				
				// 중복 확인 텍스트 숨기기
				$("#possibleText").addClass("d-none");
				$("#impossibleText").addClass("d-none");
			});
			
		});
	</script>
</body>
</html>