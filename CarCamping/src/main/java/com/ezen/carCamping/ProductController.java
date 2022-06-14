package com.ezen.carCamping;

import java.io.File; 
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.carCamping.dto.ProductCategoryDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.service.ProductMapper;

@Controller
public class ProductController {

	@Autowired
	private ProductMapper productMapper;
	  
	@RequestMapping("/goProduct.product")
	public String goProduct(HttpServletRequest req) {
		List<ProductDTO> list= productMapper.listProduct();
		req.setAttribute("listProduct", list);
		return "product/productMain";
	}
	@RequestMapping("/productView.product")
	public String productView(HttpServletRequest req, @RequestParam Map<String, String> params) {
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if(pageNum==null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage)*pageSize +1;
		int endRow = startRow + pageSize -1;
		int rowCount = productMapper.getReviewCount();
		List<ReviewProductDTO> list1 = null;
		if(rowCount>0) {
			list1 = productMapper.listReviewProduct(startRow, endRow);
		}
		int reviewNum = rowCount - (startRow -1);
		if (rowCount>0) {
			int pageCount = rowCount/pageSize + (rowCount%pageSize==0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage - 1)/pageBlock  * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) endPage = pageCount;
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
		}
		List<ReviewProductDTO> list = null;
		String search = params.get("search");
		String searchString = params.get("searcString");
		if(searchString == null) list = productMapper.listProdReview2();
		else list = productMapper.findReview(search, searchString);
		
		
		req.setAttribute("listProdReview", list);
		req.setAttribute("rowCount", rowCount);
		req.setAttribute("boardNum", reviewNum);
		req.setAttribute("listBoard", list1);
		
		return "product/productView";
	}
	@RequestMapping("/productReviewView.product")
	public String productReviewView() {
		return "product/productReviewView";
	}
}
