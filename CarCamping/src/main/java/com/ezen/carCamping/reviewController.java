package com.ezen.carCamping;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.MemberDTO;
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
	public String field_review(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources");
		session.setAttribute("upPath", upPath);
		//MemberDTO dto = (MemberDTO) session.getAttribute("mbdto");
		//System.out.println(dto.getMem_id());
		//session.setAttribute(", value);
		return "review/field_review";
	}

	@RequestMapping(value = "ccr_list.review", method=RequestMethod.POST,produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String ccr_list(HttpServletRequest req,HttpServletResponse res ,@RequestParam String region_num) {
		
	
		System.out.println(region_num);
		//String region_num = Integer.parseInt(region_num);
		List<CarCampingRegionDTO> list = RegionMapper.listCcr(Integer.parseInt(region_num));
		String ccrListHtml ="";
		
		for(int i=0;i<list.size();i++) {
			CarCampingRegionDTO dto = list.get(i);
			ccrListHtml += "<option value='"+dto.getCcr_num()+"' label='"+dto.getCcr_name()+"'>"+"</option>";
		}
		
		System.out.println(ccrListHtml);
		return ccrListHtml;
		
	}
	@RequestMapping(value="field_review.review", method=RequestMethod.POST)
	public String field_reviewOk(HttpServletRequest req, ReviewRegionDTO dto) {
		//System.out.println(dto.getMemberDTO().getMem_num());
		System.out.println(dto.getReview_title());
		System.out.println(dto.getReview_regionContent());
		System.out.println(dto.getReview_popular());
		System.out.println(dto.getReview_readCount());
		int res = reviewMapper.insertReviewRegion(dto);
		if(res>0) {
			req.setAttribute("msg", "ㅅㅅ!");
		}else {
			req.setAttribute("msg", "ㅠㅠ");
			req.setAttribute("url", "field_review.review");
		}
		return "message";
	}
	
	/*
	 * @RequestMapping(value="goods_review.review", method=RequestMethod.GET )
	 * public String goods_review() { return "review/goods_review"; }
	 * 
	 * @RequestMapping(value="goods_review.review", method=RequestMethod.POST)
	 * public String goods_reviewOk(HttpServletRequest req, ReviewProductDTO dto) {
	 * int res = reviewMapper.insertReviewProduct(dto); if(res>0) {
	 * req.setAttribute("msg", "占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙!"); }else {
	 * req.setAttribute("msg", "占쏙옙占쏙옙 占쏙옙占� 占쏙옙占싻ㅿ옙_占쏙옙"); req.setAttribute("url",
	 * "goods_review.review"); } return "message"; }
	 */
}
