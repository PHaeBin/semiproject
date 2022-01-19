function board(){
	location.href = "board.do";
}
function boardUpdate(idx){
	if (confirm("수정하시겠습니까?") == true) {
		location.href = "boardUpdate.do?idx="+idx;
	}
}
function boardDel(idx){
	if (confirm("삭제하시겠습니까?") == true) {
		location.href = "boardDel.do?idx="+idx;
    }
}
/* function commentUpdate(idx, bidx){
	if (confirm("수정하시겠습니까?") == true) {
		location.href = "commentUpdate.do?idx="+idx+"&bidx="+bidx;
	}
} */
function commentDel(idx, bidx){
	if (confirm("삭제하시겠습니까?") == true) {
		location.href = "commentDel.do?idx="+idx+"&bidx="+bidx;
    }
}
function commentWrite(){
	let text= document.getElementById("text").value;
	let id = document.getElementById("id").value;
	let bidx = document.getElementById("idx").value;
	if(text.trim()==""){
        alert("내용을 입력하세요");
        text.focus(); 
   }else{
		if (confirm("댓글을 등록하시겠습니까?") == true) {
			location.href="commentWrite.do?bidx="+bidx+"&text="+text+"&id="+id;
	    }
	}
}