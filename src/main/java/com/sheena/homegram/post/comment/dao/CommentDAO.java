package com.sheena.homegram.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sheena.homegram.post.comment.model.CommentModel;

@Repository
public interface CommentDAO {

	// comment를 insert하는 과정
	public int insertComment(
			@Param("postId") int postId,
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("content") String content);
	
	
	
	// postId 기반으로 comment 가져오기
	public List<CommentModel> selectComment(@Param("postId") int postId);
	
	
	// postId 기준으로 댓글 삭제 --> commentDAO 수행 --> postBO에서 사용
	public int deleteCommentByPostId(@Param("postId") int postId);
	
	

}
