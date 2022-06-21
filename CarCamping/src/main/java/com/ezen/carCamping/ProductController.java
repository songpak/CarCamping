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
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.service.ProductMapper;

@Controller
public class ProductController {

	@Autowired
	private ProductMapper productMapper;

	// 용품메인 컨트롤러
	@RequestMapping("/goProduct.product")
	public String goProduct(HttpServletRequest req,
			@RequestParam (required = false) String mode,
			@RequestParam Map<String,String>params) {
	
	
		List<ProductDTO> list=null;
		mode=params.get("mode");
		String search=params.get("search");
		String searchString=params.get("searchString");
		System.out.println("search : "+search);
		System.out.println("searchString : "+searchString);
		
		if(mode==null||mode.equals("")) {
			if(searchString!=null) {
				  list = productMapper.findProduct(search, searchString);
				  System.out.println("mode : "+ mode);
			}else { 
				list=productMapper.listProduct();
				 System.out.println(mode);
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
			List<ReviewProductDTO> list = productMapper.getReviewView(rp_num);
			req.setAttribute("getRv", list);
		}
		return "product/productReviewView";
	}
}
