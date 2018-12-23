package com.itheima.core.service;

import java.util.List;

import com.itheima.common.utils.Page;
import com.itheima.core.po.Classname;

public interface ClassService {
	public Page<Classname> findCustomerList(Integer page, Integer rows, 
            String course,String teacher);

public int createClassname(Classname classname);

// ͨ��id��ѯ�ͻ�
public Classname getClassnameById(Integer id);
// ���¿ͻ�
public int updateClassname(Classname classname);
// ɾ���ͻ�
public int deleteClassname(Integer id);
public List<Classname> findAll();

}
