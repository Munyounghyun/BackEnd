package com.spring.kakao.service;

import javax.servlet.http.Cookie;

import com.spring.kakao.model.dto.UserDto;
import com.spring.kakao.model.json.SignInVo;
import com.spring.kakao.model.json.SignUpVo;

public interface UserService {
	public int signUpEmailCheck(String signUpEmail);
	public int signUpPhoneCheck(SignUpVo signUpVo);
	public int signUp(SignUpVo signUpVo);
	public int signIn(SignInVo signInVo);
	public UserDto getUser(String user_email);
	public Cookie setUserCookie(String user_email);
}
