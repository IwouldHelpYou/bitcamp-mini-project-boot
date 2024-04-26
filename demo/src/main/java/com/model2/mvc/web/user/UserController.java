package com.model2.mvc.web.user;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.domain.User;
import com.model2.mvc.service.user.UserService;


// �ϴ� �δ��� �ڹٽ����ؼ� 
// ���� ������� ���ذ����� 
// ������ ����� �ѹ� �����Ű��� 
// �ٵ� ��� ���Ҷ�� �Ϲݱ�µžߵɵ�

@Controller
@RequestMapping("/user/*")
public class UserController {
	////////////Business logic UserService DI/////////////////////
	///Field

	@Autowired
	@Qualifier("UserService")
	private UserService userService;
	///Constructor
	public UserController() {
		System.out.println(this.getClass()+"��1");
	}
	
	@Value("${pageUnit}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("${pageSize}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser( @ModelAttribute("user") User user ) throws Exception {

		System.out.println("/user/addUserView : GET");
		
		//Business Logic
		//userService.addUser(user);
		
		return "redirect:/user/addUserView.jsp";
	}
	
	@RequestMapping( value="checkDuplication", method=RequestMethod.POST )
	public String checkDuplication( @RequestParam("userId") String userId , Model model ) throws Exception{
		
		System.out.println("/user/checkDuplication : POST");
		//Business Logic
		boolean result=userService.checkDuplication(userId);
		// Model �� View ����
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("userId", userId);

		return "forward:/user/checkDuplication.jsp";
	}
	
	//@RequestMapping("/getUser.do")
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		System.out.println(userId);
		//Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	
	@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search, Model model , HttpServletRequest request) throws Exception {

		System.out.println("/user/listUser");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}	
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map = userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("listUser ��ȸ��� : "+map);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/user/listUser.jsp";
		
	}
	
	@RequestMapping( value="loginView", method=RequestMethod.GET)
	public String loginView() throws Exception{
		
		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
			
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		System.out.println("�α��� �Ϸ�. ���ǻ��� => "+session.getAttribute("user"));
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public ModelAndView logout(HttpSession session) {
		System.out.println("/user/logout");

		//�α��� ���� ����
		session.removeAttribute("user");

		//Ŭ�� ������ �޼��� ����
		//String message = "���̵� �н����� 3�� �̻� �Է��ϼ���";

		//��/�� ������ ���� �𵨾غ� ����
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/index.jsp");
		//modelAndView.addObject("message", message);

		System.out.println("logout�� �� index.jsp ����� �������ߴµ� �־Ȱ���");
		return modelAndView;
	}//logout method
	
	//user �� model �� ���¿��µ� ��� ������ ����??
	//ȸ���������� ���� ������ ������ ��. ����ȭ�����γѾ
	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public ModelAndView updateuserView(@RequestParam("userId") String userId, Model model) throws Exception{
		
		// ���� ��ư�� �������� ���������ϰ� �ϴ� JSP ����
		System.out.println("/user/updateUserView");
		
		// System.out.println("updateUserView.do"+userId); //user21,user21
		
		
		User user = userService.getUser(userId);
		
		ModelAndView modelAndView = new ModelAndView();
		//modelAndView.addObject("user",user);
		modelAndView.setViewName("forward:/user/updateUser.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public ModelAndView updateUser(@ModelAttribute("user") User user) throws Exception {
		System.out.println("/user/updateUser");
		System.out.println(user);

		// ���� ��ư�� �������� DB�� �����ϰ� �ֽ� user���� ����
		userService.updateUser(user);
		
		ModelAndView modelAndView = new ModelAndView();
		//modelAndView.addObject("userId", user.getUserId()); //������
		modelAndView.setViewName("redirect:/user/getUser?userId="+user.getUserId()); //VIEW����
		
		return modelAndView;
	}
	
	/////////////////////////////
	/////////////////////////////
	/////////////////////////////
	
	//�׺���̼�
	@RequestMapping( value = "logon")
	public ModelAndView logon(){
		
		System.out.println("/user/logon : ����");

		//Ŭ�� ������ �޼��� ����
		String message = "���̵� �н����� 3���̻� �Է��ϼ���";

		//��/�� ������ ���� �𵨾غ� ����
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/logon.jsp");
		modelAndView.addObject("message", message);

		System.out.println("logon.do : ����");

		return modelAndView;
	}//logon method

	//�׺���̼�
	@RequestMapping( value = "home")
	public ModelAndView home(HttpSession session) {
		System.out.println("/user/home : ����");

		//Ŭ�� ������ �޼��� ����
		String message = "WELCOME";

		//��/�� ������ ���� �𵨾غ� ����
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/home.jsp");
		modelAndView.addObject("message", message);

		System.out.println("home.do : ����");

		return modelAndView;
	}//home method

	//�׺���̼�
	@RequestMapping(value="/logonAction.do",method= RequestMethod.GET)
	public ModelAndView logonAction(){

		System.out.println("/user/logonAction : ����");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/logon.do");
		System.out.println("logonAction.do GET: ����");

		return modelAndView;
	}//logonAction GET method

	//�����Ͻ���������� �׺���̼�@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping(value="/logonAction.do",method=RequestMethod.POST)
	public ModelAndView logonAction(@ModelAttribute("user") User user,
									HttpSession session) throws Exception {
		
		System.out.println("/user/logonAction : ����");

		//��Ʈ�ѷ� : �׺���̼�
		String viewName = "forward:/user/logon.jsp";

		//��Ʈ�ѷ�: �����Ͻ� ���� ó��
		//�����Ͻ����̾��� DAO ���� �� Method ȣ��
//		UserDao userDAO = new UserDAO();
//		userDAO.getUser(user);
		User returnUser = userService.getUser(user.getUserId());
		if(   returnUser.getPassword().equals(user.getPassword())) {
			returnUser.setActive(true);
			user = returnUser;
			
		}
		////////////////////////////////////////////////////////////////////
		
		if (user.isActive()) {
			viewName = "forward:/user/home.jsp";
			session.setAttribute("sessionUser", user);
		}
		System.out.println("action : " + viewName);//������

		//Ŭ�� ������ �޼��� ����
		String message = null;
		if (viewName.equals("forward:/user/logon.jsp")) {
			message = "WELCOME�Դϴ�.";
		} else {
			message = "���̵� �н����� 3���̻� �Է��ϼ���";
		}//ELSE

		//��/�� ������ ���� �𵨾غ� ����
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(viewName);
		modelAndView.addObject("message", message);

		System.out.println("logonAction.do POST : ����");
		return modelAndView;
	}//logonAction POST method
	
}//CLASS
