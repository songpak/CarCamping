package com.ezen.carCamping.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.RegionDTO;

@Service
public class AdminMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public List<RegionDTO> adminListRegion(){
		List<RegionDTO> list = sqlSession.selectList("adminListRegion");
		return list;
	}
	
	public int adminInsertRegion(CarCampingRegionDTO dto) {
		int res = sqlSession.insert("adminInsertRegion", dto);
		return res;
	}
	
	public List<CarCampingRegionDTO> adminListCarCampingRegion(){
		List<CarCampingRegionDTO> adminListCarCampingRegion = sqlSession.selectList("adminListCarCampingRegion");
		List<RegionDTO> adminListRegion = adminListRegion();
		
		for (CarCampingRegionDTO cdto : adminListCarCampingRegion) {
			for (RegionDTO rdto : adminListRegion) {
				if (rdto.getRegion_num()==cdto.getRegionDTO()) {
					cdto.setRegionDTO(rdto);
				}
			}
		}
		
		return adminListCarCampingRegion;
	}
	
	public CarCampingRegionDTO getCarCampingRegion(int ccr_num) {
		CarCampingRegionDTO dto = sqlSession.selectOne("getCarCampingRegion", ccr_num);
		return dto;
	}
}
