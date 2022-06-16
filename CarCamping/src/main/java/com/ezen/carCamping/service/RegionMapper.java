package com.ezen.carCamping.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;

@Service
public class RegionMapper{

	@Autowired
	private SqlSession sqlSession;
	
<<<<<<< HEAD
	private static Hashtable<String,List<CarCampingRegionDTO>> ht = new Hashtable<>();
	
	public static Hashtable<String,List<CarCampingRegionDTO>> getInstance(){
=======
	private static Hashtable<String,Object> ht = new Hashtable<>();
	
	public static Hashtable<String,Object> getInstance(){
>>>>>>> eb60c6ea7d6f2a344a33ec5b15569a9d590defd1
		/*
		 * for(int i=1;i<=9;i++) {
		 * ht.put(String.valueOf(i),listCarCampingRegionHotRegion(i)); }
		 */
		return ht;
	}
	
	public List<RegionDTO> listRegion() {
		List<RegionDTO> list = sqlSession.selectList("listRegion");
		return list;
	}
	public RegionDTO selectRegion(int region_num) {
		RegionDTO dto = sqlSession.selectOne("selectRegion", region_num);
		//System.out.println("Asd");
		return dto;
	}
	public List<CarCampingRegionDTO> listCarCampingRegionHotRegion(int region_num){
			List<CarCampingRegionDTO> list = sqlSession.selectList("listCarCampingRegionHotRegion", region_num);
			return list;
	}
	
	public List<CarCampingRegionDTO> listHotRegion(){
		List<CarCampingRegionDTO> list = sqlSession.selectList("listHotRegion");
		return list;
	}
	
	public List<CarCampingRegionDTO> listRecommandRegion(){
		List<CarCampingRegionDTO> list = sqlSession.selectList("listRecommandRegion");
		return list;
	}
	
	public CarCampingRegionDTO selectRegionByCcrnum(int ccr_num) {
		CarCampingRegionDTO dto = (CarCampingRegionDTO)sqlSession.selectOne("selectRegionByCcrnum",ccr_num);
		return dto;
	}
	
<<<<<<< HEAD
	public List<ReviewRegionDTO> listCcrReview(int ccr_num , int startRow , int endRow){
		Map<String,Integer> map = new Hashtable<>();
		map.put("ccr_num",ccr_num);
		map.put("startRow",startRow);
		map.put("endRow",endRow);
=======
	public List<ReviewRegionDTO> listCcrReview(int ccr_num , int startRow , int endRow,String orderBy){
		Map<String,Object> map = new Hashtable<>();
		map.put("ccr_num",ccr_num);
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("orderBy",orderBy);
>>>>>>> eb60c6ea7d6f2a344a33ec5b15569a9d590defd1
		List<ReviewRegionDTO> list = sqlSession.selectList("listCcrReview", map);
		System.out.println("RegionMapper list size : "+list.size());
		return list;
	}
	public int countReviewCcrnum(int ccr_num) {
		int count = (int)sqlSession.selectOne("countReviewCcrnum", ccr_num);
		return count;
	}
	
<<<<<<< HEAD
=======
	public int addLikeCountRegion(int ccr_num) {
		int res = sqlSession.update("addLikeCountRegion", ccr_num);
		return res;
	}
	public int subLikeCountRegion(int ccr_num) {
		int res = sqlSession.update("subLikeCountRegion", ccr_num);
		return res;
	}
	public int addLikeCountReview(int review_num) {
		int res = sqlSession.update("addLikeCountReview", review_num);
		return res;
	}
	public int subLikeCountReview(int review_num) {
		int res = sqlSession.update("subLikeCountReview", review_num);
		return res;
	}
	
>>>>>>> eb60c6ea7d6f2a344a33ec5b15569a9d590defd1
}
