package com.itheima.core.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.apache.commons.io.FileUtils;
import org.apache.tools.ant.taskdefs.Get.DownloadProgress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSON;
import com.itheima.common.utils.Page;
import com.itheima.core.po.Classname;
import com.itheima.core.po.Course;
import com.itheima.core.po.Homework;
import com.itheima.core.po.StuWork;
import com.itheima.core.po.Student;
import com.itheima.core.po.User;
import com.itheima.core.service.ClassService;
import com.itheima.core.service.CourseService;
import com.itheima.core.service.HomeworkService;
import com.itheima.core.service.StudentService;
import com.itheima.core.service.StuworkService;
import com.itheima.core.service.UserService;

@Controller
public class UserController {
	// ����ע��
	@Autowired
	private UserService userService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private StudentService studentService;
	@Autowired 
	private ClassService classService;
	@Autowired
	private HomeworkService homeworkService;
	@Autowired
	private StuworkService stuworkService;
	/**
	 * �û���¼
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String usercode,String password, Model model, 
                                                          HttpSession session) {
		// ͨ���˺ź������ѯ�û�
		User user = userService.findUser(usercode, password);
		if(user != null){		
			// ���û�������ӵ�Session
			session.setAttribute("USER_SESSION", user);
			// ��ת����ҳ��
			if(user.getTors()==1){
				List<Course>courses=courseService.findCourseByUid(user.getId());
				model.addAttribute("courses", courses);
				return "student/student";
			}else {
				List<Course>courses=courseService.findAll(1);
				model.addAttribute("courses", courses);
				int count=courseService.count();
				List<Integer>counts=new ArrayList<Integer>();
				for (int i = 1; i <=count; i++) {
					counts.add(i);
				}
				model.addAttribute("count",counts);
				//model.addAttribute("user", user);
				Integer nowPage=Integer.valueOf(1);
				model.addAttribute("nowPage",nowPage);
				return "teacher/teacher";
			}
		}
		model.addAttribute("msg", "�˺Ż�����������������룡");
         // ���ص���¼ҳ��
		return "login";
	}
	/**
	 * ��ҳ����
	 */
	@RequestMapping(value="page.action",method=RequestMethod.GET)
	public String page(@RequestParam("page") String page, Model model){
		Integer p=Integer.valueOf(page);
		List<Course>courses=courseService.findAll(p);
		model.addAttribute("courses", courses);
		model.addAttribute("nowPage",p);
		int count=courseService.count();
		List<Integer>counts=new ArrayList<Integer>();
		for (int i = 1; i <=count; i++) {
			counts.add(i);
		}
		model.addAttribute("count",counts);
		return "teacher/teacher";
	}
	/**
	 * �½��γ�
	 */
	@RequestMapping(value="create.action",method=RequestMethod.POST)
	public String create(String course,String teacher, Model model){
		Course c=new Course();
		c.setTeacher(teacher);
		c.setCourse(course);
		courseService.createCustomer(c);
		List<Course>courses=courseService.findAll(1);
		Integer nowPage=Integer.valueOf(1);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("courses", courses);
		int count=courseService.count();
		List<Integer>counts=new ArrayList<Integer>();
		for (int i = 1; i <=count; i++) {
			counts.add(i);
		}
		model.addAttribute("count",counts);
		return "teacher/teacher";
	}
	/**
	 * ��ת������ҳ��
	 */
	@RequestMapping(value="manage.action",method=RequestMethod.GET)
	public String manage(){
		return "teacher/manage";
	}
	/**
	 * ��ת��ҵҳ�棬����ʾ��ǰ��ҵ����ʦ���õ���ҵ
	 */
	@RequestMapping(value="homework.action",method=RequestMethod.GET)
	public String work(Model model){
		List<Homework>homeworks=homeworkService.findAll();
		for (Homework homework2 : homeworks) {
			Course course2=courseService.getCustomerById(homework2.getCourseid());
			homework2.setCourseName(course2.getCourse());
			homework2.setTeachernName(course2.getTeacher());
			Classname classname=classService.getClassnameById(homework2.getClassnum());
			System.out.println("classnum====="+homework2.getClassnum());
			homework2.setClassname(classname.getClassname());
		}
		model.addAttribute("homeworks",homeworks);
		
		return "teacher/homework";
	}
	/**
	 * ����ѧ���ϴ�����ҵ
	 */
	@RequestMapping(value="dowloadStuWork.action",method=RequestMethod.GET)
	public ResponseEntity<byte[]> dowloadStuWork(@RequestParam("file") String filename,HttpServletRequest request,Model model) throws IOException{
		String path="D:/fileupload/";
        File file = new File(path + File.separator + filename);
        HttpHeaders headers = new HttpHeaders();  
        //������ʾ���ļ������������������������  
        String downloadFielName = new String(filename.getBytes("UTF-8"),"iso-8859-1");
        //֪ͨ�������attachment�����ط�ʽ����ͼƬ
        headers.setContentDispositionFormData("attachment", downloadFielName); 
        //application/octet-stream �� �����������ݣ�������ļ����أ���
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
                headers, HttpStatus.CREATED);
	}
	/**
	 * ������ʦ����ҵ
	 */
	@RequestMapping(value="download.action")
	public ResponseEntity<byte[]> Download(HttpServletRequest request,@RequestParam("id") String id, Model model) throws IOException{
		String path="D:/fileupload/";
		String filename=homeworkService.getHomeworkById(Integer.valueOf(id)).getFilename();
        File file = new File(path + File.separator + filename);
        HttpHeaders headers = new HttpHeaders();  
        //������ʾ���ļ������������������������  
        String downloadFielName = new String(filename.getBytes("UTF-8"),"iso-8859-1");
        //֪ͨ�������attachment�����ط�ʽ����ͼƬ
        headers.setContentDispositionFormData("attachment", downloadFielName); 
        //application/octet-stream �� �����������ݣ�������ļ����أ���
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
                headers, HttpStatus.CREATED);

	}
	/**
	 * �½���ҵ
	 */
	@RequestMapping(value="crhomework.action",method=RequestMethod.POST)
	public String crhomework(@RequestParam(value="filename") CommonsMultipartFile file,
			@RequestParam(value="workname") String workname,
			@RequestParam(value="classId") String classId,
			@RequestParam(value="course")String course,
			Model model) throws IllegalStateException, IOException{
		System.out.println("work:"+workname+",classid:"+classId+",course:"+course);
		long timechunk=System.currentTimeMillis()/1000;
		String filepath="D:/fileupload/"+timechunk+file.getOriginalFilename();
		String filename=timechunk+file.getOriginalFilename();
		File newFile=new File(filepath);
        //ͨ��CommonsMultipartFile�ķ���ֱ��д�ļ���ע�����ʱ��
        file.transferTo(newFile);
        Homework homework=new Homework();
        homework.setClassnum(Integer.valueOf(classId));
        homework.setCourseid(Integer.valueOf(course));
        homework.setFilename(filename);
        homework.setWorktitle(workname);
        homeworkService.createHomework(homework);
        List<Homework>homeworks=homeworkService.findAll();
        for (Homework homework2 : homeworks) {
			Course course2=courseService.getCustomerById(homework2.getCourseid());
			homework2.setCourseName(course2.getCourse());
			homework2.setTeachernName(course2.getTeacher());
			System.out.println(course2.getCourse());
		}
		model.addAttribute("homeworks",homeworks);
		return "teacher/homework";
		
	}
	/**
	 * ��ת��֪ͨҳ��
	 */
	@RequestMapping(value="notice.action",method=RequestMethod.GET)
	public String notice(){
		return "teacher/notice";
	}
	/**
	 * ��ʾѧ����ҵ�б�
	 */
	@RequestMapping(value="stuWrokList.action",method=RequestMethod.POST,produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String stuWrokList(@RequestBody String mapString){
		Map<String, String>map=JSON.parseObject(mapString, Map.class);
		String id=map.get("id").toString();
		List<StuWork> stuWorks=stuworkService.findAll(Integer.valueOf(id));
		for (StuWork stuWork : stuWorks) {
			Student student=studentService.getStudentById(stuWork.getStudent());
			System.out.println("student:"+student.getName());
			stuWork.setStudentname(student.getName());
			Homework homework=homeworkService.getHomeworkById(stuWork.getWorkid());
			System.out.println("homework:"+homework.getWorktitle());
			stuWork.setWorktitle(homework.getWorktitle());
		}
		return JSON.toJSONString(stuWorks);
	}
	/**
	 * �½�ѧ��
	 */
	@RequestMapping(value="crstudent.action",method=RequestMethod.POST)
	public String crstudent(String name,String telephone,String classId){
		Student s=new Student();
		s.setName(name);
		s.setTelephone(telephone);
		s.setClassId(Integer.valueOf(classId));
		studentService.createStudent(s);
		return "teacher/manage";
	}
	/**
	 * ��ת����ҳ�γ�
	 */
	@RequestMapping(value="/toteacher.action",method=RequestMethod.GET)
	public String toTeacher(Model model){
		List<Course>courses=courseService.findAll(1);
		Integer nowPage=Integer.valueOf(1);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("courses", courses);
		return "teacher/teacher";
	}
	
	/**
	 * �˳���¼
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    // ���Session
	    session.invalidate();
	    // �ض��򵽵�¼ҳ�����ת����
	    return "redirect:login.action";
	}
	
	
	/**
	 * ���û���½ҳ����ת
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}
	/**
	 * Excel�ϴ�ѧ������
	 */
	@RequestMapping(value="/excel.action", method=RequestMethod.POST)
	public String excel(@RequestParam(value="filename") MultipartFile file,
            HttpServletRequest request,HttpServletResponse response,@RequestParam(value="classId") String classId){
		if(file==null) return null;
        //��ȡ�ļ���
        String name=file.getOriginalFilename();
        //��һ���ж��ļ��Ƿ�Ϊ�գ����ж����С�Ƿ�Ϊ0���������Ƿ�Ϊnull��
        long size=file.getSize();
        if(name==null || ("").equals(name) && size==0) return null;
        
        //�������롣�������ļ������ļ���
        int classIdInt=Integer.valueOf(classId).intValue();
        boolean b = studentService.excel(name,file,classIdInt);
        if(b){
             String Msg ="��������EXCEL�ɹ���";
             request.getSession().setAttribute("msg",Msg);    
        }else{
             String Msg ="��������EXCELʧ�ܣ�";
             request.getSession().setAttribute("msg",Msg);
        } 
		return "teacher/manage";
	}
	/**
	 * ��ʾѧ���γ��б�
	 */
	@RequestMapping(value="/stuCourseList.action",method=RequestMethod.POST,produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String stuCourseList(HttpSession session){
		User user=(User) session.getAttribute("USER_SESSION");
		return JSON.toJSONString(courseService.findCourseByUid(user.getId()));
	}
	@RequestMapping(value="courseList.action",method=RequestMethod.POST,produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String courseList(){
		return JSON.toJSONString(courseService.findAll());
	}
	@RequestMapping(value="/studentList.action",method=RequestMethod.POST,produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String studentList(@RequestBody String mapString){
		Map<String, String>map=JSON.parseObject(mapString, Map.class);
		String id=map.get("id").toString();
		return JSON.toJSONString(studentService.findByClassId(Integer.valueOf(id)));
	}
	/**
	 * ��ʾ�༶�б�
	 */
	@RequestMapping(value="/classlist.action", method=RequestMethod.POST,produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String classlist(HttpServletRequest request,HttpServletResponse response){
		List<Classname> classnames=classService.findAll();
		System.out.println(classnames.toString());
		return JSON.toJSONString(classnames);
	}
	/**
	 * ͨ�����ֲ���
	 */
	@RequestMapping(value="/searchClassByName.action",method=RequestMethod.POST,produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String searchClassByName(@RequestBody String mapString){
		Map<String, String>map=JSON.parseObject(mapString, Map.class);
		String teachernamechar=map.get("teachernamechar").toString();
		System.out.println(teachernamechar);
		List<Course> classnames=courseService.findByName(teachernamechar);
		return JSON.toJSONString(classnames);
	}
	/**
	 * ��ת��������ҵҳ��
	 */
	@RequestMapping(value="downwork.action",method=RequestMethod.GET)
	public String downwork(Model model){
		List<Homework>homeworks=homeworkService.findAll();
		for (Homework homework2 : homeworks) {
			Course course2=courseService.getCustomerById(homework2.getCourseid());
			homework2.setCourseName(course2.getCourse());
			homework2.setTeachernName(course2.getTeacher());
			System.out.println(course2.getCourse());
		}
		model.addAttribute("homeworks",homeworks);
		return "student/downwork";
	}
	/**
	 * ��ת���ϴ���ҵ��ҳ��
	 */
	@RequestMapping(value="upwork.action",method=RequestMethod.GET)
	public String upwork(){
		return "student/upwork";
	}
	/**
	 * ���ؿγ�ҳ��
	 */
	@RequestMapping(value="mycourse.action",method=RequestMethod.GET)
	public String mycourse(Model model, 
            HttpSession session){
		User user=(User) session.getAttribute("USER_SESSION");
		List<Course>courses=courseService.findCourseByUid(user.getId());
		model.addAttribute("courses", courses);
		return "student/student";
	}
	/**
	 * ��ʾѧ�����ϴ�����ҵ
	 */
	@RequestMapping(value="WrokList.action",method=RequestMethod.POST,produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String WrokList(HttpSession session){
		User user=(User) session.getAttribute("USER_SESSION");
		List<StuWork> stuWorks=stuworkService.findMyStuWorks(user.getId());
		for (StuWork stuWork : stuWorks) {
			Homework homework=homeworkService.getHomeworkById(stuWork.getWorkid());
			System.out.println("homework:"+homework.getWorktitle());
			stuWork.setWorktitle(homework.getWorktitle());
			Course course=courseService.getCustomerById(stuWork.getCourse());
			stuWork.setCoursename(course.getCourse());
		}
		return JSON.toJSONString(stuWorks);
	}
	@RequestMapping(value="courseWrok.action",method=RequestMethod.POST,produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String courseWrok(@RequestBody String mapString){
		Map<String, String>map=JSON.parseObject(mapString, Map.class);
		String id=map.get("id");
		
		return JSON.toJSONString(homeworkService.findByCourse(Integer.valueOf(id)));
	}
	/**
	 * ѧ���ϴ���ҵ
	 */
	@RequestMapping(value="uphomework.action",method=RequestMethod.POST)
	public String uphomework(@RequestParam(value="filename") CommonsMultipartFile file,
			@RequestParam(value="workId") String workname,
			@RequestParam(value="course")String course,
			Model model,
			HttpSession session) throws IllegalStateException, IOException{
		User user=(User) session.getAttribute("USER_SESSION");
		System.out.println("work:"+workname+",course:"+course);
		long timechunk=System.currentTimeMillis()/1000;
		String filepath="D:/fileupload/"+timechunk+file.getOriginalFilename();
		String filename=timechunk+file.getOriginalFilename();
		File newFile=new File(filepath);
        //ͨ��CommonsMultipartFile�ķ���ֱ��д�ļ���ע�����ʱ��
        file.transferTo(newFile);
        Student  student=studentService.findStudentByname(user.getId());
        StuWork stuWork=new StuWork();
        stuWork.setStudent(student.getId());
        stuWork.setCourse(Integer.valueOf(course));
        stuWork.setWorkid(Integer.valueOf(workname));
        stuWork.setWorkname(filename);
        stuworkService.createStuWork(stuWork);
//        Homework homework=new Homework();
//        homework.setCourseid(Integer.valueOf(course));
//        homework.setFilename(filename);
//        homework.setWorktitle(workname);
//        homeworkService.createHomework(homework);
//        List<Homework>homeworks=homeworkService.findAll();
//        for (Homework homework2 : homeworks) {
//			Course course2=courseService.getCustomerById(homework2.getCourseid());
//			homework2.setCourseName(course2.getCourse());
//			homework2.setTeachernName(course2.getTeacher());
//			System.out.println(course2.getCourse());
//		}
//		model.addAttribute("homeworks",homeworks);
		return "student/upwork";
		
	}
}
