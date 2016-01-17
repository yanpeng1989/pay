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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pay.services.HomeService;

@Controller
@SessionAttributes({ "sign_id", "name" })
public class HomeController {

	@Autowired
	HomeService homeService;

	@RequestMapping(value = "sign-in")
	public String sign_in() {
		return "sign-in";
	}

	@RequestMapping(value = "login-in", method = RequestMethod.GET)
	@ResponseBody
	public String login_in(Model model, @RequestParam(value = "sign_id") String sign_id, @RequestParam(value = "password_1") String password_1, @RequestParam(value = "captcha") String captcha, HttpSession session) {
		String session_captcha = String.valueOf(session.getAttribute("kaptchaExpected"));
		String result = "";
		
		System.out.println("sign_id="+sign_id+";password_1="+password_1);
		
		HashMap<String, String> map_json = new HashMap<String, String>();
		if (!session_captcha.equals(captcha)) {
			map_json.put("result", "captcha_error");
		} else {
			if (sign_id != "" && password_1 != "") {
				HashMap<String, String> usermap = homeService.userLogin(sign_id, password_1);
				if (usermap == null ? false : usermap.size() > 0) {
					String name = usermap.get("name");
					model.addAttribute("sign_id", sign_id);
					model.addAttribute("name", name);
					map_json.put("result", "sign_success");
				} else {
					map_json.put("result", "sign_unsuccess");
				}
			}else{
				map_json.put("result", "sign_error");
			}
		}
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			result = objectMapper.writeValueAsString(map_json);
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
	public String index(Model model,HttpSession session) {
		System.out.println(session.getAttribute("name"));
		model.addAttribute("name", session.getAttribute("name"));
		return "index";
	}

	@RequestMapping("kaptcha")
	public String kaptcha(HttpSession session) {
		System.out.println(session.getAttribute("kaptchaExpected"));
		return "kaptcha";
	}

}
