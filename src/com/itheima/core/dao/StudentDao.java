package com.itheima.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.core.po.Student;
import com.itheima.core.po.User;;

public interface StudentDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
    List<Student> getStudents();
    public Student findUser(@Param("usercode") String usercdoe,
			@Param("password") String password); 
    Student findStudentByName(Integer id);
    List<Student> findByClassId(Integer id);
}