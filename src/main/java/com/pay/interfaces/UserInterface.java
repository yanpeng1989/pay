package com.pay.interfaces;

import com.pay.model.User;

import java.util.HashMap;
import java.util.List;

public interface UserInterface {

	public List<User> queryAll();

	public HashMap<String, String> userLogin(String sign_id, String password_1);

	public String userSign_up(String sign_id, String name, String card_id, String tel, String password_1, String recommend_id);

	public String accountOperate(String sign_id, String user_name, String bank_id, String bank_name, String bank_branch, String wechat, String alipay, String password_2);

	public HashMap<String, String> accountCheck(String sign_id);

	public HashMap<String, Object> walletMsg(String sign_id);

	public List<HashMap<String, String>> guestbookCheck(String sign_id);

	public void guestbookInsert(String sign_id, String title, String tel, String question, String answer);

	public HashMap<String, String> marginCheck(String margin);

	public void marginUpdate(String margin);

	public List<HashMap<String, String>> offer_helpSelect(String sign_id);

	public void offer_helpInsert(String sign_id, String offer_funds, String status);

	public HashMap<String, String> checkPassword_2(String sign_id, String password_2);

	public List<HashMap<String, String>> receive_helpSelect(String sign_id);

	public void receive_helpInsert(String sign_id, double receive_funds, String status);

	public void walletAvailableUpdate(String sign_id, double available_funds);

	public void walletDynamicUpdate(String sign_id, double available_funds);

	public List<HashMap<String, String>> getOfferTradeById(String sign_id);

	public List<HashMap<String, String>> getReceiveTradeById(String sign_id);

	public HashMap<String, Object> getTradeById(String trade_id);

	public HashMap<String, Object> getOfferUserByTradeId(String trade_id);
}
