package com.project.sns.board.vo;

import java.sql.Date;

public class BoardVO {
	private Integer board_seq;
	private Integer story_seq;
	private String title;
	private String writer;
	private String tel;
	private String content;
	private String mtitle;
	private String contentTypeId;
	private String[] files;
	private String contentId;
	private String addr1;
	private String firstimage;
	private String firstimage2;
	private String cat2;
	private String cat3;
	private String mapx;
	private String mapy;
	private Date regdate;
	private Integer heart;
	private String heart_id;
	private Integer star;

	private String story_title;
	private String id;
	private String story_regdate;

	public void setStory_seq(int story_seq) {
		this.story_seq = story_seq;
	}
	public String getStory_title() {
		return story_title;
	}
	public void setStory_title(String story_title) {
		this.story_title = story_title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStory_regdate() {
		return story_regdate;
	}
	public void setStory_regdate(String story_regdate) {
		this.story_regdate = story_regdate;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMtitle() {
		return mtitle;
	}

	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	

	public String getContentTypeId() {
		return contentTypeId;
	}

	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public String getContentId() {
		return contentId;
	}

	public void setContentId(String contentId) {
		this.contentId = contentId;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getFirstimage() {
		return firstimage;
	}

	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}

	public String getFirstimage2() {
		return firstimage2;
	}

	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}

	public String getCat2() {
		return cat2;
	}

	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}

	public String getCat3() {
		return cat3;
	}

	public void setCat3(String cat3) {
		this.cat3 = cat3;
	}

	public String getMapx() {
		return mapx;
	}

	public void setMapx(String mapx) {
		this.mapx = mapx;
	}

	public String getMapy() {
		return mapy;
	}

	public void setMapy(String mapy) {
		this.mapy = mapy;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Integer getHeart() {
		return heart;
	}

	public void setHeart(Integer heart) {
		this.heart = heart;
	}

	public String getHeart_id() {
		return heart_id;
	}

	public void setHeart_id(String heart_id) {
		this.heart_id = heart_id;
	}
	public Integer getStar() {
		return star;
	}
	public void setStar(Integer star) {
		this.star = star;
	}
}