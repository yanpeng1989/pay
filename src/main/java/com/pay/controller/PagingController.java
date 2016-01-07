package com.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pay.services.PagingServices;

@Controller
public class PagingController {
	@Autowired
	private PagingServices pagingServices;

	@RequestMapping(value = "paging")
	public String pagingNews() {
		System.out.println(pagingServices.pagingNews(10, 20).get(0).getId());
		System.out.println(pagingServices.pagingNews(10, 20).get(0).getTitle());
		System.out.println(pagingServices.pagingNews(10, 20).get(0).getContent());
		return "paging";
	}
}
