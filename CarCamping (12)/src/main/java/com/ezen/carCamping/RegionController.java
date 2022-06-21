package com.ezen.carCamping;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
import com.ezen.carCamping.service.RegionMapper;

@Controller
public class RegionController {
	@Autowired
	
	private RegionMapper RegionMapper;
	
	@RequestMapping(value="goRegion.region", method=RequestMethod.GET)
	public String goRegion(HttpServletRequest req) {
		String region_num = req.getParameter("region_num");
		if(region_num!=null) {
			RegionDTO dto = RegionMapper.selectRegion(Integer.parseInt(region_num));
			List<CarCampingRegionDTO> hot_region_list = RegionMapper.listCarCampingRegionHotRegion(Integer.parseInt(region_num));
			req.setAttribute("regionDTO",dto);
			req.setAttribute("hotList_Region",hot_region_list);
		}
		List<CarCampingRegionDTO> hot_list = RegionMapper.listHotRegion();
		List<CarCampingRegionDTO> recommand_list = RegionMapper.listRecommandRegion();
		req.setAttribute("hotRegionList", hot_list);
		req.setAttribute("recommandRegionList", recommand_list);
		
		return "region/regionMain";
	}
	
	/*
	 * @RequestMapping("/goRegionHOT.region") public String
	 * goRegionHOT(HttpServletRequest req,@RequestParam int region_num) { RegionDTO
	 * dto = RegionMapper.selectRegion(region_num); List<CarCampingRegionDTO> list =
	 * RegionMapper.listCarCampingRegionHotReview(region_num);
	 * req.setAttribute("regionDTO",dto);
	 * req.setAttribute("hotReviewList_Region",list); return "region/regionMain"; }
	 */
	
	
	
	/*
	 * @RequestMapping(value="goRegion.region", method=RequestMethod.POST) public
	 * String goRegion(HttpServletRequest req,@RequestParam int region_num) {
	 * //String num = (String)req.getAttribute("region_num");
	 * req.setAttribute("region_num", region_num); return "region/regionMain"; }
	 */
	
	/*
	 * @RequestMapping(value="goRegion.region", method=RequestMethod.POST) public
	 * String goRegion(HttpServletRequest req) {
	 * 
	 * RegionDTO dto = RegionMapper.selectRegion(Integer.parseInt(num));
	 * req.setAttribute("dto", dto); return "region/regionMain"; }
	 */
	@RequestMapping("/regionReviewView.region")
	public String regionReviewView() {
		return "/region/regionReviewView";
	}
	
	@RequestMapping("/regionView.region")
	public String regionView() {
		return "/region/regionView";
	}
}
