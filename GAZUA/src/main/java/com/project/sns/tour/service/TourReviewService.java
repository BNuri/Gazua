package com.project.sns.tour.service;

import java.util.List;

import com.project.sns.tour.vo.TourReviewVO;

public interface TourReviewService {
	// CRUD...
	// Create
	public int tourReviewInsert(TourReviewVO vo) throws Exception;

	// Read
	public List<TourReviewVO> tourReviewSelectAll() throws Exception;

	public TourReviewVO tourReviewSelect(String contentId) throws Exception;

	// Update
	public int tourReviewUpdate(TourReviewVO vo) throws Exception;

	// Delete
	public int tourReviewDelete(String contentId) throws Exception;
}
