package com.pay.services;

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
}
