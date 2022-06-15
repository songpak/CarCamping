package com.ezen.carCamping;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.carCamping.dto.AgencyDTO;
import com.ezen.carCamping.dto.BrandCategoryDTO;
import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.ProductCategoryDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.service.AdminMapper;

@Controller
public class AdminController {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@RequestMapping("/goAdmin.admin")
	public String goAdmin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources");
		List<RegionDTO> adminListRegion = adminMapper.adminListRegion();
		
		session.setAttribute("adminListRegion", adminListRegion);
		session.setAttribute("upPath", upPath);
		return "admin/main";
	}
	
	@RequestMapping("/adminRegion.admin")
	public String adminRegion(HttpServletRequest req,@RequestParam(required=false) String region_num) {
		List<CarCampingRegionDTO> adminListCarCampingRegion = new ArrayList<CarCampingRegionDTO>();
		if (region_num==null) {
			adminListCarCampingRegion = adminMapper.adminListCarCampingRegion();
		}else {
			adminListCarCampingRegion = adminMapper.adminListCarCampingRegionSelectRegion(Integer.parseInt(region_num));
		}
		
		req.setAttribute("adminListCarCampingRegion", adminListCarCampingRegion);
		return "admin/adminRegion";
	}
	@RequestMapping(value="/adminRegisterRegion.admin", method=RequestMethod.GET)
	public String adminRegisterRegion(HttpServletRequest req) {
		
		return "admin/adminRegisterRegion";
	}
	
	@RequestMapping(value="/adminRegisterRegion.admin", method=RequestMethod.POST)
	public ModelAndView adminRegisterRegionPro(HttpServletRequest req,@ModelAttribute CarCampingRegionDTO dto,@RequestParam("ccr_viewImage") MultipartFile[] file, @RequestParam Map<String,String> map) {
		//외래키
				RegionDTO regionDTO = new RegionDTO();
				regionDTO.setRegion_num(Integer.parseInt(map.get("region_num")));
				dto.setRegionDTO(regionDTO);
				
				//차량 접근
				String ccr_car = "";
				if (map.containsKey("ccr_car1")) ccr_car += "승용차  ";
				if (map.containsKey("ccr_car2")) ccr_car += "소형 트레일러  ";
				if (map.containsKey("ccr_car3")) ccr_car += "카라반  ";
				if (map.containsKey("ccr_car4")) ccr_car += "루프탑  ";
				if (map.containsKey("ccr_car5")) ccr_car += "캠핑카  ";
				dto.setCcr_car(ccr_car.trim());
				
				//바닥 종류
				String ccr_ground = "";
				if (map.containsKey("ccr_ground1")) ccr_ground += "맨흙  ";
				if (map.containsKey("ccr_ground2")) ccr_ground += "자갈  ";
				if (map.containsKey("ccr_ground3")) ccr_ground += "모래  ";
				if (map.containsKey("ccr_ground4")) ccr_ground += "데크  ";
				if (map.containsKey("ccr_ground5")) ccr_ground += "잔디 ";
				dto.setCcr_ground(ccr_ground.trim());
				
				//유무 체크
				if (map.containsKey("ccr_amenity1")) dto.setCcr_toilet(0);
				else dto.setCcr_toilet(1);
				
				if (map.containsKey("ccr_amenity2")) dto.setCcr_restroom(0);
				else dto.setCcr_restroom(1);
				
				if (map.containsKey("ccr_amenity3")) dto.setCcr_water(0);
				else dto.setCcr_water(1);
				
				if (map.containsKey("ccr_amenity4")) dto.setCcr_market(0);
				else dto.setCcr_market(1);
				
				if (map.containsKey("ccr_amenity5")) dto.setCcr_river(0);
				else dto.setCcr_river(1);
				
				String upPath = (String)req.getSession().getAttribute("upPath");
				
				//다중파일 업로드
				for (MultipartFile f : file) {
					String filename = f.getOriginalFilename();		
					if (dto.getCcr_viewImage1()==null) dto.setCcr_viewImage1(filename);
					else if (dto.getCcr_viewImage2()==null) dto.setCcr_viewImage2(filename);
					else if (dto.getCcr_viewImage3()==null) dto.setCcr_viewImage3(filename);
					else if (dto.getCcr_viewImage4()==null) dto.setCcr_viewImage4(filename);
					else if (dto.getCcr_viewImage5()==null) dto.setCcr_viewImage5(filename);
					
					try {
						f.transferTo(new File(upPath+"/images/region/"+filename));
						
						
		
					}catch(IOException e) {
						e.printStackTrace();
					}
				}
				
				int res = adminMapper.adminInsertRegion(dto);
				String msg =null, url = null;
				if (res>0) {
					msg = "장소가 등록되었습니다.";
					url = "adminRegion.admin";
				}else {
					msg = "장소 등록이 실패되었습니다. 관리자에게 문의하세요";
					url = "adminRegion.admin";
				}
				ModelAndView mav = new ModelAndView("message");
				mav.addObject("msg", msg);
				mav.addObject("url", url);
				return mav;
		}
	
	@RequestMapping("/adminViewRegion.admin")
	public ModelAndView adminViewRegion(@RequestParam int ccr_num) {
		CarCampingRegionDTO cdto = adminMapper.getCarCampingRegion(ccr_num);
		return new ModelAndView("admin/adminViewRegion","cdto",cdto);
	}
			
	

	@RequestMapping("/adminUpdateRegion.admin")
	public ModelAndView  updateRegion(HttpServletRequest req,@RequestParam("ccr_viewImage") MultipartFile[] file,@RequestParam Map<String,String> map) {
		CarCampingRegionDTO dto = adminMapper.getCarCampingRegion(Integer.parseInt(map.get("ccr_num")));
		//차량 접근
		String ccr_car = "";
		if (map.containsKey("ccr_car1")) ccr_car += "승용차  ";
		if (map.containsKey("ccr_car2")) ccr_car += "소형 트레일러  ";
		if (map.containsKey("ccr_car3")) ccr_car += "카라반  ";
		if (map.containsKey("ccr_car4")) ccr_car += "루프탑  ";
		if (map.containsKey("ccr_car5")) ccr_car += "캠핑카  ";
		dto.setCcr_car(ccr_car.trim());
		
		//바닥 종류
		String ccr_ground = "";
		if (map.containsKey("ccr_ground1")) ccr_ground += "맨흙  ";
		if (map.containsKey("ccr_ground2")) ccr_ground += "자갈  ";
		if (map.containsKey("ccr_ground3")) ccr_ground += "모래  ";
		if (map.containsKey("ccr_ground4")) ccr_ground += "데크  ";
		if (map.containsKey("ccr_ground5")) ccr_ground += "잔디 ";
		dto.setCcr_ground(ccr_ground.trim());
		
		//유무 체크
		if (map.containsKey("ccr_amenity1")) dto.setCcr_toilet(0);
		else dto.setCcr_toilet(1);
		
		if (map.containsKey("ccr_amenity2")) dto.setCcr_restroom(0);
		else dto.setCcr_restroom(1);
		
		if (map.containsKey("ccr_amenity3")) dto.setCcr_water(0);
		else dto.setCcr_water(1);
		
		if (map.containsKey("ccr_amenity4")) dto.setCcr_market(0);
		else dto.setCcr_market(1);
		
		if (map.containsKey("ccr_amenity5")) dto.setCcr_river(0);
		else dto.setCcr_river(1);
		
		String upPath = (String)req.getSession().getAttribute("upPath");
		
		//다중파일 업로드
		for (MultipartFile f : file) {
			String filename = f.getOriginalFilename();		
			if (dto.getCcr_viewImage1()==null) dto.setCcr_viewImage1(filename);
			else if (dto.getCcr_viewImage2()==null) dto.setCcr_viewImage2(filename);
			else if (dto.getCcr_viewImage3()==null) dto.setCcr_viewImage3(filename);
			else if (dto.getCcr_viewImage4()==null) dto.setCcr_viewImage4(filename);
			else if (dto.getCcr_viewImage5()==null) dto.setCcr_viewImage5(filename);
			
			try {
				f.transferTo(new File(upPath+"/images/region/"+filename));
				
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		//인기여부
		if (map.containsKey("ccr_popular")) dto.setCcr_popular(0);
		else dto.setCcr_popular(1);
		
		int res = adminMapper.adminUpdateRegion(dto);
		String msg =null, url = null;
		if (res>0) {
			msg = "장소가 수정되었습니다.";
			url = "adminRegion.admin";
		}else {
			msg = "장소 수정이 실패되었습니다. 관리자에게 문의하세요";
			url = "adminRegion.admin";
		}
		ModelAndView mav = new ModelAndView("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	@RequestMapping("/adminDeleteRegion.admin")
	public ModelAndView adminDeleteRegion(@RequestParam int ccr_num) {
		int res = adminMapper.adminDeleteRegion(ccr_num);
		String msg =null, url = null;
		if (res>0) {
			msg = "장소가 삭제되었습니다.";
			url = "adminRegion.admin";
		}else {
			msg = "장소 삭제가 실패되었습니다. 관리자에게 문의하세요";
			url = "adminRegion.admin";
		}
		ModelAndView mav = new ModelAndView("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
///////////////////////////////////대리점///////////////////////////////////////////////
	@RequestMapping("/adminAgency.admin")
	public String adminAgency(HttpServletRequest req) {
		List<AgencyDTO> adminListAgency = adminMapper.adminListAgency();
		req.setAttribute("adminListAgency", adminListAgency);
		return "admin/adminAgency";
	}
	
	@RequestMapping(value="/adminRegisterAgency.admin", method=RequestMethod.GET)
	public String adminRegisterAgency() {
		return "admin/adminRegisterAgency";
	}
	
	@RequestMapping(value="/adminRegisterAgency.admin", method=RequestMethod.POST)
	public ModelAndView adminRegisterAgencyPro(@ModelAttribute AgencyDTO dto,@RequestParam int region_num) {
		RegionDTO rdto = new RegionDTO();
		rdto.setRegion_num(region_num);
		dto.setRegionDTO(rdto);
		
		int res = adminMapper.adminInsertAgency(dto);
		String msg =null, url = null;
		if (res>0) {
			msg = "대리점이 등록되었습니다.";
			url = "adminAgency.admin";
		}else {
			msg = "대리점 등록이 실패되었습니다. 관리자에게 문의하세요";
			url = "adminAgency.admin";
		}
		ModelAndView mav = new ModelAndView("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	@RequestMapping(value="/adminViewAgency.admin", method=RequestMethod.GET)
	public ModelAndView adminViewAgency(@RequestParam int agency_num) {
		AgencyDTO adto = adminMapper.adminGetAgency(agency_num);
		return new ModelAndView("admin/adminViewAgency","adto",adto);
	}
	
	@RequestMapping(value="/adminViewAgency.admin", method=RequestMethod.POST)
	public ModelAndView adminViewAgencyPro(@RequestParam Map<String,String> map) {
		AgencyDTO adto = adminMapper.adminGetAgency(Integer.parseInt(map.get("agency_num")));
		adto.setAgency_name(map.get("agency_name"));
		adto.setAgency_location(map.get("agency_location"));
		adto.setAgency_phone(map.get("agency_phone"));
		
		int res = adminMapper.adminUpdateAgency(adto);
		String msg =null, url = null;
		if (res>0) {
			msg = "대리점이 수정되었습니다.";
			url = "adminAgency.admin";
		}else {
			msg = "대리점 수정이 실패되었습니다. 관리자에게 문의하세요";
			url = "adminAgency.admin";
		}
		ModelAndView mav = new ModelAndView("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	@RequestMapping("/adminDeleteAgency.admin")
	public ModelAndView adminDeleteAgency(@RequestParam int agency_num) {
		int res = adminMapper.adminDeleteAgency(agency_num);
		String msg =null, url = null;
		if (res>0) {
			msg = "대리점이 삭제되었습니다.";
			url = "adminAgency.admin";
		}else {
			msg = "대리점 삭제가 실패되었습니다. 관리자에게 문의하세요";
			url = "adminAgency.admin";
		}
		ModelAndView mav = new ModelAndView("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	///////////////////////////////////////////카테고리/////////////////////////////////////////////////
	
	@RequestMapping("/adminCategory.admin")
	public String adminCategory(HttpServletRequest req,@RequestParam(required=false) String category) {
		List<BrandCategoryDTO> adminListBrand = adminMapper.adminListBrand();
		req.setAttribute("adminListBrand", adminListBrand);
		List<ProductCategoryDTO> adminListProductCategory = adminMapper.adminListProductCategoty();
		req.setAttribute("adminListProductCategory", adminListProductCategory);
		
		return "admin/adminCategory";
	}
	@RequestMapping(value="/adminInsertCategory.admin", method=RequestMethod.GET)
	public String adminInsertCategory() {
		return "admin/adminRegisterCategory";
	}
	
	
	@RequestMapping(value="/adminInsertCategory.admin", method=RequestMethod.POST)
	public ModelAndView adminInsertCategoryPro(@RequestParam HashMap<String,String> map) {
		int res = adminMapper.adminInsertCategory(map);
		String msg =null, url = null;
		if (res>0) {
			msg = "카테고리가 등록되었습니다.";
			url = "adminCategory.admin";
		}else {
			msg = "카테고리 등록이 실패되었습니다. 관리자에게 문의하세요";
			url = "adminCategory.admin";
		}
		ModelAndView mav = new ModelAndView("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	@RequestMapping("/adminDeleteBrand.admin")
	public ModelAndView adminDeleteBrand(int brand_num) {
		int res = adminMapper.adminDeleteBrand(brand_num);
		String msg =null, url = null;
		if (res>0) {
			msg = "브랜드 카테고리가 삭제되었습니다.";
			url = "adminCategory.admin";
		}else {
			msg = "브랜드 카테고리 삭제가 실패되었습니다. 관리자에게 문의하세요";
			url = "adminCategory.admin";
		}
		ModelAndView mav = new ModelAndView("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	@RequestMapping("/adminDeleteProductCategory.admin")
	public ModelAndView adminDeleteProductCategory(int pc_num) {
		int res = adminMapper.adminDeleteProductCategory(pc_num);
		String msg =null, url = null;
		if (res>0) {
			msg = "상품 카테고리가 삭제되었습니다.";
			url = "adminCategory.admin";
		}else {
			msg = "상품 카테고리 삭제가 실패되었습니다. 관리자에게 문의하세요";
			url = "adminCategory.admin";
		}
		ModelAndView mav = new ModelAndView("message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
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
