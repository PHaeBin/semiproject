 let memberUpdateBtn;//멤버 업데이트 기능활성화 전역변수 처리
 
 function memberUpdateBtn(){
	alert("ddddd");
      var pw = document.getElementById("pw").value;
      var pw2 = document.getElementById("pw2").value;
      var pwnew = document.getElementById("pwnew").value;
      var pwnewchk = document.getElementById("pwnewchk").value;
         if($("#pw2").val() == ''){
            alert('현재 패스워드를 입력해 주십시오');
            $("#pw2").focus();
         }
         else if($("#name").val() == ''){
            alert('이름을 입력해 주십시오');
            $("#name").focus();
         }
         else if($("#email").val() == ''){
            alert('이메일을 입력해 주십시오');
            $("#email").focus();
         }
         else if($("#phone").val() == ''){
            alert('전화번호를 입력해 주십시오');
            $("#phone").focus();
         }
         else if($("#nickName").val() == ''){
            alert('닉네임을 입력해 주십시오');
            $("#nickName").focus();
         }
         else{
            if($("#pwnew").val() != ''){
                 if(pwnew != pwnewchk){
                   alert("새 비밀번호를 확인해주세요.");   
                   $("#pwnew").val('');
                   $("#pwnewchk").val('');
                   $("#pwnew").focus();
                 }else{
                    if(pw == pw2){
                        if(confirm("정보를 수정하시겠습니까?") == true){
                           //location.href="memberUpdate.do";
                           $("#id").submit();
                        }
                  }else{
                     alert("현재 비밀번호가 올바르지 않습니다.");
                     $("#pw2").val('');
                     $("#pw2").focus();
                  }
                }
            }else{
               if(pw == pw2){
                     if(confirm("정보를 수정하시겠습니까?") == true){
                        //location.href="memberUpdate.do";
                        $("#id").submit();
                     }
               }else{
                  alert("현재 비밀번호가 올바르지 않습니다.");
                  $("#pw2").val('');
                  $("#pw2").focus();
               }
            }
            
         }
   }