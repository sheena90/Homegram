package com.sheena.homegram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sheena.homegram.post.bo.PostBO;
import com.sheena.homegram.post.model.PostModel;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostBO postBO;
	
	// MainContent Page
	@GetMapping("/mainContent_view")
	public String mainContentView(Model model) {
		
		// 게시물 가져오기
		
		List<PostModel> postList = postBO.getPostList();
		
		model.addAttribute("postList", postList);
		
		return "post/mainContent";
	}
	
	
	// newPost_photo Page
	@GetMapping("/newPostPhoto_view")
	public String newPostPhoto() {
		return "post/newPost_photo";
	}
	
	
	// newPost_sentence Page
	@GetMapping("/newPostSentence_view")
	public String newPostSentence() {
		return "post/newPost_sentence";
	}
}
