<%@page import="mul.camp.a.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
MemberDto mem = (MemberDto) request.getSession().getAttribute("login");
MemberDto member = (MemberDto) request.getAttribute("member");
%>
<html>
   <head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/memberDelete.css" />
  <script type="text/javascript" src="js/memberDelete.js"></script>
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
      
      <title>회원탈퇴</title>
   </head>
   <jsp:include page="./headerMenu.jsp"></jsp:include>
   <body>
   <section class="login-form">
     <br><br><br><br>
         <section id="container">
         <form action="memberDeleteAf.do" method="post">
            <div class="register">
               <label class="control-label" for="userId">아이디</label><br>
               <input type="text" class="put" name="id" size="70px" value="<%= mem.getId() %>" readonly="readonly"/>
            </div>
            <div class="register">
               <label class="control-label" for="userPass">비밀번호</label><br>
               <input class="put"  type="password" id="pw" name="pw">
               <input type="hidden" value="<%=mem.getPw()%>" id="pw2">
            </div>
            <div class="register">
               <button type="button" onclick="memberDelete('<%=mem.getId()%>')">회원 탈퇴</button>
            </div>
         </form>
      
      </section>
      
   </body>
   
   
<script type="text/javascript">
function memberDelete(id){
   var pw = document.getElementById("pw").value;
   var pw2 = document.getElementById("pw2").value;
   if(confirm("정말 탈퇴하시겠습니까?") == true){
      if(pw == pw2){
         location.href = "memberDeleteAf.do?id=" + id;
      }
      else{
         alert("비밀번호가 일치하지 않습니다.");
      }
   }
}
</script>

</html>