package com.ezen.carCamping;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.carCamping.dto.ProductCartDTO;
import com.ezen.carCamping.service.MyPageMapper;

@Controller
public class MyPageController {

	@Autowired
	private MyPageMapper myPageMapper;

	@RequestMapping("/myPageCart.myPage")
	public String myPageCart(HttpServletRequest req, ProductCartDTO dto, String cart_from,
			String cart_to, int mem_num, int agency_num)
			throws ParseException {
		System.out.println(agency_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date indate = sdf.parse(cart_from);
		Date outdate = sdf.parse(cart_to);
		Date time = new Date();
		String time1 = sdf.format(time);
		Date now = sdf.parse(time1);
		System.out.println(sdf.format(indate));
		System.out.println(sdf.format(outdate));
		if (mem_num == 0) {
			String msg = ".로그인 하셔야 합니다!";
			String url = "login.login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		} else if (cart_to == "" && cart_from == "") {
			String msg = "대여날짜를 선택해 주세요!";
			String url = "goProduct.product";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		} else if (indate.compareTo(outdate) > 0) {
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
				System.out.println("등록성공");
			} else {
				System.err.println("등록실패");
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
		System.out.println("cart_from" + cart_from);
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
					// 여기를 쿼리문으로 교체한다면?
					/*
					 * int res = myPageMapper.updateCart(cartDTO); if (res > 0) {
					 * System.out.println("업데이트성공"); } else { System.out.println("업데이트 실패"); }
					 */
					break;
				}
			}
		}
		return "myPage/myPageCart";
	}

	@RequestMapping("mall_cartDel.myPage") // 카트삭제
	public String mall_cartDel(HttpServletRequest req, @RequestParam int prod_num, int cart_num, String cart_from,
			String cart_to) {
		System.out.println("cart_from" + cart_from);
		System.out.println("cart_from" + cart_to);

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
			url = "";
		} else {
			msg = "결제 페이지로 이동합니다!";
			url = "Pay.myPage";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping("Pay.myPage") // 결제완료 페이지
	public String myPageCheckOut() {
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

	@RequestMapping("/myPageContactUs.myPage") // 컨텍어스
	public String myPageContactUs(HttpServletRequest req) {
		return "myPage/myPageContactUs";
	}

	@RequestMapping("/myPageProfile.myPage") // 프로필 상세보기
	public String myPageProfile() {
		return "myPage/myPageProfile";
	}

	@RequestMapping("/myPageQuestion.myPage")
	public String myPageQuestion() {
		return "myPage/myPageQuestion";
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

	@RequestMapping("/myPageProfileEdit.mypage")
	public String mypageProfileEdit() {
		return "myPage/myPageProfileEdit";
	}

}
