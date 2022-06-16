package com.ezen.carCamping;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.service.MyPageMapper;
import com.ezen.carCamping.service.ProductMapper;

@Controller
public class MyPageController {
	
	@Autowired
	   private MyPageMapper myPageMapper;
	
	//@Autowired
	//private ProductMapper productMapper;

	@RequestMapping("/myPageCart.myPage")
	public String myPageCart(HttpServletRequest req, String indate, String outdate, int prod_num) {
		Date date = new Date();        
		indate = String.format("%1$tY-%1$tm-%1$td", date);
		outdate = String.format("%1$tY-%1$tm-%1$td", date);
		HttpSession session = req.getSession();
		ProductDTO dto = myPageMapper.cartProduct(prod_num);
		List<ProductDTO> cart = (List)session.getAttribute("cartList");
		if(cart == null) {
			cart = new ArrayList<ProductDTO>();
		}
		cart.add(dto);
		session.setAttribute("cartList", cart);
		session.setAttribute("indate", indate);
		session.setAttribute("outdate", outdate);
	  // System.out.println("날짜 : " + indate);
	   //System.out.println("날짜 : " + outdate);
		return "myPage/myPageCart";
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
