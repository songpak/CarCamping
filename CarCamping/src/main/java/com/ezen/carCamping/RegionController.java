package com.ezen.carCamping;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Comparator;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
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
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
import com.ezen.carCamping.service.RegionMapper;


@Controller
public class RegionController {
	@Autowired

	private RegionMapper RegionMapper;

	private Hashtable<String, Object> ht = RegionMapper.getInstance();


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
//		임시로그인
		HttpSession test_session = req.getSession();
		test_session.setAttribute("id", "qqq");
		test_session.setAttribute("mem_num",3);
	
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

	@SuppressWarnings("unchecked")
	@RequestMapping("/regionView.region")
	public String regionView(HttpServletRequest req,@RequestParam Map<String,String> params) {
		
		int ccr_num = Integer.parseInt(params.get("ccr_num"));
		CarCampingRegionDTO dto = RegionMapper.selectRegionByCcrnum(ccr_num);
		req.setAttribute("regionSelected", dto);
		req.setAttribute("reviewCount", RegionMapper.countReviewCcr(ccr_num));
		String mode = req.getParameter("mode");
		if(mode==null) mode="none";
		
		//id값을 가져와 로그 내역 체크 후 버튼의 색깔을 결정 
		HttpSession test_session = req.getSession();
		String id = (String) test_session.getAttribute("id");
		if (id==null || id.equals("")) req.setAttribute("check", 0);
		else{
			int check = RegionMapper.checkRegionLikeLog(id, ccr_num);
			System.out.println("check = "+ check);
			req.setAttribute("check", check);
		}
		
		List<ReviewRegionDTO> list = null;
		int pageSize = 3;
		String pageNum = params.get("pageNum");
		int currentPage;
		if (pageNum == null) {
			pageNum = "1";
			currentPage = Integer.parseInt(pageNum);
		}
		else {
			double pageNum_db = Double.parseDouble(pageNum);
			if(pageNum_db<=0) pageNum_db = 0;
			currentPage = (int) (pageNum_db);
			
		}
		int startRow = (currentPage - 1) * pageSize + 1;//3-1 4 8
		int endRow = startRow + pageSize - 1;
		int rowCount = RegionMapper.countReviewCcrnum(ccr_num);
		System.out.println(rowCount);
		if (endRow > rowCount)
			endRow = rowCount;
		String orderBy =  params.get("orderBy");
		if(orderBy==null||orderBy.equals("newly")) orderBy = "review_num";
		
		if (rowCount > 0) {
			if(mode.equals("none")) {
			list = RegionMapper.listCcrReview(ccr_num,startRow-1,3,orderBy);
			System.out.println(list.size());
			}
			else if(mode.equals("searchReview")) {
				String search  = params.get("search");
				System.out.println(search);
				String searchString = params.get("searchString");
				System.out.println(searchString);
				if(search.equals("mem_nickName")) {
				rowCount = RegionMapper.countRevieWrietrSearch(ccr_num, search, searchString);
				list = RegionMapper.listCcrReviewWriterSearch(ccr_num, startRow-1, 3, orderBy, search, searchString);	
				}else {
				rowCount = RegionMapper.countReviewSearch(ccr_num, search, searchString);
				list = RegionMapper.listCcrReviewSearch(ccr_num, startRow-1, 3, orderBy, search, searchString);
				}
				req.setAttribute("search", search);
				req.setAttribute("searchString", searchString);
			}
			
			if(orderBy.equals("review_likeCount")) {
				//Collections.sort(list, new LikeCountComparator().reversed());
				orderBy="review_likeCount";
			}else if(orderBy.equals("review_regionScore")) {
				//Collections.sort(list,new RegionScoreComparator().reversed());
				orderBy="review_regionScore";
			}
			
			int pageCount = rowCount/pageSize + (rowCount%pageSize==0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage - 1)/pageBlock  * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) endPage = pageCount;
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("orderBy", orderBy);
			
		}
		
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("rowCount", rowCount);
		req.setAttribute("reviewList", list);
		req.setAttribute("mode", mode);
		
