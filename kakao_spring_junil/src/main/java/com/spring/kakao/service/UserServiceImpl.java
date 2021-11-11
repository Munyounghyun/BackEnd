package com.spring.kakao.service;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.kakao.model.dao.UserDao;
import com.spring.kakao.model.dto.UserDto;
import com.spring.kakao.model.json.SignInVo;
import com.spring.kakao.model.json.SignUpVo;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public int signUpEmailCheck(String signUpEmail) {
		return userDao.emailCheck(signUpEmail);
	}
	
	@Override
	public int signUpPhoneCheck(SignUpVo signUpVo) {
		return userDao.phoneCheck(signUpVo);
	}
	
	@Override
	public int signUp(SignUpVo signUpVo) {
		return userDao.signUp(signUpVo);
	}
	
	@Override
	public int signIn(SignInVo signInVo) {
		return userDao.signIn(signInVo);
	}
	
	@Override
	public UserDto getUser(String user_email) {
		return userDao.getUser(user_email);
	}
	
	@Override
	public Cookie setUserCookie(String user_email) {
		Cookie cookie_email = new Cookie("user_email", user_email);
		cookie_email.setMaxAge(60*60*24);
		return cookie_email;
	}
}
