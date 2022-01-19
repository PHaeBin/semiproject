package mul.camp.a.dao;

import java.util.List;

import mul.camp.a.dto.MemberDto;
import mul.camp.a.dto.boardDto;

public interface MemberDao {

	int addmember(MemberDto mem);
	
	int getId(String id);
	
	MemberDto login(MemberDto mem);
	
	MemberDto mypage(MemberDto mem);
	
	int getEmail(String email);
	
	//회원 정보 수정
   int memberUpdate(MemberDto mem);
   
   MemberDto modify(MemberDto dto);

   //회원 탈퇴
   int memberDelete(MemberDto mem);
   
   List<boardDto> mylist(MemberDto dto);

   List<MemberDto> memberList(String id);
   
   int memdeln(String id);

   int memdely(String id);
   
   int authChange(MemberDto dto);
}
