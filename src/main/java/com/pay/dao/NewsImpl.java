package com.pay.dao;

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
	public List<News> pagingNews(int begin, int end) {
		return sqlSessionTemplate.selectList("pagingNews", new Object[] { begin, end });
	}

}
