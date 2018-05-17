package com.project.sns.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.sns.addr.vo.AddrVO;
import com.project.sns.board.dao.BoardDAO;
import com.project.sns.board.vo.BoardVO;
import com.project.sns.board.vo.ImageVO;
import com.project.sns.board.vo.ReplyVO;
import com.project.sns.board.vo.StoryVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO dao;
	

	public List<BoardVO> getBoardList(HashMap map)
	{
		return dao.getBoardList(map);
	}
	
	public List<BoardVO> getBoardStoryList(BoardVO vo)
	{
		return dao.getBoardStoryList(vo);
	}
	
	
	public List<BoardVO> getMainBoardList(int index)
	{
		return dao.getMainBoardList(index);
	}

	@Override
	public int getBoardCount(int line_seq) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardVO getBoardValue(int line_seq, int board_seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReplyVO> getBoardReply(int board_seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void upBoardHeart(BoardVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int inputBoardReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delBoard(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delBoardReply(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardModify(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public void regist(BoardVO board) throws Exception {
		dao.inputBoard(board);
	}
	

	@Override
	public void registup(BoardVO board) throws Exception {
		dao.updateBoard(board);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StoryVO> getStory(String id) {
		// TODO Auto-generated method stub
		
		return dao.getStory(id);
	}


	@Override
	public int inputStory(StoryVO vo) {
		// TODO Auto-generated method stub
		return dao.inputStory(vo);
	}


	@Override
	public List<BoardVO> getBoardList(StoryVO vo) {
		// TODO Auto-generated method stub
		return dao.getBoardList(vo);
	}


	@Override
	public int getBoardSeq(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.getBoardSeq(vo);
	}


	@Override
	public int inputBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.inputBoard(vo);
	}
	
	@Override
	public int updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.updateBoard(vo);
	}


	@Override
	public int deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(vo);
	}


	@Override
	public int deleteBoardByStory(StoryVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteBoardByStory(vo);
	}


	@Override
	public int deleteStory(StoryVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteStory(vo);
	}


	@Override
	public int addImg(String fileName) throws Exception {
		// TODO Auto-generated method stub
		return dao.addImg(fileName);
	}


	@Override
	public List<ImageVO> getImg(int board_seq) throws Exception {
		// TODO Auto-generated method stub
		return dao.getImg(board_seq);
	}


	@Override
	public int saveImage(ImageVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return dao.saveImage(vo);
		
	}

	@Override
	public ImageVO getImage(int img_seq) throws Exception {
		// TODO Auto-generated method stub
		return dao.getImage(img_seq);
	}

	

	@Override
	public List<StoryVO> getStoryAll(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getStoryAll(id);
	}
/*	@Override
	public List<StoryVO> getStoryAll(HashMap map) throws Exception {
		// TODO Auto-generated method stub
		return dao.getStoryAll(map);
	}
*/
    
    // ��� ����
    public int replyCount() throws Exception{
    	return dao.replyCount();
    };
    // ��� ���
    public List<ReplyVO> replyList(ReplyVO reply) throws Exception{
    	return dao.replyList(reply);
    };
 
    // ��� �ۼ�
    public int replyInsert(ReplyVO reply) throws Exception{
    	return dao.replyInsert(reply);
    };
    
    // ��� ����
    public int replyUpdate(ReplyVO reply) throws Exception{
    	return dao.replyUpdate(reply);
    };
 
    // ��� ����
    public int replyDelete(ReplyVO reply) throws Exception{
    	// TODO
    	return dao.replyDelete(reply);
    }

	@Override
	public int getStoryCount(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getStoryCount(id);
	}

	@Override

	public List<BoardVO> getFollowerStoryList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getFollowerStoryList(map);
	}
    
    //���ƿ�
    public int likeInsert(BoardVO board) throws Exception{
    	return dao.likeInsert(board);
    }
    
    public int likeUp(BoardVO board) throws Exception{
        return dao.likeUp(board);
    }
    public List<BoardVO> getBoard(BoardVO vo) throws Exception{
    	return dao.getBoard(vo);
    }
    public int likeDelete(BoardVO board) throws Exception{
    	return dao.likeDelete(board);
    }
    public BoardVO getBoardlikeId(BoardVO vo) throws Exception{
    	return dao.getBoardlikeId(vo);
    }

	@Override
	public int getHeart(HashMap map) {
		return dao.getHeart(map);
	}

	@Override
	public int getHeartCount(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.getHeartCount(vo);
	}


    	@Override
	public BoardVO getBoardBySeq(String board_seq) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardBySeq(board_seq);
	}
    public List<AddrVO> getSavedPath(int story_seq) throws Exception
    {
    	return dao.getSavedPath(story_seq);
    }
}
