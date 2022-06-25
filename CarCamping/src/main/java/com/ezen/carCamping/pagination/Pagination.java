package com.ezen.carCamping.pagination;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ezen.carCamping.dto.CarCampingRegionDTO;

public class Pagination {
	//페이지당 게시글 수
	private int postPerPage = 10;
	
	//Singleton instance생성
	private static Pagination instance = new Pagination();
	
	private Pagination() {}
	
	public static Pagination getInstance() {
		return instance;
	}
	

	
//////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////메소드 영역////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	//총 페이지 수 계산
	public int pageCount(List list) {
		int pageCount = 0; 
		if (list.size()%postPerPage==0) {
			pageCount = list.size()/postPerPage;
		}else {
			pageCount = list.size()/postPerPage + 1;
		}
		return pageCount;
	}
	
	public HashMap<Integer,List<Object>> getPagePost(List<Object> list){
		
		//총 페이지 수 계산
		int pageCount = pageCount(list);
		
		//페이지당 게시물을  담을 HashMap 
		//Key : 페이지 번호 / Value : 페이지 번호에 해당되는 게시물리스트
		HashMap<Integer,List<Object>> map = new HashMap<>();
		
		int i = 1; //페이지 번호
		int j = 1; //개시글 카운트
		
		//게시물 리스트의 배열
		List<Object>[] listArray = new List[pageCount]; 
		for (int k=0; k<listArray.length; k++) {
			listArray[k] = new ArrayList<Object>();
		}
		
		for (Object obj : list) {
			listArray[i-1].add(obj);
			
			if(j%postPerPage==0 || j==list.size()) {
				map.put(i, listArray[i-1]);
				i++;
			}
			j++;
		}
	
		return map;
	}

	
	
//////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////차박장소 전용//////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	public List<CarCampingRegionDTO> getListRegion(int page,List<CarCampingRegionDTO> list){
		//Object로 형변환
		List<Object> listObject = new ArrayList<Object>();
		for (CarCampingRegionDTO dto : list) {
			Object obj = (Object)dto;
			listObject.add(obj);
		}

		//위의 getPagePost로 해당 페이지의 게시물 분할
		List<Object> listPerPage = getPagePost(listObject).get(page);
		
		//다시 CarCampingRegionDTO로 형변환
		List<CarCampingRegionDTO> changedList = new ArrayList<CarCampingRegionDTO>();
		for(Object obj : listPerPage) {
			CarCampingRegionDTO dto = (CarCampingRegionDTO)obj;
			changedList.add(dto);
		}
		
		return changedList;
	}
	
	
}
