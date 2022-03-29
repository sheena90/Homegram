package com.sheena.homegram.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sheena.homegram.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int postId, int userId) {
		
		return likeDAO.insertLike(postId, userId);
	}
	
	
	// postId 기반으로 like 갯수를 가져오기
	public int getLikeCount(int postId) {
		return likeDAO.selectLikeCount(postId);
	}
	

}
