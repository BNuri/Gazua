package com.project.sns.search.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.sns.board.vo.BoardVO;
import com.project.sns.search.vo.SearchVO;
import com.project.sns.tour.vo.TourMapVO;
import com.project.sns.user.vo.UserVO;

@Repository
public class SearchDAOImpl implements SearchDAO{
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.project.sns.search.searchMapper";
	
	@Override
	public List<UserVO> searchUser(String keyword) throws Exception {
		return session.selectList(namespace+".searchUser", keyword);
	}

	@Override
	public List<TourMapVO> searchMap(String keyword) throws Exception {
		return session.selectList(namespace+".searchMap", keyword);
	}

	@Override
	public List<BoardVO> searchBoard(String keyword) throws Exception {
		return session.selectList(namespace+".searchBoard", keyword);
	}

	@Override
	public List<UserVO> searchUsers(SearchVO vo) throws Exception {
		return session.selectList(namespace+".searchUsers", vo);
	}

	@Override
	public List<BoardVO> searchBoards(SearchVO vo) throws Exception {
		return session.selectList(namespace+".searchBoards", vo);
	}

	@Override
	public List<TourMapVO> searchMapInBar(String keyword) throws Exception {
		return session.selectList(namespace + ".searchMapInBar", keyword);
	}
	
}
