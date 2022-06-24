package com.ezen.carCamping.service;

import java.util.Hashtable;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ProductCartDTO;
import com.ezen.carCamping.dto.ProductDTO;

@Service
public class MyPageMapper {
	@Autowired
	private SqlSession sqlSession;

	public List<ProductCartDTO> cartProduct(int mem_num) {
		List<ProductCartDTO> dto = sqlSession.selectList("cartProduct",mem_num);
		if (dto != null)
			return dto;
		else
			return null;
	}
	
	 public int insertCart(ProductCartDTO dto) {
		 int res =sqlSession.insert("insertCart", dto);
		 return res; 
	 }
	 
	 public int updateCart(ProductCartDTO dto) {
		 int res = sqlSession.update("updateCart", dto);
		return res;
	 }
	 public int deleteCart(int prod_num) {
		 int res = sqlSession.delete("deleteCart", prod_num);
		 return res;
	 }
	 public String getMemberPassword(int mem_num) {

		 String res = sqlSession.selectOne("getMemberPassword", mem_num);
		 return res;
		}	
	
		}
		
	
	 










