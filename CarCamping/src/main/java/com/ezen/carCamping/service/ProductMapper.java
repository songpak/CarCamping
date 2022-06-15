package com.ezen.carCamping.service;


import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;


@Service
public class ProductMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ProductDTO>listProduct(){
		List<ProductDTO>list= sqlSession.selectList("listProduct");
		return list; 
	}
	public List<ProductDTO> findProduct(String search, String searchString){
		java.util.Map<String,String> map = new Hashtable<String, String>();
		System.out.println(map);
		map.put("search", search);
		map.put("searchString", searchString);
		List<ProductDTO>list = sqlSession.selectList("findProduct",map);
		return list;
	}
	
	public List<ProductDTO> popularProduct() {//인기용품 리스트
		List<ProductDTO> popList = sqlSession.selectList("popularProd");
		return popList;
	}
	
	public ProductDTO getProduct(int prod_num) {
		ProductDTO dto = sqlSession.selectOne("getProduct", prod_num);
		if(dto != null)
			return dto;
		else
			return null;
	}
	
	public List<ReviewProductDTO> listProdReview(int prod_num){
		List<ReviewProductDTO>list= sqlSession.selectList("listProdReview", prod_num);
		return list; 
	}
	
	public List<ReviewProductDTO> findReview(String search, String searchString) {
		java.util.Map<String, String> map = new Hashtable<String, String>();
		map.put("search", search);
		map.put("searchString", searchString);
		List<ReviewProductDTO> list = sqlSession.selectList("findProdReview", map);
		return list;
	}
	
	public List<ReviewProductDTO> getReviewView(int rp_num) {
		List<ReviewProductDTO>list= sqlSession.selectList("getReviewView", rp_num);
		return list;
	}
	
}
 