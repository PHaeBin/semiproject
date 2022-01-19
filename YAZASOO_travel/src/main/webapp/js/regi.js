let click; //버튼클릭시 변수지정
let account; //계정 부분 공란확인


   function btnClick(){
	if($("#id").val() == "" || $("#id").val() == null){
		alert("id를 입력해주세요.");
	}else{
		$.ajax({
         url:"idcheck.do",
         type:"post",
         data:{ id:$("#id").val() },
         success:function( msg ){
            if(msg == "YES"){
               $("#idcheck").css("color", "#0000ff");
               $("#idcheck").html("사용할 수 있는 아이디입니다");
               $("#id").attr("readonly", true);
            }else{
               $("#idcheck").css("color", "#ff0000");
               $("#idcheck").html("사용 중인 아이디입니다");
               $("#id").val("");
            }         
         },
         error:function(){
            alert('error');
         }
      });
	}
}

function ebtnClick(){
	if($("#email").val() == "" || $("#email").val() == null){
		alert("email을 입력해주세요.");
	}else{
		$.ajax({
         url:"emailcheck.do",
         type:"post",
         data:{ email:$("#email").val() },
         success:function( msg ){
            if(msg == "YES"){
               $("#emailcheck").css("color", "#0000ff");
               $("#emailcheck").html("사용할 수 있는 이메일입니다");
               $("#email").attr("readonly", true);
            }else{
               $("#emailcheck").css("color", "#ff0000");
               $("#emailcheck").html("사용 중인 이메일입니다");
               $("#email").val("");
            }         
         },
         error:function(){
            alert('error');
         }
      });
	}
}


$(function(){
   //비밀번호 확인
   $('#pw2').blur(function(){
      if($('#pw').val() != $('#pw2').val()){
          if($('#pw2').val()!=''){
          alert("비밀번호가 일치하지 않습니다.");
              $('#pw2').val('');
             $('#pw2').focus();
          }
       }
   })        
});

function account1() {
//   alert('account');

   if($("#id").val() == ''){
      alert('아이디를 입력해 주십시오');
      $("#id").focus();
   }
   else if($("#pw").val() == ''){
      alert('패스워드를 입력해 주십시오');
      $("#pw").focus();
   }
   else if($("#pw2").val() == ''){
      alert('패스워드를 확인해 주십시오');
      $("#pw2").focus();
   }
   else if($("#name").val() == ''){
      alert('이름을 입력해 주십시오');
      $("#name").focus();
   }
   else if($("#gender").val() == ''){
      alert('성별을 입력해 주십시오');
      $("#gender").focus();
   }
   else if($("#birth").val() == ''){
      alert('생년월일을 입력해 주십시오');
      $("#birth").focus();
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
      $("#frm").submit();
   }
}