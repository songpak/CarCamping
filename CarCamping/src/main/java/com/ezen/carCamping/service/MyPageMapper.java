package com.ezen.carCamping.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.ProductCartDTO;
import com.ezen.carCamping.dto.ProductDTO;

@Service
public class MyPageMapper {
	@Autowired
	   private SqlSession sqlSession;
	
	public ProductCartDTO cartProduct(int prod_num) {
		ProductCartDTO dto = sqlSession.selectOne("cartProduct", prod_num);
		if(dto != null)
			return dto;
		else
			return null;
	}
	
}
