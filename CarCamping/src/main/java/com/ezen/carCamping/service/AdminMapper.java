package com.ezen.carCamping.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.AgencyDTO;
import com.ezen.carCamping.dto.BrandCategoryDTO;
import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ProductCategoryDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;

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
	
	
//////////////////////////////////////////////////////////////////////////////////////////	
///////////////////////////////대리점/////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
	
	
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
	
	
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////카테고리///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
	
	
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
	
	
	
////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////용품/////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
	
	public List<ProductDTO> adminListProduct(){
		List<ProductDTO> adminListProduct = sqlSession.selectList("adminListProduct");
		return adminListProduct;
	}
	
	public List<ProductDTO> adminFindProduct(String search){
		search = "%"+search+"%";
		List<ProductDTO> adminFindProduct = sqlSession.selectList("adminFindProduct", search);
		return adminFindProduct;
	}
	
	public ProductDTO adminGetProduct(int prod_num) {
		ProductDTO dto = sqlSession.selectOne("adminGetProduct",prod_num);
		return dto;
	}
	
	
	public int adminInsertProduct(ProductDTO dto) {
		int res = sqlSession.insert("adminInsertProduct", dto);
		return res;
	}
	
	public int adminUpdateProduct(ProductDTO dto) {
		int res = sqlSession.update("adminUpdateProduct", dto);
		return res;
	}
	
	public int adminDeleteProduct(int prod_num) {
		int res = sqlSession.delete("adminDeleteProduct", prod_num);
		return res;
	}
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////회 원//////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
	
	public List<MemberDTO> adminListMember(){
		List<MemberDTO> list = sqlSession.selectList("adminListMember");
		return list;
	}
	
	public List<MemberDTO> adminListMemberSort(Map<String,String> map){
		List<MemberDTO> list = sqlSession.selectList("adminListMemberSort",map);
		return list;
	}
	
	public List<MemberDTO> adminListMemberSearch(Map<String,String> map){
		List<MemberDTO> list = sqlSession.selectList("adminListMemberSearch", map);
		return list;
	}
	
	public MemberDTO adminGetMember(int mem_num) {
		MemberDTO dto = sqlSession.selectOne("adminGetMember",mem_num);
		return dto;
	}
	
	public int adminDenyMember(Map<String,String> map) {
		int res = sqlSession.update("adminDenyMember", map);
		return res;
	}

	
	
	
///////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////장 소 리 뷰//////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	public List<ReviewRegionDTO> adminListReviewRegion(){
		List<ReviewRegionDTO> list = sqlSession.selectList("adminListReviewRegion");
		return list;
	}
	
	public List<ReviewRegionDTO> adminListReviewRegionSort(Map<String,String> map){
		List<ReviewRegionDTO> list = sqlSession.selectList("adminListReviewRegionSort",map);
		return list;
	}
	
	public List<ReviewRegionDTO> adminListReviewRegionSearch(Map<String,String> map){
		List<ReviewRegionDTO> list = sqlSession.selectList("adminListReviewRegionSearch",map);
		return list;
	}
	
	public ReviewRegionDTO adminGetReviewRegion(int review_num) {
		ReviewRegionDTO dto = sqlSession.selectOne("adminGetReviewRegion", review_num);
		return dto;
	}
	
	public int adminUpdateReviewRegion(Map<String,String> map) {
		int res = sqlSession.update("adminUpdateReviewRegion", map);
		return res;
	}
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////장 소 리 뷰//////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
	
	
	

	public List<ReviewProductDTO> adminListReviewProduct(){
		List<ReviewProductDTO> list = sqlSession.selectList("adminListReviewProduct");
		return list;
	}

	public List<ReviewProductDTO> adminListReviewProductSort(Map<String,String> map){
		List<ReviewProductDTO> list = sqlSession.selectList("adminListReviewProductSort",map);
		return list;
	}

	public List<ReviewProductDTO> adminListReviewProductSearch(Map<String,String> map){
		List<ReviewProductDTO> list = sqlSession.selectList("adminListReviewProductSearch",map);
		return list;
	}

	public ReviewProductDTO adminGetReviewProduct(int rp_num) {
		ReviewProductDTO dto = sqlSession.selectOne("adminGetReviewProduct", rp_num);
		return dto;
	}

	public int adminUpdateReviewProduct(Map<String,String> map) {
		int res = sqlSession.update("adminUpdateReviewProduct", map);
		return res;
	}
	
}
