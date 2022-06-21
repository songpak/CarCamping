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

	@RequestMapping("Pay.myPage") // 寃곗젣�셿猷� �럹�씠吏�
	public String myPageCheckOut() {
		return "myPage/myPageCheckOut";
	}

	@RequestMapping("/myPageContactUs.myPage")//留덉씠�럹�씠吏� 而⑦뀓�뼱�뒪
	public String myPageContactUs(HttpServletRequest req) {
		return "myPage/myPageContactUs";
	}

	@RequestMapping("/myPageProfile.myPage")//留덉씠�럹�씠吏� �봽濡쒗븘 蹂닿린
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
