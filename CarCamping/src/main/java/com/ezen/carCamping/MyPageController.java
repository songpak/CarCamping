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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ProductCartDTO;
import com.ezen.carCamping.dto.QuestionDTO;
import com.ezen.carCamping.dto.RegionDTO;

import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
import com.ezen.carCamping.pagination.Pagination;

import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;

import com.ezen.carCamping.service.MemberMapper;
import com.ezen.carCamping.service.MyPageMapper;
import com.ezen.carCamping.service.ProductMapper;
import com.ezen.carCamping.service.RegionMapper;
import com.ezen.carCamping.service.S3FileService;

import com.ezen.carCamping.dto.RentalLogDTO;



@Controller
public class MyPageController {

	@Autowired
	private MyPageMapper myPageMapper;


	@Autowired
	private MemberMapper memberMapper;

    @Autowired
    private S3FileService S3FileService;
	
	@Autowired
	private RegionMapper RegionMapper;
	@Autowired
	private ProductMapper productMapper;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	

	private static Pagination pagination = Pagination.getInstance();

	@RequestMapping("/myPageCart.myPage")
	public String myPageCart(HttpServletRequest req, ProductCartDTO dto){
		HttpSession session = req.getSession();
		int mem_num = (int)session.getAttribute("mem_num");
		if (mem_num <= 0) {
			String msg = "로그인 해주세요!";
			String url = "login.login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		/*if (cart_from == "" || cart_to == "") {
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
		} else {*/
			int res = myPageMapper.insertCart(dto);
			if (res > 0) {
				System.out.println("장바구니 넣기 성공");
			}
			else {
				System.err.println("장바구니 넣기 실패");
			}
			
			List<ProductCartDTO> list = myPageMapper.cartProduct(mem_num);
			session.setAttribute("cartList", list);
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
				if (prod_num == cartDTO.getProductDTO().getProd_num() && cart_from.equals(cartDTO.getCart_from())
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
			if (prod_num == cartDTO.getProductDTO().getProd_num() && cart_from.equals(cartDTO.getCart_from())
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
		int mem_num = (int) session.getAttribute("mem_num");
		List<ProductCartDTO> list = myPageMapper.cartProduct(mem_num);
		String msg = null, url = null;
		if (list.size() == 0) {
			msg = "장바구니가 비었습니다! 상품을 추가해 주세요";
			msg = "장바구니가 비었습니다! 용품을 장바구니에 추가해 주세요!";
			url = "goProduct.product";
		} else {
			msg = "결제 페이지로 이동합니다!";
			url = "Pay.myPage";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}


	@RequestMapping("Pay.myPage")//결제폼
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

	@RequestMapping(value="myPageProfile.myPage", method=RequestMethod.POST)
	   public String memberUpdateOk(HttpServletRequest req, @ModelAttribute MemberDTO dto, BindingResult result) {
	      MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
	      MultipartFile mf = mr.getFile("mem_image");
	      RegionDTO rdto = new RegionDTO();
	      String filename = mf.getOriginalFilename();
	   
	      if (filename != null && !(filename.trim().equals(""))) {
	         File file = new File(uploadPath, filename);
	         try {
	            dto.setMem_image(S3FileService.upload(mf));
	         } catch (IOException e1) {
	            // TODO Auto-generated catch block
	            e1.printStackTrace();
	         }
	         try {
	            mf.transferTo(file);
	         }catch(IOException e) {
	            e.printStackTrace();
	            }
	      }

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
	public String myPageQuestion(HttpServletRequest req, @RequestParam(required=false,defaultValue="1") int page) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");
		int mem_num = dto.getMem_num();
		List<QuestionDTO> qdto =  new ArrayList<QuestionDTO>();

		qdto = myPageMapper.myPageGetQuestionSelectMember(mem_num);
		req.setAttribute("listBoard", qdto);
		req.setAttribute("pageCount", pagination.pageCount(qdto));
		req.setAttribute("listBoard", pagination.getPagePost(page,qdto));
		return "myPage/myPageQuestion";
	}


	@RequestMapping(value="myPageContactUs.myPage", method=RequestMethod.GET)//마이페이지 컨텍어스
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
	

	@RequestMapping("/myPageWriteReview.myPage")//마이페이지 내가 쓴 리뷰목록
	public String myPageWriteReview(HttpServletRequest req, @RequestParam(required = false) String mode,
		@RequestParam(required=false,defaultValue="1") int page) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");
		int mem_num = dto.getMem_num();
		if (mode == null) {
			List<ReviewRegionDTO> rdto =  new ArrayList<ReviewRegionDTO>();
			rdto = myPageMapper.myPageGetWriteReviewRegion(mem_num);
			req.setAttribute("pageCount", pagination.pageCount(rdto));
			req.setAttribute("listRegion", pagination.getPagePost(page,rdto));
		
		}else {
			List<ReviewProductDTO> pdto =  new ArrayList<ReviewProductDTO>();
			pdto = myPageMapper.myPageGetWriteReviewProduct(mem_num);
			req.setAttribute("pageCount", pagination.pageCount(pdto));
			req.setAttribute("listProduct", pagination.getPagePost(page,pdto));
		}
		
		req.setAttribute("page", page);
		
		
		
		return "myPage/myPageWriteReview";

	}
	@RequestMapping("/myPageWriteReviewRegionView.myPage")
	public String myPageWriteReviewRegionView(HttpServletRequest req, HttpServletResponse rep, @RequestParam int review_num) {
		ReviewRegionDTO rdto = myPageMapper.getReviewRegion(review_num);
		req.setAttribute("getReviewRegion", rdto);
		///////////////////////////////////////////////////////////////////////////
		  HttpSession session = req.getSession();
		  MemberDTO mdto = (MemberDTO) session.getAttribute("mbdto");
		  if(mdto!=null) {
			  session.setAttribute("mem_num", mdto.getMem_num());
			  session.setAttribute("mem_id", mdto.getMem_id());
		  }else if(mdto == null){
			  System.out.println("로그인안해쓴ㄴ데여?");
			  req.setAttribute("msg", "로그인을 하시여 리뷰를 볼 수 있습니다 !\n로그인창으로 이동합니다.");
			  req.setAttribute("url","login.login");
			  return "message";
		  }
		
		Cookie[] cookies = req.getCookies();
		Cookie viewCookie = null;//鍮꾧탳荑좏궎
		
		// 荑좏궎媛� �엳�쓣 寃쎌슦 
        if (cookies != null && cookies.length > 0) { 
        	for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("cookie"+review_num)) viewCookie = cookies[i];
                // Cookie�쓽 name�씠 cookie(revie_num) ���씪移섑븯�뒗 荑좏궎瑜� viewCookie�뿉 �꽔�뼱以� 
            }
        }
        
        if (rdto != null) {
            // 留뚯씪 viewCookie媛� null�씪 寃쎌슦  荑좏궎瑜� �깮�꽦�빐�꽌 議고쉶�닔 利앷� 濡쒖쭅�쓣 泥섎━�븿.->�뾾�쑝硫� !泥섏쓬 �뱾�뼱媛꾧쾬�씠誘�濡�!
            if (viewCookie == null) {    
                // 荑좏궎 �깮�꽦(�씠由�, 媛�)
                Cookie newCookie = new Cookie("cookie"+review_num, "|" + review_num + "|");     
                // 荑좏궎 異붽�
                rep.addCookie(newCookie);
                // 荑좏궎瑜� 異붽� �떆�궎怨� 議고쉶�닔 利앷��떆�궡
                int result = RegionMapper.addReviewReadCount(review_num);
                rdto.setReview_readCount(rdto.getReview_readCount()+1);
                if(result>0) {
                    System.out.println("議고쉶�닔 利앷�");
                }else {
                    System.out.println("議고쉶�닔 利앷� �뿉�윭");
                }
            }//view 荑좏궎�뿉 媛믪씠 �엳�쑝硫� �씠誘� �뱾�뼱媛� 由щ럭 �씠誘�濡� 議고쉶�닔 利앷��븯吏��븡�쓬
            	
        }else { //dto媛� null�씠硫� �뿉�윭�럹�씠吏�濡� �씠�룞
        	return "/region/RegionErrorPage";
        }
        
		// �빐�떦 由щ럭�뿉 �엳�뒗 �씠誘몄� 留뚰겮留� �뒳�씪�씠�뱶 �깮�꽦�븯湲� �쐞�븿
		Class<? extends ReviewRegionDTO> cls = rdto.getClass();
		List<String> reviewImages = new java.util.ArrayList<>();
		for(int i=1;i<=5;i++) {
			String imageVar = "review_regionImage"+i;
			try {
				java.lang.reflect.Field f = cls.getDeclaredField(imageVar);
				f.setAccessible(true);
				String imageSrc = (String)f.get(rdto);
				System.out.println(imageSrc);
				if(imageSrc!=null) {
					reviewImages.add(imageSrc);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//id媛믪쓣 媛��졇�� 濡쒓렇 �궡�뿭 泥댄겕 �썑 踰꾪듉�쓽 �깋源붿쓣 寃곗젙 
		//HttpSession session = req.getSession();
		String id = (String) req.getSession().getAttribute("mem_id");
		if (id==null || id.equals("")) req.setAttribute("check", 0);
		else{
			int check = RegionMapper.checkReviewLikeLog(id, review_num);
			System.out.println("check = "+ check);
			req.setAttribute("check", check);
		}
					
		//req.setAttribute("selectedReview", rdto);
		req.setAttribute("reviewImageList", reviewImages); //�빐�떦 由щ럭�쓽 �씠誘몄� �씠由꾩쓣 ���옣

		return "myPage/myPageWriteReviewRegionView";
	}
	@RequestMapping("/myPageWriteReviewProductView.myPage")
	public String myPageWriteReviewProductView(HttpServletRequest req, HttpServletResponse rep, @RequestParam int rp_num) {
		ReviewProductDTO pdto = myPageMapper.getReviewProduct(rp_num);
		req.setAttribute("getReviewProduct", pdto);
		///////////////////////////////////////////////////////////////////////////
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("mbdto");
		if(mdto!=null) {
		session.setAttribute("mem_num", mdto.getMem_num());
		session.setAttribute("mem_id", mdto.getMem_id());
		}else if(mdto == null){
		System.out.println("로그인안해쓴ㄴ데여?");
		req.setAttribute("msg", "로그인을 하시여 리뷰를 볼 수 있습니다 !\n로그인창으로 이동합니다.");
		req.setAttribute("url","login.login");
		return "message";
		}
		
		Cookie[] cookies = req.getCookies();
		Cookie viewCookie = null;//鍮꾧탳荑좏궎
		
		// 荑좏궎媛� �엳�쓣 寃쎌슦 
		if (cookies != null && cookies.length > 0) { 
		for (int i = 0; i < cookies.length; i++) {
		if (cookies[i].getName().equals("cookie"+rp_num)) viewCookie = cookies[i];
		// Cookie�쓽 name�씠 cookie(revie_num) ���씪移섑븯�뒗 荑좏궎瑜� viewCookie�뿉 �꽔�뼱以� 
		}
		}
		
		if (pdto != null) {
		// 留뚯씪 viewCookie媛� null�씪 寃쎌슦  荑좏궎瑜� �깮�꽦�빐�꽌 議고쉶�닔 利앷� 濡쒖쭅�쓣 泥섎━�븿.->�뾾�쑝硫� !泥섏쓬 �뱾�뼱媛꾧쾬�씠誘�濡�!
		if (viewCookie == null) {    
		// 荑좏궎 �깮�꽦(�씠由�, 媛�)
		Cookie newCookie = new Cookie("cookie"+rp_num, "|" + rp_num + "|");     
		// 荑좏궎 異붽�
		rep.addCookie(newCookie);
		// 荑좏궎瑜� 異붽� �떆�궎怨� 議고쉶�닔 利앷��떆�궡
		int result = productMapper.addProductReviewReadCount(rp_num);
		pdto.setRp_readCount(pdto.getRp_readCount()+1);
		if(result>0) {
		System.out.println("議고쉶�닔 利앷�");
		}else {
		System.out.println("議고쉶�닔 利앷� �뿉�윭");
		}
		}//view 荑좏궎�뿉 媛믪씠 �엳�쑝硫� �씠誘� �뱾�뼱媛� 由щ럭 �씠誘�濡� 議고쉶�닔 利앷��븯吏��븡�쓬
		
		}else { //dto媛� null�씠硫� �뿉�윭�럹�씠吏�濡� �씠�룞
		return "/region/RegionErrorPage";
		}
		
		// �빐�떦 由щ럭�뿉 �엳�뒗 �씠誘몄� 留뚰겮留� �뒳�씪�씠�뱶 �깮�꽦�븯湲� �쐞�븿
		Class<? extends ReviewProductDTO> cls = pdto.getClass();
		List<String> rp_images = new java.util.ArrayList<>();
		for(int i=1;i<=5;i++) {
		String imageVar = "rp_image"+i;
		try {
		java.lang.reflect.Field f = cls.getDeclaredField(imageVar);
		f.setAccessible(true);
		String imageSrc = (String)f.get(pdto);
		System.out.println(imageSrc);
		if(imageSrc!=null) {
		rp_images.add(imageSrc);
		}
		}catch (Exception e) {
		e.printStackTrace();
		}
		}
		
		//id媛믪쓣 媛��졇�� 濡쒓렇 �궡�뿭 泥댄겕 �썑 踰꾪듉�쓽 �깋源붿쓣 寃곗젙 
		//HttpSession session = req.getSession();
		String id = (String) req.getSession().getAttribute("mem_id");
		if (id==null || id.equals("")) req.setAttribute("check", 0);
		else{
		int check = productMapper.checkProductReviewLikeLog(id, rp_num);
		System.out.println("check = "+ check);
		req.setAttribute("check", check);
		}
		
		//req.setAttribute("selectedReview", pdto);
		req.setAttribute("rp_imageList", rp_images); //�빐�떦 由щ럭�쓽 �씠誘몄� �씠由꾩쓣 ���옣
		return "myPage/myPageWriteReviewProductView";
	}
	@RequestMapping("/myPageWriteReviewRegionDelete.myPage")
	   public String deleteReviewRegion(HttpServletRequest req, @RequestParam int review_num) {
	      HttpSession session = req.getSession();
	      MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");
	      int mem_num = dto.getMem_num();
	      ////////////////////아마존 이미지 삭제//////////////////////////
	      ReviewRegionDTO rdto = myPageMapper.getReviewRegion(review_num);
	      Class<? extends ReviewRegionDTO> cls = rdto.getClass();
	      for(int i=1;i<=5;i++) {
	         String imageVar = "review_regionImage"+i;
	         try {
	            java.lang.reflect.Field f = cls.getDeclaredField(imageVar);
	            f.setAccessible(true);
	            String imageSrc = (String)f.get(rdto);
	            if(imageSrc!=null) {
	               S3FileService.deleteImage(imageSrc);
	            }
	         }catch(Exception e){
	               
	            }
	      }
	      ////////////////////////////////////////////////////////   
	      int res = myPageMapper.deleteReviewRegion(review_num);
	   
	      String msg = null, url = null;
	      if (res>0) {
	         msg = "리뷰를 삭제했습니다.";
	         url = "myPageWriteReview.myPage?mem_num="+mem_num;
	      }else {
	         msg = "리뷰를 삭제하지 못했습니다. 다시 시도해 주세요!";
	         url = "myPageWriteReview.myPage?mem_num="+mem_num;
	      }
	      req.setAttribute("msg", msg);
	      req.setAttribute("url", url);
	      return "message";   
	      
	   }
	

	 
	@RequestMapping("/myPageWriteReviewProductDelete.myPage")
	public String deleteReviewProduct(HttpServletRequest req, @RequestParam int rp_num) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");
		int mem_num = dto.getMem_num();
		int res = myPageMapper.deleteReviewProduct(rp_num);
		String msg = null, url = null;
		if (res>0) {
			msg = "리뷰를 삭제했습니다.";
			url = "myPageWriteReview.myPage?mem_num="+mem_num;
		}else {
			msg = "리뷰를 삭제하지 못했습니다. 다시 시도해 주세요!";
			url = "myPageWriteReview.myPage?mem_num="+mem_num;
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
		
}
