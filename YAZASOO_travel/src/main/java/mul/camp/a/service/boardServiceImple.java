package mul.camp.a.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.camp.a.dao.boardDao;
import mul.camp.a.dto.BbsParam;
import mul.camp.a.dto.MemberDto;
import mul.camp.a.dto.MyParam;
import mul.camp.a.dto.boardDto;
import mul.camp.a.dto.commentDto;
import mul.camp.a.dto.oneOoneDto;

@Service
public class boardServiceImple implements boardService {

	@Autowired
	boardDao dao;
	
	@Override
	public int boardInsert(boardDto dto) {
		int cnt = dao.boardInsert(dto);
		return cnt;
	}

	@Override
	public boardDto detail(int idx) {
		boardDto dto = dao.detail(idx);
		return dto;
	}

	@Override
	public int del(int idx) {
		int cnt = dao.del(idx);
		return cnt;
	}

	@Override
	public int update(boardDto dto) {
		int cnt = dao.update(dto);
		return cnt;
	}

	@Override
	public List<boardDto> bbslist(BbsParam param) {
		return dao.bbslist(param);
	}

	@Override
	public int commentWrite(commentDto dto) {
		return dao.commentWrite(dto);
	}

	@Override
	public List<commentDto> commentlist(int idx) {
		return dao.commentlist(idx);
	}

	@Override
	public int commentDel(commentDto dto) {
		return dao.commentDel(dto);
	}

	@Override//1:1 글 등록
	   public int oneOoneInsert(oneOoneDto dto) {
	      
	      return dao.oneOoneInsert(dto);
	   }

	   @Override//1:1글 리스트 불러오기
	   public List<oneOoneDto> onelist(MyParam param) {
	      
	      return dao.onelist(param);
	   }

	   @Override// 문의 내용 불러오기
	   public oneOoneDto olist(int idx) {
	      //
	      return dao.olist(idx);
	   }

	   @Override
	   public int qdel(int idx) { //문의내용 지우기
	      
	      return dao.qdel(idx);
	   }

	   @Override
	   public List<oneOoneDto> qalllist(MyParam param) {//문의내용 모두불러오기 관리자용
	      
	      return dao.qalllist(param);
	   }

	   @Override
	   public MemberDto chk(String id) {
	      
	      return dao.chk(id);
	   }

	   @Override
	   public int readcnt(int idx) {
	      
	      return dao.readcnt(idx);
	   }

	@Override
	public int qcommentWrite(commentDto dto) {
		return dao.qcommentWrite(dto);
	}

	@Override
	public int qcommentUpdate(commentDto dto) {
		return dao.qcommentUpdate(dto);
	}

	@Override
	public int qcommentDel(commentDto dto) {
		return dao.qcommentDel(dto);
	}

}
