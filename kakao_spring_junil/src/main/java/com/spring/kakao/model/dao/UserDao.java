package com.spring.kakao.model.dao;

import com.spring.kakao.model.dto.UserDto;
import com.spring.kakao.model.json.SignInVo;
import com.spring.kakao.model.json.SignUpVo;

public interface UserDao {
	public int emailCheck(String signUpEmail);
	public int phoneCheck(SignUpVo signUpVo);
	public int signUp(SignUpVo signUpVo);
	public int signIn(SignInVo signInVo);
	public UserDto getUser(String user_email);
}
