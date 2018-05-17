package com.project.sns.search.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.sns.addr.vo.AddrVO;
import com.project.sns.board.vo.BoardVO;
import com.project.sns.search.service.SearchService;
import com.project.sns.tour.vo.TourMapVO;
import com.project.sns.user.vo.UserVO;

@Controller
public class SearchController{
	private final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	private SearchService service;
	
	@RequestMapping("/searchAll.do")
	public String SearchAll(@RequestParam("keyword") String keyword, @RequestParam("number") int number, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		/*PrintWriter out = response.getWriter();
		keyword = '%'+keyword+'%';
		List<UserVO> userList = service.searchUser(keyword);
		List<TourMapVO> tourMapList = service.searchMap(keyword);
		List<BoardVO> boardList = service.searchBoard(keyword);
		String[] order = new String[3];
		
		System.out.println("userListSize : " + userList.size());
		System.out.println("tourMapListSize : " + tourMapList.size());
		System.out.println("boardListSize : " + boardList.size());
		
		
		
		if(number == 1) {
			order[0] = "사용자";
			order[1] = "관광지";
			order[2] = "게시글";
		} else if(number == 2) {
			order[0] = "관광지";
			order[1] = "사용자";
			order[2] = "게시글";
		} else if(number == 3) {
			order[0] = "게시글";
			order[1] = "관광지";
			order[2] = "사용자";
		} else {
			out.println("<script>");
			out.println("alert('잘못된 동작입니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		request.setAttribute("order", order);
		request.setAttribute("number", number);
		request.setAttribute("userList", userList);
		request.setAttribute("boardList", boardList);
		request.setAttribute("tourMapList", tourMapList);
	*/	
		request.setAttribute("keyword", keyword);
		request.setAttribute("number", number);
		System.out.println("searchTest");
		return "searchTest";
	}
	
	@RequestMapping("/searchUser.do")
	public String searchUser(@RequestParam("keyword") String keyword, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		keyword = '%'+keyword+'%';
		List<UserVO> userList = service.searchUser(keyword);

		request.setAttribute("order", "사용자");
		request.setAttribute("number", 1);
		request.setAttribute("list", userList);
		System.out.println("searchUser");
		return "searchTable";
	}

	@RequestMapping("/searchTourMap.do")
	public String searchTourMap(@RequestParam("keyword") String keyword, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		keyword = '%'+keyword+'%';
		List<TourMapVO> tourMapList = service.searchMapInBar(keyword);

		request.setAttribute("order", "관광지");
		request.setAttribute("number", 2);
		request.setAttribute("list", tourMapList);
		System.out.println("searchTM");
		return "searchTable";
	}

	@RequestMapping("/searchBoard.do")
	public String searchBoard(@RequestParam("keyword") String keyword, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		keyword = '%'+keyword+'%';
		List<BoardVO> boardList = service.searchBoard(keyword);
		
		request.setAttribute("order", "게시글");
		request.setAttribute("number", 3);
		request.setAttribute("list", boardList);
		System.out.println("searchTB");
		return "searchTable";
	}
	
	
	@ResponseBody
    @RequestMapping("/search")
    public List<TourMapVO> search (@RequestParam String keyword) throws Exception {
    	System.out.println("keyword : " + keyword);
    	List<TourMapVO> list = (List<TourMapVO>)service.searchMap(keyword);
    
    	System.out.println("list.size : " + list.size());
    	
    	return list;
    }
}
