package com.ezen.carCamping.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;

@Service
public class MemberMapper {
   @Autowired
   private SqlSession sqlSession;
   
   public boolean checkMember(Map<String, String> params) {
         MemberDTO dto = sqlSession.selectOne("checkMember", params);
         if(dto == null) return false;
         else return true;
   }

   public String searchMemberID(Map<String, String> params) {
      String sql = null;
      sql = "select * from Member where mem_userName='"+params.get("mem_userName") 
               + "' and mem_email='"+params.get("mem_email")+"'";
            params.put("sql", sql);
            MemberDTO dto = sqlSession.selectOne("searchMemberID", params);
            if (dto == null) return "�Էµ� ���� ��ġ�ϴ� ȸ���� �����ϴ�.";
            return "���̵�� " + dto.getMem_id() +" �Դϴ�.";
         
   }
   
   public String searchMemberPW(Map<String, String> params) {
      String sql = null;
      sql = "select * from Member where mem_id='"+params.get("mem_id") 
      + "' and mem_email='"+params.get("mem_email") + "'";
         params.put("sql", sql);
      MemberDTO dto = sqlSession.selectOne("searchMemberPW", params);
      if (dto == null) return "�Էµ� ���� ��ġ�ϴ� ȸ���� �����ϴ�.";
      return "��й�ȣ��."+dto.getMem_password()+"�Դϴ�.";
}
   
   public MemberDTO getMemberId(String mem_id) {
         MemberDTO dto = sqlSession.selectOne("getMemberId", mem_id);
         return dto;
   }

   public int insertMember(MemberDTO dto) {
	      int res = sqlSession.insert("insertMember", dto);
	      return res;
	   }



	}