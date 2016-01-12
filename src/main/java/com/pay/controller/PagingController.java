package com.pay.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pay.model.News;
import com.pay.services.PagingServices;

@Controller
public class PagingController {
	@Autowired
	private PagingServices pagingServices;

	@RequestMapping(value = "paging")
	public String pagingNews(Model model) {
		List<News> list = pagingServices.pagingNews(10, 20);
		int number = pagingServices.numberNews() / 10 + 1;
		model.addAttribute("list", list);
		model.addAttribute("number", number);
		return "paging";
	}

	@RequestMapping(value = "paging_ajax")
	public String pagingNewsAjax() {
		return "paging_ajax";
	}

	@RequestMapping(value = "paging_ajax_do", method = RequestMethod.GET)
	@ResponseBody
	public String pagingNewsAjaxDo(@RequestParam(value = "number") int number) {
		String result = "";
		List<News> list = pagingServices.pagingNews(10, 20);
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			result = objectMapper.writeValueAsString(list);
			System.out.println(result);
		} catch (Exception e) {
			
		}
		return result;
	}

}
