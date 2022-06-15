package com.ezen.carCamping;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	  
	@RequestMapping("/goProduct.product")
	public String goProduct(HttpServletRequest req,
			@RequestParam Map<String,String>params) {
		List<ProductDTO> list=null;
		String search=params.get("search");
		String searchString=params.get("searchString");
		if(searchString == null) {
			list=productMapper.listProduct();
		}else {
			list = productMapper.findProduct(search, searchString);
		}
		
		List<ProductDTO> popList = productMapper.popularProduct();
		
		req.setAttribute("popList", popList); // 인기용품 리스트 저장시킨겁니다
		req.setAttribute("listProduct", list);
		return "product/productMain";
		
	}
	
	@RequestMapping("/productView.product")
	public String productView(HttpServletRequest req, @RequestParam Map<String, String> params, int prod_num ) {
		List<ReviewProductDTO> list = null;
		String search = params.get("search");
		String searchString = params.get("searchString");
		if(searchString == null) {
			list = productMapper.listProdReview(prod_num);
		}else {
			list = productMapper.findReview(search, searchString);
		}
		System.out.println("리뷰" + list);
		req.setAttribute("getProduct", productMapper.getProduct(prod_num));
		req.setAttribute("ReList", list);
		return "product/productView";
	}
	@RequestMapping("/productReviewView.product")
	public String productReviewView() {
		return "product/productReviewView";
	}
}
