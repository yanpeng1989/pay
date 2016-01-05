package com.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pay.services.HomeService;

@Controller
public class HomeController {
	
	@Autowired
	HomeService homeService;

	@RequestMapping(value = "index")
	public String Test(Model model) {
		model.addAttribute("name", homeService.queryAll().get(0).getName());
		model.addAttribute("age", homeService.queryAll().get(0).getAge());
		return "index";
	}

}
