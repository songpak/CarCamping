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
//		�엫�떆濡쒓렇�씤
//		HttpSession test_session = req.getSession();
//		test_session.setAttribute("id", "qqq");
//		test_session.setAttribute("mem_num",3);
	
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
		
		//id媛믪쓣 媛��졇�� 濡쒓렇 �궡�뿭 泥댄겕 �썑 踰꾪듉�쓽 �깋源붿쓣 寃곗젙 
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
		
		//�깉濡쒓퀬移� 議고쉶�닔 留됯린
		Cookie[] cookies = req.getCookies();
		Cookie viewCookie = null;//鍮꾧탳荑좏궎
		
		// 荑좏궎媛� �엳�쓣 寃쎌슦 
        if (cookies != null && cookies.length > 0) { 
        	for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("cookie"+review_num)) viewCookie = cookies[i];
                // Cookie�쓽 name�씠 cookie(revie_num) ���씪移섑븯�뒗 荑좏궎瑜� viewCookie�뿉 �꽔�뼱以� 
            }
        }
        
        if (dto != null) {
            // 留뚯씪 viewCookie媛� null�씪 寃쎌슦  荑좏궎瑜� �깮�꽦�빐�꽌 議고쉶�닔 利앷� 濡쒖쭅�쓣 泥섎━�븿.->�뾾�쑝硫� !泥섏쓬 �뱾�뼱媛꾧쾬�씠誘�濡�!
            if (viewCookie == null) {    
                // 荑좏궎 �깮�꽦(�씠由�, 媛�)
                Cookie newCookie = new Cookie("cookie"+review_num, "|" + review_num + "|");     
                // 荑좏궎 異붽�
                rep.addCookie(newCookie);
                // 荑좏궎瑜� 異붽� �떆�궎怨� 議고쉶�닔 利앷��떆�궡
                int result = RegionMapper.addReviewReadCount(review_num);
                dto.setReview_readCount(dto.getReview_readCount()+1);
                if(result>0) {
                    System.out.println("議고쉶�닔 利앷�");
                }else {
                    System.out.println("議고쉶�닔 利앷� �뿉�윭");
                }
            }//view 荑좏궎�뿉 媛믪씠 �엳�쑝硫� �씠誘� �뱾�뼱媛� 由щ럭 �씠誘�濡� 議고쉶�닔 利앷��븯吏��븡�쓬
            	
        }else { //dto媛� null�씠硫� �뿉�윭�럹�씠吏�濡� �씠�룞
        	return "/region/RegionErrorPage";
        }
        
		// �빐�떦 由щ럭�뿉 �엳�뒗 �씠誘몄� 留뚰겮留� �뒳�씪�씠�뱶 �깮�꽦�븯湲� �쐞�븿
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
		
		//id媛믪쓣 媛��졇�� 濡쒓렇 �궡�뿭 泥댄겕 �썑 踰꾪듉�쓽 �깋源붿쓣 寃곗젙 
		HttpSession test_session = req.getSession();
		String id = (String) test_session.getAttribute("id");
		if (id==null || id.equals("")) req.setAttribute("check", 0);
		else{
			int check = RegionMapper.checkReviewLikeLog(id, review_num);
			System.out.println("check = "+ check);
			req.setAttribute("check", check);
		}
					
		req.setAttribute("selectedReview", dto);
		req.setAttribute("reviewImageList", reviewImages); //�빐�떦 由щ럭�쓽 �씠誘몄� �씠由꾩쓣 ���옣
		return "/region/regionReviewView";
	}
	

	//吏��뿭 醫뗭븘�슂 �닔瑜� 利앷��븯怨� 醫뗭븘�슂 �궡�뿭�뿉 �씤�꽌�듃
	@RequestMapping(value="updateRegionLike.region",method=RequestMethod.POST)
	@ResponseBody
	public String updateRegionLike(HttpServletRequest req,@RequestParam String mem_id,@RequestParam int ccr_num) {
		int check = RegionMapper.checkRegionLikeLog(mem_id, ccr_num);
		int count = 0;
		if(check==0) { //醫뗭븘�슂 �궡�뿭�뿉 議댁옱�븯吏� �븡�쑝硫�
			count = RegionMapper.insertRegionLikeLog(mem_id, ccr_num); // 醫뗭븘�슂 �궡�뿭�뿉 異붽�
			System.out.println("insert�썑 異붿쿇�� "+count);
			//if(updRes>0) {
			//	RegionMapper.addLikeCountRegion(ccr_num);//吏��뿭 醫뗭븘�슂 �닔瑜� 利앷��븯怨� 寃곌낵媛믪쓣
			//}
		}else {// �겢由��뻽�쓣 �븣 醫뗭븘�슂 �궡�뿭�뿉 �씠誘� 議댁옱�븯硫� 醫뗭븘�슂 �궡�뿭�뿉�꽌 �궘�젣�븯怨� 醫뗭븘�슂�닔瑜� �븯�굹 �궡由�
			count = RegionMapper.deleteRegionLikeLog(mem_id, ccr_num);
			System.out.println("delete�썑 異붿쿇�� "+count);
			//if(updRes>0) {
			//	RegionMapper.subLikeCountRegion(ccr_num);
			//}
		}
		//int count = RegionMapper.recountRegionLike(ccr_num);
		//String returnString = String.valueOf(RegionMapper.recountRegionLike(ccr_num));
		return String.valueOf(count);
	}
	
	//由щ럭 醫뗭븘�슂 �닔瑜� 利앷��븯怨� 醫뗭븘�슂 �궡�뿭�뿉 �씤�꽌�듃
	@RequestMapping(value="updateReviewLike.region",method=RequestMethod.POST)
	@ResponseBody
	public String updateReviewLike(HttpServletRequest req,@RequestParam String mem_id,@RequestParam int review_num) {
		int check = RegionMapper.checkReviewLikeLog(mem_id, review_num);
		int count = 0;
		if(check==0) { //醫뗭븘�슂 �궡�뿭�뿉 議댁옱�븯吏� �븡�쑝硫�
			count = RegionMapper.insertReviewLikeLog(mem_id, review_num); // 醫뗭븘�슂 �궡�뿭�뿉 異�
			System.out.println("insert�썑 異붿쿇�� "+count);
		}else {// �겢由��뻽�쓣 �븣 醫뗭븘�슂 �궡�뿭�뿉 �씠誘� 議댁옱�븯硫� 醫뗭븘�슂 �궡�뿭�뿉�꽌 �궘�젣�븯怨� 醫뗭븘�슂�닔瑜� �븯�굹 �궡由�
			count = RegionMapper.deleteReviewLikeLog(mem_id, review_num);
			System.out.println("delete�썑 異붿쿇�� "+count);
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
	 * class LikeCountComparator implements Comparator<ReviewRegionDTO>{ //�삤由꾩감�닚
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
	//�뀒�뒪�듃 - �궘�젣 �빐�룄�맖
	/*
	 * @RequestMapping("/test.region")
	 * 
	 * @ResponseBody public String testRegion(HttpServletRequest req,@RequestParam
	 * int ccr_num,@RequestParam String id) { System.out.println(ccr_num+" + "+ id);
	 * req.setAttribute("ccr_num", ccr_num); req.setAttribute("id", id); String test
	 * = String.valueOf(ccr_num)+id; return test; }
	 */

	@RequestMapping(value="/board.region", method=RequestMethod.GET)
	public String Board(HttpServletRequest req,HttpServletResponse rep,@RequestParam Map<String,String> params) {
	String region_num = params.get("region_num"); 
	
	System.out.println("리즌넘:"+region_num);
	List<CarCampingRegionDTO>list =null;
	int pageSize= 3;
	System.out.println("페이지 사이즈:"+pageSize);
	String pageNum = params.get("pageNum");
	int currentpage;
	
	if(pageNum==null) {
		pageNum="1";
		currentpage=Integer.parseInt(pageNum);
		System.out.println("커렌트페이지:"+currentpage);
	}else {
		double pageNum_db =Double.parseDouble(pageNum);
		if(pageNum_db<=0)pageNum_db = 0 ;
		currentpage = (int)(pageNum_db);
	}
	int startRow = (currentpage -1) * pageSize +1;
	System.out.println("스타트로우:"+startRow);
	int endRow = startRow + pageSize - 1;
	System.out.println("앤드로우:"+endRow);
	int rowCount=RegionMapper.listRegionCount(region_num);
	System.out.println("로우카운:"+rowCount);
	if(endRow>rowCount)
		endRow=rowCount;
	if(rowCount>0) {
		list=RegionMapper.listPopRegion(Integer.parseInt(region_num)); 
	}
	int pageCount = rowCount/pageSize + (rowCount%pageSize==0 ? 0 : 1);
	int pageBlock = 3;
	int startPage = (currentpage - 1)/pageBlock  * pageBlock + 1;
	int endPage = startPage + pageBlock - 1;
	if (endPage > pageCount) endPage = pageCount;
	req.setAttribute("region_num", region_num);
	req.setAttribute("rowCount",rowCount);
	req.setAttribute("list", list);
	req.setAttribute("pageCount", pageCount);
	req.setAttribute("startPage", startPage);
	req.setAttribute("endPage", endPage);

	return "/region/regionBoard";
	  
	}
}
