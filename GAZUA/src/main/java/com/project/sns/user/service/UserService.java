package com.project.sns.user.service;

import java.util.HashMap;
import java.util.List;

import com.project.sns.addr.vo.AddrVO;
import com.project.sns.user.vo.UserVO;

public interface UserService {
	public int insertUser(UserVO vo);
	public List<UserVO> getUserList(UserVO vo);
	public UserVO getUser(String keyword);
	public UserVO getId(UserVO vo);
//	public List<UserVO> getUser1(int index);
	public String getUserImage(String id);
	public int getFollowingCount(String id);
	public int getFollowerCount(String id);
	public int followByBoard(HashMap<String, String> ids);
	public int followByPage(HashMap<String, String> ids);
	public void unFollow(HashMap<String, String> ids);

	public List<UserVO> getFollower(String id);
	public int getFollow(HashMap map);
	public int updatePicture(UserVO vo);
}