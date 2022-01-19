package mul.camp.a.controller;

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

import mul.camp.a.dto.BbsParam;
import mul.camp.a.dto.MemberDto;
import mul.camp.a.dto.MyParam;
import mul.camp.a.dto.boardDto;
import mul.camp.a.dto.commentDto;
import mul.camp.a.dto.oneOoneDto;
import mul.camp.a.service.boardService;



@Controller
public class BoardController {

private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	boardService service;
	
	@RequestMapping(value = "MainPage.do", method = RequestMethod.GET)
	public String bbslist(Model model, BbsParam param, HttpSession session) {
		logger.info("BbsController MainPage() " + new Date());
		
		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		List<boardDto> list = service.bbslist(param);
		model.addAttribute("MainPage", list);
		
		return "MainPage";
	}
	
	//1:1 내 문의글 확인
	@RequestMapping(value="myq.do",method=RequestMethod.GET)
	public String myq(Model model,String id, HttpSession session, MyParam param) {
		logger.info("MainController myq() " + new Date());
		
		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		MemberDto dto = service.chk(id);
		System.out.println(param.toString());
		
		if(dto.getAuth() == 1) {
			List<oneOoneDto> list = service.qalllist(param);
			model.addAttribute("onelist",list);
		}else {
			List<oneOoneDto> list = service.onelist(param);
			model.addAttribute("onelist",list);
		}
		
		return "myq";
	}
	
	
	@RequestMapping(value = "board.do", method = RequestMethod.GET)
	public String board(Model model, BbsParam param, HttpSession session) {
		logger.info("MainController board() " + new Date());
		
		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}	
		
		
		if(param.getSpot() != null && !param.getSpot().equals("")) {
			if(param.getSpot().equals("seoul")) {
				param.setSpot("서울");
			}
			else if(param.getSpot().equals("gyeonggi")) {
				param.setSpot("경기도");
			}
			else if(param.getSpot().equals("gangwon")) {
				param.setSpot("강원도");
			}
			else if(param.getSpot().equals("chungcheong")) {
				param.setSpot("충청도");
			}
			else if(param.getSpot().equals("gyeongsang")) {
				param.setSpot("경상도");
			}
			else if(param.getSpot().equals("jeolla")) {
				param.setSpot("전라도");
			}
			else if(param.getSpot().equals("jeju")) {
				param.setSpot("제주도");
			}
			model.addAttribute("spot", param.getSpot());
		}else {
			model.addAttribute("spot","");
		}
		
		List<boardDto> list = service.bbslist(param);
		model.addAttribute("bbslist", list);
		
