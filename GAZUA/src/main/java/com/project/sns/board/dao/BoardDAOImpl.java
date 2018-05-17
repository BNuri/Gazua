package com.project.sns.board.dao;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.sns.addr.vo.AddrVO;
import com.project.sns.board.vo.BoardVO;
import com.project.sns.board.vo.ImageVO;
import com.project.sns.board.vo.ReplyVO;
import com.project.sns.board.vo.StoryVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.project.sns.mapper.boardMapper";
	
	public List<BoardVO> getBoardList(HashMap map)
	{
		return sqlSession.selectList(namespace+".getBoardList",map);
	}
	
	public List<BoardVO> getBoardStoryList(BoardVO vo)
	{
		return sqlSession.selectList(namespace+".getBoardStoryList",vo);
	}
	
	public List<BoardVO> getMainBoardList(int index)
	{
		return sqlSession.selectList(namespace+".getMainBoardList",index);
	}

	@Override
	public int getBoardCount(int line_seq) throws Exception {
		return sqlSession.selectOne(namespace+".getBoardCount", line_seq);
	}


	@Override
	public BoardVO getBoardValue(int line_seq, int board_seq) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void upBoardHeart(BoardVO vo) {
		sqlSession.update(namespace+".upBoardHeart", vo);
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
		// TODO Auto-generated method stub
		
	}
	
 
	@Override
	public List<String> getAttach(Integer bno) throws Exception {

		return null;
	}

	@Override
	public List<StoryVO> getStory(String id) {
		return sqlSession.selectList(namespace+".getStory", id);
	}

	@Override
	public int inputStory(StoryVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".inputStory",vo);
	}

	@Override
	public List<BoardVO> getBoardList(StoryVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getBoardList",vo);
	}

	@Override
	public int getBoardSeq(BoardVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getBoardSeq",vo);
	}



	@Override
	public int inputBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".inputBoard",vo);
	}
	
	@Override
	public int updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".updateBoard",vo);
	}

	@Override
	public int deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".deleteBoard",vo);
	}

	@Override
	public int deleteBoardByStory(StoryVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".deleteBoardByStory", vo);
	}

	@Override
	public int deleteStory(StoryVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".deleteStory",vo);
	}

	@Override
	public int addImg(String fileName) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".addImg",fileName);
	}

	@Override
	public List<ImageVO> getImg(int board_seq) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getImg",board_seq);
	}

	@Override
	public void registup(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int saveImage(ImageVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".saveImage",vo);
	}

	@Override
	public ImageVO getImage(int img_seq) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getImage",img_seq);
	}

	// 2018-02-05 in
	@Override
	public List<StoryVO> getStoryAll(String id) throws Exception {
		return sqlSession.selectList(namespace+".getStoryAll", id);
	}
/*	@Override
	public List<StoryVO> getStoryAll(HashMap map) throws Exception {
		return sqlSession.selectList(namespace+".getStoryAll", map);
	}
*/	
	    // ��� ����
	    public int replyCount() throws Exception{
	    	return sqlSession.selectOne(namespace+".replyCount");
	    };
	    // ��� ���
	    public List<ReplyVO> replyList(ReplyVO reply) throws Exception{
	    	return sqlSession.selectList(namespace+".replyList",reply);
	    };
	 
	    // ��� �ۼ�
	    public int replyInsert(ReplyVO reply) throws Exception{
	    	return sqlSession.insert(namespace+".insertReply", reply);
	    };
	    
	    // ��� ����
	    public int replyUpdate(ReplyVO reply) throws Exception{
	    	return sqlSession.update(namespace+".replyUpdate", reply);
	    };
	 
	    // ��� ����
	    public int replyDelete(ReplyVO reply) throws Exception{
	    	return sqlSession.delete(namespace+".replyDelete", reply);
	    }

		@Override
		public int getStoryCount(String id) throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectOne(namespace+".getStoryCount", id);
		}

		@Override
		public List<BoardVO> getFollowerStoryList(HashMap<String, Object> map) {
			return sqlSession.selectList(namespace+".getFollowerStoryList", map);
		};
	    
	    //���ƿ�
	    public int likeInsert(BoardVO board) throws Exception
	    {
	    	return sqlSession.insert(namespace+".likeInsert", board);
	    }
	    public int likeUp(BoardVO board) throws Exception
	    {
	    	return sqlSession.update(namespace+".likeUp", board);
	    }
	    
	    public List<BoardVO> getBoard(BoardVO vo) throws Exception
	    {
	    	return sqlSession.selectList(namespace+".getBoard", vo);
	    }
	    
	    public int likeDelete(BoardVO board) throws Exception
	    {
	    	return sqlSession.delete(namespace+".likeDelete", board);
	    }
	    
	    public BoardVO getBoardlikeId(BoardVO vo) throws Exception
	    {
	    	return sqlSession.selectOne(namespace+".getBoardlikeId", vo);
	    }

		@Override
		public int getHeart(HashMap map) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne(namespace+".getHeart", map);
		}

		@Override
		public int getHeartCount(BoardVO vo) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne(namespace+".getHeartCount", vo);
		}

		@Override
		public BoardVO getBoardBySeq(String board_seq) throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectOne(namespace+".getBoardBySeq", board_seq);
		}
	    
	    public List<AddrVO> getSavedPath(int story_seq) throws Exception
	    {
	    	return sqlSession.selectList(namespace+".getSavedPath", story_seq);
	    }

}
