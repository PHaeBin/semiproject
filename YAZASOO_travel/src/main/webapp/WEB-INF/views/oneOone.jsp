<%@page import="mul.camp.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto) request.getSession().getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/qwe.css" />
    <link rel="stylesheet" type="text/css" href="css/abc.css" />
    
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
    <link href="css/abc.css" rel="stylesheet" />
    
    <link rel="shortcut icon" type="image/x-icon" href="image/YAZASOO.png">
   
    <title>1:1 문의하기</title>
<br>
<br>
<hr>
</head>
<body>
<script type="text/javascript" src="js/oneOone.js"></script>
<header id="main-header">
<jsp:include page="./headerMenu.jsp"></jsp:include>
</header>
<body>
<br><br><br>
	<form action="oneOoneAf.do" method="post" id="frm">
		<table>
			<tr>
				<th>작성자 </th>
				<td><input value="<%=mem.getId()%>" type="hidden" name="id"><%=mem.getId()%></td>
			<tr>
				<th>분류 </th>
				<td><select name="qtype" id="qtype">
						<option value="분류 선택">분류 선택</option>
						<option value="계정 관리">계정 관리</option>
						<option value="내글 관리">내글 관리</option>
						<option value="유저 신고">유저 신고</option>
				</select></td>
			</tr>
			<tr>
				<th>제목 </th>
				<td><textarea rows="1" cols="100" name="qtitle" id="qtitle"></textarea>
				</td>
			</tr>

			<tr>
				<th>내용 </th>
				<td><textarea rows="10" cols="100" name="qcontent"
						id="qcontent"></textarea></td>
			</tr>
			</table>
	</form>
	<div class="btn" style="text-align:right; margin-right:10%">
	<span style="margin-right:30%"><button type="button" onclick="qWrite()">작성</button></span>
	<button type="button" onclick="location.href='myq.do?id=<%=mem.getId()%>'"/>내 문의내역 보기</button></div>
	<br>
<jsp:include page="./footer.jsp"></jsp:include>
</body>

</html>






