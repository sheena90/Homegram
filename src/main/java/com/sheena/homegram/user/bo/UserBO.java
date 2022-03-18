package com.sheena.homegram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sheena.homegram.common.EncryptUtils;
import com.sheena.homegram.user.dao.UserDAO;
import com.sheena.homegram.user.model.UserModel;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;

	// 가입
	public int addUser(String loginId, String password, String name, String email) {
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	
	// 로그인
	public UserModel getUser(String loginId, String password) {
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(password);
				
		return userDAO.selectUser(loginId, encryptPassword);
	}
	
	
	// 중복 체크
	public boolean duplicateId(String loginId) {
		
		int count = userDAO.selectLoginIdCount(loginId);
		
		return count != 0;
	}
	
}
