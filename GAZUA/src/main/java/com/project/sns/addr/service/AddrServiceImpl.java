package com.project.sns.addr.service;

import com.project.sns.addr.dao.AddrDAO;
import com.project.sns.addr.vo.AddrVO;
import com.project.sns.board.vo.BoardVO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

@Service
public class AddrServiceImpl implements AddrService{
	@Autowired
	private AddrDAO dao;

	@Override
	public int inputAddr(List<AddrVO> vo) {
		return dao.inputAddr(vo);
	}
	
	@Override
	public int inputAddrCat(List<AddrVO> vo) {
		return dao.inputAddrCat(vo);
	}
	
	@Override
	public List<AddrVO> getAddress() throws Exception {
		return dao.getAddress();
	}
	
	@Override
	   public List<AddrVO> getAddrByWeather(String sigungucode, String inside) throws Exception {
	      return dao.getAddrByWeather(sigungucode, inside);
	   }
	
	@Override
	 public List<AddrVO> getAddrWithCode(String sigungucode) throws Exception {
	      return dao.getAddrWithCode(sigungucode);
	   }
	
	@Override
	 public List<BoardVO> getHeart() throws Exception {
	      return dao.getHeart();
	   }

	@Override
	public void insertPath(BoardVO vo) {
		dao.insertPath(vo);
	}
	
	@Override
	public AddrVO callInfo(String contentId) throws Exception {
		// TODO Auto-generated method stub
		return dao.callInfo(contentId);
	}

	@Override
	public AddrVO callReview(String contentId) throws Exception {
		// TODO Auto-generated method stub
		return dao.callReview(contentId);
	}

	@Override
	public double getStarAvg(String contentId) throws Exception {
		// TODO Auto-generated method stub
		return dao.getStarAvg(contentId);
	}
	
	@Override
	public List<BoardVO> getStarAvgList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getStarAvgList();
	}
	@Override
	public int getStoryseq(String id) throws Exception {
		return dao.getStoryseq(id);
	}
}
