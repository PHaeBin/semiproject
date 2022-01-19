package mul.camp.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.camp.a.dto.MemberDto;
import mul.camp.a.dto.boardDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession session;
	
	String ns = "Y_MEMBER.";

	@Override
	public int addmember(MemberDto mem) {
		int count = session.insert(ns + "addmember", mem);
		return count;
	}

	@Override
	public int getId(String id) {
		int count = session.selectOne(ns + "getId", id);
		return count;
	}

	@Override
	public MemberDto login(MemberDto mem) {		
		return session.selectOne(ns + "login", mem);
	}
	
	@Override
    public MemberDto mypage(MemberDto mem) {
      return null;
    }
	
	@Override
   public int getEmail(String email) {
      int count = session.selectOne(ns + "getEmail", email);
      return count;
   }
	
	//회원 정보 수정
	   @Override
	   public int memberUpdate(MemberDto mem){
	      
	      return session.update(ns + "memberUpdate", mem); 
	   }
	   @Override
	   public MemberDto modify(MemberDto dto) {
	      
	      return session.selectOne(ns+"modify", dto);
	   }

	   //회원 삭제
	   @Override
	   public int memberDelete(MemberDto mem) {
	      
	      return session.update(ns+ "memberDelete", mem);
	   }

	@Override
	public List<boardDto> mylist(MemberDto dto) {
		return session.selectList(ns+"mylist", dto);
	}

	@Override
	public List<MemberDto> memberList(String id) {
		return session.selectList(ns+"memberlist", id);
	}

	@Override
	public int memdeln(String id) {
		return session.update(ns+"deln", id);
	}

	@Override
	public int memdely(String id) {
		return session.update(ns+"memberDelete", id);
	}

	@Override
	public int authChange(MemberDto dto) {
		return session.update(ns+"authChange", dto);
	}
	
}







