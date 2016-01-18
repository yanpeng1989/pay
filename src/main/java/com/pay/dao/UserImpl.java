package com.pay.dao;

import java.util.ArrayList;
import java.util.HashMap;
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

	@Override
	public HashMap<String, String> userLogin(String sign_id, String password_1) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("sign_id", sign_id);
		params.put("password_1", password_1);
		HashMap<String, String> usermap = sqlSessionTemplate.selectOne("userLogin", params);
		return usermap;
	}

	@Override
	public String userSign_up(String sign_id, String name, String tel, String password_1, String recommend_id_1) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("sign_id", sign_id);
		params.put("name", name);
		params.put("tel", tel);
		params.put("password_1", password_1);
		params.put("recommend_id_1", recommend_id_1);
		HashMap<String, String> usermap = sqlSessionTemplate.selectOne("userCheck", params);
		if (usermap != null && usermap.size() > 0) {
			return "exist";
		} else {
			int result = sqlSessionTemplate.insert("userSign_up", params);
			System.out.println(result);
			return "inexistent";
		}
	}
}
