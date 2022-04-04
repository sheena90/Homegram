package com.sheena.homegram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sheena.homegram.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	// 게시물 업로드(통합 버전)
	@PostMapping("/create")
	public Map<String, String> create(
			// content 비필수 항목으로 설정
			@RequestParam(value = "content", required = false) String content,
			@RequestParam(value = "profile", required = false) String profile,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		Map<String, String> result = new HashMap<>();
		
		int count = postBO.addPost(userId, userName, content, profile, file);
		//int count = postBO.addPost(userId, userName, content, file);
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	
	// 프로필 사진 편집
	@PostMapping("/profile")
	public Map<String, String> profile(
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Map<String, String> result = new HashMap<>();
		
		int count = postBO.updateProfile(userId, file);
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	
	// 게시물 삭제하기
	@GetMapping("/delete")
	public Map<String, String> delete(
			@RequestParam("postId") int postId,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.deletePost(postId, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	
	
	// 추후 다시 진행하기!
	// 사진 업로드(분리 버전_사진)
//	@PostMapping("/createPhoto")
//	public Map<String, String> createPhoto(
//			@RequestParam("file") MultipartFile file,
//			HttpServletRequest request) {
//		
//		HttpSession session = request.getSession();
//		int userId = (Integer)session.getAttribute("userId");
//		String userName = (String)session.getAttribute("userName");
//		
//		Map<String, String> result = new HashMap<>();
//		
//		int count = postBO.addPost(userId, userName, file);
//		
//		if(count == 1) {
//			result.put("result", "success");
//		} else {
//			result.put("result", "fail");
//		}
//		
//		return result;
//	}
	
	
//	// 추후 다시 진행하기!
//	// 새 게시물 공유하기(분리 버전_게시물)
//	@PostMapping("/createSentence")
//	public Map<String, String> createSentence(
//			@RequestParam(value = "content", required = false) String content,
//			@RequestParam("file") MultipartFile file,
//			HttpServletRequest request) {
//		
//		HttpSession session = request.getSession();
//		int userId = (Integer)session.getAttribute("userId");
//		String userName = (String)session.getAttribute("userName");
//		
//		Map<String, String> result = new HashMap<>();
//		
//		int count = postBO.addPost(userId, userName, content, file);
//		
//		if(count == 1) {
//			result.put("result", "success");
//		} else {
//			result.put("result", "fail");
//		}
//		
//		return result;
//		
//		
//	}

}
