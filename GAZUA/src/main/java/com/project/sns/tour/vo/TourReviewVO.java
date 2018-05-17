package com.project.sns.tour.vo;

public class TourReviewVO {
	private String contentId;
	private String scope;
	private String link1;
	private String link2;
	private String link3;
	private String image1;
	private String image2;
	private String image3;
	
	public TourReviewVO(String contentId, String scope, String link1, String link2, String link3,
			String image1, String image2, String image3) {
		this.contentId = contentId;
		this.scope = scope;
		this.link1 = link1;
		this.link2 = link2;
		this.link3 = link3;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
	}

	public String getContentId() {
		return contentId;
	}

	public String getScope() {
		return scope;
	}

	public String getLink1() {
		return link1;
	}

	public String getLink2() {
		return link2;
	}

	public String getLink3() {
		return link3;
	}

	public String getImage1() {
		return image1;
	}

	public String getImage2() {
		return image2;
	}

	public String getImage3() {
		return image3;
	}	
}
