package com.spring.kakao.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.kakao.model.dto.UserDto;
import com.spring.kakao.model.json.SignUpVo;
import com.spring.kakao.service.UserService;

@Controller
public class SignUpController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/sign-up", method = RequestMethod.GET)
	public String signUpIndex(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("user_email")) {
					UserDto userDto = userService.getUser(c.getValue());
					session.setAttribute("login_user", userDto);
				}
			}
		}
		if(session.getAttribute("login_user") != null) {
			return "redirect:index";
		}
		return "signUp/sign_up";
	}
	
	@ResponseBody
	@RequestMapping(value = "/sign-up-emailCheck", method = RequestMethod.POST)
	public Object signUpEmailCheck(@RequestParam String signUpEmail) {
		SignUpVo signUpVo = new SignUpVo();
		signUpVo.setSignUpEmail(signUpEmail);
		signUpVo.setEmailFlag(userService.signUpEmailCheck(signUpEmail));
		System.out.println(signUpVo);
		return signUpVo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/phone-number-check", method = RequestMethod.POST)
	public Object signUpPhoneCheck(@RequestBody SignUpVo signUpVo) {
		signUpVo.setPhoneFlag(userService.signUpPhoneCheck(signUpVo));
		return signUpVo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/sign-up", method = RequestMethod.POST)
	public String signUp(@RequestBody SignUpVo signUpVo) {
		return Integer.toString(userService.signUp(signUpVo));
	}
}








