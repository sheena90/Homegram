package com.sheena.homegram.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	// 로그아웃
	@GetMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		
		// 세션에 저장한 사용자 정보 지우기
		HttpSession session  = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		
		return "redirect:/user/signin_view";
	}
	
	// 소개
	@GetMapping("/about_view")
	public String aboutView() {
		return "user/about";
	}
	
	// 비밀번호 찾기
	@GetMapping("/findPassword_view")
	public String findPassword() {
		return "user/findPassword";
	}
	
}
