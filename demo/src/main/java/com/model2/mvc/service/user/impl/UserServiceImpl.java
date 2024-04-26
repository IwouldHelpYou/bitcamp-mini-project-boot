package com.model2.mvc.service.user.impl;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.model2.mvc.common.Search;
import com.model2.mvc.domain.User;
import com.model2.mvc.service.user.UserDao;
import com.model2.mvc.service.user.UserService;

@Service("UserService")

@Transactional()
public class UserServiceImpl implements UserService{
	
	///Field
	@Autowired
	@Qualifier("userDao")
	private UserDao userDAO;
	
	////***** spring ���� setter �����Ϸ��� �ص� setter �޼ҵ�� �����ؾ� userDao DI �� �� ����
	public void setUserDao(UserDao userDAO) {
		this.userDAO = userDAO;
	}
	
	public UserServiceImpl() {
		 System.out.println(this.getClass());
		 System.out.println("[UserServiceImpl] userDAO =>" + userDAO);
		//DAO �������� ����?
		//userDAO=new UserDao(); 
	}

	public void addUser(User userVO) throws Exception {
		userDAO.insertUser(userVO);
	}

	public User loginUser(User userVO) throws Exception {
			User dbUser=userDAO.getUser(userVO.getUserId());

			if(! dbUser.getPassword().equals(userVO.getPassword()))
				throw new Exception("�α��ο� �����߽��ϴ�.");
			
			return dbUser;
	}

	public User getUser(String userId) throws Exception {
		return userDAO.getUser(userId);
	}

	public Map<String,Object> getUserList(Search search) throws Exception {
		List<User> list= userDAO.getUserList(search);
		int totalCount = userDAO.getTotalCount(search);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updateUser(User userVO) throws Exception {
		System.out.println("updateUser �尣��");
		userDAO.updateUser(userVO);
	}

	public boolean checkDuplication(String userId) throws Exception {
		boolean result=true;
		User userVO=userDAO.getUser(userId);
		if(userVO != null) {
			result=false;
		}
		return result;
	}
}