<%@page import="mul.camp.a.dto.boardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%
boardDto dto = (boardDto)request.getAttribute("detail");
%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/abc.css" />
    <link rel="stylesheet" type="text/css" href="css/qwe.css" />
    <script type="text/javascript" src="js/board.js"></script>
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
<br><br><br><br>
<div align="center">
	<form action="boardUpdateAf.do" method="post" id="frm">
		<table border="1" style="width:1000px">
			<input type="hidden" id="idx" name="idx" value="<%=dto.getIdx() %>">
			<tr>
				<th>?????????</th>
				<td>
					<input type="hidden" name="id" size="70px" value="<%= dto.getId() %>">
					<%= dto.getId() %>
				</td>
			</tr>
			
			<tr>
				<th>?????????</th>
				<td>
					<input type="hidden" id="date" name="date" size="70px" value="<%= dto.getRegDate()%>">
					<%= dto.getRegDate()%>
				</td>
			</tr>
			<tr>
				<th>??????</th>
				<td>
					<input type="text" id="title" name="title" size="70px" value="<%= dto.getTitle()%>">
				</td>
			</tr>
			<tr>
				<th>??????</th>
				<td>
					<select name="spot" id="spot">
						<option value="??????" <%if(dto.getSpot().equals("??????")){ %>selected<%} %>>??????</option>
						<option value="?????????" <%if(dto.getSpot().equals("?????????")){ %>selected<%} %>>?????????</option>
						<option value="?????????" <%if(dto.getSpot().equals("?????????")){ %>selected<%} %>>?????????</option>
						<option value="?????????" <%if(dto.getSpot().equals("?????????")){ %>selected<%} %>>?????????</option>
						<option value="?????????" <%if(dto.getSpot().equals("?????????")){ %>selected<%} %>>?????????</option>
						<option value="?????????" <%if(dto.getSpot().equals("?????????")){ %>selected<%} %>>?????????</option>
						<option value="?????????" <%if(dto.getSpot().equals("?????????")){ %>selected<%} %>>?????????</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>??????</th>
				<td>
					<textarea rows="20" cols="80" id="summernote" name="content" ><%=dto.getContent() %></textarea>
				</td>
			</tr>
		</table>	
		<div class="btn"><button type="button" onclick="boardUpdate()">????????????</button></div>
	</form>
</div>
<jsp:include page="./footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
function boardUpdate(){
	if($("#title").val() == ''){
		alert("????????? ??????????????????");
		$("#title").focus();
	}else if($("#summernote").val() == ''){
		alert("????????? ???????????????.");
		$("#summernote").focus();
	}else{
		if (confirm("?????? ?????????????????????????") == true) {
			$("#frm").submit();
        }
	}
}
$('#summernote').summernote({
    tabsize: 2,
    height: 400
  });
</script>
</html>