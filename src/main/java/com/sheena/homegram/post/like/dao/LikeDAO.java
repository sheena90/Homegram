package com.sheena.homegram.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	
	// postId 기반으로 like 갯수를 가져오기
	public int selectLikeCount(@Param("postId") int postId);
}
