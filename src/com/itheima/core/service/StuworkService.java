package com.itheima.core.service;

import java.util.List;
import com.itheima.core.po.StuWork;

public interface StuworkService {
		public int createStuWork(StuWork homework);

		// ͨ��id��ѯ�ͻ�
		public StuWork getStuWorkById(Integer id);
		// ���¿ͻ�
		public int updateStuWork(StuWork homework);
		// ɾ���ͻ�
		public int deleteStuWork(Integer id);
		public List<StuWork> findByName(String name);
		public List<StuWork> findAll();
		public List<StuWork> findAll(Integer id);
		public List<StuWork> findMyStuWorks(Integer id);
}
