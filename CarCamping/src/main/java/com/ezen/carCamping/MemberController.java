package com.ezen.carCamping;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.service.MemberMapper;



@Controller
public class MemberController {
   
   @Autowired
   private MemberMapper memberMapper;
   
   @Autowired
   private JavaMailSenderImpl mailSender;
   

   @Resource(name="uploadPath")
	private String uploadPath;
   
   @RequestMapping(value="login.login", method=RequestMethod.GET)
   public String login(HttpServletRequest req) {
	   HttpSession session = req.getSession();
	   String referer = req.getHeader("Referer");
	      String re_url = null;
	      if(referer.indexOf("index.do")>0) {
	         System.out.println("이전 페이지 : "+referer); // 메인페이지 -> 로그인페이지 -> 메인페이지
	         session.setAttribute("re_url", referer);
	      }else {
	          System.out.println("이전 페이지 : "+referer); //메인페이지가 아닌 다른 페이지 -> 로그인 페이지 -> 메인페이지가 아닌 다른 페이지
	          session.setAttribute("re_url", referer);
	      } 
      return "login/login";
   }
   
@RequestMapping(value="findID.login", method=RequestMethod.GET)
   public String searchMemberID() {
      return "login/findID";
   }
   
   @RequestMapping(value="findPW.login", method=RequestMethod.GET)
   public String searchMemberPW() {
      return "login/findPW";
   }
   
   @RequestMapping(value="findID.login", method=RequestMethod.POST)
   public String checkMemberID(HttpServletRequest req, 
                           @RequestParam Map<String, String> params) {
      String msg = memberMapper.searchMemberID(params);
      String url = "login.login";
      req.setAttribute("msg", msg);
      req.setAttribute("url", url);
      return "message";
   }
   
   @RequestMapping(value="findPW.login", method=RequestMethod.POST)
   public String checkMemberPW(HttpServletRequest req, 
                           @RequestParam Map<String, String> params) {
      String msg = memberMapper.searchMemberPW(params);
      String url = "login.login";
      req.setAttribute("msg", msg);
      req.setAttribute("url", url);
      return "message";
   }

   
   
   @RequestMapping(value="login.login", method=RequestMethod.POST)
   public String loginOk(HttpServletRequest req, HttpServletResponse resp,         
         @RequestParam Map<String, String> params) {
	  int login_success = 1;
      String msg = null, url = null;
      HttpSession session = req.getSession();
      if ( session.getAttribute("mbdto") != null ){// 기존에 login이란 세션 값이 존재한다면            
    	   session.removeAttribute("mbdto"); // 기존값을 제거함
      }

      MemberDTO dto = memberMapper.getMemberId(params.get("mem_id"));
      

      if (dto == null){   
          msg = "해당하는 아이디가 없습니다. 다시 확인하고 로그인해 주세요!!";
          url = "login.login";
       }else { 
    	   if (params.get("mem_password").equals(dto.getMem_password())){
    		msg = dto.getMem_id()+"님, 환영합니다!!";
    		url = (String) session.getAttribute("re_url");
            login_success = 0;
            session.setAttribute("mem_num",  dto.getMem_num());
            session.setAttribute("mbdto", dto);
            MemberDTO mdto = (MemberDTO)session.getAttribute("mbdto"); 
            req.setAttribute("getMember", mdto);
            
    	  	Cookie loginCookie = new Cookie("loginCookie", dto.getMem_id());
    	  	if (params.containsKey("loginCookie") ){	
          	loginCookie.setPath("/");
          	loginCookie.setMaxAge(60*60*24*3); // 유효시간 3일     
          	resp.addCookie(loginCookie);
   			String value =loginCookie.getValue(); 
   			MemberDTO mbdto = memberMapper.getMemberId(value);
   			session.setAttribute("mem_num", mbdto.getMem_num());
   			session.setAttribute("mbdto", mbdto);  
    	  	}else {
          	loginCookie.setMaxAge(0);
    	  	}
    	  	
            Cookie ck = new Cookie("saveId", dto.getMem_id());
            if (params.containsKey("saveId")){
               ck.setMaxAge(60*60*24);
            }else {
               ck.setMaxAge(0);
            }
            resp.addCookie(ck);
         }else {   
            msg = "비밀번호가 틀렸습니다. 다시 확인하고 로그인해 주세요!!";
            url = "login.login";
         }
       }	   
      req.setAttribute("msg", msg);
      req.setAttribute("url", url);

	  //Cookie ck2 = new Cookie("stopId", dto.getMem_id());
      // ck2.setMaxAge(24*60*60);
     // resp.addCookie(ck2);
	 // url="index.do";
	 // msg ="5번 이상 로그인에 실패하여 하루동안 로그인이 불가능합니다.";
	  
	  

      return "message";
   }
   
