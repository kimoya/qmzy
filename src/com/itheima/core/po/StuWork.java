package com.itheima.core.po;

import java.io.Serializable;

/**
 * stu_work
 * @author 
 */
public class StuWork implements Serializable {
    private Integer id;

    private Integer student;

    private Integer course;

    private String workname;
    
    private String coursename;
    private String studentname;
    private String worktitle;
    private Integer workid;
    
    public Integer getWorkid() {
		return workid;
	}

	public void setWorkid(Integer workid) {
		this.workid = workid;
	}

	public String getWorktitle() {
		return worktitle;
	}

	public void setWorktitle(String worktitle) {
		this.worktitle = worktitle;
	}

	private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStudent() {
        return student;
    }

    public void setStudent(Integer student) {
        this.student = student;
    }

    public Integer getCourse() {
        return course;
    }

    public void setCourse(Integer course) {
        this.course = course;
    }

    public String getWorkname() {
        return workname;
    }

    public void setWorkname(String workname) {
        this.workname = workname;
    }

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getStudentname() {
		return studentname;
	}

	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
    
}