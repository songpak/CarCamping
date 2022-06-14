package com.ezen.carCamping;

import java.util.Hashtable;
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
	
	private Hashtable<String, List<CarCampingRegionDTO>> ht = RegionMapper.getInstance();
	
	@RequestMapping(value="goRegion.region", method=RequestMethod.GET)
	public String goRegion(HttpServletRequest req) {
		List<CarCampingRegionDTO> hot_list = RegionMapper.listHotRegion();
		List<CarCampingRegionDTO> recommand_list = RegionMapper.listRecommandRegion();
		ht.put("hot_list", hot_list);
		ht.put("recommand_list", recommand_list);
		req.setAttribute("hotRegionList", hot_list);
		req.setAttribute("recommandRegionList", recommand_list);
		
		return "region/regionMain";
	}
	
	
	  @RequestMapping("/goRegionHotLocList.region")
	  public String goRegionHOT(HttpServletRequest req,@RequestParam int region_num) { 
		  RegionDTO dto = RegionMapper.selectRegion(region_num); 
		  List<CarCampingRegionDTO> list = RegionMapper.listCarCampingRegionHotRegion(region_num);
		  req.setAttribute("regionDTO",dto);
		  req.setAttribute("hotList_Region",list);
		  req.setAttribute("hotRegionList", ht.get("hot_list"));
		  req.setAttribute("recommandRegionList", ht.get("recommand_list"));
		  return "region/regionHotLocList"; 
	  }
	 
	
	
	
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
