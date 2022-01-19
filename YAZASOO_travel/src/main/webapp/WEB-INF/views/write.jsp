<%@page import="mul.camp.a.dto.BbsParam"%>
<%@page import="mul.camp.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/qwe.css" />
    <link rel="stylesheet" type="text/css" href="css/abc.css" />
    <script type="text/javascript" src="js/write.js"></script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">-->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
     <!-- Bootstrap Icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    
    <!-- SimpleLightbox plugin CSS-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/qwe.css" rel="stylesheet" />
    
    
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
<br><br><br><br><br>
<div align="center">
<h1 align="center">write.jsp</h1>
	<form action="writeAf.do" method="post" id="frm">
		<table border="1" style="width:1000px">
			<tr>
				<th>아이디</th>
				<td>
					<input type="hidden" name="id" size="70px" value="<%=mem.getId() %>" readonly>
					<%=mem.getId() %>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" id="title" name="title" size="70px" >
				</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>
					<select name="spot" id="spot">
						<option value="서울" selected>서울</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청도">충청도</option>
						<option value="경상도">경상도</option>
						<option value="전라도">전라도</option>
						<option value="제주도">제주도</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<!-- <textarea rows="20" cols="80" id="content" name="content"></textarea> -->
					<textarea id="summernote" name="content"></textarea>
				</td>
			</tr>
		</table>
	</form>
	<div class="btn">
		<button type="button" onclick="boardWrite()">글쓰기</button>&nbsp;
		<button type="button" onclick="location='board.do'">돌아가기</button>
	</div>
</div>
<jsp:include page="./footer.jsp"></jsp:include>
</body>
<script>
$('#summernote').summernote({
    tabsize: 2,
    height: 400
  });
</script>
</html>