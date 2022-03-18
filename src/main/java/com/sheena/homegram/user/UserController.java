package com.sheena.homegram.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	// 가입
	@GetMapping("/signup_view")
	public String signupView() {
		return "user/signUp";
	}
	
	// 메인 로그인
	@GetMapping("/homegram")
	public String mainSignin() {
		return "user/mainSignIn";
	}
	
	// 로그인
	@GetMapping("/signin_view")
	public String signinView() {
		return "user/signIn";
	}
	
	// 소개
	@GetMapping("/about_view")
	public String aboutView() {
		return "user/about";
	}
	
}
