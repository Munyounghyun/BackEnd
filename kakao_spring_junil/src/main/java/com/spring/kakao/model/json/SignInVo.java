package com.spring.kakao.model.json;

public class SignInVo {
	private String user_email;
	private String user_password;
	private String signIncb;
	private int signInFlag;
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getSignIncb() {
		return signIncb;
	}
	public void setSignIncb(String signIncb) {
		this.signIncb = signIncb;
	}
	public int getSignInFlag() {
		return signInFlag;
	}
	public void setSignInFlag(int signInFlag) {
		this.signInFlag = signInFlag;
	}
	
	@Override
	public String toString() {
		return "SignInVo [user_email=" + user_email + ", user_password=" + user_password + ", signIncb=" + signIncb
				+ ", signInFlag=" + signInFlag + "]";
	}
}
