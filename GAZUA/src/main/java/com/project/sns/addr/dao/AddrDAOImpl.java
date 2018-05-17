package com.project.sns.addr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.sns.addr.vo.AddrVO;
import com.project.sns.board.vo.BoardVO;

@Repository
public class AddrDAOImpl implements AddrDAO {
	@Autowired
	private SqlSession sqlSession;

	private static final String namespace = "com.project.sns.mapper.addrMapper";

	@Override
	public int inputAddr(List<AddrVO> vo) {
		return sqlSession.insert(namespace + ".inputAddr", vo);
	}

	@Override
	public int inputAddrCat(List<AddrVO> vo) {
		return sqlSession.insert(namespace + ".inputAddrCat", vo);
	}

	@Override
	public List<AddrVO> getAddress() throws Exception {
		return sqlSession.selectList(namespace + ".getAddress");
	}

	@Override
	public List<AddrVO> getAddrByWeather(String sigungucode, String inside) throws Exception {
		HashMap params = new HashMap();
		params.put("sigungucode", sigungucode);
		params.put("inside", inside);
		return sqlSession.selectList(namespace + ".getAddrByWeather", params);
	}

	@Override
	public List<AddrVO> getAddrWithCode(String sigungucode) throws Exception {
		return sqlSession.selectList(namespace + ".getAddrWithCode", sigungucode);
	}

	@Override
	public List<BoardVO> getHeart() throws Exception {
		return sqlSession.selectList(namespace + ".getHeart");
	}

	@Override
	public void insertPath(BoardVO vo) {
		sqlSession.insert(namespace + ".insertPath", vo);
	}
	
	@Override
	public AddrVO callInfo(String contentId) throws Exception {
		return sqlSession.selectOne(namespace+".callInfo", contentId);
	}

	@Override
	public AddrVO callReview(String contentId) throws Exception {
		return sqlSession.selectOne(namespace+".callReview", contentId);
	}

	@Override
	public double getStarAvg(String contentId) throws Exception {
		return sqlSession.selectOne(namespace+".getStarAvg", contentId);	
	}
	
	@Override
	public List<BoardVO> getStarAvgList() throws Exception {
		return sqlSession.selectList(namespace+".getStarAvgList");	
	}
	@Override
	public int getStoryseq(String id) throws Exception {
		return sqlSession.selectOne(namespace + ".getStoryseq", id);
	}
}
