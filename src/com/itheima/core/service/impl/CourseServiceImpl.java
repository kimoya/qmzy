package com.itheima.core.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.itheima.common.utils.Page;
import com.itheima.core.dao.CourseDao;
import com.itheima.core.po.Course;
import com.itheima.core.service.CourseService;

import javassist.bytecode.stackmap.BasicBlock.Catch;
@Service
public class CourseServiceImpl implements CourseService{
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	@Resource
	private CourseDao courseDao;
	@Override
	public Page<Course> findCustomerList(Integer page, Integer rows, String course, String teacher) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int createCustomer(Course course) {
		courseDao.insert(course);
		return 0;
	}
	@Override
	public Course getCustomerById(Integer id) {
		// TODO Auto-generated method stub
		return courseDao.selectByPrimaryKey(id);
	}
	@Override
	public int updateCustomer(Course course) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteCustomer(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<Course> findAll(Integer offset) {
		// TODO Auto-generated method stub
		int i=offset.intValue();
		return courseDao.getCourses((i-1)*6);
	}
	@Override
	public List<Course> findByName(String name) {
		// TODO Auto-generated method stub
		return courseDao.findByName(name);
	}
	@Override
	public int count() {
		int i=courseDao.count();
		int count=i/6;
		if(i%6!=0){
			count+=1;
		}
		return count;
	}
	@Override
	public List<Course> findAll() {
		// TODO Auto-generated method stub
		return courseDao.findAll();
	}
	@Override
	public List<Course> findCourseByUid(Integer id) {
		// TODO Auto-generated method stub
		return courseDao.findCourseByUid(id);
	}

}
