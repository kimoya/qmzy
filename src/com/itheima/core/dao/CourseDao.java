package com.itheima.core.dao;

import java.util.List;

import com.itheima.core.po.Classname;
import com.itheima.core.po.Course;

public interface CourseDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
    
    public List<Course> getCourses(Integer offset);
    List<Course> findByName(String name);
    int count();
    List<Course> findAll();
    List<Course>findCourseByUid(Integer id);
}