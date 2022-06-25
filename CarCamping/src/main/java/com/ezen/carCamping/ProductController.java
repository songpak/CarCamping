package com.ezen.carCamping;


import java.io.File; 


import java.io.IOException;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.carCamping.dto.AgencyDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.service.ProductMapper;

@Controller
public class ProductController {

	@Autowired
	private ProductMapper productMapper;

	// 용품메인 컨트롤러
	@RequestMapping(value ="/goProduct.product",method = RequestMethod.GET)
	 public String goProduct(HttpServletRequest req,
	         @RequestParam (required = false) String mode,
	         @RequestParam Map<String,String>params) {
	   
	      List<ProductDTO> list=null;
	      //int prod_num = Integer.parseInt(params.get("prod_num"));
	      System.out.println("맵받기:"+params);
	      String pageNum = params.get("pageNum");
	      mode=params.get("mode");
	      System.out.println("컨트롤러의 모드:"+mode);
	      String search=params.get("search");
	      String searchString=params.get("searchString");
	      System.out.println("칸트롤러의 서치 : "+search);
	      System.out.println("칸트롤러의 서치스트링 : "+searchString);
	      int pageSize= 2;
	      System.out.println("페이지 사이즈:"+pageSize);
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
	      int rowCount=productMapper.listProductMainCount();
	      System.out.println("로우카운:"+rowCount);
	      if(endRow>rowCount)   
	         endRow=rowCount; 
	      int pageCount = rowCount/pageSize + (rowCount%pageSize==0 ? 0 : 1);
	      int pageBlock = 2;
	      int startPage = (currentpage - 1)/pageBlock  * pageBlock + 1;
	      int endPage = startPage + pageBlock - 1;
	      if (endPage > pageCount) endPage = pageCount;
	      
	      
	      if(mode==null||mode.equals("")) {
	         if(searchString!=null) {
	              list = productMapper.findProduct(search, searchString,startRow,endRow);
	              System.out.println("위에 서치 스트링값은 : "+ searchString);
	         }else {
	              list=productMapper.listProduct(startRow, endRow);
	              System.out.println("밑에서치스트링값은 : "+ searchString);
	         }
	      }else if(mode.equals("listProductNew")) {
	         if(search!=null&&searchString!=null) {
	            list=productMapper.listProductsearchNew(search,searchString);
	         }else {
	            list=productMapper.listProductNew(); 
	         }
	      }else if(mode.equals("listProductPop")) {
	         if(search!=null&&searchString!=null) {
	            list=productMapper.listProductsearchPop(search, searchString);
	         }else {
	            list=productMapper.listProductPop();
	         }
	      }else if(mode.equals("listProductPrice")){
	         if(search!=null&&searchString!=null) {
	            list=productMapper.listProductsearchPrice(search, searchString);
	         }else {
	            list=productMapper.listProductPrice();
	         }
	      } 

	      System.out.println("list : "+list);
	      List<ProductDTO> popList = productMapper.popularProduct();
	      req.setAttribute("mode", mode);
	      req.setAttribute("rowCount",rowCount);
	      req.setAttribute("pageCount", pageCount);
	      req.setAttribute("startPage", startPage);
	      req.setAttribute("endPage", endPage);
	      req.setAttribute("search", search);
	      req.setAttribute("searchString", searchString);
	      req.setAttribute("popList", popList); 
	      req.setAttribute("listProduct", list);
	      
	      return "product/productMain";
	   }

	// 리뷰목록 컨트롤러
	@RequestMapping("/productView.product")
	public String productView(HttpServletRequest req, @RequestParam Map<String, String> params, int prod_num) {
			List<ReviewProductDTO> list = null;
			String search = params.get("search");
			String searchString = params.get("searchString");
			if (searchString == null) {
				list = productMapper.listProdReview(prod_num);
			} else {
				list = productMapper.findReview(search, searchString);
			}
			List<AgencyDTO> Alist = productMapper.getAgency();
			req.setAttribute("getAgency", Alist);
			req.setAttribute("getProduct", productMapper.getProduct(prod_num));
			req.setAttribute("ReList", list);

		return "product/productView";
	}

	// 용품 리뷰상세보기 컨트롤러
	@RequestMapping("/productReviewView.product")
	public String productReviewView(HttpServletRequest req, int rp_num) {
		HttpSession session = req.getSession();
		if (session.getAttribute("mem_num") == null) {
			String msg = "로그인 하셔야 볼 수 있습니다!";
			String url = "login.login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}else {
			int res = productMapper.plusReviewReadCount(rp_num);
			if (res > 0) {
				System.out.println("조회수상승성공");
			} else {
				System.err.println("조회수상승실패");
			}
			List<ReviewProductDTO> list = productMapper.getReviewView(rp_num);
			req.setAttribute("getRv", list);
		}
		return "product/productReviewView";
	}
	
	@RequestMapping("likeButton.product")
	public String likeButton(HttpServletRequest req, int rp_num) {
		int res = productMapper.plusLikeCount(rp_num);
		String url =null; String msg = null;
		if (res > 0) {
			int res2 =productMapper.minReviewReadCount(rp_num);
			if (res2 > 0) {
				System.out.println("조회수바로잡기성공");
			} else {
				System.err.println("조회수바로잡기실패");
			}
			msg = "좋아요가 추가되었습니다!";
			url="productReviewView.product?rp_num="+rp_num;
			System.out.println("좋아요상승성공");
		} else {
			msg = "관리자에게 문의하세요!";
			url= "goProduct.product";
			System.err.println("좋아요상승실패");
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
}










