package com.pay.controller;

import java.util.ArrayList;
import java.util.List;

import com.pay.model.News;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pay.services.PagingServices;

@Controller
public class PagingController {
	@Autowired
	private PagingServices pagingServices;

	@RequestMapping(value = "paging")
	public String pagingNews(Model model) {
		List<News> list = pagingServices.pagingNews(10, 20);
		model.addAttribute("list", list);
		return "paging";
	}
}
