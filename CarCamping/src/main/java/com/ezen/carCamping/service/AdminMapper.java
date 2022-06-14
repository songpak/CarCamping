package com.ezen.carCamping.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ezen.carCamping.dto.RegionDTO;

public class AdminMapper {

	@Autowired
	private SqlSession sqlSession;
	
	private List<RegionDTO> listRegion(){
		List<RegionDTO> list = sqlSession.selectList("listRegion");
		return list;
	}
}
