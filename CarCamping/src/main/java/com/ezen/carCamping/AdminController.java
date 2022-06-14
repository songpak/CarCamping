package com.ezen.carCamping;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.service.AdminMapper;

@Controller
public class AdminController {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@RequestMapping("/goAdmin.admin")
	public String goAdmin() {
		return "admin/main";
	}
	
	@RequestMapping("/adminRegion.admin")
	public String adminRegion(HttpServletRequest req,@RequestParam(required=false) String region_num) {
		List<RegionDTO> adminListRegion = adminMapper.adminListRegion();
		req.setAttribute("adminListRegion", adminListRegion);
		return "admin/adminRegion";
	}
	@RequestMapping(value="/adminRegisterRegion.admin", method=RequestMethod.GET)
	public String adminRegisterRegion(HttpServletRequest req) {
		List<RegionDTO> adminListRegion = adminMapper.adminListRegion();
		req.setAttribute("adminListRegion", adminListRegion);
		return "admin/adminRegisterRegion";
	}
	
	@RequestMapping(value="/adminRegisterRegion.admin", method=RequestMethod.POST)
	public String adminRegisterRegionPro(@ModelAttribute CarCampingRegionDTO dto) {
		
		return "admin/adminRegisterRegion";
	}
	
	@RequestMapping("/adminAgency.admin")
	public String adminAgency() {
		return "admin/adminAgency";
	}
	
	@RequestMapping("/adminCategory.admin")
	public String adminCategory() {
		return "admin/adminCategory";
	}
	
	@RequestMapping("/adminProduct.admin")
	public String adminProduct() {
		return "admin/adminProduct";
	}
	
	@RequestMapping("/adminMember.admin")
	public String adminMember() {
		return "admin/adminMember";
	}
	
	@RequestMapping("/adminReviewRegion.admin")
	public String adminReviewRegion() {
		return "admin/adminReviewRegion";
	}
	
	@RequestMapping("/adminReviewProduct.admin")
	public String adminReviewProduct() {
		return "admin/adminReviewProduct";
	}
	
	@RequestMapping("/adminAnnounce.admin")
	public String adminAnnounce() {
		return "admin/adminAnnounce";
	}
	
	@RequestMapping("/adminQuestion.admin")
	public String adminQuestion() {
		return "admin/adminQuestion";
	}
	
	@RequestMapping("/adminRental.admin")
	public String adminRental() {
		return "admin/adminRental";
	}
}
