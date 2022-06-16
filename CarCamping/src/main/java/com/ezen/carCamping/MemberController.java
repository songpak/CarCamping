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
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.service.MemberMapper;



@Controller
public class MemberController {
   
   @Autowired
   private MemberMapper memberMapper;
   
   @Autowired
   private JavaMailSender mailSender;
   
   @Resource(name="uploadPath")
	private String uploadPath;
   
   @RequestMapping(value="login.login", method=RequestMethod.GET)
   public String login(HttpServletRequest req) {
	    String referer = req.getHeader("Referer");
	    req.getSession().setAttribute("redirectURI", referer);
	    
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
   
   /*@RequestMapping(value="findPW.login", method=RequestMethod.POST)
   public String checkMemberPW(HttpServletRequest req, 
                           @RequestParam Map<String, String> params) {
      String msg = memberMapper.searchMemberPW(params);
      String url = "login.login";
      req.setAttribute("msg", msg);
      req.setAttribute("url", url);
      return "message";
   }
   */

   @RequestMapping(value="pw_auth.login", method=RequestMethod.POST)
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IOException {
	   String mem_userName = (String)req.getParameter("mem_userName");
	   String mem_email = (String)req.getParameter("mem_email");

		MemberDTO dto = memberMapper.selectMember(mem_email);
			
		if(dto != null) {
		Random r = new Random();
		int num = r.nextInt(999999); // ������������
		
		if (dto.getMem_userName().equals(mem_userName)) {
			session.setAttribute("mem_email", dto.getMem_email());

			String setfrom = "ektmf1101@naver.com"; 
			String tomail = mem_email; 
			String title = "��й�ȣ ���� ���� ���� �Դϴ�"; 
			String content = System.getProperty("line.separator") + "�ȳ��ϼ��� ȸ����!" + System.getProperty("line.separator")
					+ "����ī ��й�ȣ ã�� ������ȣ�� " + num + " �Դϴ�." + System.getProperty("line.separator"); 

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title);
				messageHelper.setText(content); 

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			ModelAndView mav = new ModelAndView();
			mav.setViewName("login/pw_auth");
			mav.addObject("num", num);
			return mav;
		}else {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("login/findPW");
			return mav;
		}
		}else {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("login/findPW");
			return mav;
		}
		
		
   }	
   
   @RequestMapping(value = "pw_set.login", method = RequestMethod.POST)
   public String pw_set(@RequestParam(value="email_injeung") String email_injeung,
   			@RequestParam(value = "num") String num) throws IOException{
   		
   		if(email_injeung.equals(num)) {
   			return "login/pw_new";
   		}
   		else {
   			return "login/pw_find";
   		}
   } //�̸��� ������ȣ Ȯ��
   
   
   
   @RequestMapping(value="login.login", method=RequestMethod.POST)
   public String loginOk(HttpServletRequest req, HttpServletResponse resp,         
         @RequestParam Map<String, String> params) {
      MemberDTO dto = memberMapper.getMemberId(params.get("mem_id"));
      
      
      String msg = null, url = null;
      if (dto == null){   
         msg = "�ش��ϴ� ���̵� �����ϴ�. �ٽ� Ȯ���ϰ� �α����� �ּ���!!";
         url = "login.login";
      }else {
         if (params.get("mem_password").equals(dto.getMem_password())){
        	
            msg = dto.getMem_id()+"��, ȯ���մϴ�!!";
            url = "javascript:history.go(-2)";
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
            msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ���ϰ� �α����� �ּ���!!";
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
          req.setAttribute("msg", "ȸ������ ���� ^__^");
          req.setAttribute("url", "index.do");
       }else {
          req.setAttribute("msg", "ȸ������ ���Ф�_��");
          req.setAttribute("url", "sign.login");
          
       }
      return "message";
   }
   
   @RequestMapping("/logout.login")
   public String logout(HttpServletRequest req) {
	   HttpSession session = req.getSession();
	   	session.invalidate();
		req.setAttribute("msg", "�α׾ƿ� �Ǿ����ϴ�.");
		req.setAttribute("url", "index.do");
		return "message";
	   
   }
   
   
}