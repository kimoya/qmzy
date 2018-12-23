package com.itheima.core.dao;

import java.util.List;

import com.itheima.core.po.Homework;

public interface HomeworkDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Homework record);

    int insertSelective(Homework record);

    Homework selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Homework record);

    int updateByPrimaryKey(Homework record);
    List<Homework> findAll();
    List<Homework>findByCourse(Integer id);
}