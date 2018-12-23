package com.itheima.core.po;

public class User {
	private Integer id;
	private String code;
	private String name;
	private String password;
	private Integer state;
	private Integer tors;
	public Integer getId() {
		return id;
	} 
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getTors() {
		return tors;
	}
	public void setTors(Integer tors) {
		this.tors = tors;
	}
	
}
