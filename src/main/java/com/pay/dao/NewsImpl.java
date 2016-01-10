package com.pay.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pay.interfaces.NewsInterface;
import com.pay.model.News;

@Repository
public class NewsImpl implements NewsInterface {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<News> pagingNews(Integer begin, Integer end) {
		HashMap<String, Integer> params = new HashMap<String, Integer>();
		params.put("begin", begin);
		params.put("end", end);
		return sqlSessionTemplate.selectList("pagingNews", params);
	}

	@Override
	public int numberNews() {
		return sqlSessionTemplate.selectOne("numberNews");
	}

}
