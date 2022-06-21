package com.ezen.carCamping.dto;

public class ReviewScoreDTO {
	private int rs_num;
	private ReviewRegionDTO reviewRegionDTO;
	private MemberDTO memberDTO;
	private float rs_score;
	
	public int getRs_num() {
		return rs_num;
	}
	public void setRs_num(int rs_num) {
		this.rs_num = rs_num;
	}
	public ReviewRegionDTO getReviewRegionDTO() {
		return reviewRegionDTO;
	}
	public void setReviewRegionDTO(ReviewRegionDTO reviewRegionDTO) {
		this.reviewRegionDTO = reviewRegionDTO;
	}
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public float getRs_score() {
		return rs_score;
	}
	public void setRs_score(float rs_score) {
		this.rs_score = rs_score;
	}
	
	
}
