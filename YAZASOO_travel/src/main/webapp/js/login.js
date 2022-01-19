
  
  let id = document.querySelector('#id') /*전역변수 처리 아디 */
  let pw = document.querySelector('#pw') /*전역변수 처리 비번 */
  let btn = document.querySelector('#btn') /*전역변수 처리 버튼 */
  
  btn.addEventListener('click', () => {
      if(id.value == "") {
          label = id.nextElementSibling
          label.classList.add('warning')
          setTimeout(() => {
              label.classList.remove('warning')
          }, 1500)
      } else if(pw.value == "") {
          label = pw.nextElementSibling
          label.classList.add('warning')
          setTimeout(() => {
              label.classList.remove('warning')
          }, 1500)
      }
  }); //클릭할때 밸류값 지정
  
  /*function login() {
    
    if($("#id").val().trim() == ""){
      
    }else if($("#pw").val().trim() == ""){
      
    }else{ 
      $("#frm").submit();
    }
  } //로그인 시 공간 처리*/
  
  let user_id = $.cookie("user_id");	// cookie에서 데이터를 산출	= aaa, bbb
                    // model.addattribute("list", list)
  if(user_id != null){	// cookie에 저장된 값이 있음
    $("#id").val( user_id );
  //	$("#chk_save_id").attr("checked", "checked");
    $("#chk_save_id").prop("checked", true);
  }
  
  $("#chk_save_id").click(function () {
  //	alert("click");
    if( $("#chk_save_id").is(":checked") ){	// 첵크되었을 경우
    //	alert("첵크");		
      if($("#id").val().trim() == ""){	//  java java
      //	alert("빈문자");
        alert("id를 입력해 주십시오");
        $("#chk_save_id").prop("checked", false);
        $("#id").val("");
      }else{
        // 쿠키에 저장
        $.cookie("user_id", $("#id").val().trim(), { expires:7, path:'./' });
      }
    }
    else{
    //	alert("첵크무효!");
      $.removeCookie("user_id", { path:'./' });
    }
  });
  
  function enterkey() {
        if (window.event.keyCode == 13) {
             login();
        }
	}

  function login() {
   let id = $("#id").val();
   let pw = $("#pw").val();
   
   if($("#id").val().trim() == ""){
        alert("id를 입력하세요");
        $("#id").focus(); 
   }else if($("#pw").val().trim() == ""){
        alert("pw를 입력하세요");
        $("#pw").focus();
   }else{
     $.ajax({
      url:"loginAf.do",
      type:"post",
      data:{"id":id, "pw":pw},  //-------------보낼 데이터의 셋팅
      success:function(rep_data){
         if(rep_data == "success"){
            location.href = "MainPage.do";
         }else{
            alert("일치하는 회원 정보가 없습니다.");
            $("#id").val('').focus();
            $("#pw").val('');
         }
      },
      error:function(){
         alert("error");
      }
   });
   }
 }
  
