	package com.ezen.carCamping;

import java.util.Collections;
import java.util.Comparator;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String mode = req.getParameter("mode");
		if(mode==null) mode="none";
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
		if (endRow > rowCount)
			endRow = rowCount;
		String orderBy =  params.get("orderBy");
		if(orderBy==null||orderBy.equals("newly")) orderBy = "review_num";
		
		if (rowCount > 0) {
			if(mode.equals("none")) list = RegionMapper.listCcrReview(ccr_num,startRow-1,3,orderBy);
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
		System.out.println(list.size());
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
		
		//���ΰ�ħ ��ȸ�� ����
		Cookie[] cookies = req.getCookies();
		Cookie viewCookie = null;//����Ű
		
		// ��Ű�� ���� ��� 
        if (cookies != null && cookies.length > 0) { 
        	for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("cookie"+review_num)) viewCookie = cookies[i];
                // Cookie�� name�� cookie(revie_num) ����ġ�ϴ� ��Ű�� viewCookie�� �־��� 
            }
        }
        
        if (dto != null) {
            // ���� viewCookie�� null�� ���  ��Ű�� �����ؼ� ��ȸ�� ���� ������ ó����.->������ !ó�� �����̹Ƿ�!
            if (viewCookie == null) {    
                // ��Ű ����(�̸�, ��)
                Cookie newCookie = new Cookie("cookie"+review_num, "|" + review_num + "|");     
                // ��Ű �߰�
                rep.addCookie(newCookie);
                // ��Ű�� �߰� ��Ű�� ��ȸ�� ������Ŵ
                int result = RegionMapper.addReviewReadCount(review_num);
                dto.setReview_readCount(dto.getReview_readCount()+1);
                if(result>0) {
                    System.out.println("��ȸ�� ����");
                }else {
                    System.out.println("��ȸ�� ���� ����");
                }
            }//view ��Ű�� ���� ������ �̹� �� ���� �̹Ƿ� ��ȸ�� ������������
            	
        }else { //dto�� null�̸� ������������ �̵�
        	return "/region/RegionErrorPage";
        }
        
		// �ش� ���信 �ִ� �̹��� ��ŭ�� �����̵� �����ϱ� ����
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
		req.setAttribute("selectedReview", dto);
		req.setAttribute("reviewImageList", reviewImages); //�ش� ������ �̹��� �̸��� ����
		return "/region/regionReviewView";
	}
	
	@RequestMapping("/regionLike.region")
	public String regionLike(HttpServletRequest req,@RequestParam Map<String,String> params) {
		int ccr_num = Integer.parseInt(params.get("ccr_num"));
		int res = RegionMapper.addLikeCountRegion(ccr_num);
		String msg,url="regionView.region?ccr_num="+ccr_num;
		if(res<0) {
			 msg ="������ ���ƿ� ��Ͽ� �߰����� ���߽��ϴ� !";
		}else {
			msg="���� ���ƿ��� ������ ��Ͽ� �߰��˴ϴ� !";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	/*
	 * class LikeCountComparator implements Comparator<ReviewRegionDTO>{ //��������
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

}
