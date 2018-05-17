package com.project.sns.chat.dao;

import java.util.List;

import com.project.sns.chat.vo.ChatVO;
import com.project.sns.user.vo.UserVO;

public interface ChatDAO {
	public int submit(ChatVO vo);
	public List<ChatVO> getChatListById(ChatVO vo);
	public List<ChatVO> getChatListByRecent(ChatVO vo);
	public int readChat(ChatVO vo);
	public int newChat(ChatVO vo);
	
	public List<ChatVO> getFollowerList(String id);
	
	public UserVO getUser(String id); 
}
