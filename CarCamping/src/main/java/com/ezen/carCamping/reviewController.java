package com.ezen.carCamping;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
import com.ezen.carCamping.service.ReviewMapper;

@Controller
public class reviewController {

	@Autowired
	private ReviewMapper reviewMapper;
	
	@RequestMapping(value="field_review.review", method=RequestMethod.GET )
	public String field_review() {
		return "review/field_review";
	}
	
	@RequestMapping(value="field_review.review", method=RequestMethod.POST)
	public String field_reviewOk(HttpServletRequest req, ReviewRegionDTO dto) {
		int res = reviewMapper.insertReviewRegion(dto);
		if(res>0) {
			req.setAttribute("msg", "리뷰 등록 성공!");
		}else {
			req.setAttribute("msg", "리뷰 등록 실패ㅜ_ㅜ");
			req.setAttribute("url", "field_review.review");
		}
		return "message";
	}
	
	@RequestMapping(value="goods_review.review", method=RequestMethod.GET )
	public String goods_review() {
		return "review/goods_review";
	}
	
	@RequestMapping(value="goods_review.review", method=RequestMethod.POST)
	public String goods_reviewOk(HttpServletRequest req, ReviewProductDTO dto) {
		int res = reviewMapper.insertReviewProduct(dto);
		if(res>0) {
			req.setAttribute("msg", "리뷰 등록 성공!");
		}else {
			req.setAttribute("msg", "리뷰 등록 실패ㅜ_ㅜ");
			req.setAttribute("url", "goods_review.review");
		}
		return "message";
	}
}
