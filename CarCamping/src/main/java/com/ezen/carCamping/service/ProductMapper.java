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
	
	public List<ReviewProductDTO>listProdReview(){
		List<ReviewProductDTO>list= sqlSession.selectList("listProdReview");
		return list; 
	}
	
	public int getReviewCount() {
		int res = sqlSession.selectOne("getReviewCount");
		return res;
	}
	
	public List<ReviewProductDTO>listReviewProduct(int startRow, int endRow) {
		List<ReviewProductDTO>list = sqlSession.selectList("paging");
		return list;
	}
	
	public List<ReviewProductDTO> findReview(String search, String searchString) {
		java.util.Map<String, String> map = new Hashtable<String, String>();
		map.put("search", search);
		map.put("searchString", searchString);
		List<ReviewProductDTO> list = sqlSession.selectList("findProdReview", map);
		return list;
	}
	
}
 