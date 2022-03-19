package com.sheena.homegram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sheena.homegram.user.bo.UserBO;
import com.sheena.homegram.user.model.UserModel;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	// 가입
	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {
		
		int count = userBO.addUser(loginId, password, name, email);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result; 
		
	}
	
	
	// 로그인
	@PostMapping("/sign_in")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		
		UserModel user = userBO.getUser(loginId, password);
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			// 성공
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			
			// id, loginId, name
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			
		} else {
			// 실패
			result.put("result", "fail");
		}
		return result;
	}
	
	
	// 중복확인
	@GetMapping("/duplicate_id")
	@ResponseBody
	public Map<String, Boolean> duplicateId(@RequestParam("loginId") String loginId) {
		boolean duplicate = userBO.duplicateId(loginId);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("duplicate", duplicate);
		return result;
	}
	
	
	// 비밀번호 찾기
	

}
