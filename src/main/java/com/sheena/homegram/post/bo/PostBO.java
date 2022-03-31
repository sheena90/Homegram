package com.sheena.homegram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sheena.homegram.common.FileManagerService;
import com.sheena.homegram.post.comment.bo.CommentBO;
import com.sheena.homegram.post.comment.model.CommentModel;
import com.sheena.homegram.post.dao.PostDAO;
import com.sheena.homegram.post.like.bo.LikeBO;
import com.sheena.homegram.post.model.PostDetailModel;
import com.sheena.homegram.post.model.PostModel;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private CommentBO commentBO;
	
	// 통합 버전
	public int addPost(int userId, String userName, String content, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertCreatePost(userId, userName, content, imagePath);
		
	}
	
	
	
	// 게시물 가져오기
	// 메인화면 전체 게시물 가져오기(좋아요, 댓글)
	// 해당 코드에 좋아요 클릭 기능도 추가
	public List<PostDetailModel> getPostList(int userId) {
		
		List<PostModel> postList = postDAO.selectPostList();
		
		
		List<PostDetailModel> postDetailList = new ArrayList<>();
		
		// 포스트마다 댓글 좋아요 가져오기
		for(PostModel post : postList) {
			
			// postId 기반으로 like 갯수를 가져오기
			int likeCount = likeBO.getLikeCount(post.getId());
			
			// 댓글 리스트 얻어오기
			List<CommentModel> commentList = commentBO.getCommentList(post.getId());
			
			// 로그인한 사용자가 좋아요를 눌렀는지 여부
			boolean isLike = likeBO.isLike(post.getId(), userId);
			
			// post id를 이용해서 좋아요 개수, 댓글 리스트 조회
			PostDetailModel postDetail = new PostDetailModel();
			//post 데이터 set
			postDetail.setPost(post);
			// likeCount set
			postDetail.setLikeCount(likeCount);
			
			// commentList set
			postDetail.setCommentList(commentList);
			
			// isLike(로그인한 사용자가 좋아요 눌렀는지 여부_boolean 형태) set
			postDetail.setLike(isLike);
			
			
			postDetailList.add(postDetail);
			
		}
		
		return postDetailList;
	}
	
	
	

	// 추후 다시 진행하기!
	// 사진 업로드(분리 버전_사진)
//	public int addPost(int userId, String userName, MultipartFile file) {
//		
//		String imagePath = FileManagerService.saveFile(userId, file);
//		
//		return postDAO.insertPost(userId, userName, imagePath);
//	}
	
	
	// 추후 다시 진행하기!
	// 사진 업로드(분리 버전_게시글)
//	public int addPost(int userId, String userName, String content, MultipartFile file) {
//		
//		String imagePath = FileManagerService.saveFile(userId, file);
//		
//		return postDAO.insertCreatePost(userId, userName, content, imagePath);
//	}
	
	
	
	

}
