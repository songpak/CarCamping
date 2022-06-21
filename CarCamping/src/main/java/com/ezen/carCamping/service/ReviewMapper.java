package com.ezen.carCamping.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;

@Service
public class ReviewMapper {
	@Autowired
	private SqlSession	sqlSession;
	
	
	
	public int insertReviewRegion(ReviewRegionDTO dto) {
		   int res = sqlSession.insert("insertReviewRegion", dto);
		   return res;
	   }
	 
	public int insertReviewProduct(ReviewProductDTO dto) {
		   int res = sqlSession.insert("insertReviewProduct", dto);
		   return res;
	   } 
	

}
