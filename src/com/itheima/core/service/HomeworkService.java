package com.itheima.core.service;

import java.util.List;

import com.itheima.core.po.Homework;

public interface HomeworkService {

public int createHomework(Homework homework);

// 通过id查询客户
public Homework getHomeworkById(Integer id);
// 更新客户
public int updateHomework(Homework homework);
// 删除客户
public int deleteHomework(Integer id);
public List<Homework> findAll(Integer offset);
public List<Homework> findByName(String name);
public List<Homework> findAll();
public List<Homework>findByCourse(Integer id);
}
