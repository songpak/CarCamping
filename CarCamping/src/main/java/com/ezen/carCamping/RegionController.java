package com.ezen.carCamping;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

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

	@RequestMapping(value = "goRegion.region", method = RequestMethod.GET)
	public String goRegion(HttpServletRequest req) {
		List<CarCampingRegionDTO> hot_list = RegionMapper.listHotRegion();
		List<CarCampingRegionDTO> recommand_list = RegionMapper.listRecommandRegion();
		ht.put("hot_list", hot_list);
		ht.put("recommand_list", recommand_list);
		req.setAttribute("hotRegionList", hot_list);
		req.setAttribute("recommandRegionList", recommand_list);
		/*
		 * for(int i=1;i<=9;i++) {
		 * ht.put(String.valueOf(i),RegionMapper.listCarCampingRegionHotRegion(i)); }
		 */
		return "region/regionMain";
	}

	@RequestMapping("/regionHotLocList.region")
	public String goRegionHOT(HttpServletRequest req, @RequestParam int region_num) {
		RegionDTO dto = RegionMapper.selectRegion(region_num);
		List<CarCampingRegionDTO> list = RegionMapper.listCarCampingRegionHotRegion(region_num);
		req.setAttribute("regionDTO", dto);
		// req.setAttribute("hotList_Region",ht.get(String.valueOf(region_num)));
		req.setAttribute("hotList_Region", list);
		req.setAttribute("hotRegionList", ht.get("hot_list"));
		req.setAttribute("recommandRegionList", ht.get("recommand_list"));
		return "region/regionHotLocList";
	}

	@RequestMapping("/regionView.region")
	public String regionView(HttpServletRequest req,@RequestParam Map<String,String> params) {
		int ccr_num = Integer.parseInt(params.get("ccr_num"));
		//int pageNum = Integer.parseInt(params.get("pageNum"));
		System.out.println(ccr_num);
		CarCampingRegionDTO dto = RegionMapper.selectRegionByCcrnum(ccr_num);
		req.setAttribute("regionSelected", dto);
		List<ReviewRegionDTO> list = null;
		int pageSize = 3;
		String pageNum = params.get("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int rowCount = RegionMapper.countReviewCcrnum(ccr_num);
		System.out.println("rowCount"+rowCount);
		System.out.println("pageSize"+pageSize);
		System.out.println("currentPage"+currentPage);
		System.out.println("startRow"+startRow);
		System.out.println("endRow"+endRow);
		if (endRow > rowCount)
			endRow = rowCount;
		if (rowCount > 0) {
			list = RegionMapper.listCcrReview(ccr_num,startRow-1,endRow);
		}
		System.out.println(list.size());
		int boardNum = rowCount - (startRow - 1);
		
		req.setAttribute("rowCount", rowCount);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("reviewList", list);
		
		return "/region/regionView";
	}

	@RequestMapping("/regionReviewView.region")
	public String regionReviewView(HttpServletRequest req, @RequestParam int ccr_num) {

		return "/region/regionReviewView";
	}

}
