package com.ezen.carCamping.dto;

public class ReviewProductScoreDTO {
	private int rps_num;
	private ReviewProductDTO reviewProductDTO;
	private MemberDTO memberDTO;
	private float rps_score;
	
	public int getRps_num() {
		return rps_num;
	}
	public void setRps_num(int rps_num) {
		this.rps_num = rps_num;
	}
	public ReviewProductDTO getReviewProductDTO() {
		return reviewProductDTO;
	}
	public void setReviewProductDTO(ReviewProductDTO reviewProductDTO) {
		this.reviewProductDTO = reviewProductDTO;
	}
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public float getRps_score() {
		return rps_score;
	}
	public void setRps_score(float rps_score) {
		this.rps_score = rps_score;
	}
}
