package com.itheima.core.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.itheima.common.utils.Page;
import com.itheima.core.dao.CourseDao;
import com.itheima.core.dao.HomeworkDao;
import com.itheima.core.po.Course;
import com.itheima.core.po.Homework;
import com.itheima.core.service.HomeworkService;

@Service
public class HomeworkServiceImpl implements HomeworkService{
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	@Resource
	private HomeworkDao homeworkDao;
	@Override
	public int createHomework(Homework homework) {
		// TODO Auto-generated method stub
		return homeworkDao.insert(homework);
	}
	@Override
	public Homework getHomeworkById(Integer id) {
		// TODO Auto-generated method stub
		return homeworkDao.selectByPrimaryKey(id);
	}
	@Override
	public int updateHomework(Homework homework) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteHomework(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<Homework> findAll(Integer offset) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Homework> findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Homework> findAll() {
		// TODO Auto-generated method stub
		return homeworkDao.findAll();
	}
	@Override
	public List<Homework> findByCourse(Integer id) {
		// TODO Auto-generated method stub
		return homeworkDao.findByCourse(id);
	}
	
}
