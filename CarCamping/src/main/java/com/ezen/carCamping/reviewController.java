package com.ezen.carCamping;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
import com.ezen.carCamping.service.RegionMapper;
import com.ezen.carCamping.service.ReviewMapper;

@Controller
public class reviewController {

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Autowired 
	private RegionMapper RegionMapper; 
	
	@RequestMapping(value="field_review.review", method=RequestMethod.GET )
	public String field_review() {
		return "review/field_review";
	}
//	select에서 선택한 region_num에 따른 ccr_name,ccr_num가져오기
	@RequestMapping(value = "ccr_list.review", method=RequestMethod.POST)
	@ResponseBody
	public String ccr_list(HttpServletRequest req,@RequestParam String region_num) {
		System.out.println(region_num);
		//String region_num = Integer.parseInt(region_num);
		List<CarCampingRegionDTO> list = RegionMapper.listCcr(Integer.parseInt(region_num));
		String size= String.valueOf(list.size());
		System.out.println(size);
		return String.valueOf(list.size());
		
	}
	@RequestMapping(value="field_review.review", method=RequestMethod.POST)
	public String field_reviewOk(HttpServletRequest req, ReviewRegionDTO dto) {
		int res = reviewMapper.insertReviewRegion(dto);
		if(res>0) {
			req.setAttribute("msg", "���� ��� ����!");
		}else {
			req.setAttribute("msg", "���� ��� ���Ф�_��");
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
			req.setAttribute("msg", "���� ��� ����!");
		}else {
			req.setAttribute("msg", "���� ��� ���Ф�_��");
			req.setAttribute("url", "goods_review.review");
		}
		return "message";
	}
}
