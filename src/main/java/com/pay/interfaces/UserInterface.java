package com.pay.interfaces;

import com.pay.model.User;

import java.util.HashMap;
import java.util.List;

public interface UserInterface {

	public List<User> queryAll();
	public HashMap<String,String> userLogin(String sign_id,String password_1);
	public String userSign_up(String sign_id,String name,String tel,String password_1,String recommend_id_1);
}
