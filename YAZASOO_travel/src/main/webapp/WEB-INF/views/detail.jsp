<%@page import="mul.camp.a.dto.commentDto"%>
<%@page import="java.util.List"%>
<%@page import="mul.camp.a.dto.MemberDto"%>
<%@page import="mul.camp.a.dto.boardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
boardDto dto = (boardDto)request.getAttribute("detail");
List<commentDto> list = (List<commentDto>)request.getAttribute("commentlist");
%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/abc.css" />
    <link rel="stylesheet" type="text/css" href="css/qwe.css" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/detail.js?ver=1"></script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    
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
    
    <!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style type="text/css">
th{
   width: 100px;
   text-align:center;
}
</style>	
</head>
<body>
<header id="main-header">
<jsp:include page="./headerMenu.jsp"></jsp:include>
</header>

<div style="margin-top:130px">
<div align="center">
	<table class="table table-bordered" style="width:80%" border="1">
		<tr>
			<th>작성자</th>
			<td><%=dto.getId() %></td>
		</tr>	
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>	
		<tr>
			<th>지역</th>
			<td><%=dto.getSpot() %></td>
		</tr>	
		<tr>
			<th>작성일</th>
			<c:set var="now" value="<%=dto.getRegDate()%>"/>
			<fmt:parseDate value="${now }" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss.S"/>
 		    <td><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd HH:mm"/></td>
		</tr>	
		<tr>
			<th>조회수</th>
			<td><%=dto.getCnt() %></td>
		</tr>	
		<tr>
			<th>내용</th>
			<td align="center"><textarea rows="15" cols="100" id="summernote" readonly><%=dto.getContent() %></textarea></td>
		</tr>	
	</table>
	
	
	<%
	MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
	%>
	<br><br>
	<div class="btn">
	<button type="button" onclick="board()">목록</button>	
	<%if(mem.getId().equals(dto.getId())){ %>
	<%-- <%if(dto.getId().equals("id")){ %> --%>
		<button type="button" onclick="boardUpdate(<%=dto.getIdx() %>)">수정</button>	
		<button type="button" onclick="boardDel(<%=dto.getIdx() %>)">삭제</button>
	<%} %>
	</div>
	<br><br><hr><br><br>
	<input type="hidden" value="<%=mem.getId()%>" id="id">
	<input type="hidden" value="<%=dto.getIdx()%>" id="idx">
	
	<table>
		<tr><th>댓글쓰기</th></tr>
		<tr><td><div style="width:80%"><textarea type="text" id="text" name="text" rows="5" cols="180"></textarea></div></td></tr>
	</table>
		<div style="text-align:center" class="btn"><button type="button" onclick="commentWrite()">등록</button></div>
	
<table border="1" style="width:80%">
   <thead>
      <tr>
      <th>글 번호</th><th>작성자</th><th>내용</th><th>날짜</th><th>비고</th>
      </tr>
   </thead>
      <%

         if(list == null || list.size()==0){    //bbslist를 controller 에서 가져와야함
            
      %>
      <tr>
         <td colspan="5">작성된 댓글이 없습니다 !! 댓글을 제일먼저 작성해보세요!</td>
      </tr>
      <%
         }
         else{
            for(int i=0;i < list.size();i++)
            {
               commentDto comment = list.get(i);
      %>
      <tr>
         <th><%=i+1 %></th>
         <td><%=comment.getId() %></td>
         <td><%=comment.getText()%></td>
         <c:set var="now" value="<%=comment.getRegDate()%>"/>
         <fmt:parseDate value="${now }" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss.S"/>
 		 <td><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd HH:mm"/></td>
         <td>
         <%if(mem.getId().equals(comment.getId())){ %>       
			<a href="#" style="color:black" type="button" onclick="commentDel(<%=comment.getIdx() %>, <%=comment.getBidx() %>)">삭제</a>   
		<%} %>      
         </td>
      </tr>
      <%
            }
         }
      %>
</table>
</div>
</div>
<jsp:include page="./footer.jsp"></jsp:include>
</body>
<script>
$('#summernote').summernote({
    tabsize: 2,
    height: 400,
    toolbar:false,
    disableDragAndDrop : true,
	disable:true,
	readonly:true
  });
$('#summernote').summernote('disable');
</script>
</html>
