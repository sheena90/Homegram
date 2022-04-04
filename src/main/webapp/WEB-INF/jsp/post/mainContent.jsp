<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homegram</title>
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
						
						<a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-bs-expanded="false" class="mr-2 text-dark"> 
							<h4><i class="bi bi-person-circle mr-3"></i></h4>
						</a>
						
						<ul class="dropdown-menu dropdown-menu-right mt-2" aria-labelledby="dropdownMenuLink">
							<li><a class="dropdown-item" href="/post/profile_view">프로필</a></li>
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
		<div class="mainContentSection"> <!-- 나중에 section으로 수정 -->		
			<div class="d-flex justify-content-center">
				<div>
					<!-- 친구 업데이트 -->
					<div class="mainContentStories">
							
					</div>
					
					<!-- 상세 업데이트 -->
					<c:forEach var="postDetail" items="${postList }">
					<div class="mainContentNewContent mt-3">
					
						<!-- 유저 정보(이름, 삭제 아이콘) -->
						<div class="mainContentNameInfo d-flex justify-content-between align-items-center">
							<!-- 프로필&이름 -->
							<div class="d-flex align-items-center m-1">
								<div class="mainContentProfileBox">
									<img class="profile" src="https://i.pinimg.com/originals/e3/cb/8e/e3cb8eeb33d7d8f7a5ac65a08bc255ed.jpg">
								</div>
								<div class="ml-3">
									<b>${postDetail.post.userName }</b>
								</div>
							</div>
							
							<!-- 삭제 아이콘 -->
							<div class="mr-3">
								<a href="#" class="text-dark moreBtn" data-post-id="${postDetail.post.id }" data-toggle="modal" data-target="#moreModal">
									<b><i class="bi bi-three-dots"></i></b>
								</a>
							</div>
						</div>
						
						<!-- 이미지 -->
						<div>
							<img class="w-100" src="${postDetail.post.imagePath }" alt="유저 업로드 사진">
						</div>
						
						<!-- 좋아요, 댓글 아이콘 -->
						<div class="mainContentLike d-flex justify-content-start align-items-center">
							<div class="ml-3">
								<!-- boolean 형태의 is*** 값을 가져올때, is를 뺀 나머지 소문자 형태로 쓰인다 -->
								<c:choose>
									<c:when test="${postDetail.like }">
										<!-- 좋아요 형태 -->
										<a href="#" class="unlikeBtn" data-post-id="${postDetail.post.id }"><i class="bi bi-heart-fill text-danger"></i></a>
									</c:when>
									<c:otherwise>
										<!-- 좋아요 아닌 상태 -->
										<a href="#" class="likeBtn" data-post-id="${postDetail.post.id }"><i class="bi bi-heart text-dark"></i></a>
									</c:otherwise>
								</c:choose>						
							</div>
							<div class="ml-3">
								<i class="bi bi-chat-square"></i>
							</div>
						</div>
						
						<!-- 좋아요 개수 표기 -->
						<div class="mainContentLikeCount">
							<div class="ml-3">
								<b>좋아요 ${postDetail.likeCount }개</b>
							</div>
						</div>
						
						<!-- 게시글 -->
						<div class="ml-3">
							<b>${postDetail.post.userName }</b> ${postDetail.post.content }
						</div>
						
						<!-- 댓글 -->
						<div>
						
							<div class="mainContentComment d-flex align-items-end mb-2">
								<b class="text-secondary ml-3">댓글</b>
							</div>
							<c:forEach var="comment" items="${postDetail.commentList }">
								<div class="ml-3">
									<b>${comment.userName }</b> ${comment.content }
								</div>
							</c:forEach>
						</div>
						
						<!-- 댓글 달기 -->
						<hr class="mt-3">
						<div class="mainContentWriteComment d-flex">
							<input type="text" class="form-control border-0" placeholder="댓글 달기..." id="commentInput${postDetail.post.id }">
							<button type="button" class="btn btn-link commentBtn" data-post-id="${postDetail.post.id }"><b class="text-info">게시</b></button>
						</div>
					</div>
					</c:forEach>				
				</div>
				
				<div class="ml-4">
					<!-- 로그인 대상 -->
					<div class="mainContentLoginInfo">
						
						<div class="ml-3 d-flex align-items-center ">
							<div class="mainContentProfileBox">
								<img class="profile" src="https://i.pinimg.com/originals/e3/cb/8e/e3cb8eeb33d7d8f7a5ac65a08bc255ed.jpg">
							</div>
							<div>
								<b class="ml-4">${userName }</b>
							</div>
							
						</div>
						
						<!-- 회원님을 위한 추천 -->
						<div class="ml-3 mt-5">
							<b class="text-secondary">회원님을 위한 추천</b>
						</div>
						<div class="mt-4">
						<c:forEach var="postDetailUserName" items="${postList }">
							<div class="d-flex justify-content-between align-items-center ml-3 mr-3">
								<div class="d-flex align-items-center">
									<h2><i class="bi bi-person-circle"></i></h2>
									<b class="ml-4">${postDetailUserName.post.userName }</b>
								</div>
								<a href="#"><b class="text-primary">팔로우</b></a>
							</div>
						</c:forEach>
						</div>
					</div>
					<!-- footer -->
					<div class="mainContentFooter mt-5">
						<c:import url="/WEB-INF/jsp/include/footer.jsp" />
					</div>
				</div>
			</div>
		</div>
		
	
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="moreModal">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-body text-center">
	      	<a href="#" id="deleteBtn">삭제하기</a>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
		$(document).ready(function() {
			
			// 댓글 게시 버튼
			$(".commentBtn").on("click", function() {
				
				//postId 가져오기
				let postId = $(this).data("post-id");
				
				// $("#commentInput2") 버튼에 대한 객체
				let comment = $("#commentInput" + postId).val();
				
				// 유효성 검사
				if(comment == "") {
					alert("내용을 입력하세요");
					 return;
				}
				
				// comment api 호출
				$.ajax({
					type:"post",
					url:"/post/comment/create",
					data:{"postId":postId, "content":comment},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 쓰기 실패");
						}
						
					},
					error:function() {
						alert("댓글 쓰기 에러")
					}
					
				});
				
			});
			
			
			// 좋아요 이벤트 등록
			// 여러개의 좋아요 버튼을 하나의 이벤트에서 관리할 때, class를 부여
			$(".likeBtn").on("click", function(e) {
				// 해당 태그에 있던 모든 속성, 기능들을 취소해줌.(여기서는 a태그의 페이지 이동을 취소해줌)
				e.preventDefault();
				
				// postId 가져오기
				let postId = $(this).data("post-id");	
				
				// like api 호출
				$.ajax({
					type:"get",
					url:"/post/like",
					data:{"postId":postId},
					success:function(data) {
						
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 실패");
						}
					},
					error:function() {
						alert("좋아요 에러");
					}
				});
				
			});
			
			
			// 좋아요 취소 이베트 등록
			$(".unlikeBtn").on("click", function(e) {
				// 해당 태그에 있던 모든 속성, 기능들을 취소해줌.(여기서는 a태그의 페이지 이동을 취소해줌)
				e.preventDefault();
				
				// postId 가져오기
				let postId = $(this).data("post-id");
				
				// unlike api 호출
				$.ajax({
					type:"get",
					url:"/post/unlike",
					data:{"postId":postId},
					success:function(data) {
						
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 취소 실패");
						}
					},
					error:function() {
						alert("좋아요 취소 에러");
					}
				});
			});
			
			
			
			
			// 게시물 삭제 이벤트 등록 (moreBtn, deleteBtn)
			$(".moreBtn").on("click", function(e) {
				// 해당 태그에 있던 모든 속성, 기능들을 취소해줌.(여기서는 a태그의 페이지 이동을 취소해줌)
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				// more 버튼을 클릭했을 때, 데이터(postId) 심기
				$("#deleteBtn").data("post-id", postId); // <a href="" data-post-id="값">과 같다
				
			});
			
			$("#deleteBtn").on("click", function(e) {
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("삭제 실패");
						}
					},
					error:function() {
						alert("삭제 에러");
					}
				
				});
				
			});
		});
	</script>

</body>
</html>