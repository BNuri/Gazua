package com.project.sns.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.sns.chat.dao.ChatDAO;
import com.project.sns.chat.vo.ChatVO;
import com.project.sns.user.vo.UserVO;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDAO dao;

	@Override
	public int submit(ChatVO vo) {
		return dao.submit(vo);
	}

	@Override
	public List<ChatVO> getChatListById(ChatVO vo) {
		return dao.getChatListById(vo);
	}

	@Override
	public List<ChatVO> getChatListByRecent(ChatVO vo) {
		return dao.getChatListByRecent(vo);
	}

	@Override
	public int readChat(ChatVO vo) {
		return dao.readChat(vo);
	}

	@Override
	public int newChat(ChatVO vo) {
		return dao.newChat(vo);
	}

	@Override
	public List<ChatVO> getFollowerList(String id) {
		// TODO Auto-generated method stub
		return dao.getFollowerList(id);
	}

	@Override
	public UserVO getUser(String id) {
		// TODO Auto-generated method stub
		return dao.getUser(id);
	}
}