		return "/region/regionView";
	}
	
	@RequestMapping("/regionReviewView.region")
	public String regionReviewView(HttpServletRequest req,HttpServletResponse rep, @RequestParam int review_num) {
		System.out.println(review_num);
		ReviewRegionDTO dto = RegionMapper.selectReviewDetail(review_num);
		
		//새로고침 조회수 막기
		Cookie[] cookies = req.getCookies();
		Cookie viewCookie = null;//비교쿠키
		
		// 쿠키가 있을 경우 
        if (cookies != null && cookies.length > 0) { 
        	for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("cookie"+review_num)) viewCookie = cookies[i];
                // Cookie의 name이 cookie(revie_num) 와일치하는 쿠키를 viewCookie에 넣어줌 
            }
        }
        
        if (dto != null) {
            // 만일 viewCookie가 null일 경우  쿠키를 생성해서 조회수 증가 로직을 처리함.->없으면 !처음 들어간것이므로!
            if (viewCookie == null) {    
                // 쿠키 생성(이름, 값)
                Cookie newCookie = new Cookie("cookie"+review_num, "|" + review_num + "|");     
                // 쿠키 추가
                rep.addCookie(newCookie);
                // 쿠키를 추가 시키고 조회수 증가시킴
                int result = RegionMapper.addReviewReadCount(review_num);
                dto.setReview_readCount(dto.getReview_readCount()+1);
                if(result>0) {
                    System.out.println("조회수 증가");
                }else {
                    System.out.println("조회수 증가 에러");
                }
            }//view 쿠키에 값이 있으면 이미 들어간 리뷰 이므로 조회수 증가하지않음
            	
        }else { //dto가 null이면 에러페이지로 이동
        	return "/region/RegionErrorPage";
        }
        
		// 해당 리뷰에 있는 이미지 만큼만 슬라이드 생성하기 위함
		Class<? extends ReviewRegionDTO> cls = dto.getClass();
		List<String> reviewImages = new java.util.ArrayList<>();
		for(int i=1;i<=5;i++) {
			String imageVar = "review_regionImage"+i;
			try {
				java.lang.reflect.Field f = cls.getDeclaredField(imageVar);
				f.setAccessible(true);
				String imageSrc = (String)f.get(dto);
				System.out.println(imageSrc);
				if(imageSrc!=null) {
					reviewImages.add(imageSrc);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//id값을 가져와 로그 내역 체크 후 버튼의 색깔을 결정 
		HttpSession test_session = req.getSession();
		String id = (String) test_session.getAttribute("id");
		if (id==null || id.equals("")) req.setAttribute("check", 0);
		else{
			int check = RegionMapper.checkReviewLikeLog(id, review_num);
			System.out.println("check = "+ check);
			req.setAttribute("check", check);
		}
					
		req.setAttribute("selectedReview", dto);
		req.setAttribute("reviewImageList", reviewImages); //해당 리뷰의 이미지 이름을 저장
		return "/region/regionReviewView";
	}
	

	//지역 좋아요 수를 증가하고 좋아요 내역에 인서트
	@RequestMapping(value="updateRegionLike.region",method=RequestMethod.POST)
	@ResponseBody
	public String updateRegionLike(HttpServletRequest req,@RequestParam String mem_id,@RequestParam int ccr_num) {
		int check = RegionMapper.checkRegionLikeLog(mem_id, ccr_num);
		int count = 0;
		if(check==0) { //좋아요 내역에 존재하지 않으면
			count = RegionMapper.insertRegionLikeLog(mem_id, ccr_num); // 좋아요 내역에 추가
			System.out.println("insert후 추천은 "+count);
			//if(updRes>0) {
			//	RegionMapper.addLikeCountRegion(ccr_num);//지역 좋아요 수를 증가하고 결과값을
			//}
		}else {// 클릭했을 때 좋아요 내역에 이미 존재하면 좋아요 내역에서 삭제하고 좋아요수를 하나 내림
			count = RegionMapper.deleteRegionLikeLog(mem_id, ccr_num);
			System.out.println("delete후 추천은 "+count);
			//if(updRes>0) {
			//	RegionMapper.subLikeCountRegion(ccr_num);
			//}
		}
		//int count = RegionMapper.recountRegionLike(ccr_num);
		//String returnString = String.valueOf(RegionMapper.recountRegionLike(ccr_num));
		return String.valueOf(count);
	}
	
	//리뷰 좋아요 수를 증가하고 좋아요 내역에 인서트
	@RequestMapping(value="updateReviewLike.region",method=RequestMethod.POST)
	@ResponseBody
	public String updateReviewLike(HttpServletRequest req,@RequestParam String mem_id,@RequestParam int review_num) {
		int check = RegionMapper.checkReviewLikeLog(mem_id, review_num);
		int count = 0;
		if(check==0) { //좋아요 내역에 존재하지 않으면
			count = RegionMapper.insertReviewLikeLog(mem_id, review_num); // 좋아요 내역에 추
			System.out.println("insert후 추천은 "+count);
		}else {// 클릭했을 때 좋아요 내역에 이미 존재하면 좋아요 내역에서 삭제하고 좋아요수를 하나 내림
			count = RegionMapper.deleteReviewLikeLog(mem_id, review_num);
			System.out.println("delete후 추천은 "+count);
		}
		return String.valueOf(count);
	}
	
	
	@RequestMapping("/test.region")
	public String test(HttpServletRequest req,HttpServletResponse rep) {
		List<Map<String,Object>> list = RegionMapper.test();
		req.setAttribute("list", list);
		return "/region/test";
	}
	
	/*
	 * class LikeCountComparator implements Comparator<ReviewRegionDTO>{ //오름차순
	 * 
	 * @Override public int compare(ReviewRegionDTO o1, ReviewRegionDTO o2) {
	 * if(o1.getReview_likeCount()>o2.getReview_likeCount()) return 1; else
	 * if(o1.getReview_likeCount()<o2.getReview_likeCount()) return -1; else return
	 * 0; } } class RegionScoreComparator implements Comparator<ReviewRegionDTO>{
	 * 
	 * @Override public int compare(ReviewRegionDTO o1, ReviewRegionDTO o2) {
	 * if(o1.getReview_regionScore()>o2.getReview_regionScore()) return 1; else
	 * if(o1.getReview_regionScore()<o2.getReview_regionScore()) return -1; else
	 * return 0; } }
	 */
	//테스트 - 삭제 해도됨
	/*
	 * @RequestMapping("/test.region")
	 * 
	 * @ResponseBody public String testRegion(HttpServletRequest req,@RequestParam
	 * int ccr_num,@RequestParam String id) { System.out.println(ccr_num+" + "+ id);
	 * req.setAttribute("ccr_num", ccr_num); req.setAttribute("id", id); String test
	 * = String.valueOf(ccr_num)+id; return test; }
	 */

}
