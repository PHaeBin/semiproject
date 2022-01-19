<%@page import="mul.camp.a.dto.boardDto"%>
<%@page import="java.util.List"%>
<%@page import="mul.camp.a.dto.MemberDto"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
MemberDto mem = (MemberDto) request.getSession().getAttribute("login");
List<boardDto> mylist = (List<boardDto>)request.getAttribute("mylist");
%>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/mypage.css" />
    <script type="text/javascript" src="js/mypage.js"></script>
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
<script type="text/javascript">
   $(document).ready(function(){
   
      $("#memberUpdateBtn").on("click", function(){
         location.href="member/modify";
      })
   })
</script>
<title>마이 페이지</title>
<style type="text/css">
.center{
   margin: auto;
   width: 60%;
   border: 3px solid #0000ff;
   padding: 10px;    
}
</style>
</head>
<jsp:include page="./headerMenu.jsp"></jsp:include>
<body>
   <br><br><br><br><br><br>
   <h1>마이 페이지</h1>
   <table border="1" style="width:80%" class = description >
   <thead>
      <tr>
      <th>글 번호</th> <th>글 제목</th> <th>작성자</th> <th>날짜</th> <th>조회수</th><th>지역</th>
      </tr>
   </thead>
      <%
         if(mylist == null || mylist.size()==0){    //bbslist를 controller 에서 가져와야함
      %>
      <tr>
         <td colspan="6"><div style="text-align:center">작성된 글이 없습니다 !! 글을 제일먼저 작성해보세요!</div></td>
      </tr>
      <%
         }
         else{
            for(int i=0;i < mylist.size();i++)
            {
               boardDto bbs = mylist.get(i);
      %>
      <tr>
          <c:set var="now" value="<%=bbs.getRegDate()%>"/>
         <th><%=i+1 %></th>
         <td><a href="detail.do?idx=<%=bbs.getIdx()%>"><%=bbs.getTitle()%></a></td>
         <td><%=bbs.getId() %></td>
         <fmt:parseDate value="${now }" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss.S"/>
        <td><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd HH:mm"/></td>
         <td><%=bbs.getCnt()%></td>
         <td><%=bbs.getSpot()%></td>
      </tr>
      <%
            }
         }
      %> 
</table>
         <div class="goLogin ">
            <button type="button" onclick="location.href='Modify.do?id=<%=mem.getId()%>'">회원수정</button>
            <button type="button" onclick="location.href='memberDelete.do?id=<%=mem.getId()%>'">회원 탈퇴</button>
         </div>
<jsp:include page="./footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
   function memberDelete(id){
       alert('정말 탈퇴 하시겠습니까?');
       if(data==0){
            alert("dfdfdfd");
            return;
         }else{
            if(confirm("회원 탈퇴 하시겠습니까?")){
               $("#delForm").submit();
            })
         });
      })
   </script>
</html>