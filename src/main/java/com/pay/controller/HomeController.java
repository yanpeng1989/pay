package com.pay.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pay.services.HomeService;

@Controller
public class HomeController {

	@Autowired
	HomeService homeService;

	@RequestMapping(value = "sign-in")
	public String sign_in() {
		return "sign-in";
	}
	@RequestMapping(value = "login-in",method = RequestMethod.GET)
	@ResponseBody
	public String login_in(Model model,@RequestParam(value = "username") String username,@RequestParam(value = "password") String password,@RequestParam(value = "captcha") String captcha,HttpSession session) {
		String session_captcha=String.valueOf( session.getAttribute("kaptchaExpected"));
		System.out.println(session_captcha);
		System.out.println(username+"+"+password+"+"+captcha);
		String result="";
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("result", "success");
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			result = objectMapper.writeValueAsString(map);
			System.out.println(result);
		} catch (Exception e) {
			
		}
		
		return result;
	}
	
	@RequestMapping(value = "sign-up")
	public String sign_up(Model model) {
		return "sign-up";
	}
	@RequestMapping(value = "index")
	public String Test(Model model) {
		return "index";
	}

	@RequestMapping("kaptcha")
	public String kaptcha(HttpSession session) {
		System.out.println(session.getAttribute("kaptchaExpected"));
		return "kaptcha";
	}

}
