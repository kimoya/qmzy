package com.itheima.core.po;

import java.io.Serializable;

/**
 * student
 * @author 
 */
public class Student implements Serializable {
    private Integer id;

    private String name;

    private String telephone;
    
    private Integer classId;
    
    private String code;
    private String password;
    private Integer state;
    private Integer tors;
    private static final long serialVersionUID = 1L;

    public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}
    
}