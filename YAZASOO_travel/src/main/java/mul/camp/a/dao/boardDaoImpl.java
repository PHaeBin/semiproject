package mul.camp.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.camp.a.dto.BbsParam;
import mul.camp.a.dto.MemberDto;
import mul.camp.a.dto.MyParam;
import mul.camp.a.dto.boardDto;
import mul.camp.a.dto.commentDto;
import mul.camp.a.dto.oneOoneDto;

@Repository
public class boardDaoImpl implements boardDao {

	@Autowired
	SqlSession session;
	
	String ns = "Board.";
	String ns1="Comment.";

	@Override // 글 쓰기
   public int boardInsert(boardDto dto) {
      
      return session.insert(ns+"write", dto);
   }

   @Override // 글 내용
   public boardDto detail(int idx) {
      return session.selectOne(ns+"detail", idx);
   }

   @Override // 글 삭제
   public int del(int idx) {
      return session.update(ns+"del", idx);
   }

   @Override // 글 수정
   public int update(boardDto dto) {
      return session.update(ns+"update", dto);
   }

   @Override // 글목록 불러오기 + 검색한글만 불러오기
   public List<boardDto> bbslist(BbsParam param) {
      return session.selectList(ns + "bbslist", param);
   }
//아래는 댓글  위로는 게시판 댓글 dao 따로 만들어주기
   @Override
   public int commentWrite(commentDto dto) {
      return session.insert(ns1+"commentWrite", dto);
   }

   @Override
   public List<commentDto> commentlist(int idx) {
      return session.selectList(ns1+"commentlist", idx);
   }

   @Override
   public int commentDel(commentDto dto) {
      return session.update(ns1+"commentDel", dto);
   }

   @Override //1:1 문의 게시판
   public int oneOoneInsert(oneOoneDto dto) {
      
      return session.insert(ns+"qwrite",dto);
   }

   @Override//1:1 글 불러오기
   public List<oneOoneDto> onelist(MyParam param) {
      
      return session.selectList(ns+"qboard",param);
   }

   @Override//문의 내용 불러오기
   public oneOoneDto olist(int idx) {
      
      return session.selectOne(ns+"qlist",idx);
   }

   @Override
   public int qdel(int idx) {
      
      return session.update(ns+"qdel",idx);
      
   }

   @Override
   public List<oneOoneDto> qalllist(MyParam param) {
      
      return session.selectList(ns+"qallboard", param);
   }

   @Override
   public MemberDto chk(String id) {
   
      return session.selectOne(ns+"authChk",id);
   }

   @Override
   public int readcnt(int idx) {
      
         return session.update(ns+"readcnt", idx);
      }

	@Override
	public int qcommentWrite(commentDto dto) {
		return session.update(ns1+"qcommentWrite", dto);
	}

	@Override
	public int qcommentUpdate(commentDto dto) {
		return session.update(ns1+"qcommentUpdate", dto);
	}

	@Override
	public int qcommentDel(commentDto dto) {
		return session.update(ns1+"qcommentDel", dto);
	}

}
