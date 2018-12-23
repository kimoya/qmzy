package com.itheima.core.dao;

import java.util.List;

import com.itheima.core.po.Classname;

public interface ClassDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Classname record);

    int insertSelective(Classname record);

    Classname selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Classname record);

    int updateByPrimaryKey(Classname record);
    
    List<Classname> findAll();
   
}
