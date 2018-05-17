package com.project.sns.board.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.sns.addr.vo.AddrVO;
import com.project.sns.board.vo.BoardVO;
import com.project.sns.board.vo.ImageVO;
import com.project.sns.board.vo.ReplyVO;
import com.project.sns.board.vo.StoryVO;

public interface BoardDAO {
	public List<BoardVO> getBoardList(HashMap map);
	public List<BoardVO> getBoardStoryList(BoardVO vo);
	// 疫뀐옙 揶쏆뮇�땾(占쎌뵬占쎌뵥 甕곕뜇�깈)
	public List<BoardVO> getMainBoardList(@Param("index") int index);
	public int getBoardCount(int line_seq) throws Exception;

	// 湲� �긽�꽭(湲� 踰덊샇, �씪�씤 踰덊샇[BoardVO])
	public BoardVO getBoardValue(int line_seq, int board_seq);
	
	
	
	public void upBoardHeart(BoardVO vo);
	public int inputBoardReply(ReplyVO vo);
	public int delBoard(int seq);
	public int delBoardReply(int seq);
	public int boardModify(BoardVO vo);	
	public void regist(BoardVO board) throws Exception;
	public List<String> getAttach(Integer bno)throws Exception;
	public List<StoryVO> getStory(String id);
	public int inputStory(StoryVO vo);
	
	public List<BoardVO> getBoardList(StoryVO vo);
	public int getBoardSeq(BoardVO vo);
	public int inputBoard(BoardVO vo);
	public int updateBoard(BoardVO vo);
	
	public int deleteBoard(BoardVO vo);
	public int deleteBoardByStory(StoryVO vo);
	public int deleteStory(StoryVO vo);
	
	public int addImg(String fileName)throws Exception;
	public List<ImageVO> getImg(int board_seq)throws Exception;
	public void registup(BoardVO board) throws Exception;
	
	public int saveImage(ImageVO vo) throws SQLException;
	public ImageVO getImage(int img_seq) throws Exception;
	
	// 2018/02/05 in
	public List<StoryVO> getStoryAll(String id) throws Exception;
//	public List<StoryVO> getStoryAll(HashMap map) throws Exception;
	
	public int getStoryCount(String id) throws Exception;
	

    // 댓글 개수
    public int replyCount() throws Exception;
    // 댓글 목록
    public List<ReplyVO> replyList(ReplyVO reply) throws Exception;
 
    // 댓글 작성
    public int replyInsert(ReplyVO reply) throws Exception;
    
    // 댓글 수정
    public int replyUpdate(ReplyVO reply) throws Exception;
 
    // 댓글 삭제
    public int replyDelete(ReplyVO reply) throws Exception;
	public List<BoardVO> getFollowerStoryList(HashMap<String, Object> map);

   
    //좋아요
    public int likeInsert(BoardVO board) throws Exception;
    public int likeUp(BoardVO board) throws Exception;
    public List<BoardVO> getBoard(BoardVO vo) throws Exception;
    public int likeDelete(BoardVO board) throws Exception;
    public BoardVO getBoardlikeId(BoardVO vo) throws Exception;
	public int getHeart(HashMap map);
	public int getHeartCount(BoardVO vo);
     public BoardVO getBoardBySeq(String board_seq) throws Exception;
    public List<AddrVO> getSavedPath(int story_seq) throws Exception;
}
