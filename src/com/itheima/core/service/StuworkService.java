package com.itheima.core.service;

import java.util.List;
import com.itheima.core.po.StuWork;

public interface StuworkService {
		public int createStuWork(StuWork homework);

		// 通过id查询客户
		public StuWork getStuWorkById(Integer id);
		// 更新客户
		public int updateStuWork(StuWork homework);
		// 删除客户
		public int deleteStuWork(Integer id);
		public List<StuWork> findByName(String name);
		public List<StuWork> findAll();
		public List<StuWork> findAll(Integer id);
		public List<StuWork> findMyStuWorks(Integer id);
}
