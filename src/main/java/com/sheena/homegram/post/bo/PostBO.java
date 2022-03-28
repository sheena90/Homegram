package com.sheena.homegram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sheena.homegram.common.FileManagerService;
import com.sheena.homegram.post.dao.PostDAO;
import com.sheena.homegram.post.model.PostModel;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	// 통합 버전
	public int addPost(int userId, String userName, String content, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertCreatePost(userId, userName, content, imagePath);
		
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
	
	
	
	
	// 게시물 가져오기
	public List<PostModel> getPostList() {
		return postDAO.selectPostList();
	}
}
