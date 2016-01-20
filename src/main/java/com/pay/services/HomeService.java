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

	// 登陆
	public HashMap<String, String> userLogin(String sign_id, String password_1) {
		HashMap<String, String> usermap = userImpl.userLogin(sign_id, password_1);
		return usermap;
	}

	// 注册
	public String userSign_up(String sign_id, String name, String tel, String password_1, String recommend_id_1) {
		return userImpl.userSign_up(sign_id, name, tel, password_1, recommend_id_1);
	}

	// 获取交易账户
	public HashMap<String, String> accountCheck(String sign_id) {
		return userImpl.accountCheck(sign_id);
	}

	// 更新交易账户
	public String accountOperate(String sign_id, String user_name, String bank_id, String bank_name, String bank_branch, String wechat, String alipay) {
		return userImpl.accountOperate(sign_id, user_name, bank_id, bank_name, bank_branch, wechat, alipay);
	}
}
