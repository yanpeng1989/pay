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
	public String userSign_up(String sign_id, String name, String card_id, String tel, String password_1, String recommend_id) {
		return userImpl.userSign_up(sign_id, name, card_id, tel, password_1, recommend_id);
	}

	// 获取交易账户
	public HashMap<String, String> accountCheck(String sign_id) {
		return userImpl.accountCheck(sign_id);
	}

	// 更新交易账户
	public String accountOperate(String sign_id, String user_name, String bank_id, String bank_name, String bank_branch, String wechat, String alipay, String password_2) {
		return userImpl.accountOperate(sign_id, user_name, bank_id, bank_name, bank_branch, wechat, alipay, password_2);
	}

	// 用户历史提问
	public List<HashMap<String, String>> guestbookCheck(String sign_id) {
		return userImpl.guestbookCheck(sign_id);
	}

	// 用户新建提问
	public void guestbookInsert(String sign_id, String title, String tel, String question, String answer) {
		userImpl.guestbookInsert(sign_id, title, tel, question, answer);
	}

	// 获取钱包信息
	public HashMap<String, Object> walletMsg(String sign_id) {
		return userImpl.walletMsg(sign_id);
	}

	// 获取授权码信息
	public HashMap<String, String> marginCheck(String margin) {
		return userImpl.marginCheck(margin);
	}

	// 更新授权码状态
	public void marginUpdate(String margin) {
		userImpl.marginUpdate(margin);
	}

	// 交易密码查询
	public HashMap<String, String> checkPassword_2(String sign_id, String password_2) {
		return userImpl.checkPassword_2(sign_id, password_2);
	}

	// 提供帮助查询
	public List<HashMap<String, String>> offer_helpSelect(String sign_id) {
		return userImpl.offer_helpSelect(sign_id);
	}

	// 提供帮助插入
	public void offer_helpInsert(String sign_id, String offer_funds, String status) {
		userImpl.offer_helpInsert(sign_id, offer_funds, status);
	}

	// 接受帮助信息
	public List<HashMap<String, String>> receive_helpSelect(String sign_id) {
		return userImpl.receive_helpSelect(sign_id);
	}

	// 插入接受帮助信息
	public void receive_helpInsert(String sign_id, double receive_funds, String status) {
		userImpl.receive_helpInsert(sign_id, receive_funds, status);
	}
	// 更新可用余额
	public void walletAvailableUpdate(String sign_id, double available_funds) {
		userImpl.walletAvailableUpdate(sign_id, available_funds);
	}
	// 静态余额
	public void walletDynamicUpdate(String sign_id, double dynamic_bonus) {
		userImpl.walletAvailableUpdate(sign_id, dynamic_bonus);
	}
	// 提供帮助匹配订单
	public List<HashMap<String, String>> getOfferTradeById(String sign_id) {
		return userImpl.getOfferTradeById(sign_id);
	}

	// 接受帮助匹配订单
	public List<HashMap<String, String>> getReceiveTradeById(String sign_id) {
		return userImpl.getReceiveTradeById(sign_id);
	}
	//匹配订单详情
	public HashMap<String, Object> getTradeById(String trade_id) {
		return userImpl.getTradeById(trade_id);
	}
	//提供帮助人员信息
	public HashMap<String, Object> getOfferUserByTradeId(String trade_id) {
		return userImpl.getOfferUserByTradeId(trade_id);
	}
}
