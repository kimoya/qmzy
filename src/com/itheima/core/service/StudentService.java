package com.itheima.core.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.itheima.common.utils.Page;
import com.itheima.core.po.Course;
import com.itheima.core.po.Student;
import com.itheima.core.po.User;

public interface StudentService {
	
	Page<Student> findStudentList(Integer page, Integer rows, 
	            String name,String telephone);

	public int createStudent(Student sthdent);

	// ͨ��id��ѯ�ͻ�
	public Student getStudentById(Integer id);
	// ���¿ͻ�
	public int updateStudent(Student student);
	// ɾ���ͻ�
	public int deleteStudent(Integer id);
	public List<Student> findAll();
	public Boolean excel(String name,MultipartFile file,int classId);
	public Student findUser(String usercode,String password);
	public Student findStudentByname(Integer id);
	public List<Student> findByClassId(Integer id);
	
}
