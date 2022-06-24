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

import com.ezen.carCamping.dto.AgencyDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.service.ProductMapper;

@Controller
public class ProductController {

	@Autowired
	private ProductMapper productMapper;

	// 용품메인 컨트롤러
	@RequestMapping("/goProduct.product")
	public String goProduct(HttpServletRequest req, @RequestParam Map<String, String> params) {
			List<ProductDTO> list = null;
			String search = params.get("search");
			String searchString = params.get("searchString");
			if (searchString == null) {
				list = productMapper.listProduct();
			} else {
				list = productMapper.findProduct(search, searchString);
			}
			List<ProductDTO> popList = productMapper.popularProduct();
			System.out.println("인기리스트" + popList);
			req.setAttribute("popList", popList); // 인기용품 리스트 저장시킨겁니다
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










