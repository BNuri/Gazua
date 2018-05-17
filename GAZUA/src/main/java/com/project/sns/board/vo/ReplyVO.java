package com.project.sns.board.vo;

import java.sql.Date;

public class ReplyVO {
	private Integer reply_seq;
	private Integer board_seq;
	private Integer story_seq;
	private String writer;
	private String rcontent;
	private String rwriter;
	private Date rregdate;
    private String reparent;
    private String redepth;
    
    
    public String getReparent() {
		return reparent;
	}
	public void setReparent(String reparent) {
		this.reparent = reparent;
	}
	public String getRedepth() {
		return redepth;
	}
	public void setRedepth(String redepth) {
		this.redepth = redepth;
	}
	public Integer getReorder() {
		return reorder;
	}
	public void setReorder(Integer reorder) {
		this.reorder = reorder;
	}
	private Integer reorder;

	
	
	public Integer getReply_seq() {
		return reply_seq;
	}
	public void setReply_seq(Integer reply_seq) {
		this.reply_seq = reply_seq;
	}
	public Integer getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(Integer board_seq) {
		this.board_seq = board_seq;
	}
	public Integer getStory_seq() {
		return story_seq;
	}
	public void setStory_seq(Integer story_seq) {
		this.story_seq = story_seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public Date getRregdate() {
		return rregdate;
	}
	public void setRregdate(Date rregdate) {
		this.rregdate = rregdate;
	}

	
}