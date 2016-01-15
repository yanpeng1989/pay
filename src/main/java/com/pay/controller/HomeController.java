package com.pay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pay.services.HomeService;

@Controller
public class HomeController {

	@Autowired
	HomeService homeService;

	@RequestMapping(value = "sign-in")
	public String sign_in(Model model) {
		return "sign-in";
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
	public String kaptcha(HttpServletRequest request,HttpSession session) {
		System.out.println(session.getAttribute("kaptchaExpected"));
		return "kaptcha";
	}

}
