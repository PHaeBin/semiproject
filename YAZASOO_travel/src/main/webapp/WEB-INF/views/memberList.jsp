<%@page import="mul.camp.a.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<MemberDto> mlist = (List<MemberDto>)request.getAttribute("mlist");
MemberDto mem = (MemberDto) request.getSession().getAttribute("login");
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
</head>
<body>
<header id="main-header">
<jsp:include page="./headerMenu.jsp"></jsp:include>
</header>
<br><br><br><br>
<table border="1" style="width:80%">
   <thead>
      <tr>
      <th>??????</th><th>?????????</th><th>??????</th><th>?????????</th><th>??????</th><th>????????????</th><th>?????????</th><th>????????????</th><th>????????????</th><th>??????</th><th>????????????</th>
      </tr>
   </thead>
      <%
         if(mlist == null || mlist.size()==0){    //bbslist??? controller ?????? ???????????????
      %>
      <tr>
         <td colspan="5">????????? ?????? ???????????? !! ?????? ???????????? ??????????????????!</td>
      </tr>
      <%
         }
         else{
            for(int i=0;i < mlist.size();i++)
            {
               MemberDto m = mlist.get(i);
      %>
      <tr>
      		<th><%=i+1 %></th>
      		<td><%=m.getId() %></td>
      		<td><%=m.getName() %></td>
      		<td><%=m.getNickName() %></td>
      		<td><%=m.getGender() %></td>
      		<td><%=m.getBirth() %></td>
      		<td><%=m.getEmail() %></td>
      		<td><%=m.getPhone() %></td>
      		<td><%=m.getDel() %></td>
      		<%if(m.getDel().equals("Y") || m.getDel() == "Y"){ %>
      		<td><button type="button" onclick="memDelN('<%=m.getId() %>','<%=mem.getId()%>')">??????</button></td>
      		<%}else{ %>
      		<td><button type="button" onclick="memDelY('<%=m.getId() %>','<%=mem.getId()%>')">??????</button></td>
      		<%} %>
      		<%if(m.getAuth() == 1){ %>
      		<td><button type="button" onclick="authChange0('<%=m.getId() %>','<%=mem.getId()%>')">??????</button></td>
      		<%}else{ %>
      		<td><button type="button" onclick="authChange1('<%=m.getId() %>','<%=mem.getId()%>')">?????????</button></td>
      		<%} %>
      </tr>
      <%
            }
         }
      %> 
</table>
<jsp:include page="./footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
function memDelN(id, user){
	if(confirm("????????? ?????????????????????????") == true){
		location.href = "memDelN.do?id="+id+"&user="+user;
	}
}
function memDelY(id, user){
	if(confirm("????????? ?????????????????????????") == true){
		location.href = "memDelY.do?id="+id+"&user="+user;
	}
}
function authChange0(id, user){
	if(confirm("???????????? ?????? ???????????? ?????????????????????????") == true){
		location.href = "authChange.do?id="+id+"&auth=0&user="+user;
	}
}
function authChange1(id, user){
	if(confirm("?????? ????????? ???????????? ?????????????????????????") == true){
		location.href = "authChange.do?id="+id+"&auth=1&user="+user;
	}
}
</script>
</html>