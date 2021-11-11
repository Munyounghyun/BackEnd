package com.spring.kakao.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("user_email")) {
					c.setValue(null);
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
		session.invalidate();
		
		return "redirect:index";
	}
}
