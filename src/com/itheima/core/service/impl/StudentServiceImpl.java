package com.itheima.core.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itheima.common.utils.Page;
import com.itheima.core.dao.StudentDao;
import com.itheima.core.po.Student;
import com.itheima.core.po.User;
import com.itheima.core.service.StudentService;
import com.itheima.util.ReadExcel;

@Service
public class StudentServiceImpl implements StudentService{
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	@Resource
	private StudentDao studentDao;
	@Override
	public Page<Student> findStudentList(Integer page, Integer rows, String name, String telephone) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int createStudent(Student Student) {
		studentDao.insert(Student);
		return 0;
	}
	@Override
	public Student getStudentById(Integer id) {
		// TODO Auto-generated method stub
		return studentDao.selectByPrimaryKey(id);
	}
	@Override
	public int updateStudent(Student Student) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteStudent(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<Student> findAll() {
		// TODO Auto-generated method stub
		return studentDao.getStudents();
	}
	@Override
	public Boolean excel(String name, MultipartFile file,int classId) {
		boolean b = false;
        //��������EXCEL
        ReadExcel readExcel=new ReadExcel();
        //����excel����ȡ�ͻ���Ϣ���ϡ�
        List<Student> customerList = readExcel.getExcelInfo(name ,file);

        if(customerList != null){
            b = true;
        }
        
        //������ӿͻ���Ϣ��ע��ʵ��������Ҳ����ֱ�ӽ�customerList������Ϊ��������Mybatis����Ӧӳ���ļ���ʹ��foreach��ǩ����������ӡ���
        for(Student customer:customerList){
        	customer.setClassId(classId);
            studentDao.insert(customer);
        }
		return b;
	}
	@Override
	public Student findUser(String usercode, String password) {
		// TODO Auto-generated method stub
		return studentDao.findUser(usercode, password);
	}
	@Override
	public Student findStudentByname(Integer id) {
		// TODO Auto-generated method stub
		return studentDao.findStudentByName(id);
	}
	@Override
	public List<Student> findByClassId(Integer id) {
		// TODO Auto-generated method stub
		return studentDao.findByClassId(id);
	}
	
}

