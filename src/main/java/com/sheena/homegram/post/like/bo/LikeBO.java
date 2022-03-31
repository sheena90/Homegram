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
	
	
	// '좋아요' 취소
	public int unLike(int postId, int userId) {
		return likeDAO.deleteLike(postId, userId);
	}
	
	
	// postId 기반으로 like 갯수를 가져오기
	public int getLikeCount(int postId) {
		return likeDAO.selectLikeCount(postId);
	}
	
	// 어떤 사용자가 좋아요를 눌렀는지 안눌렀는지, 전달해야 할 데이터: 어떤 글에 누가
	public boolean isLike(int postId, int userId) {
		int count = likeDAO.selectLikeCountByUserId(postId, userId);
		
//		// 조회된 결과가 없으면 좋아요 아닌 상태
//		if(count == 0) {
//			return false;
//		} else { // 좋아요 상태
//			return true;
//		}
		
		// 위 코드를 줄여서 표현하기
		// 0이 아닌 경우는 좋아요 상태
		return (count != 0);
	}
	

}
