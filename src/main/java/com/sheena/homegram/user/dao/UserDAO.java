package com.sheena.homegram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sheena.homegram.user.model.UserModel;

@Repository
public interface UserDAO {
	
	// 가입
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email") String email);

	
	
	// 로그인
	public UserModel selectUser(
			@Param("loginId") String loginId,
			@Param("password") String password);
	
	
	// 중복체크
	public int selectLoginIdCount(@Param("loginId") String loginId);
	
	
	// 비밀번호 찾기
	
}
