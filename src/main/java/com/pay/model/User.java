package com.pay.model;

import java.io.Serializable;

public class User implements Serializable {

	private String id;
	private String sign_id;
	private String name;
	private String tel;
	private String password_1;
	private String password_2;
	private String recommend_id_1;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSign_id() {
		return sign_id;
	}

	public void setSign_id(String sign_id) {
		this.sign_id = sign_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPassword_1() {
		return password_1;
	}

	public void setPassword_1(String password_1) {
		this.password_1 = password_1;
	}

	public String getPassword_2() {
		return password_2;
	}

	public void setPassword_2(String password_2) {
		this.password_2 = password_2;
	}

	public String getRecommend_id_1() {
		return recommend_id_1;
	}

	public void setRecommend_id_1(String recommend_id_1) {
		this.recommend_id_1 = recommend_id_1;
	}

	private static final long serialVersionUID = 1L;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return null;
	}

}
