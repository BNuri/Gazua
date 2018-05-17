package com.project.sns.tour.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.sns.tour.service.TourReviewService;
import com.project.sns.tour.vo.TourReviewVO;

@Controller
public class TourController {
	private final Logger logger = LoggerFactory.getLogger(TourController.class);
	
	@Autowired
	private TourReviewService tourReviewService;
	
	@RequestMapping("/inputTourReview")
	public String inputTourReview() {
		
		return "";
	}
	@RequestMapping("/selectTourReviewAll")
	public String selectTourReviewAll(HttpServletRequest request) throws Exception {
		List<TourReviewVO> list = tourReviewService.tourReviewSelectAll();
		request.setAttribute("list", list);
		return "TourReviewAll";
	}
	@RequestMapping("/selectTourReview")
	public String selectTourReview(@RequestParam("contentId") String contentId) throws Exception {
		TourReviewVO vo = tourReviewService.tourReviewSelect(contentId);
		return "TourReview";
	}
	@RequestMapping("/updateTourReview")
	public String updateTourReview() {
//		TourReviewVO vo = new TourReviewVO(asdf, scope, link1, link2, link3, image1, image2, image3);
		
//		int a = tourReviewService.tourReviewUpdate(vo);
		return "redirect:selectTourReviewAll.do";
	}
	@RequestMapping("/deleteTourReview")
	public String deleteTourReview(@RequestParam("contentId") String contentId) throws Exception {
		tourReviewService.tourReviewDelete(contentId);
		return "redirect:selectTourReviewAll.do";
	}
	
	
}
