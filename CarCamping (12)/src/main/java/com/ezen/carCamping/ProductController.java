package com.ezen.carCamping;

<<<<<<< HEAD
=======
import java.io.File; 

import java.io.IOException;
>>>>>>> Ïû¨ÏòÅ(Í¥ÄÎ¶¨Ïûê)
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.service.ProductMapper;

@Controller
public class ProductController {

	@Autowired
	private ProductMapper productMapper;

	// øÎ«∞∏ﬁ¿Œ ƒ¡∆Æ∑—∑Ø
	@RequestMapping("/goProduct.product")
	public String goProduct(HttpServletRequest req, @RequestParam Map<String, String> params) {
			List<ProductDTO> list = null;
			String search = params.get("search");
			String searchString = params.get("searchString");
			if (searchString == null) {
				list = productMapper.listProduct();
			} else {
				list = productMapper.findProduct(search, searchString);
			}
			List<ProductDTO> popList = productMapper.popularProduct();
			System.out.println("¿Œ±‚∏ÆΩ∫∆Æ" + popList);
			req.setAttribute("popList", popList); // ¿Œ±‚øÎ«∞ ∏ÆΩ∫∆Æ ¿˙¿ÂΩ√≈≤∞Ã¥œ¥Ÿ
			req.setAttribute("listProduct", list);
		return "product/productMain";

	}

	// ∏Æ∫‰∏Ò∑œ ƒ¡∆Æ∑—∑Ø
	@RequestMapping("/productView.product")
	public String productView(HttpServletRequest req, @RequestParam Map<String, String> params, int prod_num) {
			List<ReviewProductDTO> list = null;
			String search = params.get("search");
			String searchString = params.get("searchString");
			if (searchString == null) {
				list = productMapper.listProdReview(prod_num);
			} else {
				list = productMapper.findReview(search, searchString);
			}
			req.setAttribute("getProduct", productMapper.getProduct(prod_num));
			req.setAttribute("ReList", list);
		return "product/productView";
	}

	// øÎ«∞ ∏Æ∫‰ªÛºº∫∏±‚ ƒ¡∆Æ∑—∑Ø
	@RequestMapping("/productReviewView.product")
	public String productReviewView(HttpServletRequest req, int rp_num) {
		HttpSession session = req.getSession();
		if (session.getAttribute("mem_num") == null) {
			String msg = "∑Œ±◊¿Œ «œº≈æﬂ ∫º ºˆ ¿÷Ω¿¥œ¥Ÿ!";
			String url = "login.login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}else {
			List<ReviewProductDTO> list = productMapper.getReviewView(rp_num);
			req.setAttribute("getRv", list);
		}
		return "product/productReviewView";
	}
}
