package com.itheima.core.service;

import java.util.List;

import com.itheima.common.utils.Page;
import com.itheima.core.po.Classname;
import com.itheima.core.po.Course;

public interface CourseService {
	public Page<Course> findCustomerList(Integer page, Integer rows, 
            String course,String teacher);

public int createCustomer(Course course);

// 通过id查询客户
public Course getCustomerById(Integer id);
// 更新客户
public int updateCustomer(Course course);
// 删除客户
public int deleteCustomer(Integer id);
public List<Course> findAll(Integer offset);
public List<Course> findByName(String name);
public int count();

public List<Course> findAll();
public List<Course> findCourseByUid(Integer id);
}
