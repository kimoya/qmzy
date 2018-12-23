package com.itheima.core.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itheima.common.utils.Page;
import com.itheima.core.dao.StudentDao;
import com.itheima.core.dao.StuworkDao;
import com.itheima.core.po.StuWork;
import com.itheima.core.po.Student;
import com.itheima.core.service.StudentService;
import com.itheima.core.service.StuworkService;
@Service
public class StuworkServiceImpl implements StuworkService{
	@Resource
	private StuworkDao stuworkDao;
	@Override
	public int createStuWork(StuWork homework) {
		// TODO Auto-generated method stub
		return stuworkDao.insert(homework);
	}

	@Override
	public StuWork getStuWorkById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateStuWork(StuWork homework) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStuWork(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StuWork> findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StuWork> findAll() {
		return null;
	}

	@Override
	public List<StuWork> findAll(Integer id) {
		// TODO Auto-generated method stub
		return stuworkDao.selectByStuWorks(id);
	}

	@Override
	public List<StuWork> findMyStuWorks(Integer id) {
		// TODO Auto-generated method stub
		return stuworkDao.findMyStuWorks(id);
	}

	

}
