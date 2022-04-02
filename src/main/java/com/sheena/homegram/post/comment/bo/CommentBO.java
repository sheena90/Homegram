package com.sheena.homegram.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sheena.homegram.post.comment.dao.CommentDAO;
import com.sheena.homegram.post.comment.model.CommentModel;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	// comment를 insert하는 과정
	public int addComment(int postId, int userId, String userName, String content) {
		
		return commentDAO.insertComment(postId, userId, userName, content);
	}
	
	
	// postId기반으로 comment 가져오기
	public List<CommentModel> getCommentList(int postId) {
		
		 return commentDAO.selectComment(postId);
		
	}
	
	
	// postId 기준으로 댓글 삭제 메소드 만들기 --> commentDAO 수행 --> postBO에서 사용
	public int deleteCommentByPostId(int postId) {
		return commentDAO.deleteCommentByPostId(postId);
	}
}
