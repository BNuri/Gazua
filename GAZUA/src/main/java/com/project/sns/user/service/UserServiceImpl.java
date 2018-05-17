package com.project.sns.user.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.sns.addr.vo.AddrVO;
import com.project.sns.user.dao.UserDAO;
import com.project.sns.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;

	@Override // new user insert
	public int insertUser(UserVO vo) {
		return dao.insertUser(vo);
	}
	
	@Override // get user data
	public List<UserVO> getUserList(UserVO vo){
		return dao.getUserList(vo);
	}

	@Override // get one user data
	public UserVO getUser(String keyword) {
		return dao.getUser(keyword);
	}

	@Override
	public String getUserImage(String id) {
		// TODO Auto-generated method stub
		return dao.getUserImage(id);
	}

	@Override
	public int getFollowingCount(String id) {
		// TODO Auto-generated method stub
		return dao.getFollowingCount(id);
	}

	@Override
	public int getFollowerCount(String id) {
		// TODO Auto-generated method stub
		return dao.getFollowerCount(id);
	}

	@Override
	public int followByBoard(HashMap<String, String> ids) {
		// TODO Auto-generated method stub
		return dao.followByBoard(ids);
	}
	
	@Override
	public int followByPage(HashMap<String, String> ids) {
		// TODO Auto-generated method stub
		return dao.followByPage(ids);
	}
	
	@Override // get one user data
	public UserVO getId(UserVO vo) {
		return dao.getId(vo);
	}
	/*@Override
	public List<UserVO> getUser1(int index){
		return dao.getUser1(index);
	}*/

	@Override
	public List<UserVO> getFollower(String id) {
		// TODO Auto-generated method stub
		return dao.getFollower(id);
	}

	@Override
	public void unFollow(HashMap<String, String> ids) {
		// TODO Auto-generated method stub
		dao.unFollow(ids);
	}

	@Override
	public int getFollow(HashMap map) {
		// TODO Auto-generated method stub
		return dao.getFollow(map);
	}

	@Override
	public int updatePicture(UserVO vo) {
		// TODO Auto-generated method stub
		return dao.updatePicture(vo);
	}
}