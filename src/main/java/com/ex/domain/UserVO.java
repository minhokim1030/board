package com.ex.domain;

import java.util.Date;

public class UserVO {
	
	private int uno;
	private String uemail;
	private String unick;
	private Date uregdate;
	private int ulock;
	private int uauth;
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUnick() {
		return unick;
	}
	public void setUnick(String unick) {
		this.unick = unick;
	}
	public Date getUregdate() {
		return uregdate;
	}
	public void setUregdate(Date uregdate) {
		this.uregdate = uregdate;
	}
	public int getUlock() {
		return ulock;
	}
	public void setUlock(int ulock) {
		this.ulock = ulock;
	}
	public int getUauth() {
		return uauth;
	}
	public void setUauth(int uauth) {
		this.uauth = uauth;
	}
	@Override
	public String toString() {
		return "UserVO [uno=" + uno + ", uemail=" + uemail + ", unick=" + unick + ", uregdate=" + uregdate + ", ulock="
				+ ulock + ", uauth=" + uauth + "]";
	}
	
	
}
