package mul.camp.a.service;

import java.util.List;

import mul.camp.a.dto.MemberDto;
import mul.camp.a.dto.boardDto;

public interface MemberService {

	boolean addmember(MemberDto mem);	
	
	int getId(String id);
	
	MemberDto login(MemberDto mem);
	
	Object mypage(MemberDto mem);
	
	int getEmail(String email);
	
	int memberUpdate(MemberDto mem);

    MemberDto modify(MemberDto dto);

    int memberDelete(MemberDto mem);
    
    List<boardDto> mylist(MemberDto dto);

    List<MemberDto> memberList(String id);
    
    int memdeln(String id);

    int memdely(String id);
    
    int authChange(MemberDto dto);
}
