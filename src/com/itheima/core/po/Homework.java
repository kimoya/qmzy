package com.itheima.core.po;

import java.io.Serializable;

/**
 * work
 * @author 
 */
public class Homework implements Serializable {
    private Integer id;

    private Integer courseid;

    private String worktitle;
    
    private String teachernName;
    
    private String courseName;

    private Integer classnum;
    private String classname;

    private String filename;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCourseid() {
        return courseid;
    }

    public void setCourseid(Integer courseid) {
        this.courseid = courseid;
    }

    public String getWorktitle() {
        return worktitle;
    }

    public void setWorktitle(String worktitle) {
        this.worktitle = worktitle;
    }

    public Integer getClassnum() {
        return classnum;
    }

    public void setClassnum(Integer classnum) {
        this.classnum = classnum;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

	public String getTeachernName() {
		return teachernName;
	}

	public void setTeachernName(String teachernName) {
		this.teachernName = teachernName;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
    
}