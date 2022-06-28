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
	
		
		

	 public List<QuestionDTO> myPageGetQuestion(){
		 List<QuestionDTO> myPageGetQuestion = sqlSession.selectList("myPageGetQuestion");
		 return myPageGetQuestion;
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
	
	
	 
	//전용재 -- 용품 좋아요 리뷰  
	public List<ReviewProductDTO> ReviewProductList(int mem_num){
		List<ReviewProductDTO>ReviewProductList =sqlSession.selectList("ReviewProductList",mem_num);
		System.out.println("맵퍼의ReviewProductList:" + ReviewProductList);
		return ReviewProductList;
	}
	
	public List<ReviewRegionDTO> ReviewRegionList(int mem_num){
		List<ReviewRegionDTO> ReviewRegionList =sqlSession.selectList("ReviewRegionList",mem_num);
		return ReviewRegionList;
	}
	public ReviewProductDTO ReviewProductNum(int rp_num) {
		ReviewProductDTO ReviewProductNum = sqlSession.selectOne("ReviewProductNum", rp_num);
		 return ReviewProductNum;
	}	
	public ReviewRegionDTO ReviewRegionNum(int review_num) {
		ReviewRegionDTO ReviewRegionNum =sqlSession.selectOne("ReviewRegionNum", review_num);
		System.out.println("맵퍼의:ReviewRegionNum "+ ReviewRegionNum );
		return ReviewRegionNum;
	}
	//지역 좋아요 불러오기
	public int CountReviewLikeLog(String mem_id,int review_num) {
		Map<String,Object> map = new Hashtable<>();
		map.put("mem_id", mem_id);
		map.put("review_num", review_num);
		int res = (int)sqlSession.selectOne("CountReviewLikeLog", map);
		if(res>0) System.out.println("해당 아이디의  해당 리뷰에 대해 추천한 기록이있습니다");
		else System.out.println("해당 아이디의 해당 리뷰에 대해 추천한 기록이 없습니다");
		return res;
	}
	
	 public int DeleteProductReview(Map<String,String> map) {
//	 Map<String,Object> map = new Hashtable<>();
//		 map.put("mem_num", mem_num);
//		map.put("rp_mun",rp_num);	
		 int res = sqlSession.delete("DeleteProductReview", map);
		 return res;
	 } 
	 public int DeleteRegionReveiw(Map<String,String>map) {
		 int res = sqlSession.delete("DeleteRegionReveiw", map);
		 return res;
	 }
	 public int UpdateProductLikeLog(int rp_num) {
		int res = sqlSession.update("UpdateProductLikeLog", rp_num);
		return res;
	 }
	 public int UpdateRegionLikeLog(int review_num) {
		int res = sqlSession.update("UpdateRegionLikeLog", review_num);
		return res;
	 }
	 
}
 








