package mul.camp.a.dao;

import java.util.List;

import mul.camp.a.dto.BbsParam;
import mul.camp.a.dto.MemberDto;
import mul.camp.a.dto.MyParam;
import mul.camp.a.dto.boardDto;
import mul.camp.a.dto.commentDto;
import mul.camp.a.dto.oneOoneDto;

public interface boardDao {
	int boardInsert(boardDto dto);

	boardDto detail(int idx);
	
	int del(int idx);
	
	int update(boardDto dto);
	
	List<boardDto> bbslist(BbsParam param);
	
	int commentWrite(commentDto dto);
	
	List<commentDto> commentlist(int idx);
	
	int commentDel(commentDto dto);
	
	int  oneOoneInsert(oneOoneDto dto); //1:1 문의 게시판
	   
   List<oneOoneDto> onelist(MyParam param); //1:1 글 불러오기
   
   oneOoneDto olist(int idx);// 문의 디테일
   
   int qdel(int idx);//문의내용 ㅅ ㅏㄱ제
   
   List<oneOoneDto> qalllist(MyParam param); //문의 내용 관리자용

   MemberDto chk(String id);//아이디값 불러오기 컨트롤러에
   
   int readcnt(int idx);//조회수
   
   int qcommentWrite(commentDto dto);
   
   int qcommentUpdate(commentDto dto);
   
   int qcommentDel(commentDto dto);
   
}
