package com.model2.mvc.service.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.model2.mvc.common.Search;
import com.model2.mvc.domain.User;


//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition

@Mapper
public interface UserDao {
	
	// INSERT
	public int insertUser(User user) throws Exception ;

	// SELECT ONE
	public User getUser(String userId) throws Exception ;

	// SELECT LIST
	public List<User> getUserList(Search search) throws Exception ;

	// UPDATE
	public void updateUser(User user) throws Exception ;
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;

	int removeUser(String userId) throws Exception;
	
}