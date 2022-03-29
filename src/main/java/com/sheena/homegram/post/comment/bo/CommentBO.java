package com.sheena.homegram.post.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sheena.homegram.post.comment.dao.CommentDAO;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	// comment를 insert하는 과정
	public int addComment(int postId, int userId, String userName, String content) {
		
		return commentDAO.insertComment(postId, userId, userName, content);
	}
	
	
	// postId 기반으로 comment 가져오기
	public int getComment(int postId) {
		return commentDAO.selectComment(postId);
	}
}
