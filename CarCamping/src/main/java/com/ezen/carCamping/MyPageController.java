package com.ezen.carCamping;

<<<<<<< HEAD
import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
=======
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
>>>>>>> 신웅(장소)

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.service.MemberMapper;
=======
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ProductCartDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.service.MyPageMapper;
import com.ezen.carCamping.service.ProductMapper;
>>>>>>> 신웅(장소)

@Controller
public class MyPageController {
	
	@Autowired
	   private MemberMapper memberMapper;
	   

	   @Resource(name="uploadPath")
		private String uploadPath;

	@Autowired
	private MyPageMapper myPageMapper;

	@RequestMapping("/myPageCart.myPage") // īƮ�� �߰�
	public String myPageCart(HttpServletRequest req, ProductCartDTO dto, String cart_from, String cart_to, int mem_num) {
		if (mem_num == 0) {
			String msg = "�α����� �ؾ� �뿩 �� �� �ֽ��ϴ�!";
			String url = "login.login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		} else if(cart_to == "" && cart_from == "") {
			String msg = "�뿩 ��¥�� ���� �ϼž� �մϴ�!";
			String url = "goProduct.product";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}else {
			int res = myPageMapper.insertCart(dto);
			if (res > 0) {
				System.out.println("��ϼ���");
			} else {
				System.err.println("��Ͻ���");
			}
			HttpSession session = req.getSession();
			List<ProductCartDTO> list = myPageMapper.cartProduct(mem_num);
			session.setAttribute("cartList", list);
		}
		return "myPage/myPageCart";
	}

	@RequestMapping("/myPageCart2.myPage") // ���߿� ȸ����ȣ �߰��ؼ� �Ѱ��ֱ�!
	public String myPageCart2(HttpServletRequest req) {
		HttpSession session = req.getSession();
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		session.setAttribute("cartList", cart);
		return "myPage/myPageCart";
	}

	@RequestMapping("mall_cartEdit.myPage") // ���� ���� ����
	public String mall_cartEdit(HttpServletRequest req, int cart_prodCount, int prod_num, ProductCartDTO dto) {
		int res = myPageMapper.updateCart(dto);
		if (res > 0) {
			System.out.println("��������");
		} else {
			System.out.println("��������");
		}
		HttpSession session = req.getSession();
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		if (cart_prodCount <= 0) {
			session.setAttribute("msg", "��ǰ���� : 0�� ! ��ٱ��Ͽ��� �����մϴ�.");
			session.setAttribute("url", "mall_cartDel.myPage?prod_num=" + prod_num);
			return "message";
		} else {
			for (ProductCartDTO cartDTO : cart) {
				if (prod_num == cartDTO.getProd_num()) {
					cartDTO.setCart_prodCount(cart_prodCount);
				}
			}
		}
		System.out.println("����" + cart_prodCount);
		System.out.println("�ѹ�" + prod_num);
		return "myPage/myPageCart";
	}

	@RequestMapping("mall_cartDel.myPage") // īƮ���� ����
	public String mall_cartDel(HttpServletRequest req, @RequestParam int prod_num) {
		int res = myPageMapper.deleteCart(prod_num);
		if (res > 0) {
			System.out.println("��������");
		} else {
			System.out.println("��������");
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
			msg = "�����Ͻ� ��ǰ�� �����ϴ�. ��ٱ��Ͽ� �߰��� �ּ���!";
			url = "";
		} else {
			msg = "���� �������� �̵��մϴ�!";
			url = "Pay.myPage";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping("Pay.myPage") // �����Ϸ� ������
	public String myPageCheckOut() {
		return "myPage/myPageCheckOut";
	}

	@RequestMapping("/myPageContactUs.myPage")
	public String myPageContactUs(HttpServletRequest req) {
		return "myPage/myPageContactUs";
	}
<<<<<<< HEAD
	
=======

	@RequestMapping("/myPageProfile.myPage")
	public String myPageProfile() {
		return "myPage/myPageProfile";
	}

>>>>>>> 신웅(장소)
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
<<<<<<< HEAD
	
	@RequestMapping(value="myPageProfile.myPage", method=RequestMethod.GET)
	public String memberUpdate(HttpServletRequest req, @RequestParam int mem_num) {
		
		MemberDTO dto = memberMapper.getMember(mem_num);
		req.setAttribute("getMember", dto);
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
			msg = "������ ���� ����!";
			url = "myPageProfile.myPage";
		}else {
			msg = "������ ���� ����! �ٽ� �õ��� �ּ���.";
			url = "myPageProfile.myPage?mem_num=" + dto.getMem_num();
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
=======

	@RequestMapping("/myPageTest.myPage")
	public String myPageTest() {
		return "myPage/myPageTest";
	}

	@RequestMapping("/myPageProfileEdit.mypage")
	public String mypageProfileEdit() {
		return "myPage/myPageProfileEdit";
>>>>>>> 신웅(장소)
	}

}
