package com.ezen.carCamping;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
			ccrListHtml += "<option value='"+dto.getCcr_num()+"'>"+dto.getCcr_name()+"</option>";
		}
		
		System.out.println(ccrListHtml);
		return ccrListHtml;
		
	}
	@ResponseBody
	@RequestMapping(value="field_review.review", method=RequestMethod.POST)
	public String field_reviewOk( @RequestParam(value = "review_regionImage", required = false) List<MultipartFile> multipartFile,
							HttpServletRequest req,ReviewRegionDTO dto) {
		/*
		 * System.out.println("a:"+dto.getMemberDTO().getMem_num());
		 * System.out.println("a:"+dto.getCarCampingRegionDTO().getCcr_num());
		 * System.out.println(dto.getReview_title());
		 * System.out.println(dto.getReview_regionContent());
		 * System.out.println(dto.getReview_popular());
		 * System.out.println(dto.getReview_readCount());
		 */
		String upPath = (String) req.getSession().getAttribute("upPath");
		String fileRoot;
		String strResult = "{ \"result\":\"FAIL\" }";
		System.out.println("멀티파일 사이즈"+multipartFile.size());
		
		
		//System.out.println("멀티파일 네임"+ multipartFile.get(0).getOriginalFilename());
		try {
			// 파일이 있을때 탄다.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				
				for(MultipartFile file:multipartFile) {
					fileRoot = upPath + "resources/images/";
					System.out.println(fileRoot);
					
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						if (dto.getReview_regionImage1()==null) dto.setReview_regionImage1(savedFileName);
						else if (dto.getReview_regionImage2()==null) dto.setReview_regionImage2(savedFileName);
						else if (dto.getReview_regionImage3()==null) dto.setReview_regionImage3(savedFileName);
						else if (dto.getReview_regionImage4()==null) dto.setReview_regionImage4(savedFileName);
						else if (dto.getReview_regionImage5()==null) dto.setReview_regionImage5(savedFileName);
						
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				strResult = "파일이 있을때 탄다.{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "파일 아무것도 첨부 안했을때 탄다.{ \"result\":\"OK\" }";
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println(strResult);
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
