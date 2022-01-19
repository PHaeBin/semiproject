function qcommentWrite(){
	let text= document.getElementById("text").value;
	let id = document.getElementById("id").value;
	let idx = document.getElementById("idx").value;
	if(text.trim()==""){
        alert("내용을 입력하세요");
        text.focus(); 
   }else{
		if (confirm("댓글을 등록하시겠습니까?") == true) {
			location.href="qcommentWrite.do?idx="+idx+"&text="+text+"&id="+id;
	    }
	}
}

function qDel(idx, id, auth){
	if(confirm("삭제하시겠습니까?") == true) {
		location.href="qDel.do?idx="+idx+"&id="+id+"&auth="+auth;
    }
}

function qcommentDel(idx, id){
	if(confirm("삭제하시겠습니까?") == true) {
		location.href="qcommentDel.do?idx="+idx+"&id="+id;
    }
}