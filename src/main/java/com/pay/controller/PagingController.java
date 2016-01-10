package com.pay.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pay.model.News;
import com.pay.services.PagingServices;

@Controller
public class PagingController {
	@Autowired
	private PagingServices pagingServices;

	@RequestMapping(value = "paging")
	public String pagingNews(Model model) {
		List<News> list = pagingServices.pagingNews(10, 20);
		int number = pagingServices.numberNews()/10+1;
		model.addAttribute("list", list);
		model.addAttribute("number", number);
		return "paging";
	}
}
