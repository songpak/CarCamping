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
<<<<<<< HEAD
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
=======
import com.ezen.carCamping.dto.RentalLogDTO;
>>>>>>> 오신웅2

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
<<<<<<< HEAD
=======
	 public int insertCartLog(Map<String, String> params) {
		 int res =sqlSession.insert("insertCartLog", params);
		 return res; 
	 }
	 
	 public int updateCartLogPoint(Map<String, String> params2) {
		 int res =sqlSession.update("updateCartLogPoint", params2);
		 return res; 
	 }
		
		

	 public List<QuestionDTO> myPageGetQuestion(){
		 List<QuestionDTO> myPageGetQuestion = sqlSession.selectList("myPageGetQuestion");
		 return myPageGetQuestion;
	 }
>>>>>>> 오신웅2
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
<<<<<<< HEAD
	public int payCart(int mem_num) {
		int res = sqlSession.delete("payCart",mem_num );
=======

	
	public int payCart(int cart_num) {
		int res = sqlSession.delete("payCart",cart_num );
>>>>>>> 오신웅2
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
	public int deleteReviewRegion(int review_num) {
		int res = sqlSession.delete("deleteReviewRegion", review_num);
		return res;
		}
	public int deleteReviewProduct(int rp_num) {
		int res = sqlSession.delete("deleteReviewProduct", rp_num);
		return res;
		}
}









