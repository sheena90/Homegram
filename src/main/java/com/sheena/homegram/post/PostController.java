package com.sheena.homegram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sheena.homegram.post.bo.PostBO;
import com.sheena.homegram.post.model.PostDetailModel;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostBO postBO;
	

	// MainContent Page
	@GetMapping("/mainContent_view")
	public String mainContentView(Model model, HttpServletRequest request) {
		
		// 좋아요 클릭 기능을 위한 PostBO에서 userId를 꺼내오기 위한 코드
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		// 게시물 가져오기
		// 좋아요 클릭 기능을 위한 PostBO에서 userId를 꺼내오기 위한 코드 추가
		List<PostDetailModel> postList = postBO.getPostList(userId);
		
		model.addAttribute("postList", postList);
		
		return "post/mainContent";
	}

	
	
	// newPost Page 
	@GetMapping("/newPost_view")
	public String newPost() {
		return "post/newPost";
	}
	
	
	
	// profile Page
	@GetMapping("/profile_view")
	public String profile() {
		return "post/profile";
	}
	
		
//	// 추후 분리하기_사진
//	// newPost_photo Page 
//	@GetMapping("/newPostPhoto_view")
//	public String newPostPhoto() {
//		return "post/newPost_photo";
//	}
//	
//	
//	// 추후 분리하가_게시글
//	// newPost_sentence Page
//	@GetMapping("/newPostSentence_view")
//	public String newPostSentence() {
//		return "post/newPost_sentence";
//	}
}
