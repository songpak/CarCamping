package com.ezen.carCamping.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.AgencyDTO;
import com.ezen.carCamping.dto.BrandCategoryDTO;
import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.ProductCategoryDTO;
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
		
		return adminListCarCampingRegion;
	}
	
	public List<CarCampingRegionDTO> adminListCarCampingRegionSelectRegion(int region_num){
		List<CarCampingRegionDTO> adminListCarCampingRegion = sqlSession.selectList("adminListCarCampingRegionSelectRegion",region_num);
		
		return adminListCarCampingRegion;
	}
	
	public CarCampingRegionDTO getCarCampingRegion(int ccr_num) {
		CarCampingRegionDTO dto = sqlSession.selectOne("adminGetCarCampingRegion", ccr_num);
		return dto;
	}
	
	public int adminUpdateRegion(CarCampingRegionDTO dto) {
		int res = sqlSession.update("adminUpdateRegion", dto);
		return res;
	}
	
	public int adminDeleteRegion(int ccr_num) {
		int res = sqlSession.delete("adminDeleteRegion",ccr_num);
		return res;
	}
	
	////////////////////////////대리점////////////////////////////////////////////
	public List<AgencyDTO> adminListAgency(){
		List<AgencyDTO> adminListAgency = sqlSession.selectList("adminListAgency");
		return adminListAgency;
	}
	
	public int adminInsertAgency(AgencyDTO dto) {
		int res = sqlSession.insert("adminInsertAgency", dto);
		return res;
	}
	
	public AgencyDTO adminGetAgency(int agency_num) {
		AgencyDTO dto = sqlSession.selectOne("adminGetAgency", agency_num);
		return dto;
	}
	
	public int adminUpdateAgency(AgencyDTO dto) {
		int res = sqlSession.update("adminUpdateAgency", dto);
		return res;
	}
	
	public int adminDeleteAgency(int agency_num) {
		int res = sqlSession.delete("adminDeleteAgency", agency_num);
		return res;
	}
	
	////////////////////////////////////////카테고리/////////////////////////////////////
	public List<BrandCategoryDTO> adminListBrand(){
		List<BrandCategoryDTO> adminListBrand = sqlSession.selectList("adminListBrand");
		return adminListBrand;
	}
	
	public List<ProductCategoryDTO> adminListProductCategoty(){
		List<ProductCategoryDTO> adminListProductCategory = sqlSession.selectList("adminListProductCategory");
		return adminListProductCategory;
	}
	
	public int adminInsertCategory(HashMap<String,String> map) {
		int res = 0;
		String name = map.get("name");
		if (map.get("category").equals("brand")) {
			res = sqlSession.insert("adminInsertBrand",name);
		}
		else {
			res = sqlSession.insert("adminInsertProductCategory",name);
		}
		return res;
	}
	
	public int adminDeleteBrand(int brand_num) {
		int res = sqlSession.delete("adminDeleteBrand", brand_num);
		return res;
	}
	
	public int adminDeleteProductCategory(int pc_num) {
		int res = sqlSession.delete("adminDeleteProductCategory", pc_num);
		return res;
	}
}
