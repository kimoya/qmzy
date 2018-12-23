package com.itheima.core.service;

import java.util.List;

import com.itheima.core.po.Homework;

public interface HomeworkService {

public int createHomework(Homework homework);

// ͨ��id��ѯ�ͻ�
public Homework getHomeworkById(Integer id);
// ���¿ͻ�
public int updateHomework(Homework homework);
// ɾ���ͻ�
public int deleteHomework(Integer id);
public List<Homework> findAll(Integer offset);
public List<Homework> findByName(String name);
public List<Homework> findAll();
public List<Homework>findByCourse(Integer id);
}
