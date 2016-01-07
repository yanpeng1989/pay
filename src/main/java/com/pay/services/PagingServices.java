package com.pay.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pay.dao.NewsImpl;
import com.pay.model.News;

@Service
public class PagingServices {
	@Autowired
	private NewsImpl newsImpl;

	public List<News> pagingNews(int begin, int end) {
		return newsImpl.pagingNews(begin, end);
	}
}