   @RequestMapping(value="sign.login", method=RequestMethod.GET)
   public String sign() {
      return "login/sign";
   }
   
   @RequestMapping(value="sign.login", method=RequestMethod.POST)
   public String signOK(HttpServletRequest req,@ModelAttribute MemberDTO dto, BindingResult result) {
	   MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("mem_image");
		String filename = mf.getOriginalFilename();
		dto.setMem_image(filename);
		if (filename != null && !(filename.trim().equals(""))) {
			File file = new File(uploadPath, filename);
			try {
				mf.transferTo(file);
			}catch(IOException e) {
				e.printStackTrace();
				}
		}
	  RegionDTO rdto = new RegionDTO();
      rdto.setRegion_num(Integer.parseInt(req.getParameter("region_num")));
      dto.setRegionDTO(rdto);
      int res = memberMapper.insertMember(dto);
      
       if (res>0) {
          req.setAttribute("msg", "회원가입 성공 ^__^");
          req.setAttribute("url", "index.do");
       }else {
          req.setAttribute("msg", "회원가입 실패ㅠ_ㅠ");
          req.setAttribute("url", "sign.login");
          
       }
      return "message";
   }
   
   @RequestMapping("/logout.login")
   public String logout(HttpServletRequest req, HttpServletResponse resp, @RequestParam Map<String, String> params) {
	   HttpSession session = req.getSession();
	   	Cookie[] cookie = req.getCookies();
	   	if(cookie !=null) {
	    for(int i=0; i < cookie.length; i++){
	         if(cookie[i].getName().equals("loginCookie")){
	        	 cookie[i].setMaxAge(0);
	             resp.addCookie(cookie[i]);
	             break;
	         	}
	         }
	    }
	    req.getSession().invalidate();
		req.setAttribute("msg", "로그아웃 되었습니다.");
		req.setAttribute("url", "index.do");
		return "message";
	   	
   }
	   	
   
	@RequestMapping("/checkId.login")
	public String checkID(HttpServletRequest req, @RequestParam String mem_id) {	
		  MemberDTO dto = memberMapper.getMemberId(mem_id);
	      int result = -1;
		  if (dto == null){   
	    	  result= 1;
	      }else {
	    	  result = 0;
	      }
		  req.setAttribute("result", result);
	      return "login/checkId";
	   }
	
	@RequestMapping("/checkNick.login")
	public String checkNick(HttpServletRequest req, @RequestParam String mem_nickName) {	
		  MemberDTO dto = memberMapper.getMemberNick(mem_nickName);
	      int result = -1;
		  if (dto == null){   
	    	  result= 1;
	      }else {
	    	  result = 0;
	      }
		  req.setAttribute("result", result);
	      return "login/checkNick";
	   }
	
  @RequestMapping("/checkEmail.login")
  public String checkEmail(HttpServletRequest req, @RequestParam String mem_email) {	
	  MemberDTO dto = memberMapper.getMemberEmail(mem_email);
      int result = -1;
	  if (dto == null){   
    	  result= 1;
      }else {
    	  result = 0;
      }
	  req.setAttribute("result", result);
      return "login/checkEmail";
   }
  @RequestMapping(value = "/CertifyEmail.login", method = RequestMethod.GET)
  @ResponseBody
  public String CertifyEmail(@RequestParam("mem_email") String mem_email) throws Exception{
    int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
    
    String from = "qkzptjd5440@naver.com";//보내는 이 메일주소
    String to = mem_email;
    String title = "회원가입시 필요한 인증번호 입니다.";
    String content = "[인증번호] "+ serti +" 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
    String num = "";
    try {
    	MimeMessage mail = mailSender.createMimeMessage();
        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
        
        mailHelper.setFrom(from);
        mailHelper.setTo(to);
        mailHelper.setSubject(title);
        mailHelper.setText(content, true);       
        
        mailSender.send(mail);
        num = Integer.toString(serti);
        
    } catch(Exception e) {
        num = "error";
    }
    return num;
}
 
 
}

	
   
