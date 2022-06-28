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
import com.ezen.carCamping.dto.RentalLogDTO;
import com.ezen.carCamping.service.MemberMapper;
import com.ezen.carCamping.service.MyPageMapper;

@Controller
public class MyPageController {

	@Autowired
	private MyPageMapper myPageMapper;

	@Autowired
	private MemberMapper memberMapper;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping("/myPageCart.myPage")
	public String myPageCart(HttpServletRequest req, ProductCartDTO dto, String cart_from, String cart_to, int mem_num,
			int agency_num) throws ParseException {
		// System.out.println(agency_num);
		// System.out.println(sdf.format(indate));
		// System.out.println(sdf.format(outdate));
		if (mem_num == 0) {
			String msg = ".로그인 하셔야 합니다!";

			String url = "login.login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		if (cart_from == "" || cart_to == "") {
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
				System.out.println("장바구니 넣기 성공");
			} else {
				System.err.println("장바구니 넣기 실패");
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
		System.out.println("prodNum" + prod_num);
		System.out.println("cart_from" + cart_to);
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
		// System.out.println("cart_from" + cart_from);
		// System.out.println("cart_from" + cart_to);
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

	@RequestMapping("checkOut.myPage")//장바구니 결제버튼 눌렀을때
	public String checkOut(HttpServletRequest req) {
		HttpSession session = req.getSession();
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		String msg = null, url = null;
		if (cart == null) {
			msg = "장바구니가 비었습니다!";
			url = "productView.product";
		} else {
			msg = "결제 페이지로 이동합니다!";
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
		return "myPage/myPagePay";
	}
	
	@RequestMapping("myPageCheckOut.myPage")//결제폼에서 결제버튼 눌렀을떄
	public String myPageCheckOut2(HttpServletRequest req, int cart_num
			,RentalLogDTO dto, @RequestParam Map<String, String> params,@RequestParam Map<String, String> params2, int rental_usePoint) {
		System.out.println("포인트" + rental_usePoint);
		//System.out.println("대여날짜" + cart_from);
		HttpSession session = req.getSession();
		//List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
				int res2 = myPageMapper.insertCartLog(params);
				if (res2 > 0) {
					System.out.println("로그 입력 성공");
				} else {
					System.out.println("삭로그 입력제 실패");
				}
				int res3 = myPageMapper.updateCartLogPoint(params2);
				if (res3 > 0) {
					System.out.println("포인트 변경 성공");
				} else {
					System.out.println("포인트 변경 실패");
				}
				
		//로그 테이블에 인서트 할 곳
		//int mem_num = (int) session.getAttribute("mem_num");
		int res = myPageMapper.payCart(cart_num);
		if (res > 0) {
			System.out.println("결제후 장바구니 삭제 성공");
		} else {
			System.err.println("결제후 장바구니 삭제 실패");
		}
		return "myPage/myPageCheckOut";
	}
	
	//----------------------------------------------------------------------------------------------------

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

	@RequestMapping(value = "myPageProfile.myPage", method = RequestMethod.GET)
	public String memberUpdate(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("mbdto");
		req.setAttribute("getMember", dto);

		return "myPage/myPageProfile";
	}

	@RequestMapping("/myPageProfile.myPage") // 프로필 상세보기
	public String myPageProfile() {

		return "myPage/myPageProfile";
	}

	@RequestMapping(value = "myPageProfile.myPage", method = RequestMethod.POST)
	public String memberUpdateOk(HttpServletRequest req, @ModelAttribute MemberDTO dto, BindingResult result) {
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile mf = mr.getFile("mem_image");
		String filename = mf.getOriginalFilename();
		dto.setMem_image(filename);
		if (filename != null && !(filename.trim().equals(""))) {
			File file = new File(uploadPath, filename);
			try {
				mf.transferTo(file);
			} catch (IOException e) {
			}
		} else {
			filename = req.getParameter("mem_image2");
		}
		dto.setMem_image(filename);
		RegionDTO rdto = new RegionDTO();
		rdto.setRegion_num(Integer.parseInt(req.getParameter("region_num")));
		dto.setRegionDTO(rdto);

		int res = memberMapper.updateMember(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "내정보 수정 성공!";
			url = "myPageProfile.myPage";
		} else {
			msg = "내정보 수정 실패! 다시 시도해 주세요.";
			url = "myPageProfile.myPage?mem_num=" + dto.getMem_num();
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping("/myPageQuestion.myPage") // 마이페이지 문의목록
	public String myPageQuestion(HttpServletRequest req, int mem_num) {
		List<QuestionDTO> qdto = new ArrayList<QuestionDTO>();
		qdto = myPageMapper.myPageGetQuestionSelectMember(mem_num);
		req.setAttribute("listBoard", qdto);
		return "myPage/myPageQuestion";
	}

	@RequestMapping(value = "myPageContactUs.myPage", method = RequestMethod.GET) // 마이페이지 컨텍어스
	public String myPageContactUs() {
		return "myPage/myPageContactUs";
	}

	@RequestMapping(value = "myPageContactUs.myPage", method = RequestMethod.POST)
	public String myPageContactUsOk(HttpServletRequest req, QuestionDTO qdto, @RequestParam int mem_num) {
		MemberDTO dto = new MemberDTO();
		dto.setMem_num(Integer.parseInt(req.getParameter("mem_num")));
		qdto.setMemberDTO(dto);
		req.setAttribute("mem_num", mem_num);
		int res = myPageMapper.insertQuestion(qdto);
		if (res > 0) {
			req.setAttribute("msg", "문의사항을 접수했습니다.");
		} else {
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

	@RequestMapping(value = "memberDelete.myPage", method = RequestMethod.GET)
	public String memberDelete() {
		return "myPage/memberDelete";
	}

	@RequestMapping(value = "memberDelete.myPage", method = RequestMethod.POST)
	public String memberDeleteOK(HttpServletRequest req, String raw_password) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("mbdto");
		int mem_num = dto.getMem_num();

		String mem_password = memberMapper.getMemberPassword(mem_num);

		System.out.println(mem_password);
		System.out.println(raw_password);
		if (mem_password.equals(raw_password)) {
			System.out.println(mem_password);
			int res = memberMapper.deleteMember(mem_num, mem_password);
			System.out.println(raw_password);

			if (res > 0) {
				session.invalidate();

				req.setAttribute("msg", "회원 탈퇴되었습니다.");
				req.setAttribute("url", "index.do");
			} else {
				req.setAttribute("msg", "회원 탈퇴에 실패하였습니다. 다시 시도해주세요.");
				req.setAttribute("url", "memberDelete.myPage");
			}
		} else {
			req.setAttribute("msg", "비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			req.setAttribute("url", "memberDelete.myPage");
		}

		return "message";
	}

}
