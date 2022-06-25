package com.ezen.carCamping;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
import com.ezen.carCamping.service.MemberMapper;
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
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");
		if(dto==null) {
			req.setAttribute("msg","리뷰 등록을 위해서는 로그인이 필요합니다");
			req.setAttribute("url", "login.login");
			return "message";
		}else {
			req.setAttribute("mem_num", dto.getMem_num());
		}
		return "review/field_review";
	}

	@RequestMapping(value = "ccr_list.review", method=RequestMethod.POST,produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String ccr_list(HttpServletRequest req,HttpServletResponse res ,@RequestParam String region_num) {
		List<CarCampingRegionDTO> list = RegionMapper.listCcr(Integer.parseInt(region_num));
		String ccrListHtml ="";
		for(int i=0;i<list.size();i++) {
			CarCampingRegionDTO dto = list.get(i);
			ccrListHtml += "<option value='"+dto.getCcr_num()+"'>"+dto.getCcr_name()+"</option>";
		}
		return ccrListHtml;
	}
	
	@ResponseBody
	@RequestMapping(value = "/fieldReview_upload.review", method = RequestMethod.POST)
	public String fileUploadFiled(
			@RequestParam("review_Image") List<MultipartFile> multipartFile
			, HttpServletRequest request,ReviewRegionDTO dto) {
		String strResult ="bad";
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
		try {
			// 파일이 있을때 
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile file:multipartFile) {
					fileRoot = contextRoot + "resources/images/";
					System.out.println(fileRoot);
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					//dto image setting
					if (dto.getReview_regionImage1()==null) dto.setReview_regionImage1(savedFileName);
					else if (dto.getReview_regionImage2()==null) dto.setReview_regionImage2(savedFileName);
					else if (dto.getReview_regionImage3()==null) dto.setReview_regionImage3(savedFileName);
					else if (dto.getReview_regionImage4()==null) dto.setReview_regionImage4(savedFileName);
					else if (dto.getReview_regionImage5()==null) dto.setReview_regionImage5(savedFileName);
					
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						
					} catch (Exception e) {//파일삭제
						FileUtils.deleteQuietly(targetFile);//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				int res = reviewMapper.insertReviewRegion(dto);	
				strResult = "good";
			}
			// 파일 아무것도 첨부 안했을때 
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}	
	
	///////////////////////////////////////////product////////////////////////////////////////
	@RequestMapping(value="goods_review.review", method=RequestMethod.GET )
	public String prod_review(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources");
		session.setAttribute("upPath", upPath);
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");
		if(dto==null) {
			req.setAttribute("msg","리뷰 등록을 위해서는 로그인이 필요합니다");
			req.setAttribute("url", "login.login");
			return "message";
		}else {
			req.setAttribute("mem_num", dto.getMem_num());
			req.setAttribute("prodCateList", reviewMapper.listAllProdCate());
			req.setAttribute("brandCateList", reviewMapper.listAllBrandCate());
		}
		return "review/goods_review";
	}

	@RequestMapping(value = "prod_list.review", method=RequestMethod.POST,produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String prod_list(HttpServletRequest req,HttpServletResponse res ,@RequestParam String pc_num,@RequestParam String brand_num) {
		List<ProductDTO> list = reviewMapper.listProdByCategory(Integer.parseInt(pc_num),Integer.parseInt(brand_num));
		System.out.println(list.size());
		String prodListHtml ="";
		for(int i=0;i<list.size();i++) {
			ProductDTO dto = list.get(i);
			prodListHtml += "<option value='"+dto.getProd_num()+"'>"+dto.getProd_name()+"</option>";
		}
		return prodListHtml;
	}
	
	@ResponseBody
	@RequestMapping(value = "/goodsReview_upload.review", method = RequestMethod.POST)
	public String fileUploadGoods(
			@RequestParam("review_Image") List<MultipartFile> multipartFile
			, HttpServletRequest request,ReviewProductDTO dto) {
		String strResult = "bad";
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
		try {
			// 파일이 있을때 
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile file:multipartFile) {
					fileRoot = contextRoot + "resources/images/";
					System.out.println(fileRoot);
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
				
					//dto image setting
					if (dto.getRp_image1()==null) dto.setRp_image1(savedFileName);
					else if (dto.getRp_image2()==null) dto.setRp_image2(savedFileName);
					else if (dto.getRp_image3()==null) dto.setRp_image3(savedFileName);
					else if (dto.getRp_image4()==null) dto.setRp_image4(savedFileName);
					else if (dto.getRp_image5()==null) dto.setRp_image5(savedFileName);
					System.out.println("dto의 1번이미지 : "+dto.getRp_image1());
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						
					} catch (Exception e) {//파일삭제
						FileUtils.deleteQuietly(targetFile);//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				int res = reviewMapper.insertReviewProduct(dto);	
				strResult = "good";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}	
	
	@RequestMapping("message.review")
	public String messageReview(String msg,String url,HttpServletRequest req) {
		req.setAttribute("msg",msg);
		req.setAttribute("url",url);
		return "message";
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/prod_upload.review", method = RequestMethod.POST)
	 * public String fileUpload(
	 * 
	 * @RequestParam("review_Image") List<MultipartFile> multipartFile ,
	 * HttpServletRequest request,ReviewRegionDTO dto) {
	 * 
	 * String strResult = "{ \"result\":\"FAIL\" }"; String contextRoot = new
	 * HttpServletRequestWrapper(request).getRealPath("/"); String fileRoot; try {
	 * // 파일이 있을때 if(multipartFile.size() > 0 &&
	 * !multipartFile.get(0).getOriginalFilename().equals("")) { for(MultipartFile
	 * file:multipartFile) { fileRoot = contextRoot + "resources/images/";
	 * System.out.println(fileRoot); String originalFileName =
	 * file.getOriginalFilename(); //오리지날 파일명 String extension =
	 * originalFileName.substring(originalFileName.lastIndexOf(".")); //파일 확장자
	 * String savedFileName = UUID.randomUUID() + extension; //저장될 파일 명 //dto image
	 * setting if (dto.getReview_regionImage1()==null)
	 * dto.setReview_regionImage1(savedFileName); else if
	 * (dto.getReview_regionImage2()==null)
	 * dto.setReview_regionImage2(savedFileName); else if
	 * (dto.getReview_regionImage3()==null)
	 * dto.setReview_regionImage3(savedFileName); else if
	 * (dto.getReview_regionImage4()==null)
	 * dto.setReview_regionImage4(savedFileName); else if
	 * (dto.getReview_regionImage5()==null)
	 * dto.setReview_regionImage5(savedFileName);
	 * //System.out.println("dto의 1번이미지 : "+dto.getReview_regionImage1()); File
	 * targetFile = new File(fileRoot + savedFileName); try { InputStream fileStream
	 * = file.getInputStream(); FileUtils.copyInputStreamToFile(fileStream,
	 * targetFile); //파일 저장
	 * 
	 * } catch (Exception e) {//파일삭제 FileUtils.deleteQuietly(targetFile);//저장된 현재 파일
	 * 삭제 e.printStackTrace(); break; } } int res =
	 * reviewMapper.insertReviewRegion(dto); strResult = "{ \"result\":\"OK\" }"; }
	 * // 파일 아무것도 첨부 안했을때 else strResult = "{ \"result\":\"OK\" }"; }catch(Exception
	 * e){ e.printStackTrace(); } return strResult; }
	 */
	
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
