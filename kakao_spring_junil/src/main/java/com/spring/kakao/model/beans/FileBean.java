package com.spring.kakao.model.beans;

public class FileBean {
	private String originFileName;
	private String tempFileName;
	
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}
	public String getTempFileName() {
		return tempFileName;
	}
	public void setTempFileName(String tempFileName) {
		this.tempFileName = tempFileName;
	}
	
	@Override
	public String toString() {
		return "FileBean [originFileName=" + originFileName + ", tempFileName=" + tempFileName + "]";
	}
}
