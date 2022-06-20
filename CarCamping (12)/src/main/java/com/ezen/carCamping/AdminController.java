package com.ezen.carCamping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("/goAdmin.admin")
	public String goAdmin() {
		return "admin/main";
	}
	
	@RequestMapping("/adminRegion.admin")
	public String adminRegion() {
		return "admin/adminRegion";
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
