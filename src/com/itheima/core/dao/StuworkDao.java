package com.itheima.core.dao;

import java.util.List;

import com.itheima.core.po.StuWork;

public interface StuworkDao {
    int deleteByPrimaryKey(Integer id);

    int insert(StuWork record);

    int insertSelective(StuWork record);

    StuWork selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StuWork record);

    int updateByPrimaryKey(StuWork record);
    List<StuWork> selectByStuWorks(Integer id);
    List<StuWork> findMyStuWorks(Integer id);
}