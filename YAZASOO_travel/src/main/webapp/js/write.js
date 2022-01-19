function boardWrite(){
	if($("#title").val().trim() == ''){
		alert("제목을 입력해주세요");
		$("#title").focus();
	}else if($("#summernote").val() == ''){
		alert("내용을 입력하세요.");
		$("#summernote").focus();
	}else{
		if (confirm("글을 등록하시겠습니까?") == true) {
			$("#frm").submit();
        }
	}
}