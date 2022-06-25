package com.ezen.carCamping.service;

import java.util.Hashtable;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.ezen.carCamping.dto.CarCampingRegionDTO;

import com.ezen.carCamping.dto.AgencyDTO;

import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ProductCartDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.QuestionDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;

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
	 
	 public int updateCart(ProductCartDTO cartDTO) {
		 int res = sqlSession.update("updateCart", cartDTO);
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
	 public List<QuestionDTO> myPageGetQuestionSelectMember(int mem_num){
			List<QuestionDTO> qdto = sqlSession.selectList("myPageGetQuestionSelectMember",mem_num);
			return qdto;
		}
	public int insertQuestion(QuestionDTO dto) {
		int res = sqlSession.insert("insertQuestion", dto);
		return res;
		}
	public QuestionDTO getQuestion(int question_num){
		QuestionDTO qdto = sqlSession.selectOne("getQuestion", question_num);
		return qdto;
	}
	public int payCart(int mem_num) {
		int res = sqlSession.delete("payCart",mem_num );
		return res;
	}
	 public List<ReviewRegionDTO> myPageGetWriteReviewRegion(int mem_num){
			List<ReviewRegionDTO> rdto = sqlSession.selectList("myPageGetWriteReviewRegion",mem_num);
			return rdto;
		}
	 public List<ReviewProductDTO> myPageGetWriteReviewProduct(int mem_num){
			List<ReviewProductDTO> pdto = sqlSession.selectList("myPageGetWriteReviewProduct",mem_num);
			return pdto;
		} 
	 public ReviewRegionDTO getReviewRegion(int review_num){
		 	ReviewRegionDTO rdto = sqlSession.selectOne("getReviewRegion", review_num);
			return rdto;
		}
	 public ReviewProductDTO getReviewProduct(int rp_num){
		 	ReviewProductDTO pdto = sqlSession.selectOne("getReviewProduct", rp_num);
			return pdto;
		}
	
}









