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
@SessionAttributes({ "sign_id", "name", "level" })
public class HomeController {

	@Autowired
	HomeService homeService;

	@RequestMapping(value = "sign-in")
	public String sign_in() {
		return "sign-in";
	}

	// 用户登陆
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
					String level = usermap.get("level");
					model.addAttribute("sign_id", sign_id);
					model.addAttribute("name", name);
					model.addAttribute("level", level);
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

	// 注册
	@RequestMapping(value = "login-up", method = RequestMethod.GET)
	@ResponseBody
	public String login_up(Model model, @RequestParam(value = "tel") String tel, @RequestParam(value = "sign_id") String sign_id, @RequestParam(value = "username") String username, @RequestParam(value = "password") String password, @RequestParam(value = "card_id") String card_id, @RequestParam(value = "recommend_id") String recommend_id, @RequestParam(value = "captcha") String captcha, HttpSession session) {
		String session_captcha = String.valueOf(session.getAttribute("kaptchaExpected"));
		String result = "";
		HashMap<String, String> map_json = new HashMap<String, String>();
		if (!session_captcha.equals(captcha)) {
			map_json.put("result", "captcha_error");
		} else if (!tel.equals("") && !sign_id.equals("") && !username.equals("") && !password.equals("") && !captcha.equals("")) {
			String register_result = homeService.userSign_up(sign_id, username, card_id, tel, password, recommend_id);
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
			String sign_id = String.valueOf(session.getAttribute("sign_id"));
			model.addAttribute("OfferTrade", homeService.getOfferTradeById(sign_id));
			model.addAttribute("ReceiveTrade", homeService.getReceiveTradeById(sign_id));
			// 钱包信息
			HashMap<String, Object> walletMsg = homeService.walletMsg(sign_id);
			model.addAllAttributes(walletMsg);
			// 登记信息
			String level = String.valueOf(session.getAttribute("level"));
			model.addAttribute("level", level);

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

	// 留言反馈
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

	// 交易资料修改
	@RequestMapping(value = "account", method = RequestMethod.POST)
	@ResponseBody
	public String account(HttpSession session, @RequestBody Map<String, String> params) {

		String user_name = params.get("user_name");
		String bank_id = params.get("bank_id");
		String bank_name = params.get("bank_name");
		String bank_branch = params.get("bank_branch");
		String wechat = params.get("wechat");
		String alipay = params.get("alipay");
		String password_2 = params.get("password_2");

		String sign_id = String.valueOf(session.getAttribute("sign_id"));
		String result = "";
		HashMap<String, String> map_json = new HashMap<String, String>();
		homeService.accountOperate(sign_id, user_name, bank_id, bank_name, bank_branch, wechat, alipay, password_2);
		map_json.put("result", "success");
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			result = objectMapper.writeValueAsString(map_json);
		} catch (Exception e) {
		}
		return result;
	}

	// 奖金明细
	@RequestMapping("bonus")
	public String bonus(HttpSession session) {
		if (session.getAttribute("sign_id") != null) {
			return "bonus";
		} else {
			return "sign-in";
		}
	}

	@RequestMapping("reset-password")
	public String reset_password(HttpSession session) {
		if (session.getAttribute("sign_id") != null) {
			return "reset-password";
		} else {
			return "sign-in";
		}
	}

	// 重置登陆密码
	@RequestMapping("reset-update-1")
	public String reset_update_1(HttpSession session) {
		if (session.getAttribute("sign_id") != null) {
			return "reset-password_1";
		} else {
			return "sign-in";
		}
	}

	// 重置交易密码
	@RequestMapping("reset-update-2")
	public String reset_update_2(HttpSession session) {
		if (session.getAttribute("sign_id") != null) {
			return "reset-password";
		} else {
			return "sign-in";
		}
	}

	@RequestMapping("protect-password")
	public String protect_password(HttpSession session) {
		if (session.getAttribute("sign_id") != null) {
			return "protect-password";
		} else {
			return "sign-in";
		}
	}

	// 重置密码保护
	@RequestMapping("protect-update")
	public String protect_update(HttpSession session) {
		if (session.getAttribute("sign_id") != null) {
			return "protect-password";
		} else {
			return "sign-in";
		}
	}

	// 奖金明细
	@RequestMapping("fund")
	public String fund(HttpSession session) {
		if (session.getAttribute("sign_id") != null) {
			return "fund";
		} else {
			return "sign-in";
		}
	}

	// 接受帮助界面
	@RequestMapping("receive-help")
	public String receive_help(HttpSession session, Model model) {
		if (session.getAttribute("sign_id") != null) {
			String sign_id = String.valueOf(session.getAttribute("sign_id"));
			HashMap<String, Object> result = homeService.walletMsg(sign_id);
			model.addAllAttributes(result);
			List<HashMap<String, String>> receive_help = homeService.receive_helpSelect(sign_id);
			model.addAttribute("result", receive_help);
			// 钱包信息
			HashMap<String, Object> walletMsg = homeService.walletMsg(sign_id);
			model.addAllAttributes(walletMsg);
			// 等级信息
			String level = String.valueOf(session.getAttribute("level"));
			model.addAttribute("level", level);
			return "receive-help";
		} else {
			return "sign-in";
		}
	}

	// 接受帮助AJAX
	@RequestMapping("receive-help-ajax")
	@ResponseBody
	public String receive_help_ajax(HttpSession session, @RequestBody Map<String, String> params) {
		String result = "";
		HashMap<String, String> map_json = new HashMap<String, String>();
		if (session.getAttribute("sign_id") != null) {
			String sign_id = String.valueOf(session.getAttribute("sign_id"));
			String password_2 = params.get("password_2");
			HashMap<String, String> password_2_Check = homeService.checkPassword_2(sign_id, password_2);
			if (password_2_Check != null && password_2_Check.size() > 0) {
				HashMap<String, Object> wallet = homeService.walletMsg(sign_id);
				double w_static_funds = Double.valueOf(wallet.get("available_funds").toString()).doubleValue();
				double w_dynamic_funds = Double.valueOf(wallet.get("dynamic_bonus").toString()).doubleValue();
				double funds = Double.valueOf(params.get("funds")).doubleValue();
				String type = params.get("type");
				System.out.println(type);
				if (type.equals("static_help")) {
					if (funds > w_static_funds) {
						// 静态不足
						map_json.put("result", "lack");
					} else {
						// 静态资金满足
						List<HashMap<String, String>> receive_helpSelect = homeService.receive_helpSelect(sign_id);
						if (receive_helpSelect == null ? true : receive_helpSelect.size() <= 0) {
							homeService.receive_helpInsert(sign_id, funds, "正在排队");
							double available_funds = w_static_funds - funds;
							homeService.walletAvailableUpdate(sign_id, available_funds);
							map_json.put("result", "success");
						} else {
							// 已有排单
							map_json.put("result", "order_exit");
						}
					}
				} else if (type.equals("dynamic_help")) {
					if (funds > w_dynamic_funds) {
						// 静态不足
						map_json.put("result", "lack");
					} else {
						// 动态资金满足
						homeService.receive_helpInsert(sign_id, funds, "正在排队");
						double dynamic_funds = w_dynamic_funds - funds;
						homeService.walletDynamicUpdate(sign_id, dynamic_funds);
						map_json.put("result", "success");
					}
				} else {
					map_json.put("result", "error");
				}
			} else {
				// 交易密码错误
				map_json.put("result", "password_2_invalid");
			}
		} else {
			map_json.put("result", "sign_in_error");
		}
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			result = objectMapper.writeValueAsString(map_json);
		} catch (Exception e) {
		}
		System.out.println(result);
		return result;
	}