		return "board";
	}
	
	@RequestMapping(value = "detail.do", method = RequestMethod.GET)
	public String detail(Model model, int idx, HttpSession session) {
		logger.info("MainController detail() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		boardDto dto = service.detail(idx);
		model.addAttribute("detail", dto);
		
		int chk = service.readcnt(idx);//조회수
	    System.out.println(chk);
	     
		List<commentDto> list = service.commentlist(idx);
		model.addAttribute("commentlist", list);
		
		return "detail";
	}
	
	//1:1 문의글 불러오기
	@RequestMapping(value="qdetail.do",method=RequestMethod.GET)
	public String qdetail(Model model,int idx, HttpSession session) {
		logger.info("MainController qdetail() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		oneOoneDto oto = service.olist(idx);
		model.addAttribute("oto",oto);
				
		return "qdetail";
	}
	

	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String write(HttpSession session) {
		logger.info("MainController write() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		return "write";
	}
	
	@RequestMapping(value = "writeAf.do", method = RequestMethod.POST)
	public String writeAf(Model model, boardDto dto, HttpSession session) {
		logger.info("MainController writeAf() " + new Date());
		System.out.println(dto.toString());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		int chk = service.boardInsert(dto);
		System.out.println("chk====="+chk);
		
		if(chk == 0) {
			return "write";
		}else {
			return "redirect:/board.do";
		}
	}
	
	@RequestMapping(value="boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(Model model, int idx, HttpSession session) {
		logger.info("MainController boardUpdate() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		boardDto dto = service.detail(idx);
		model.addAttribute("detail", dto);
		
		return "update";
	}
	
	@RequestMapping(value="boardDel.do", method = RequestMethod.GET)
	public String boardDel(int idx, HttpSession session) {
		logger.info("MainController boardDel() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		int chk = service.del(idx);
		System.out.println(chk);
		if(chk == 1) {
			return "redirect:/board.do";
		}
		return "redirect:/detail.do";
	}
	
	@RequestMapping(value="qDel.do", method = RequestMethod.GET)
	public String qDel(int idx, String id, int auth, HttpSession session) {
		logger.info("MainController qDel() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		int chk = service.qdel(idx);
		
		System.out.println(chk);
		if(chk == 1) {
			return "redirect:/myq.do?id="+id;
		}
		return "redirect:/myq.do?id="+id;
	}
	
	@RequestMapping(value="boardUpdateAf.do", method = RequestMethod.POST)
	public String boardUpdateAf(boardDto dto, HttpSession session) {
		logger.info("MainController boardUpdateAf() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		System.out.println(dto.toString());
		
		int chk = service.update(dto);
		if(chk == 1) {
			return "redirect:/board.do";
		}else {
			return "redirect:/boardUpdate.do";
		}
		
	}
	//1:1 문의
	@RequestMapping(value="oneOone.do",method=RequestMethod.GET)
	public String oneOone(Model model,int auth,String id, HttpSession session) {
		logger.info("MainController oneOone() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		if(auth == 1)
		{
			return "redirect:/myq.do?id="+id;
		}
		return "oneOone";
	}
	//1:1문의 작성
	@RequestMapping(value = "oneOoneAf.do", method = RequestMethod.POST)
	public String oneOoneAf(oneOoneDto dto, HttpSession session) {
		logger.info("MainController oneOoneAf() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		int chk=service.oneOoneInsert(dto);
		
		if(chk == 0) {
			return "oneOone";
		}else {
			return "redirect:/myq.do?id="+dto.getId();
			
		}	
	}
	
	//댓글쓰기
	@RequestMapping(value="commentWrite.do", method = RequestMethod.GET)
	public String commentWrite(commentDto dto, HttpSession session) {
		logger.info("MainController commentWrite() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		
		int chk = service.commentWrite(dto);
		System.out.println(chk);
		if(chk == 1) {
			return "redirect:/detail.do?idx="+dto.getBidx();
		}else {
			return "redirect:/board.do";
		}
	}
	//댓글 지우기
	@RequestMapping(value="commentDel.do", method=RequestMethod.GET)
	public String commentDel(commentDto dto, HttpSession session) {
		logger.info("MainController commentDel() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		int chk = service.commentDel(dto);
		if(chk == 1) {
			return "redirect:/detail.do?idx="+dto.getBidx();
		}else {
			return "redirect:/board.do";
		}
	}
	
	//댓글쓰기
	@RequestMapping(value="qcommentWrite.do", method = RequestMethod.GET)
	public String qcommentWrite(commentDto dto, HttpSession session) {
		logger.info("MainController qcommentWrite() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		int chk = service.qcommentWrite(dto);
		if(chk == 1) {
			return "redirect:/qdetail.do?idx="+dto.getIdx();
		}else {
			return "redirect:/qdetail.do?idx="+dto.getIdx();
		}
	}
	
	@RequestMapping(value="qcommentUpdate.do", method=RequestMethod.GET)
	public String qcommentUpdate(commentDto dto, HttpSession session) {
		logger.info("MainController qcommentUpdate() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		int chk = service.qcommentUpdate(dto);
		
		if(chk == 1) {
			return "redirect:/qdetail.do?idx="+dto.getIdx();
		}else {
			return "redirect:/qdetail.do?idx="+dto.getIdx();
		}
	}
	
	@RequestMapping(value="qcommentDel.do", method=RequestMethod.GET)
	public String qcommentDel(commentDto dto, HttpSession session) {
		logger.info("MainController qcommentDel() " + new Date());

		if(session.getAttribute("login") == null) {
			return "redirect:/login.do";
		}
		
		int chk = service.qcommentDel(dto);
		if(chk == 1) {
			return "redirect:/qdetail.do?idx="+dto.getIdx();
		}else {
			return "redirect:/board.do";
		}
	}
	
	
}
