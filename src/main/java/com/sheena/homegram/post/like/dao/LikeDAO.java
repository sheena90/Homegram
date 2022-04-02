package com.sheena.homegram.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	
	// '좋아요' 취소(dao-->쿼리 입장)
	public int deleteLike(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	
	// postId 기반으로 like 갯수를 가져오기
	public int selectLikeCount(@Param("postId") int postId);
	
	
	// 어떤 사용자가 좋아요를 눌렀는지 안눌렀는지, 전달해야 할 형태: 0과 1
	public int selectLikeCountByUserId(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	
	// postId 기준으로 좋아요 삭제 --> likeDAO 수행 --> postBO에서 사용
	public int deleteLikeByPostId(@Param("postId")int postId);
}
