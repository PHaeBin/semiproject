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
      <th>번호</th><th>아이디</th><th>이름</th><th>닉네임</th><th>성별</th><th>생년월일</th><th>이메일</th><th>전화번호</th><th>탈퇴여부</th><th>비고</th><th>권한변경</th>
      </tr>
   </thead>
      <%
         if(mlist == null || mlist.size()==0){    //bbslist를 controller 에서 가져와야함
      %>
      <tr>
         <td colspan="5">작성된 글이 없습니다 !! 글을 제일먼저 작성해보세요!</td>
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
      		<td><button type="button" onclick="memDelN('<%=m.getId() %>','<%=mem.getId()%>')">복구</button></td>
      		<%}else{ %>
      		<td><button type="button" onclick="memDelY('<%=m.getId() %>','<%=mem.getId()%>')">탈퇴</button></td>
      		<%} %>
      		<%if(m.getAuth() == 1){ %>
      		<td><button type="button" onclick="authChange0('<%=m.getId() %>','<%=mem.getId()%>')">일반</button></td>
      		<%}else{ %>
      		<td><button type="button" onclick="authChange1('<%=m.getId() %>','<%=mem.getId()%>')">관리자</button></td>
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
	if(confirm("회원을 복구하시겠습니까?") == true){
		location.href = "memDelN.do?id="+id+"&user="+user;
	}
}
function memDelY(id, user){
	if(confirm("회원을 탈퇴시키겠습니까?") == true){
		location.href = "memDelY.do?id="+id+"&user="+user;
	}
}
function authChange0(id, user){
	if(confirm("관리자를 일반 회원으로 변경하시겠습니까?") == true){
		location.href = "authChange.do?id="+id+"&auth=0&user="+user;
	}
}
function authChange1(id, user){
	if(confirm("일반 회원을 관리자로 변경하시겠습니까?") == true){
		location.href = "authChange.do?id="+id+"&auth=1&user="+user;
	}
}
</script>
</html>