package com.itheima.core.po;


	import java.io.Serializable;

	/**
	 * class
	 * @author 
	 */
	public class Classname implements Serializable {
	    private Integer id;

	    /**
	     * °à¼¶Ãû×Ö
	     */
	    private String classname;

	    private static final long serialVersionUID = 1L;

	    public Integer getId() {
	        return id;
	    }

	    public void setId(Integer id) {
	        this.id = id;
	    }

	    public String getClassname() {
	        return classname;
	    }

	    public void setClassname(String classname) {
	        this.classname = classname;
	    }

		@Override
		public String toString() {
			return "Classname [id=" + id + ", classname=" + classname + "]";
		}
	    
	
}
