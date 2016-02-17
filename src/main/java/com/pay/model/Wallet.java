package com.pay.model;

import java.io.Serializable;

public class Wallet implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sign_id;
	private double funds;
	private double dynamic_bonus;
	private double static_bonus;
	private double available_funds;

	public String getSign_id() {
		return sign_id;
	}

	public void setSign_id(String sign_id) {
		this.sign_id = sign_id;
	}

	public double getFunds() {
		return funds;
	}

	public void setFunds(double funds) {
		this.funds = funds;
	}

	public double getDynamic_bonus() {
		return dynamic_bonus;
	}

	public void setDynamic_bonus(double dynamic_bonus) {
		this.dynamic_bonus = dynamic_bonus;
	}

	public double getStatic_bonus() {
		return static_bonus;
	}

	public void setStatic_bonus(double static_bonus) {
		this.static_bonus = static_bonus;
	}

	public double getAvailable_funds() {
		return available_funds;
	}

	public void setAvailable_funds(double available_funds) {
		this.available_funds = available_funds;
	}

}