	// 提供帮助界面
	@RequestMapping("offer-help")
	public String offer_help(HttpSession session, Model model) {
		if (session.getAttribute("sign_id") != null) {
			String sign_id = String.valueOf(session.getAttribute("sign_id"));
			List<HashMap<String, String>> result = homeService.offer_helpSelect(sign_id);
			model.addAttribute("result", result);
			// 钱包信息
			HashMap<String, Object> walletMsg = homeService.walletMsg(sign_id);
			model.addAllAttributes(walletMsg);
			// 等级信息
			String level = String.valueOf(session.getAttribute("level"));
			model.addAttribute("level", level);
			return "offer-help";
		} else {
			return "sign-in";
		}
	}

	// 提供帮助请求
	@RequestMapping("offer-help-ajax")
	@ResponseBody
	public String offer_help_ajax(HttpSession session, @RequestBody Map<String, String> params) {
		String result = "";
		HashMap<String, String> map_json = new HashMap<String, String>();
		if (session.getAttribute("sign_id") != null) {
			String sign_id = String.valueOf(session.getAttribute("sign_id"));
			String password_2 = params.get("password_2");
			HashMap<String, String> password_2_Check = homeService.checkPassword_2(sign_id, password_2);
			if (password_2_Check != null && password_2_Check.size() > 0) {
				String margin = params.get("margin");
				String offer_funds = params.get("funds");
				HashMap<String, String> marginCheck = homeService.marginCheck(margin);
				if (marginCheck != null && marginCheck.size() > 0) {
					homeService.offer_helpInsert(sign_id, offer_funds, "正在排队");
					homeService.marginUpdate(margin);
					map_json.put("result", "success");
				} else {
					map_json.put("result", "margin_invalid");
				}
			} else {
				map_json.put("result", "password_2_invalid");
			}
		} else {
			map_json.put("result", "sign_in_error");
		}
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			result = objectMapper.writeValueAsString(map_json);
		} catch (Exception e) {
		}
		return result;
	}

	// 账户转账界面
	@RequestMapping("account-transfer")
	public String account_transfer(HttpSession session) {
		if (session.getAttribute("sign_id") != null) {
			return "account-transfer";
		} else {
			return "sign-in";
		}
	}

	// 匹配详情界面
	@RequestMapping("match-status")
	public String match_status(HttpSession session) {
		if (session.getAttribute("sign_id") != null) {
			return "match-status";
		} else {
			return "sign-in";
		}
	}

	// 直属会员界面
	@RequestMapping("membership")
	public String membership(HttpSession session, Model model) {
		if (session.getAttribute("sign_id") != null) {
			model.addAttribute("name", session.getAttribute("name"));
			String sign_id = String.valueOf(session.getAttribute("sign_id"));
			// 钱包信息
			HashMap<String, Object> walletMsg = homeService.walletMsg(sign_id);
			model.addAllAttributes(walletMsg);
			// 等级信息
			String level = String.valueOf(session.getAttribute("level"));
			model.addAttribute("level", level);
			return "membership";
		} else {
			return "sign-in";
		}
	}

	// 帮助用户注册
	@RequestMapping("user-register")
	public String user_register(HttpSession session, Model model) {
		if (session.getAttribute("sign_id") != null) {
			String sign_id = String.valueOf(session.getAttribute("sign_id"));
			model.addAttribute("sign_id", sign_id);
			return "user-register";
		} else {
			return "sign-in";
		}
	}

	// 帮助用户注册AJAX
	@RequestMapping(value = "user-register-ajax", method = RequestMethod.GET)
	@ResponseBody
	public String user_register_ajax(Model model, @RequestParam(value = "tel") String tel, @RequestParam(value = "sign_id") String sign_id, @RequestParam(value = "username") String username, @RequestParam(value = "password") String password, @RequestParam(value = "card_id") String card_id, @RequestParam(value = "recommend_id") String recommend_id) {
		String result = "";
		HashMap<String, String> map_json = new HashMap<String, String>();
		if (!tel.equals("") && !sign_id.equals("") && !username.equals("") && !password.equals("")) {
			String register_result = homeService.userSign_up(sign_id, username, card_id, tel, password, recommend_id);
			if (register_result.equals("exist")) {
				map_json.put("result", "exist");
			} else if (register_result.equals("inexistent")) {
				map_json.put("result", "success");
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

	// 接受帮助匹配详情
	@RequestMapping(value = "detail-receive", method = RequestMethod.GET)
	public String detail_receive(HttpSession session, Model model, @RequestParam(value = "trade_id") String trade_id) {
		if (session.getAttribute("sign_id") != null) {
			String sign_id = String.valueOf(session.getAttribute("sign_id"));
			model.addAttribute("sign_id", sign_id);
			// 匹配订单详情
			HashMap<String, Object> detail = homeService.getTradeById(trade_id);
			if (detail == null ? false : detail.size() > 0) {
				model.addAttribute("detail",detail);
				// 提供人信息
				HashMap<String, Object> user = homeService.getOfferUserByTradeId(trade_id);
				model.addAttribute("offer_user", user);
			}
			return "detail-receive";
		} else {
			return "sign-in";
		}
	}

	@RequestMapping("kaptcha")
	public String kaptcha(HttpSession session) {
		return "kaptcha";
	}
}
