function qWrite() {
		if ($("#qtype").val()=='분류 선택'){
			alert("분류를 선택해주세요");
			$("#qtype").focus();
		}
		else if ($("#qtitle").val() == '') {
			alert("제목을 입력해주세요");
			$("#qtitle").focus();
		} else if ($("#content").val() == '') {
			alert("내용을 입력하세요.");
			$("#qcontent").focus();
		} else {
			if (confirm("글을 등록하시겠습니까?") == true) {
				$("#frm").submit();
				alert("등록되었습니다 .");
			}
		}

	}
	
	function go(id){
		location.href="myq.do?id="+id;
	}
