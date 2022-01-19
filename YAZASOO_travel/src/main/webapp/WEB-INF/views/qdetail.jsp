<%@page import="mul.camp.a.dto.MemberDto"%>
<%@page import="mul.camp.a.dto.oneOoneDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%oneOoneDto oto= (oneOoneDto)request.getAttribute("oto");
MemberDto mem = (MemberDto) request.getSession().getAttribute("login");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/abc.css" />
    <link rel="stylesheet" type="text/css" href="css/qwe.css" />
    <script type="text/javascript" src="js/qdetail.js?ver=123"></script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- Bootstrap core CSS -->
   <!-- <link href="/webjars/bootstrap/4.5.3/css/bootstrap.css" rel="stylesheet"> -->
    
     <!-- Bootstrap Icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    
    <!-- SimpleLightbox plugin CSS-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/abc.css" rel="stylesheet" />
    
    <link rel="shortcut icon" type="image/x-icon" href="image/YAZASOO.png">
    <title>YAZASOO</title>
</head>
<body>
<header id="main-header">
<jsp:include page="./headerMenu.jsp"></jsp:include>
</header>
<br><br><br><br>

<table>
	<tr>
		<th>작성자</th>
		<td><%=oto.getId()%></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><%=oto.getQtitle()%></td>
	</tr>
	<tr>
		<th>작성일</th>
		<c:set var="now" value="<%=oto.getRegdate()%>"/>
		<fmt:parseDate value="${now }" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss.S"/>
 		<td><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd HH:mm"/></td>
	</tr>
	<tr>
		<th>문의 유형</th>
		<td><%=oto.getQtype()%></td>
	</tr>
	<tr>
		<th>문의 내용</th>
		<td align="center"><textarea rows="15" cols="100" readonly><%=oto.getQcontent() %></textarea></td>
	</tr>
</table>

<input type="hidden" value="<%=mem.getId() %>" id="id">
<input type="hidden" value="<%=oto.getIdx() %>" id="idx">
<%if(oto.getId().equals(mem.getId())){ %>
<div style="text-align:center" class="btn">
<%-- <button type="button" onclick="location.href='myq.do?id=<%=mem.getId()%>'">목록</button> --%>
<button type="button" onclick="qDel(<%=oto.getIdx() %>, '<%=mem.getId() %>', <%=mem.getAuth() %>)">삭제</button>
<button type="button" onclick="location.href='myq.do?id=<%=mem.getId()%>'">목록</button>
</div>
<%} %>

<div style="text-align:center">
<%if(oto.getAnswerYn().equals("Y")){ %>
답변 내용<br><br>
<table border="1" style="width:80%">
   <thead>
      <tr>
      <th>작성자</th><th>내용</th>
      </tr>
   </thead>
      <tr>
         <th>관리자</th>
         <td><textarea type="text" rows="5" cols="100" readonly id="commentText"><%=oto.getAnswer()%></textarea></td>
      </tr>
</table>
	<%if(mem.getAuth() == 1){ %>
	<div class="btn">
		<button type="button" id="updateBtn1" onclick="qcommnetUpdate()">수정</button>
		<button type="button" id="updateBtn2" onclick="qcommnetUpdateAf(<%=oto.getIdx()%>, '<%=mem.getId()%>')" style="display:none">수정</button>
		<button type="button" id="delBtn" onclick="qcommentDel(<%=oto.getIdx()%>, '<%=mem.getId()%>')">삭제</button>
	</div>
	<%} %>
<%} %>
</div>
<div style="text-align:center">
<%if(mem.getAuth() == 1 & oto.getAnswerYn().equals("N")){ %>
<br><br><hr><br><br>
	<table>
	<tr><th>답변하기</th></tr>
	<tr><td><div style="width:80%"><textarea type="text" id="text" name="text" rows="5" cols="100"></textarea></div></td></tr>
	</table>
	<div style="text-align:center" class="btn"><button type="button" onclick="qcommentWrite()">등록</button></div>
<%} %>
</div>
<script type="text/javascript">
function qcommnetUpdate(){
	if(confirm("수정하시겠습니까?") == true) {
		$("#commentText").attr("readonly", false);
		document.getElementById("updateBtn1").style.display = "none"; 
		document.getElementById("updateBtn2").style.display = ""; 
		document.getElementById("delBtn").style.display = "none"; 
	}
}
function qcommnetUpdateAf(idx, id){
	let ctext= document.getElementById("commentText").value;
	location.href="qcommentUpdate.do?idx="+idx+"&text="+ctext+"&id="+id;
}
</script>
<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>