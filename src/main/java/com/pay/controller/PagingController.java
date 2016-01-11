package com.pay.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping(value = "paging_ajax")
	public String pagingNewsAjax() {
		return "paging_ajax";
	}
	@RequestMapping(value = "paging_ajax_do",method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String,String> pagingNewsAjaxDo(@RequestParam(value="number") int number) {
		String str=String.valueOf(number) ;
		HashMap<String,String> map =new HashMap<String,String>(); 
		map.put("str", str);
		return map;
	}
	
}
