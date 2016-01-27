package com.pay.interfaces;

import com.pay.model.User;

import java.util.HashMap;
import java.util.List;

public interface UserInterface {

	public List<User> queryAll();

	public HashMap<String, String> userLogin(String sign_id, String password_1);

	public String userSign_up(String sign_id, String name,String card_id,String tel, String password_1,String recommend_id);

	public String accountOperate(String sign_id, String user_name, String bank_id, String bank_name, String bank_branch, String wechat, String alipay,String password_2);

	public HashMap<String, String> accountCheck(String sign_id);
	public HashMap<String, String> walletMsg(String sign_id);
	public List<HashMap<String, String>> guestbookCheck(String sign_id);

	public void guestbookInsert(String sign_id, String title, String tel, String question, String answer);
}
