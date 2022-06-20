package com.ezen.carCamping;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ProductCartDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.service.MyPageMapper;
import com.ezen.carCamping.service.ProductMapper;

@Controller
public class MyPageController {

	@Autowired
	private MyPageMapper myPageMapper;

	@RequestMapping("/myPageCart.myPage")//카트에 추가
	public String myPageCart(HttpServletRequest req,ProductCartDTO dto, String cart_prodCount, String cart_from, String cart_to) {
		//Cart에 상품을 DB에 저장 조건문 설정해줘야함
		 int res = myPageMapper.insertCart(dto);
		 if(res>0) {
			 System.out.println("등록성공");
		 }else {
			 System.err.println("등록실패");
		 }
		 //등록 끝 불러와서 cartList에 올려야함
		 HttpSession session = req.getSession();
		 List<ProductCartDTO> list = myPageMapper.cartProduct();
		 session.setAttribute("cartList", list);
			return "myPage/myPageCart";
	}

	@RequestMapping("/myPageCart2.myPage")//나중에 회원번호 추가해서 넘겨주기!
	public String myPageCart2(HttpServletRequest req) {
		HttpSession session = req.getSession();
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		session.setAttribute("cartList", cart);
		return  "myPage/myPageCart";
	}
	  
	@RequestMapping("mall_cartEdit.myPage")//물건 갯수 수정
	public String mall_cartEdit(HttpServletRequest req, int cart_prodCount, int prod_num,ProductCartDTO dto) {
		int res = myPageMapper.updateCart(dto);
		if(res>0) {
			System.out.println("수정성공");
		}else {
			System.out.println("수정실패");
		}
		HttpSession session = req.getSession();
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		if (cart_prodCount <= 0) {
			session.setAttribute("msg", "상품수량 : 0개 ! 장바구니에서 삭제합니다.");
			session.setAttribute("url", "mall_cartDel.myPage?prod_num=" + prod_num);
			return "message";
		} else {
			for (ProductCartDTO cartDTO : cart) {
				if (prod_num == cartDTO.getProd_num()) {
					cartDTO.setCart_prodCount(cart_prodCount);
				}
			}
		}
		System.out.println("갯수" + cart_prodCount);
		System.out.println("넘버" + prod_num);
		return "myPage/myPageCart";
	}

	@RequestMapping("mall_cartDel.myPage") // 카트에서 삭제
	public String mall_cartDel(HttpServletRequest req, @RequestParam int prod_num) {
		int res = myPageMapper.deleteCart(prod_num);
		if(res>0) {
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제실패");
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
			msg = "결제하실 상품이 없습니다. 장바구니에 추가해 주세요!";
			url = "";
		} else {
			msg = "결제 페이지로 이동합니다!";
			url = "Pay.myPage";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping("Pay.myPage") //결제완료 페이지
		public String myPageCheckOut() {
			return "myPage/myPageCheckOut";
		}
	
	@RequestMapping("/myPageContactUs.myPage")
	public String myPageContactUs(HttpServletRequest req) {
		return "myPage/myPageContactUs";
	}

	@RequestMapping("/myPageProfile.myPage")
	public String myPageProfile() {
		return "myPage/myPageProfile";
	}

	@RequestMapping("/myPageQuestion.myPage")
	public String myPageQuestion() {
		return "myPage/myPageQuestion";
	}

	@RequestMapping("/myPageRental.myPage")
	public String myPageRental() {
		return "myPage/myPageRental";
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
