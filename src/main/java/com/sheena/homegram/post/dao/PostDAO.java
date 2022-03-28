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

	// 추후 다시 진행하기!
	// 사진 업로드(분리 버전_사진)
	public int insertPost(
			@Param("userId") int userId, 
			@Param("userName") String userName,
			@Param("imagePath") String imagePath);
	
	
	// 추후 다시 진행하기!
	// 사진 업로드(분리 버전_게시글)
//	public int insertCreatePost(
//			@Param("userId") int userId, 
//			@Param("userName") String userName,
//			@Param("content") String content,
//			@Param("imagePath") String imagePath);
	
	
	
	
	
	// 게시물 가져오기
	public List<PostModel> selectPostList();
	
}
