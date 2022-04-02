package com.sheena.homegram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sheena.homegram.post.model.PostModel;

@Repository
public interface PostDAO {
	
	// 통합 버전
	public int insertCreatePost(
			@Param("userId") int userId, 
			@Param("userName") String userName,
			@Param("content") String content,
			@Param("imagePath") String imagePath);
	
	
	// 게시물 가져오기
	public List<PostModel> selectPostList();
	
	
	
	// 게시물 삭제하기
	public int deletePost(@Param("postId") int postId);
	
	// 게시물 삭제를 위한 postId 가져오기
	public PostModel selectPost(@Param("postId") int postId);
	
	
	

	// 추후 다시 진행하기!
	// 사진 업로드(분리 버전_사진)
//	public int insertPost(
//			@Param("userId") int userId, 
//			@Param("userName") String userName,
//			@Param("imagePath") String imagePath);
	
	
	// 추후 다시 진행하기!
	// 사진 업로드(분리 버전_게시글)
//	public int insertCreatePost(
//			@Param("userId") int userId, 
//			@Param("userName") String userName,
//			@Param("content") String content,
//			@Param("imagePath") String imagePath);
	
	
	
	
	

	
}
