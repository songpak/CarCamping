package com.ezen.carCamping.service;


import java.util.*; 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.AgencyDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;


@Service
public class ProductMapper {
	
	@Autowired
	private SqlSession sqlSession;
	


	
	public List<ProductDTO> popularProduct() {//인기용품 리스트
		List<ProductDTO> popList = sqlSession.selectList("popularProd");
		return popList;
	}
	
/*	
	public ProductDTO getProduct(int prod_num,String select) {
		List<ProductDTO>list = ht.get(select);
		for(ProductDTO dto: list) {
			if(dto.getProd_num()==prod_num) {
				return dto;
			}
		}
		return null;
}
*/
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
	
<<<<<<< HEAD
	public List<AgencyDTO> getAgency() {
		List<AgencyDTO> dto = sqlSession.selectList("getAgency");
		return dto;
	}
	
	public int plusReviewReadCount(int rp_num) {
		return sqlSession.update("plusReviewReadCount", rp_num);
	}
	
	public int minReviewReadCount(int rp_num) {
		return sqlSession.update("minReviewReadCount", rp_num);
	}
	
	public int plusLikeCount(int rp_num) {
		return sqlSession.update("plusLikeCount", rp_num);
	}
=======
	public List<ProductDTO> findProduct( String search, String searchString, int startRow , int endRow){
		Map<String,Object> map = new Hashtable<>();
		System.out.println(map);
		map.put("search", search);
		map.put("searchString", searchString);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ProductDTO>list = sqlSession.selectList("findProduct",map);
		return list;
	}
	
	public List<ProductDTO> listProduct(String search, String searchString, int startRow , int endRow){
		Map<String,Object> map = new Hashtable<>();
		map.put("search", search);
		System.out.println("매퍼의 서치:"+search);
		map.put("searchString", searchString);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		System.out.println("매퍼의 map:"+map);
		List<ProductDTO>list= sqlSession.selectList("listProduct",map);
		System.out.println("매퍼의 map:"+map);
		return list; 
	}
	
	public int listProductMainCount() {
		int count = sqlSession.selectOne("listProductMainCount");
		return count;
	}

	
>>>>>>> 전용재
	
}
 