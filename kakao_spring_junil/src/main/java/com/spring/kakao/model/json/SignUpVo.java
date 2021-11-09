package com.spring.kakao.model.json;

public class SignUpVo {
	private String signUpEmail;
	private int emailFlag;
	private String signUpPassword;
	private String signUpName;
	private String signUpPhone;
	private int phoneFlag;
	
	public String getSignUpEmail() {
		return signUpEmail;
	}
	public void setSignUpEmail(String signUpEmail) {
		this.signUpEmail = signUpEmail;
	}
	public int getEmailFlag() {
		return emailFlag;
	}
	public void setEmailFlag(int emailFlag) {
		this.emailFlag = emailFlag;
	}
	public String getSignUpPassword() {
		return signUpPassword;
	}
	public void setSignUpPassword(String signUpPassword) {
		this.signUpPassword = signUpPassword;
	}
	public String getSignUpName() {
		return signUpName;
	}
	public void setSignUpName(String signUpName) {
		this.signUpName = signUpName;
	}
	public String getSignUpPhone() {
		return signUpPhone;
	}
	public void setSignUpPhone(String signUpPhone) {
		this.signUpPhone = signUpPhone;
	}
	public int getPhoneFlag() {
		return phoneFlag;
	}
	public void setPhoneFlag(int phoneFlag) {
		this.phoneFlag = phoneFlag;
	}
	
	@Override
	public String toString() {
		return "SignUpVo [signUpEmail=" + signUpEmail + ", emailFlag=" + emailFlag + ", signUpPassword="
				+ signUpPassword + ", signUpName=" + signUpName + ", signUpPhone=" + signUpPhone + ", phoneFlag="
				+ phoneFlag + "]";
	}
}
