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

import com.ezen.carCamping.dto.ProductCartDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.service.MyPageMapper;
import com.ezen.carCamping.service.ProductMapper;

@Controller
public class MyPageController {

	@Autowired
	private MyPageMapper myPageMapper;

	@RequestMapping("/myPageCart.myPage")
	public String myPageCart(HttpServletRequest req, String indate, String outdate, int prod_num, int cart_prodCount) {

		HttpSession session = req.getSession();
		ProductCartDTO dto = myPageMapper.cartProduct(prod_num);
		dto.setCart_prodCount(cart_prodCount);
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		if (cart == null) {
			cart = new ArrayList<ProductCartDTO>();
		}
		cart.add(dto);
		session.setAttribute("cartList", cart);
		session.setAttribute("indate", indate);
		session.setAttribute("outdate", outdate);
		System.out.println("넘버 : " + prod_num);
		// System.out.println("날짜 : " + outdate);
		return "myPage/myPageCart";
	}

	/*
	 * @RequestMapping("/myPageCart2.myPage") public String
	 * myPageCart2(HttpServletRequest req, int prod_num) { HttpSession session =
	 * req.getSession(); List<ProductCartDTO> cart = (List)
	 * session.getAttribute("cartList"); return "myPage/myPageCart"; }
	 */

	@RequestMapping("mall_cartEdit.myPage")
	public String mall_cartEdit(HttpServletRequest req, int cart_prodCount, int prod_num) {
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
			url = "";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping("/myPageContactUs.myPage")
	public String myPageContactUs() {
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
