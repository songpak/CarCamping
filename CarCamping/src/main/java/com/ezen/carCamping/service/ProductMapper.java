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
	
	public List<ProductDTO> popularProduct() {//�α��ǰ ����Ʈ
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
	
	public List<ProductDTO> listProductPrice(){
		List<ProductDTO> listProductPrice = sqlSession.selectList("listProductPrice");
		return listProductPrice;
	}
	public List<ProductDTO> listProductNew(){
		List<ProductDTO>listProductNew = sqlSession.selectList("listProductNew");
		return listProductNew;
	}
	public List<ProductDTO> listProductPop(){
		List<ProductDTO> listProductPop= sqlSession.selectList("listProductPop");
		return listProductPop;
	}
	public List<ProductDTO> listProductsearchPrice(String search,String searchString){
		java.util.Map<String,String> map = new Hashtable<String, String>();
		map.put("search", search);
		map.put("searchString", searchString);
		List<ProductDTO>listProductsearchPrice=sqlSession.selectList("listProductsearchPrice",map);
		return listProductsearchPrice;
	}
	public List<ProductDTO> listProductsearchNew(String search,String searchString){
		java.util.Map<String,String> map = new Hashtable<String, String>();
		map.put("search", search);
		map.put("searchString", searchString);
		List<ProductDTO>listProductsearchNew=sqlSession.selectList("listProductsearchNew",map);
		return listProductsearchNew;
	}
	public List<ProductDTO> listProductsearchPop(String search,String searchString){
		java.util.Map<String,String> map = new Hashtable<String, String>();
		map.put("search", search);
		map.put("searchString", searchString);
		List<ProductDTO>listProductsearchPop=sqlSession.selectList("listProductsearchPop",map);
		return listProductsearchPop;
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
	
	public List<ReviewProductDTO> R_orderByScore() {
		List<ReviewProductDTO>list= sqlSession.selectList("R_orderByScore");
		return list;
	}
	
	public List<ReviewProductDTO> R_orderByRead() {
		List<ReviewProductDTO>list= sqlSession.selectList("R_orderByRead");
		return list;
	}
	
}
 