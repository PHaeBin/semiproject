package mul.camp.a.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.camp.a.dao.MemberDao;
import mul.camp.a.dto.MemberDto;
import mul.camp.a.dto.boardDto;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;

	@Override
	public boolean addmember(MemberDto mem) {
		
		int count = dao.addmember(mem);		
		return count>0?true:false;
	}

	@Override
	public int getId(String id) {		
		return dao.getId(id);
	}

	@Override
	public MemberDto login(MemberDto mem) {		
		return dao.login(mem);
	}
	
	@Override
   public Object mypage(MemberDto mem) {
      return null;
   }
	
	@Override
   public int getEmail(String email) {
      return dao.getEmail(email);
   }
	
	//회원수정
	   @Override
	   public int memberUpdate(MemberDto mem)  {
	      
	      return dao.memberUpdate(mem);
	   }
	   
	    //회원 수정
	   @Override
	   public MemberDto modify(MemberDto dto) {
	   
	      return dao.modify(dto);
	   }
	    //회원 탈퇴
	   @Override
	   public int memberDelete(MemberDto mem) {
	      
	      return dao.memberDelete(mem);
	   }

	@Override
	public List<boardDto> mylist(MemberDto dto) {
		return dao.mylist(dto);
	}

	@Override
	public List<MemberDto> memberList(String id) {
		return dao.memberList(id);
	}

	@Override
	public int memdeln(String id) {
		return dao.memdeln(id);
	}

	@Override
	public int memdely(String id) {
		return dao.memdely(id);
	}

	@Override
	public int authChange(MemberDto dto) {
		return dao.authChange(dto);
	}
}
