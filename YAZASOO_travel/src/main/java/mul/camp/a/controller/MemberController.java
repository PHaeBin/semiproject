package mul.camp.a.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mul.camp.a.dto.MemberDto;
import mul.camp.a.dto.boardDto;
import mul.camp.a.service.MemberService;

@Controller
public class MemberController {

   private static Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   @Autowired
   MemberService service;
   
   @RequestMapping(value = "login.do", method = RequestMethod.GET)
   public String login() {
      logger.info("MemberController login() " + new Date());   
      
      return "login";
   }
   
   @RequestMapping(value = "regi.do", method = RequestMethod.GET)
   public String regi() {
      logger.info("MemberController regi() " + new Date());
      
      return "regi";
   }
   
   @RequestMapping(value = "regiAf.do", method = RequestMethod.POST)
   public String regiAf(MemberDto dto) {
      logger.info("MemberController regiAf() " + new Date());
      
      boolean b = service.addmember(dto);
      if(b == true) {
         System.out.println("가입되었음");
      }
      
      return "redirect:/login.do";
   }
   
   @ResponseBody
   @RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
   public String idcheck(String id) {
      logger.info("MemberController idcheck() " + new Date());      
      System.out.println("id:" + id);
      
      int count = service.getId(id);
      System.out.println("count:" + count);      
      if(count > 0) {   // 아이디가 있음
         return "NO";
      }else {         // 아이디가 없음
         return "YES";
      }      
   }
   
   @ResponseBody
   @RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
   public String loginAf(MemberDto dto, HttpServletRequest req) { // request == HttpServletRequest
      logger.info("MemberController loginAf() " + new Date());      
      MemberDto mem = service.login(dto);
      if(mem != null) {   // 정상적인 로그인
         // login 정보를 저장 -> session 
         req.getSession().setAttribute("login", mem);         
         return "success";
      }
      else {      // 회원정보에 없음
         return "error";
      }      
   }
   
   @RequestMapping(value = "logout.do", method = RequestMethod.GET)
   public String logout(HttpSession session) throws Exception {

      session.invalidate();

      return "redirect:/login.do";
   }
   
   @RequestMapping(value ="mypage.do", method = RequestMethod.GET)
      public String mypage(Model model, MemberDto dto, HttpSession session) {
         logger.info("MainController mypageAf()" + new Date());
         
 		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
 		
         List<boardDto> list = service.mylist(dto);
         model.addAttribute("mylist", list);
         
         return "mypage";
   }
   
   @ResponseBody
   @RequestMapping(value = "emailcheck.do", method = RequestMethod.POST)
   public String emailcheck(String email) {
      logger.info("MemberController emailcheck() " + new Date());      
      System.out.println("email:" + email);
      int count = service.getEmail(email);
      System.out.println("count:" + count);      
      if(count > 0) {   // 이메일이 있음
         return "NO";
      }else {         // 이메일이 없음
         return "YES";
      }      
   }
   
   //회원 정보 수정
   @RequestMapping(value="Modify.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String Modify(Model model, MemberDto dto, HttpSession session) throws Exception{
      logger.info("MemberController Modify() " + new Date());
		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
      MemberDto mem = service.modify(dto);
      model.addAttribute("member", mem);
      
      return "Modify";
   }
   
   //회원 권한 변경
   @RequestMapping(value="authChange.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String authChange(HttpSession session, MemberDto dto, String user){
	   logger.info("MemberController authChange() " + new Date());
	   if(session.getAttribute("login") == null) {
		   return "redirect:/login.do";
	   }
	   
	   System.out.println(dto.toString());
	   int chk = service.authChange(dto);
	   if(chk == 1) {
		   return "redirect:/memberList.do?id="+user;
	   }else {
		   return "redirect:/memberList.do?id="+user;
	   }
	   
   }

   @RequestMapping(value="memberUpdate.do", method = RequestMethod.POST)
   public String registerUpdate(Model model, MemberDto mem, HttpSession session) throws Exception{
      logger.info("MemberController memberUpdate() " + new Date());
		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
      if(!mem.getPwnew().equals("")) {
    	  mem.setPw(mem.getPwnew());
      }
      
      int count = service.memberUpdate(mem);
      session.invalidate();
      
      if(count == 1) {
         return "redirect:/login.do";
      }
      else {return "redirect:/board.do";}
      
   }
   
  //회원 탈퇴
   @RequestMapping(value="memberDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String memberDelete(MemberDto mem, HttpSession session) throws Exception{
      logger.info("MemberController memberDelete() " + new Date());
		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
       System.out.print(mem.toString());
            
      return "memberDelete";
      
   }
   
   @RequestMapping(value="memberDeleteAf.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String memberDeleteAf(MemberDto mem, HttpSession session) throws Exception{
      logger.info("MemberController memberDeleteAf() " + new Date());
       System.out.print(mem.toString());
		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
       int count = service.memberDelete(mem);
       session.invalidate();
            
      return "redirect:/login.do";
   }
   
   @RequestMapping(value="memberList.do", method=RequestMethod.GET)
   public String memberList(HttpSession session, Model model, String id) {
	   logger.info("MemberController memberList() " + new Date());
		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		List<MemberDto> mlist = service.memberList(id);
		model.addAttribute("mlist", mlist);
	   
	   return "memberList";
   }
   
   @RequestMapping(value="memDelN.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String memDelN(String id, HttpSession session, String user){
	   logger.info("MemberController memDelN() " + new Date());
		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		System.out.println("id======"+id);
	   int chk = service.memdeln(id);
	   if(chk == 1) {
		   return "redirect:/memberList.do?id="+user;
	   }else {
		   return "redirect:/memberList.do?id="+user;
	   }
	   
   }
   
   @RequestMapping(value="memDelY.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String memDelY(String id, HttpSession session, String user){
	   logger.info("MemberController memDelN() " + new Date());
		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
	   int chk = service.memdely(id);
	   if(chk == 1) {
		   return "redirect:/memberList.do?id="+user;
	   }else {
		   return "redirect:/memberList.do?id="+user;
	   }
   }
}