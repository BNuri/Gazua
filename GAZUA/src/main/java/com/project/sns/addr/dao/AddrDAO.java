package com.project.sns.addr.dao;

import java.util.List;

import com.project.sns.addr.vo.AddrVO;
import com.project.sns.board.vo.BoardVO;

public interface AddrDAO {
	public int inputAddr(List<AddrVO> vo);
	public int inputAddrCat(List<AddrVO> vo);
	public List<AddrVO> getAddress() throws Exception;
	
	public List<AddrVO> getAddrByWeather(String sigungucode, String inside) throws Exception;  
	public List<AddrVO> getAddrWithCode(String sigungucode) throws Exception;

	public List<BoardVO> getHeart() throws Exception;
	
	public void insertPath(BoardVO vo);
	public double getStarAvg(String contentId) throws Exception;
	public List<BoardVO> getStarAvgList() throws Exception;
	
	public AddrVO callInfo(String contentId) throws Exception;
	public AddrVO callReview(String contentId) throws Exception;

	public int getStoryseq(String id) throws Exception;
}
