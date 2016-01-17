package com.pay.services;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pay.dao.UserImpl;
import com.pay.model.User;

@Service
public class HomeService {
	@Autowired
	public UserImpl userImpl;

	public List<User> queryAll() {
		List<User> ls = userImpl.queryAll();
		return ls;
	}

	public HashMap<String, String> userLogin(String sign_id, String password_1) {
		HashMap<String, String> usermap = userImpl.userLogin(sign_id, password_1);
		return usermap;
	}
}
