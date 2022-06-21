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
            if (dto == null) return "입력된 값과 일치하는 회원이 없습니다.";
            return "아이디는 " + dto.getMem_id() +" 입니다.";
         
   }
   
   public String searchMemberPW(Map<String, String> params) {
      String sql = null;
      sql = "select * from Member where mem_id='"+params.get("mem_id") 
      + "' and mem_email='"+params.get("mem_email") + "'";
         params.put("sql", sql);
      MemberDTO dto = sqlSession.selectOne("searchMemberPW", params);
<<<<<<< HEAD
      if (dto == null) return "�Էµ� ���� ��ġ�ϴ� ȸ���� �����ϴ�.";
      return "��й�ȣ��."+dto.getMem_password()+"�Դϴ�.";
=======
      if (dto == null) return "입력된 값과 일치하는 회원이 없습니다.";
      return "비밀번호는."+dto.getMem_password()+"입니다.";
>>>>>>> 혜성(리뷰)
}
   
   public MemberDTO getMemberId(String mem_id) {
         MemberDTO dto = sqlSession.selectOne("getMemberId", mem_id);
         return dto;
   }

   public int insertMember(MemberDTO dto) {
	      int res = sqlSession.insert("insertMember", dto);
	      return res;
	   }
   public MemberDTO getMemberNick(String mem_nickName) {
       MemberDTO dto = sqlSession.selectOne("getMemberNick", mem_nickName);
       return dto;
   }
   public MemberDTO getMemberEmail(String mem_email) {
       MemberDTO dto = sqlSession.selectOne("getMemberEmail", mem_email);
       return dto;
   }

   public int updateMember(MemberDTO dto) {
		int res = sqlSession.update("updateMember", dto);
		return res;
	}
   public MemberDTO getMember(int mem_num){
		MemberDTO dto = sqlSession.selectOne("getMember", mem_num);
		return dto;
	}
   
 

}