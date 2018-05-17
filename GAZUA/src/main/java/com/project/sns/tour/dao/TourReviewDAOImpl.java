package com.project.sns.tour.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.sns.tour.vo.TourReviewVO;

@Repository
public class TourReviewDAOImpl implements TourReviewDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.project.sns.mapper.tourMapper";
	
	@Override
	public int tourReviewInsert(TourReviewVO vo) throws Exception {
		return sqlSession.insert(namespace+".inputTourReview", vo);
	}

	@Override
	public List<TourReviewVO> tourReviewSelectAll() throws Exception {
		return sqlSession.selectList(namespace+".selectTourReviewAll");
	}

	@Override
	public TourReviewVO tourReviewSelect(String contentId) throws Exception {
		return sqlSession.selectOne(namespace+".selectTourReview", contentId);
	}

	@Override
	public int tourReviewUpdate(TourReviewVO vo) throws Exception {
		return sqlSession.update(namespace+".updateTourReview", vo);
	}

	@Override
	public int tourReviewDelete(String contentId) throws Exception {
		return sqlSession.delete(namespace+".deleteTourReview", contentId);
	}
	

}