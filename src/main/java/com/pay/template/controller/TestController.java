package com.pay.template.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping(value = "/template/index")
	public String index() {
		return "/template/index";
	}
	@RequestMapping(value = "/template/calendar")
	public String calendar() {
		return "/template/calendar";
	}

	@RequestMapping(value = "/template/faq")
	public String faq() {
		return "/template/faq";
	}

	@RequestMapping(value = "/template/help")
	public String help() {
		return "/template/help";
	}

	@RequestMapping(value = "/template/media")
	public String media() {
		return "/template/media";
	}

	@RequestMapping(value = "/template/premium-blog-item")
	public String premium_blog_item() {
		return "/template/premium-blog-item";
	}

	@RequestMapping(value = "/template/premium-blog")
	public String premium_blog() {
		return "/template/premium-blog";
	}

	@RequestMapping(value = "/template/premium-build")
	public String premium_build() {
		return "/template/premium-build";
	}

	@RequestMapping(value = "/template/premium-colors")
	public String premium_colors() {
		return "/template/premium-colors";
	}

	@RequestMapping(value = "/template/premium-invoice")
	public String premium_invoice() {
		return "/template/premium-invoice";
	}

	@RequestMapping(value = "/template/premium-media")
	public String premium_media() {
		return "/template/premium-media";
	}

	@RequestMapping(value = "/template/premium-pricing-tables")
	public String premium_pricing_tables() {
		return "/template/premium-pricing-tables";
	}

	@RequestMapping(value = "/template/premium-profile")
	public String premium_profile() {
		return "/template/premium-profile";
	}

	@RequestMapping(value = "/template/premium-search-results")
	public String premium_search_results() {
		return "/template/premium-search-results";
	}

	@RequestMapping(value = "/template/premium-timeline")
	public String premium_timeline() {
		return "/template/premium-timeline";
	}

	@RequestMapping(value = "/template/premium-upgrade-account")
	public String premium_upgrade_account() {
		return "/template/premium-upgrade-account";
	}

	@RequestMapping(value = "/template/premium-users")
	public String premium_users() {
		return "/template/premium-users";
	}

	@RequestMapping(value = "/template/premium-widgets")
	public String premium_widgets() {
		return "/template/premium-widgets";
	}

	@RequestMapping(value = "/template/privacy-policy")
	public String privacy_policy() {
		return "/template/privacy-policy";
	}

	@RequestMapping(value = "/template/reset-password")
	public String reset_password() {
		return "/template/reset-password";
	}

	@RequestMapping(value = "/template/sign-in")
	public String sign_in() {
		return "/template/sign-in";
	}
	@RequestMapping(value = "/template/sign-up")
	public String sign_up() {
		return "/template/sign-up";
	}
	@RequestMapping(value = "/template/terms-and-conditions")
	public String terms_and_conditions() {
		return "/template/terms-and-conditions";
	}
	@RequestMapping(value = "/template/user")
	public String user() {
		return "/template/user";
	}
	@RequestMapping(value = "/template/users")
	public String users() {
		return "/template/users";
	}
}
