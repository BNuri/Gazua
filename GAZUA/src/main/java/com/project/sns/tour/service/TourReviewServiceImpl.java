package com.project.sns.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.sns.tour.dao.TourReviewDAO;
import com.project.sns.tour.vo.TourReviewVO;

@Service
public class TourReviewServiceImpl implements TourReviewService {
	@Autowired
	private TourReviewDAO dao;
	
	@Override
	public int tourReviewInsert(TourReviewVO vo) throws Exception {
		return dao.tourReviewInsert(vo);
	}

	@Override
	public List<TourReviewVO> tourReviewSelectAll() throws Exception {
		return dao.tourReviewSelectAll();
	}

	@Override
	public TourReviewVO tourReviewSelect(String contentId) throws Exception {
		return dao.tourReviewSelect(contentId);
	}

	@Override
	public int tourReviewUpdate(TourReviewVO vo) throws Exception {
		return dao.tourReviewUpdate(vo);
	}

	@Override
	public int tourReviewDelete(String contentId) throws Exception {
		return dao.tourReviewDelete(contentId);
	}
}
