let memberDelete
function memberDelete(id){
   var pw = document.getElementById("pw").value;
   var pw2 = document.getElementById("pw2").value;
   if(confirm("정말 탈퇴하시겠습니까?") == true){
      if(pw == pw2){
         location.href = "memberDeleteAf.do?id=" + id;
      }
      else{
         alert("비밀번호가 일치하지 않습니다.");
      }
   }
}