package com.ezen.carCamping;


import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import com.ezen.carCamping.dto.QuestionDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
import com.ezen.carCamping.service.MemberMapper;
import com.ezen.carCamping.service.MyPageMapper;


@Controller
public class MyPageController {

	@Autowired
	private MyPageMapper myPageMapper;

	
	@Autowired
	private MemberMapper memberMapper;
	
	@Resource(name="uploadPath")
			private String uploadPath;




	@RequestMapping("/myPageCart.myPage")
	public String myPageCart(HttpServletRequest req, ProductCartDTO dto, String cart_from,
			String cart_to, int mem_num, int agency_num)
			throws ParseException {
		//System.out.println(agency_num);
		//System.out.println(sdf.format(indate));
		//System.out.println(sdf.format(outdate));
		if (mem_num == 0) {
			String msg = ".로그인 하셔야 합니다!";

			String url = "login.login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";

		} 
		if (cart_from == "" || cart_to =="") {
			String msg = "대여날짜를 선택해 주세요!";
			String url = "goProduct.product";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date indate = sdf.parse(cart_from);
		Date outdate = sdf.parse(cart_to);
		Date time = new Date();
		String time1 = sdf.format(time);
		Date now = sdf.parse(time1);
			if (indate.compareTo(outdate) > 0) {
			String msg = "반납날짜보다 빌린날짜가 먼저여야 합니다!";
			String url = "goProduct.product";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		} else if (indate.compareTo(now) < 0) {
			String msg = "지난 날짜는 선택 할 수 없습니다.!";
			String url = "goProduct.product";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		} else {
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


	@RequestMapping("/myPageCart2.myPage") // 탑에서 장바구니 갈때
	public String myPageCart2(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if (session.getAttribute("mem_num") == null) {
			String msg = "로그인 하셔야 합니다";
			String url = "login.login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		} else {
			int mem_num = (int) session.getAttribute("mem_num");
			List<ProductCartDTO> list = myPageMapper.cartProduct(mem_num);
			session.setAttribute("cartList", list);
		}
		return "myPage/myPageCart";
	}


	@RequestMapping("mall_cartEdit.myPage") // 카트수정
	public String mall_cartEdit(HttpServletRequest req, int cart_prodCount, int prod_num, String cart_from,
			String cart_to) {
		//System.out.println("cart_from" + cart_from);
		//System.out.println("cart_from" + cart_to);
		HttpSession session = req.getSession();
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		if (cart_prodCount <= 0) {
			session.setAttribute("msg", "등록된 상품을 삭제 했습니다.");
			session.setAttribute("url", "mall_cartDel.myPage?prod_num=" + prod_num);
			return "message";
		} else {
			for (ProductCartDTO cartDTO : cart) {
				if (prod_num == cartDTO.getProd_num() && cart_from.equals(cartDTO.getCart_from())
						&& cart_to.equals(cartDTO.getCart_to())) {
					cartDTO.setCart_prodCount(cart_prodCount);
					int res = myPageMapper.updateCart(cartDTO);
					if (res > 0) {
						System.out.println("업데이트성공");
					} else {
						System.out.println("업데이트 실패");
					}
					break;
				}
			}
		}
		return "myPage/myPageCart";
	}



	@RequestMapping("mall_cartDel.myPage") // 카트삭제
	public String mall_cartDel(HttpServletRequest req, @RequestParam int prod_num, int cart_num, String cart_from,
			String cart_to) {
		//System.out.println("cart_from" + cart_from);
		//System.out.println("cart_from" + cart_to);
		HttpSession session = req.getSession();
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		for (ProductCartDTO cartDTO : cart) {
			if (prod_num == cartDTO.getProd_num() && cart_from.equals(cartDTO.getCart_from())
					&& cart_to.equals(cartDTO.getCart_to())) {
				cart.remove(cartDTO);
				int res = myPageMapper.deleteCart(cart_num);
				if (res > 0) {
					System.out.println("삭제 성공");
				} else {
					System.out.println("삭제 실패");
				}
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

			msg = "장바구니가 비었습니다!";
			url = "productView.product";
			
		} else {
			msg = "寃곗젣 �럹�씠吏�濡� �씠�룞�빀�땲�떎!";
			url = "Pay.myPage";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	

	@RequestMapping("Pay.myPage") 
	public String myPageCheckOut1(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int mem_num = (int) session.getAttribute("mem_num");
		List<ProductCartDTO> list = myPageMapper.cartProduct(mem_num);
		session.setAttribute("cartList", list);
		return "myPage/myPagePay";// 결제폼
	}
	
	@RequestMapping("myPageCheckOut.myPage")
	public String myPageCheckOut2(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int mem_num = (int) session.getAttribute("mem_num");
		int res= myPageMapper.payCart(mem_num);//장바구니 비우기
		if (res > 0) {
			System.out.println("결제 성공");
		} else {
			System.out.println("결제 실패");
		}
		return "myPage/myPageCheckOut";
	}
	
	@RequestMapping("/myPageRental.myPage")
	public String myPageRental(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if (session.getAttribute("mem_num") == null) {
			String msg = "로그인 하셔야 합니다";
			String url = "login.login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		} else {
			int mem_num = (int) session.getAttribute("mem_num");
			List<ProductCartDTO> list = myPageMapper.cartProduct(mem_num);
			session.setAttribute("cartList", list);
		}
		return "myPage/myPageRental";
	}

	@RequestMapping(value="myPageProfile.myPage", method=RequestMethod.GET)
	public String memberUpdate(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");  
		req.setAttribute("getMember", dto);
		
		return "myPage/myPageProfile";
	}
	@RequestMapping("/myPageProfile.myPage") // 프로필 상세보기
	public String myPageProfile() {

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


	
	@RequestMapping("/myPageQuestion.myPage")//마이페이지 문의목록
	public String myPageQuestion(HttpServletRequest req, int mem_num) {
		List<QuestionDTO> qdto =  new ArrayList<QuestionDTO>();
		qdto = myPageMapper.myPageGetQuestionSelectMember(mem_num);
		req.setAttribute("listBoard", qdto);
		return "myPage/myPageQuestion";
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
	// 전용재 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("/myPageLikeReview.myPage")
	public String myPagaLikeReview(HttpServletRequest req,@RequestParam (required = false) String mode) {
		HttpSession session = req.getSession();
		int mem_num = (int) session.getAttribute("mem_num");
		System.out.println("회원번호:"+mem_num);
		if(mode==null||mode.equals("")) {
			  List<ReviewProductDTO>list = myPageMapper.ReviewProductList(mem_num);
			  System.out.println("모드가 널 일때 값 :" + list);
			  session.setAttribute("ReviewProductList", list);
		}else if(mode.equals("ReviewProductList")) {  
			List<ReviewProductDTO>list = myPageMapper.ReviewProductList(mem_num);
			System.out.println("모드가 용품 일때 값 :" + list);
			session.setAttribute("ReviewProductList", list);
		}else if(mode.equals("ReviewRegionList")) {
			List<ReviewRegionDTO>list = myPageMapper.ReviewRegionList(mem_num);
			System.out.println("모드가 지역 일때 값 :" + list);
			session.setAttribute("ReviewRegionList", list);
		}
		req.setAttribute("mode", mode);
		System.out.println("모드 값:"+mode);
		return "myPage/myPageLikeReview";
	}   
	@RequestMapping("/myPageProductReview.myPage")
	public String myPageProductReview(HttpServletRequest req) {
		int mem_num = Integer.parseInt(req.getParameter("mem_num"));
		int rp_num = Integer.parseInt(req.getParameter("rp_num"));
		System.out.println("상세보기의 rp_num"+rp_num);
		System.out.println("상세보기의 mem_num"+mem_num);
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("mem_id");
		if (id==null || id.equals("")) req.setAttribute("check", 0);
		else{
			int check = myPageMapper.CountReviewLikeLog(id, rp_num);
			//System.out.println("check = "+ check);
			req.setAttribute("check", check);
		}
		ReviewProductDTO rplist =myPageMapper.ReviewProductNum(rp_num);
		System.out.println("리뷰프로덕트:"+rplist);
		req.setAttribute("mem_num", mem_num);
		req.setAttribute("rplist", rplist);
		return "myPage/myPageProductReview";
	}
	
	@RequestMapping("/myPageRegionReview.myPage")
	public String myPageRegionReview(HttpServletRequest req) {
		int mem_num = Integer.parseInt(req.getParameter("mem_num"));
		int review_num = Integer.parseInt(req.getParameter("review_num"));
		System.out.println("상세보기의 rp_num"+review_num);
		System.out.println("상세보기의 mem_num"+mem_num);
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("mem_id");
		if (id==null || id.equals("")) req.setAttribute("check", 0);
		else{
			int check = myPageMapper.CountReviewLikeLog(id, review_num);
			//System.out.println("check = "+ check);
			req.setAttribute("check", check);
		}
		ReviewRegionDTO rrlist=myPageMapper.ReviewRegionNum(review_num);
		System.out.println("rrlist:"+rrlist);
		req.setAttribute("mem_num", mem_num);
		req.setAttribute("rrlist", rrlist);
		return "myPage/myPageRegionReview";
	}
	
	@RequestMapping("/DeleteProductReview.myPage")
	public String DeleteProductReview(HttpServletRequest req,@RequestParam Map<String,String> map) {
//		int mem_num = Integer.parseInt(req.getParameter("mem_num"));
		int rp_num = Integer.parseInt(req.getParameter("rp_num"));
//		System.out.println("상세보기의 rp_num:"+rp_num);
//		System.out.println("상세보기의 mem_num:"+mem_num);
		int res = myPageMapper.DeleteProductReview(map);
		
//		System.out.println("삭제의 rp_num"+rp_num);
//		System.out.println("삭제의 mem_num"+mem_num);
		String msg =null, url = null;
		if (res>0) {
			res = myPageMapper.UpdateProductLikeLog(rp_num);
			msg = "목록에서 삭제되었습니다";
			url = "myPageLikeReview.myPage";
		}else {
			msg = "목록에서 실패되었습니다. 서비스 센터에 문의하세요";
			url = "myPageLikeReview.myPage";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message"; 
	}
	@RequestMapping("/DeleteReviewReview.myPage")
	public String DeleteReviewReview(HttpServletRequest req,@RequestParam Map<String,String> map){
		int res = myPageMapper.DeleteRegionReveiw(map);
		int review_num = Integer.parseInt(req.getParameter("review_num"));
		String msg =null, url = null;
		if (res>0) {
			res = myPageMapper.UpdateRegionLikeLog(review_num);
			msg = "목록에서 삭제되었습니다";
			System.out.println(msg);
			url = "myPageLikeReview.myPage";
		}else {
			msg = "목록에서 실패되었습니다. 서비스 센터에 문의하세요";
			url = "myPageLikeReview.myPage";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	

	@RequestMapping("/myPageTest.myPage")
	public String myPageTest() { 
		return "myPage/myPageTest"; 
	}

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
	
}
		 



