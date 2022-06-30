package com.ezen.carCamping;


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

import com.ezen.carCamping.dto.AgencyDTO;
import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.pagination.Pagination;
import com.ezen.carCamping.service.MyPageMapper;
import com.ezen.carCamping.service.ProductMapper;
import com.ezen.carCamping.service.S3FileService;

@Controller
public class ProductController {

	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private MyPageMapper myPageMapper;
	
	@Autowired
	private S3FileService service;
	
	private static Pagination pagination = Pagination.getInstance();
	
	
	//service.upload(File file)
	// 용품메인 컨트롤러
	/**
	 * @param req
	 * @param mode
	 * @param params
	 * @return
	 */
	
	@RequestMapping(value ="/goProduct.product",method = RequestMethod.GET)
	 public String goProduct(HttpServletRequest req,
	         @RequestParam (required = false) String mode,
	         @RequestParam Map<String,String>params) {
	      List<ProductDTO> list=null;
	      String pageNum = params.get("pageNum");
	      mode=params.get("mode");
	      String search=params.get("search");
	      String searchString=params.get("searchString");

	      int pageSize= 12;
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
	     
	      int startRow = (currentpage -1) * pageSize +1;//1  
	      int endRow = startRow + pageSize - 1;//10
	      int rowCount=productMapper.listProductMainCount();
	      
	      if(mode==null||mode.equals("")) {
	         if(searchString!=null) {
	              list = productMapper.findProduct(search, searchString,startRow-1,endRow);
	              rowCount = productMapper.countProductSeacrch(search, searchString); // 검색결과 로우카운트 0627 박혜성 추가
	         }else {
	              list=productMapper.listProduct(startRow-1, endRow);
	         }
	      }else if(mode.equals("listProductNew")) {
	         if(search!=null&&searchString!=null) {
	        	if(search.equals(""))  search = "prod_name";
	            list=productMapper.listProductsearchNew(search,searchString,startRow-1,endRow);
	            rowCount = productMapper.countProductSeacrch(search, searchString); // 검색결과 로우카운트 0627 박혜성 추가
	         }else  {
	        	list=productMapper.listProductNew(startRow-1,endRow); 
	         }
	      }else if(mode.equals("listProductPop")) {
	         if(search!=null&&searchString!=null) {
	        	if(search.equals("")) search = "prod_name";
	            list=productMapper.listProductsearchPop(search, searchString,startRow-1,endRow);
	            rowCount = productMapper.countProductSeacrch(search, searchString); // 검색결과 로우카운트 0627 박혜성 추가
	         }else {
	        	 list=productMapper.listProductPop(startRow-1,endRow);
	         }
	      }else if(mode.equals("listProductPrice")){
	         if(search!=null&&searchString!=null) {
	        	if(search.equals("")) search = "prod_name";
	            list=productMapper.listProductsearchPrice(search, searchString,startRow-1,endRow);
	            rowCount = productMapper.countProductSeacrch(search, searchString);
	         }else {
	        	 list=productMapper.listProductPrice(startRow-1,endRow);
	         }
	      } 

	      if(endRow>rowCount) endRow=rowCount; 
	      int pageCount = rowCount/pageSize + (rowCount%pageSize==0 ? 0 : 1);
	      int pageBlock = 4;
	      int startPage = (currentpage - 1)/pageBlock  * pageBlock + 1;
	      int endPage = startPage + pageBlock - 1;
	      if (endPage > pageCount) endPage = pageCount;
	      
	      List<ProductDTO> popList = productMapper.popularProduct();
	      req.setAttribute("prodrank3", productMapper.popularProdRank());
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
 
	@RequestMapping("/productView.product")//이부분 수정함
    public String productView(HttpServletRequest req, @RequestParam Map<String, String> params,
          String mode, @RequestParam(required=false,defaultValue="1") int page) {
          System.out.println("모드값" + mode);
           HttpSession session = req.getSession();
           int prod_num = Integer.parseInt(params.get("prod_num"));
           session.setAttribute("prod_num", prod_num);
           ProductDTO dto = productMapper.getProduct(prod_num);
           req.setAttribute("getProduct", dto);
          List<ReviewProductDTO> list = null;
          String search = params.get("search");
          String searchString = params.get("searchString");
          if (searchString == null||searchString.equals("")) {
             list = productMapper.listProdReview(prod_num);
          }else {
             list = productMapper.findReview(prod_num,search, searchString);
             session.setAttribute("prodsearch", search);
             session.setAttribute("prodsearchString", searchString);
          }
          System.out.println("1 search searchString : " +search+ searchString);
          List<AgencyDTO> Alist = productMapper.getAgency();
          req.setAttribute("countReviewProd", productMapper.countReviewProd(prod_num));
          req.setAttribute("getAgency", Alist);
          req.setAttribute("getProduct", productMapper.getProduct(prod_num));
          req.setAttribute("pageCount", pagination.pageCount(list));
          req.setAttribute("listBoard", pagination.getPagePost(page,list));

       return "product/productView";
    }
 
 @RequestMapping("/productViewOrder.product")//이 부분 추가
     public String productView2(HttpServletRequest req,String mode,@RequestParam(required=false,defaultValue="1") int page
           , @RequestParam Map<String,String> params) {
    
    //String search =params.get("search");
     //String searchString =params.get("searchString");
     HttpSession session = req.getSession();
     String search = (String) session.getAttribute("search");
     String searchString = (String) session.getAttribute("searchString");
     int prod_num = (int)session.getAttribute("prod_num");
        List<ReviewProductDTO> list = null;
        System.out.println("모드값" + mode);
        if(mode.equals("listReviewNew")) {
           if(search!=null&&searchString!=null) {
              list = productMapper.listReviewsearchSysdate(search, searchString, prod_num);
           }else if(search==null||searchString==null||search.equals("")||searchString.equals("")) {
        	   list = productMapper.R_orderBysysdate(prod_num);
           }
        }else if(mode.equals("listReviewPop")) {
           if(search!=null&&searchString!=null) {
              list = productMapper.listReviewsearchScore(search, searchString, prod_num);
           }else if(search==null&&searchString==null||search.equals("")&&searchString.equals("")) {
        	   list = productMapper.R_orderByScore(prod_num);
           }
        }else if(mode.equals("listReviewLike")) {
        	 if(search!=null&&searchString!=null) {
                 list = productMapper.listReviewsearchLike(search, searchString, prod_num);
              }else if(search==null&&searchString==null||search.equals("")&&searchString.equals("")) {
        		 list = productMapper.R_orderByLike(prod_num); 
        	 }
        		
          
        }
       
        req.setAttribute("pageCount", pagination.pageCount(list));
          req.setAttribute("listBoard", pagination.getPagePost(page,list));
        return "product/productView";
 }
	
 @RequestMapping("/productReviewView.product")
 public String myPageWriteReviewProductView(HttpServletRequest req, HttpServletResponse rep, @RequestParam int rp_num) {
		ReviewProductDTO pdto = myPageMapper.getReviewProduct(rp_num);
		req.setAttribute("getReviewProduct", pdto);
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("mbdto");
		int mem_num = (int)session.getAttribute("mem_num");
		if (mem_num > 0) {
			session.setAttribute("mem_num", mdto.getMem_num());
			session.setAttribute("mem_id", mdto.getMem_id());
		} else if (mem_num <= 0) {
			req.setAttribute("msg", "로그인을 하시여 리뷰를 볼 수 있습니다 !\n로그인창으로 이동합니다.");
			req.setAttribute("url", "login.login");
			return "message";
		}
	      
	      Cookie[] cookies = req.getCookies();
	      Cookie viewCookie = null;//鍮꾧탳荑좏궎
	      
	      // 荑좏궎媛   엳 쓣 寃쎌슦 
	      if (cookies != null && cookies.length > 0) { 
	      for (int i = 0; i < cookies.length; i++) {
	      if (cookies[i].getName().equals("cookie"+rp_num)) viewCookie = cookies[i];
	      // Cookie 쓽 name 씠 cookie(revie_num)    씪移섑븯 뒗 荑좏궎瑜  viewCookie 뿉  꽔 뼱以  
	      }
	      }
	      
	      if (pdto != null) {
	      // 留뚯씪 viewCookie媛  null 씪 寃쎌슦  荑좏궎瑜   깮 꽦 빐 꽌 議고쉶 닔 利앷  濡쒖쭅 쓣 泥섎━ 븿.-> 뾾 쑝硫  !泥섏쓬  뱾 뼱媛꾧쾬 씠誘 濡 !
	      if (viewCookie == null) {    
	      // 荑좏궎  깮 꽦( 씠由 , 媛 )
	      Cookie newCookie = new Cookie("cookie"+rp_num, "|" + rp_num + "|");     
	      // 荑좏궎 異붽 
	      rep.addCookie(newCookie);
	      // 荑좏궎瑜  異붽   떆 궎怨  議고쉶 닔 利앷  떆 궡
	      int result = productMapper.addProductReviewReadCount(rp_num);
	      pdto.setRp_readCount(pdto.getRp_readCount()+1);
	      if(result>0) {
	      System.out.println("議고쉶 닔 利앷 ");
	      }else {
	      System.out.println("議고쉶 닔 利앷   뿉 윭");
	      }
	      }//view 荑좏궎 뿉 媛믪씠  엳 쑝硫   씠誘   뱾 뼱媛  由щ럭  씠誘 濡  議고쉶 닔 利앷  븯吏  븡 쓬
	      
	      }else { //dto媛  null 씠硫   뿉 윭 럹 씠吏 濡   씠 룞
	      return "/region/RegionErrorPage";
	      }
	      
	      //  빐 떦 由щ럭 뿉  엳 뒗  씠誘몄  留뚰겮留   뒳 씪 씠 뱶  깮 꽦 븯湲   쐞 븿
	      Class<? extends ReviewProductDTO> cls = pdto.getClass();
	      List<String> rp_images = new java.util.ArrayList<>();
	      for(int i=1;i<=5;i++) {
	      String imageVar = "rp_image"+i;
	      try {
	      java.lang.reflect.Field f = cls.getDeclaredField(imageVar);
	      f.setAccessible(true);
	      String imageSrc = (String)f.get(pdto);
	      System.out.println(imageSrc);
	      if(imageSrc!=null) {
	      rp_images.add(imageSrc);
	      }
	      }catch (Exception e) {
	      e.printStackTrace();
	      }
	      }
	      
	      //id媛믪쓣 媛  졇   濡쒓렇  궡 뿭 泥댄겕  썑 踰꾪듉 쓽  깋源붿쓣 寃곗젙 
	      //HttpSession session = req.getSession();
	      String id = (String) req.getSession().getAttribute("mem_id");
	      if (id==null || id.equals("")) req.setAttribute("check", 0);
	      else{
	      int check = productMapper.checkProductReviewLikeLog(id, rp_num);
	      System.out.println("check = "+ check);
	      req.setAttribute("check", check);
	      }
	      
	      //req.setAttribute("selectedReview", pdto);
	      req.setAttribute("rp_imageList", rp_images); // 빐 떦 由щ럭 쓽  씠誘몄   씠由꾩쓣    옣
	      return "myPage/myPageWriteReviewProductView";
	   }

	   // 용품 리뷰상세보기 컨트롤러
	   /*@RequestMapping("/productReviewView.product")
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
	   } */
	   @RequestMapping(value="updateProductReviewLike.product",method=RequestMethod.POST)
	   @ResponseBody
	   public String updateProductReviewLike(HttpServletRequest req,@RequestParam String mem_id,@RequestParam int rp_num) {
	      
	      HttpSession session = req.getSession();
	        MemberDTO mdto = (MemberDTO) session.getAttribute("mbdto");
	        if(mdto!=null) {
	           session.setAttribute("mem_num", mdto.getMem_num());
	           session.setAttribute("mem_id", mdto.getMem_id());
	        }else if(mdto == null){
	           req.setAttribute("msg", "로그인을 하셔야 좋아요를 누를수 있습니다 !\n로그인창으로 이동합니다.");
	           req.setAttribute("url","login.login");
	           return "message";
	        }
	        
	        
	      int check = productMapper.checkProductReviewLikeLog(mem_id, rp_num);
	      int count = 0;
	      if(check==0) { //醫뗭븘 슂  궡 뿭 뿉 議댁옱 븯吏   븡 쑝硫 
	         count = productMapper.insertProductReviewLikeLog(mem_id, rp_num); // 醫뗭븘 슂  궡 뿭 뿉 異 
	         System.out.println("insert 썑 異붿쿇   "+count);
	      }else {//  겢由  뻽 쓣  븣 醫뗭븘 슂  궡 뿭 뿉  씠誘  議댁옱 븯硫  醫뗭븘 슂  궡 뿭 뿉 꽌  궘 젣 븯怨  醫뗭븘 슂 닔瑜   븯 굹  궡由 
	         count = productMapper.deleteProductReviewLikeLog(mem_id, rp_num);
	         System.out.println("delete 썑 異붿쿇   "+count);
	      }
	      return String.valueOf(count);
	   }
	}
	   
	   /*@RequestMapping("likeButton.product")
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
	   } */

