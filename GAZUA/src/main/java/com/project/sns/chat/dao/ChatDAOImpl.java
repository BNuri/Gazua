package com.project.sns.chat.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.sns.chat.vo.ChatVO;
import com.project.sns.user.vo.UserVO;

@Repository
public class ChatDAOImpl implements ChatDAO {

	@Autowired
	private SqlSession session;

	private static String namespace = "com.project.mapper.chatMapper";

	@Override
	public int submit(ChatVO vo) {
		return session.insert(namespace + ".submit", vo);

	}

	@Override
	public List<ChatVO> getChatListById(ChatVO vo) {
		return session.selectList(namespace + ".listByID", vo);
	}

	@Override
	public List<ChatVO> getChatListByRecent(ChatVO vo) {
		return session.selectList(namespace + ".listByRecent", vo);
	}

	@Override
	public int readChat(ChatVO vo) {
		return session.update(namespace + ".readChat", vo);
	}

	@Override
	public int newChat(ChatVO vo) {
		return session.selectOne(namespace + ".newChat", vo);
	}

	@Override
	public List<ChatVO> getFollowerList(String id) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".getFollowerList", id);
	}

	@Override
	public UserVO getUser(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".getUser", id);
	}
}
