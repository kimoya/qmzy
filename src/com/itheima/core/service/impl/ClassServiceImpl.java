package com.itheima.core.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.itheima.common.utils.Page;
import com.itheima.core.dao.ClassDao;
import com.itheima.core.dao.CourseDao;
import com.itheima.core.po.Classname;
import com.itheima.core.po.Course;
import com.itheima.core.service.ClassService;

@Service
public class ClassServiceImpl implements ClassService{
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	@Resource
	private ClassDao classDao;
	@Override
	public Page<Classname> findCustomerList(Integer page, Integer rows, String course, String teacher) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int createClassname(Classname course) {
		classDao.insert(course);
		return 0;
	}
	@Override
	public Classname getClassnameById(Integer id) {
		// TODO Auto-generated method stub
		return classDao.selectByPrimaryKey(id);
	}
	@Override
	public int updateClassname(Classname course) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteClassname(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<Classname> findAll() {
		// TODO Auto-generated method stub
		return classDao.findAll();
	}
	

}
