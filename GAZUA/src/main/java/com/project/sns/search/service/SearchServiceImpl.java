package com.project.sns.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.sns.board.vo.BoardVO;
import com.project.sns.search.dao.SearchDAO;
import com.project.sns.search.vo.SearchVO;
import com.project.sns.tour.vo.TourMapVO;
import com.project.sns.user.vo.UserVO;

@Service
public class SearchServiceImpl implements SearchService{
	@Autowired
	private SearchDAO dao;

	@Override
	public List<UserVO> searchUser(String keyword) throws Exception {
		return dao.searchUser(keyword);
	}

	@Override
	public List<TourMapVO> searchMap(String keyword) throws Exception {
		return dao.searchMap(keyword);
	}

	@Override
	public List<BoardVO> searchBoard(String keyword) throws Exception {
		return dao.searchBoard(keyword);
	}

	@Override
	public List<UserVO> searchUsers(SearchVO vo) throws Exception {
		return dao.searchUsers(vo);
	}

	@Override
	public List<BoardVO> searchBoards(SearchVO vo) throws Exception {
		return dao.searchBoards(vo);
	}

	@Override
	public List<TourMapVO> searchMapInBar(String keyword) throws Exception {
		return dao.searchMapInBar(keyword);
	}
	
	
}
