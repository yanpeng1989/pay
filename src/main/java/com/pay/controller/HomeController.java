package com.pay.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
			} else {
				map_json.put("result", "sign_error");
			}
		}
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			result = objectMapper.writeValueAsString(map_json);
		} catch (Exception e) {
		}
		return result;
	}

	@RequestMapping(value = "sign-up")
	public String sign_up(Model model) {
		return "sign-up";
	}

	@RequestMapping(value = "login-up", method = RequestMethod.GET)
	@ResponseBody
	public String login_up(Model model, @RequestParam(value = "tel") String tel, @RequestParam(value = "sign_id") String sign_id, @RequestParam(value = "username") String username, @RequestParam(value = "password") String password, @RequestParam(value = "recommend_id") String recommend_id, @RequestParam(value = "captcha") String captcha, HttpSession session) {
		String session_captcha = String.valueOf(session.getAttribute("kaptchaExpected"));
		String result = "";
		HashMap<String, String> map_json = new HashMap<String, String>();
		if (!session_captcha.equals(captcha)) {
			map_json.put("result", "captcha_error");
		} else if (!tel.equals("") && !sign_id.equals("") && !username.equals("") && !password.equals("") && !captcha.equals("")) {
			String register_result = homeService.userSign_up(sign_id, username, tel, password, recommend_id);
			if (register_result.equals("exist")) {
				map_json.put("result", "exist");
			} else if (register_result.equals("inexistent")) {
				map_json.put("result", "success");
				model.addAttribute("sign_id", sign_id);
				model.addAttribute("name", username);
			} else {
				map_json.put("result", "error");
			}
		}
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			result = objectMapper.writeValueAsString(map_json);
		} catch (Exception e) {
		}
		return result;
	}

	@RequestMapping(value = "index")
	public String index(Model model, HttpSession session) {
		if (session.getAttribute("name") != null) {
			model.addAttribute("name", session.getAttribute("name"));
			return "index";
		} else {
			return "sign-in";
		}
	}

	@RequestMapping("faq")
	public String faq(Model model, HttpSession session) {
		if (session.getAttribute("name") != null) {
			model.addAttribute("name", session.getAttribute("name"));
			return "faq";
		} else {
			return "sign-in";
		}
	}

	@RequestMapping("news")
	public String news(Model model, HttpSession session) {
		if (session.getAttribute("name") != null) {
			String name = String.valueOf(session.getAttribute("name"));
			model.addAttribute("name", name);
			return "news";
		} else {
			return "sign-in";
		}
	}

	@RequestMapping("guestbook")
	public String guestbook(Model model, HttpSession session) {
		if (session.getAttribute("sign_id") != null) {
			String sign_id = String.valueOf(session.getAttribute("sign_id"));
			List<HashMap<String, String>> result = homeService.guestbookCheck(sign_id);
			model.addAttribute("result", result);
			return "guestbook";
		} else {
			return "sign-in";
		}
	}

	@RequestMapping(value = "guestbookInsert", method = RequestMethod.POST)
	@ResponseBody
	public String guestbookInsert(HttpSession session, @RequestBody Map<String, String> params) {
		String result = "";
		HashMap<String, String> map_json = new HashMap<String, String>();
		if (session.getAttribute("sign_id") != null) {
			String sign_id = String.valueOf(session.getAttribute("sign_id"));
			String title = params.get("title");
			String tel = params.get("tel");
			String question = params.get("question");
			homeService.guestbookInsert(sign_id, title, tel, question, "");
			map_json.put("result", "success");
			try {
				ObjectMapper objectMapper = new ObjectMapper();
				result = objectMapper.writeValueAsString(map_json);
			} catch (Exception e) {
			}
			return result;
		} else {
			map_json.put("result", "unsuccess");
			try {
				ObjectMapper objectMapper = new ObjectMapper();
				result = objectMapper.writeValueAsString(map_json);
			} catch (Exception e) {
			}
			return result;
		}
	}

	@RequestMapping("user")
	public String user(Model model, HttpSession session) {
		if (session.getAttribute("sign_id") != null) {
			model.addAttribute("name", session.getAttribute("name"));
			String sign_id = String.valueOf(session.getAttribute("sign_id"));
			HashMap<String, String> accountMsg = homeService.accountCheck(sign_id);
			if (accountMsg != null && accountMsg.size() > 0) {
				model.addAllAttributes(accountMsg);
			}
			return "user";
		} else {
			return "sign-in";
		}
	}

	@RequestMapping(value = "account", method = RequestMethod.POST)
	@ResponseBody
	public String account(HttpSession session, @RequestBody Map<String, String> params) {

		String user_name = params.get("user_name");
		String bank_id = params.get("bank_id");
		String bank_name = params.get("bank_name");
		String bank_branch = params.get("bank_branch");
		String wechat = params.get("wechat");
		String alipay = params.get("alipay");

		String sign_id = String.valueOf(session.getAttribute("sign_id"));
		String result = "";
		HashMap<String, String> map_json = new HashMap<String, String>();
		homeService.accountOperate(sign_id, user_name, bank_id, bank_name, bank_branch, wechat, alipay);
		map_json.put("result", "success");
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			result = objectMapper.writeValueAsString(map_json);
		} catch (Exception e) {
		}
		return result;
	}

	@RequestMapping("bonus")
	public String bonus(HttpSession session) {
		if (session.getAttribute("sign_id") != null) {
			return "bonus";
		} else {
			return "sign-in";
		}
	}

	@RequestMapping("kaptcha")
	public String kaptcha(HttpSession session) {
		System.out.println(session.getAttribute("kaptchaExpected"));
		return "kaptcha";
	}

}
