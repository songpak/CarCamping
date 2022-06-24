package com.ezen.carCamping;

<<<<<<< HEAD
<<<<<<< HEAD
import java.io.File;



import java.io.IOException;
import java.text.SimpleDateFormat;
=======
import java.text.SimpleDateFormat; 
>>>>>>> 전용재
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

=======

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import java.util.List;

>>>>>>> 박다슬
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ProductCartDTO;
<<<<<<< HEAD
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
=======
import com.ezen.carCamping.dto.QuestionDTO;
import com.ezen.carCamping.dto.RegionDTO;
>>>>>>> 박다슬
import com.ezen.carCamping.service.MemberMapper;
import com.ezen.carCamping.service.MyPageMapper;


@Controller
public class MyPageController {

	@Autowired
	private MyPageMapper myPageMapper;
<<<<<<< HEAD
	
	@Autowired
	private MemberMapper memberMapper;
		
	@Resource(name="uploadPath")
			private String uploadPath;
=======
	@Autowired
	private MemberMapper memberMapper;
	@Resource(name="uploadPath")
	private String uploadPath;	
>>>>>>> 박다슬

	@RequestMapping("/myPageCart.myPage") // 移댄듃�뿉 異붽�
	public String myPageCart(HttpServletRequest req, ProductCartDTO dto, String cart_from, String cart_to, int mem_num) {
		if (mem_num == 0) {
			String msg = "濡쒓렇�씤�쓣 �빐�빞 ���뿬 �븷 �닔 �엳�뒿�땲�떎!";
			String url = "login.login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		} else if(cart_to == "" && cart_from == "") {
			String msg = "���뿬 �궇吏쒕�� �꽑�깮 �븯�뀛�빞 �빀�땲�떎!";
			String url = "goProduct.product";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}else {
			int res = myPageMapper.insertCart(dto);
			if (res > 0) {
				System.out.println("�벑濡앹꽦怨�");
			} else {
				System.err.println("�벑濡앹떎�뙣");
			}
			HttpSession session = req.getSession();
			List<ProductCartDTO> list = myPageMapper.cartProduct(mem_num);
			session.setAttribute("cartList", list);
		}
		return "myPage/myPageCart";
	}

	@RequestMapping("/myPageCart2.myPage") // �굹以묒뿉 �쉶�썝踰덊샇 異붽��빐�꽌 �꽆寃⑥＜湲�!
	public String myPageCart2(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if (session.getAttribute("mem_num") == null) {
			String msg = "濡쒓렇�씤�쓣 �빐�빞 ���뿬 �븷 �닔 �엳�뒿�땲�떎!";
			String url = "login.login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}else {
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		session.setAttribute("cartList", cart);
		}
		return "myPage/myPageCart";
	}

	@RequestMapping("mall_cartEdit.myPage") // 臾쇨굔 媛��닔 �닔�젙
	public String mall_cartEdit(HttpServletRequest req, int cart_prodCount, int prod_num, ProductCartDTO dto) {
		int res = myPageMapper.updateCart(dto);
		if (res > 0) {
			System.out.println("�닔�젙�꽦怨�");
		} else {
			System.out.println("�닔�젙�떎�뙣");
		}
		HttpSession session = req.getSession();
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		if (cart_prodCount <= 0) {
			session.setAttribute("msg", "�긽�뭹�닔�웾 : 0媛� ! �옣諛붽뎄�땲�뿉�꽌 �궘�젣�빀�땲�떎.");
			session.setAttribute("url", "mall_cartDel.myPage?prod_num=" + prod_num);
			return "message";
		} else {
			for (ProductCartDTO cartDTO : cart) {
				if (prod_num == cartDTO.getProd_num()) {
					cartDTO.setCart_prodCount(cart_prodCount);
				}
			}
		}
		System.out.println("媛��닔" + cart_prodCount);
		System.out.println("�꽆踰�" + prod_num);
		return "myPage/myPageCart";
	}

	@RequestMapping("mall_cartDel.myPage") // 移댄듃�뿉�꽌 �궘�젣
	public String mall_cartDel(HttpServletRequest req, @RequestParam int prod_num) {
		int res = myPageMapper.deleteCart(prod_num);
		if (res > 0) {
			System.out.println("�궘�젣�꽦怨�");
		} else {
			System.out.println("�궘�젣�떎�뙣");
		}
		HttpSession session = req.getSession();
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		for (ProductCartDTO cartDTO : cart) {
			if (prod_num == cartDTO.getProd_num()) {
				cart.remove(cartDTO);
				break;
			}
		}
		return "myPage/myPageCart";
	}

