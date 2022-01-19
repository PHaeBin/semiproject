<%@page import="mul.camp.a.dto.MemberDto"%>
<%@page import="mul.camp.a.dto.BbsParam"%>
<%@page import="mul.camp.a.dto.boardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<boardDto> bbslist=(List<boardDto>)request.getAttribute("bbslist");
String spot = (String)request.getAttribute("spot");
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
<div align="center" style="margin-top: 130px;">
<h1> 여행지 리뷰 게시판 </h1>
<div style="text-align:left; margin-left:10%; font-size:30px"><%=spot %> </div>
<div style="text-align:right; margin-right:10%">
<select id="choice">
   <option value="title">제목</option>   
   <option value="content">내용</option>   
   <option value="writer">작성자</option>
</select>
<input type="text" id="search" value="">
<input type="hidden" id="spot" value="<%=spot%>">
<button type="button" onclick="searchBbs()">검색</button>
</div>

<table border="1" style="width:80%">
   <thead>
      <tr>
      <th>글 번호</th> <th>글 제목</th> <th>작성자</th> <th>날짜</th> <th>조회수</th><th>지역</th>
      </tr>
   </thead>
      <%
         if(bbslist == null || bbslist.size()==0){    //bbslist를 controller 에서 가져와야함
      %>
      <tr>
         <td colspan="6" style="text-align:center">작성된 글이 없습니다 !! 글을 제일먼저 작성해보세요!</td>
      </tr>
      <%
         }
         else{
            for(int i=0;i < bbslist.size();i++)
            {
               boardDto bbs=bbslist.get(i);
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
<div style="text-align:center;" class="btn ">
   <button type="button" onclick="location.href='write.do'">글쓰기</button>
   <!-- <a href="write.do" style="border">글쓰기</a> -->
</div>
<br>
<br><br>
</div>
<br>

<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>
