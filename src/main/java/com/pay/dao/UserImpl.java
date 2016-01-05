package com.pay.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pay.interfaces.UserInterface;
import com.pay.model.User;

@Repository
public class UserImpl implements UserInterface {

	@Autowired
	public SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List<User> queryAll() {
		List<User> ls = new ArrayList<User>();
		ls = sqlSessionTemplate.selectList("queryAll");
		return ls;
	}
}