	@RequestMapping("checkOut.myPage")
	public String checkOut(HttpServletRequest req) {
		HttpSession session = req.getSession();
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		String msg = null, url = null;
		if (cart == null) {
			msg = "寃곗젣�븯�떎 �긽�뭹�씠 �뾾�뒿�땲�떎. �옣諛붽뎄�땲�뿉 異붽��빐 二쇱꽭�슂!";
			url = "";
		} else {
			msg = "寃곗젣 �럹�씠吏�濡� �씠�룞�빀�땲�떎!";
			url = "Pay.myPage";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

<<<<<<< HEAD
	@RequestMapping("Pay.myPage") // 결제완료 페이지
	public String Pay() {
		return "myPage/myPagePay";
	}
	
	@RequestMapping("myPageCheckOut.myPage")
=======
	@RequestMapping("Pay.myPage") // 寃곗젣�셿猷� �럹�씠吏�
>>>>>>> 전용재
	public String myPageCheckOut() {
		return "myPage/myPageCheckOut";
	}
<<<<<<< HEAD

	@RequestMapping("/myPageContactUs.myPage")//留덉씠�럹�씠吏� 而⑦뀓�뼱�뒪
	public String myPageContactUs(HttpServletRequest req) {
		return "myPage/myPageContactUs";
	}

<<<<<<< HEAD
	@RequestMapping(value="myPageProfile.myPage", method=RequestMethod.GET)
	public String memberUpdate(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");  
		req.setAttribute("getMember", dto);
		
=======
	@RequestMapping("/myPageProfile.myPage")//留덉씠�럹�씠吏� �봽濡쒗븘 蹂닿린
	public String myPageProfile() {
>>>>>>> 전용재
		return "myPage/myPageProfile";
	}
	@RequestMapping(value="myPageProfile.myPage", method=RequestMethod.POST)
	public String memberUpdateOk(HttpServletRequest req, @ModelAttribute MemberDTO dto, BindingResult result) {
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("mem_image");
		String filename = mf.getOriginalFilename();
		dto.setMem_image(filename);
		if (filename != null && !(filename.trim().equals(""))) {
			File file = new File(uploadPath, filename);
			try {
				mf.transferTo(file);
			}catch(IOException e) {}
			}else {
				filename = req.getParameter("mem_image2"); 
			}		
			dto.setMem_image(filename);
	  RegionDTO rdto = new RegionDTO();
      rdto.setRegion_num(Integer.parseInt(req.getParameter("region_num")));
      dto.setRegionDTO(rdto);
		
      int res = memberMapper.updateMember(dto);
		String msg = null, url = null;
		if (res>0) {
			msg = "내정보 수정 성공!";
			url = "myPageProfile.myPage";
		}else {
			msg = "내정보 수정 실패! 다시 시도해 주세요.";
			url = "myPageProfile.myPage?mem_num=" + dto.getMem_num();
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
=======
	@RequestMapping(value="myPageProfile.myPage", method=RequestMethod.GET)
	 public String memberUpdate(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto"); 
		req.setAttribute("getMember", dto);
		return "myPage/myPageProfile";
	   }
>>>>>>> 박다슬

	@RequestMapping(value="myPageProfile.myPage", method=RequestMethod.POST)
	   public String memberUpdateOk(HttpServletRequest req, @ModelAttribute MemberDTO dto, BindingResult result) {
	      MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
	      MultipartFile mf = mr.getFile("mem_image");
	      String filename = mf.getOriginalFilename();
	      dto.setMem_image(filename);
	      if (filename != null && !(filename.trim().equals(""))) {
	         File file = new File(uploadPath, filename);
	         try {
	            mf.transferTo(file);
	         }catch(IOException e) {}
	         }else {
	            filename = req.getParameter("mem_image2"); 
	         }      
	         dto.setMem_image(filename);
	     RegionDTO rdto = new RegionDTO();
	      rdto.setRegion_num(Integer.parseInt(req.getParameter("region_num")));
	      dto.setRegionDTO(rdto);
	      
	      int res = memberMapper.updateMember(dto);
	      String msg = null, url = null;
	      if (res>0) {
	         msg = "내정보 수정 성공!";
	         url = "myPageProfile.myPage";
	      }else {
	         msg = "내정보 수정 실패! 다시 시도해 주세요.";
	         url = "myPageProfile.myPage?mem_num=" + dto.getMem_num();
	      }
	      req.setAttribute("msg", msg);
	      req.setAttribute("url", url);
	      return "message";
	   }

	
	@RequestMapping("/myPageQuestion.myPage")//마이페이지 문의목록
	public String myPageQuestion(HttpServletRequest req, int mem_num) {
		List<QuestionDTO> qdto =  new ArrayList<QuestionDTO>();
		qdto = myPageMapper.myPageGetQuestionSelectMember(mem_num);
		req.setAttribute("listBoard", qdto);
		return "myPage/myPageQuestion";
	}

	@RequestMapping("/myPageRental.myPage")
	public String myPageRental() {
		return "myPage/myPageRental";
	}
	@RequestMapping(value="myPageContactUs.myPage", method=RequestMethod.GET)//마이페이지 컨텍어스
	public String myPageContactUs() {
		return "myPage/myPageContactUs";
	}
	@RequestMapping(value="myPageContactUs.myPage", method=RequestMethod.POST)
	public String myPageContactUsOk(HttpServletRequest req, QuestionDTO qdto, @RequestParam int mem_num) {
		MemberDTO dto = new MemberDTO();
		dto.setMem_num(Integer.parseInt(req.getParameter("mem_num")));
	    qdto.setMemberDTO(dto);
	    req.setAttribute("mem_num", mem_num);
		int res = myPageMapper.insertQuestion(qdto);
		if (res>0) {
			req.setAttribute("msg", "문의사항을 접수했습니다.");
		}else {
			req.setAttribute("msg", "문의사항을 접수하지 못했습니다. 다시 입력해 주세요.");
		}
		return "message";
	}
	@RequestMapping("/myPageContactUsView.myPage")
	public String myPageContactUsView(HttpServletRequest req, @RequestParam int question_num) {
		QuestionDTO qdto = myPageMapper.getQuestion(question_num);
		req.setAttribute("getQuestion", qdto);
		return "myPage/myPageContactUsView";
	}
	@RequestMapping("/myPageQuestionReply.myPage")
	public String myPageQuestionReply(HttpServletRequest req, @RequestParam int question_num) {
		QuestionDTO qdto = myPageMapper.getQuestion(question_num);
		req.setAttribute("getQuestion", qdto);
		return "myPage/myPageQuestionReply";
	}
	
	@RequestMapping("/myPageWriteReview.myPage")
	public String myPagaWriteReview() {
		return "myPage/myPageWriteReview";
	}

	@RequestMapping("/myPageLikeReview.myPage")
	public String myPagaLikeReview() {
		return "myPage/myPageLikeReview";
	}

	@RequestMapping("/myPageTest.myPage")
	public String myPageTest() {
		return "myPage/myPageTest";
	}
<<<<<<< HEAD
  
	@RequestMapping(value="memberDelete.myPage", method=RequestMethod.GET)
	public String memberDelete() {
	return "myPage/memberDelete";
	}
	
	@RequestMapping(value="memberDelete.myPage", method=RequestMethod.POST)
	public String memberDeleteOK(HttpServletRequest req, String raw_password) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");
		int mem_num = dto.getMem_num();
		
		
		String mem_password = memberMapper.getMemberPassword(mem_num);
		
		System.out.println(mem_password);
		System.out.println(raw_password);
		if(mem_password.equals(raw_password)) {
			System.out.println(mem_password);
         int res = memberMapper.deleteMember(mem_num, mem_password);
 		System.out.println(raw_password);
         
         if(res>0){
				session.invalidate();
				
				req.setAttribute("msg", "회원 탈퇴되었습니다.");
				req.setAttribute("url", "index.do");
			}else { 
				req.setAttribute("msg", "회원 탈퇴에 실패하였습니다. 다시 시도해주세요.");
				req.setAttribute("url", "memberDelete.myPage");
			}
		}else {
			req.setAttribute("msg", "비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			req.setAttribute("url", "memberDelete.myPage");
		}
		
		return "message"; 
	}
=======


>>>>>>> 박다슬
}
		 



