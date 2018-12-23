package com.itheima.core.service;

import java.util.List;

import com.itheima.common.utils.Page;
import com.itheima.core.po.Classname;

public interface ClassService {
	public Page<Classname> findCustomerList(Integer page, Integer rows, 
            String course,String teacher);

public int createClassname(Classname classname);

// 通过id查询客户
public Classname getClassnameById(Integer id);
// 更新客户
public int updateClassname(Classname classname);
// 删除客户
public int deleteClassname(Integer id);
public List<Classname> findAll();

}
