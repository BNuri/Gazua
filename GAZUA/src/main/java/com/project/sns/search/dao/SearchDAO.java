package com.project.sns.search.dao;

import java.util.List;

import com.project.sns.board.vo.BoardVO;
import com.project.sns.search.vo.SearchVO;
import com.project.sns.tour.vo.TourMapVO;
import com.project.sns.user.vo.UserVO;

public interface SearchDAO {
	public List<UserVO> searchUser(String keyword) throws Exception;
	public List<UserVO> searchUsers(SearchVO vo) throws Exception;
	public List<TourMapVO> searchMap(String keyword) throws Exception;
	public List<BoardVO> searchBoard(String keyword) throws Exception;
	public List<BoardVO> searchBoards(SearchVO vo) throws Exception;
	public List<TourMapVO> searchMapInBar(String keyword) throws Exception;
}
