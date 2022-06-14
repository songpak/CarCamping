package com.ezen.carCamping.service;

import java.util.Hashtable;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
@Service
public class RegionMapper {

	@Autowired
	private SqlSession sqlSession;
	
	private static Hashtable<String,List<CarCampingRegionDTO>> ht = new Hashtable<>();
	
	public static Hashtable<String,List<CarCampingRegionDTO>> getInstance(){
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
	
}
