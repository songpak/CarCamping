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
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
      MemberDTO dto = memberMapper.getMemberId(params.get("mem_id"));
      
      
      String msg = null, url = null;
      if (dto == null){   
         msg = "�빐�떦�븯�뒗 �븘�씠�뵒媛� �뾾�뒿�땲�떎. �떎�떆 �솗�씤�븯怨� 濡쒓렇�씤�빐 二쇱꽭�슂!!";
         url = "login.login";
      }else {
         if (params.get("mem_password").equals(dto.getMem_password())){
        	
            msg = dto.getMem_id()+"�떂, �솚�쁺�빀�땲�떎!!";
            url = "index.do";
            HttpSession session = req.getSession();
            session.setAttribute("mbdto", dto);
            Cookie ck = new Cookie("saveId", dto.getMem_id());
            if (params.containsKey("saveId")){
               ck.setMaxAge(0);
            }else {
               ck.setMaxAge(24*60*60);
            }
            resp.addCookie(ck);
         }else {   
            msg = "鍮꾨�踰덊샇媛� ���졇�뒿�땲�떎. �떎�떆 �솗�씤�븯怨� 濡쒓렇�씤�빐 二쇱꽭�슂!!";
            url = "login.login";
         }
      }
      req.setAttribute("msg", msg);
      req.setAttribute("url", url);
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
          req.setAttribute("msg", "�쉶�썝媛��엯 �꽦怨� ^__^");
          req.setAttribute("url", "index.do");
       }else {
          req.setAttribute("msg", "�쉶�썝媛��엯 �떎�뙣�뀪_�뀪");
          req.setAttribute("url", "sign.login");
          
       }
      return "message";
   }
   
   @RequestMapping("/logout.login")
   public String logout(HttpServletRequest req) {
	   HttpSession session = req.getSession();
	   	session.invalidate();
		req.setAttribute("msg", "濡쒓렇�븘�썐 �릺�뿀�뒿�땲�떎.");
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
