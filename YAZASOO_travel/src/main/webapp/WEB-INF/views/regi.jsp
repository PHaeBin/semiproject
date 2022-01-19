<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/regi.css" />
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 제이쿼리 시작점 확인 -->
<script type="text/javascript" src="js/regi.js"></script>
<!-- 경로 바꾸지 마세요-->


<!--부트스트랩 코드 이거이상 넣지 마세요!!! 시작 -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!--부트스트랩 코드 이거이상 넣지 마세요!!! 종료 -->


<link rel="shortcut icon" type="image/x-icon" href="image/YAZASOO.png">
<title>Registration</title>
</head>

<body>
	<div class="main">
		<div class="register">
		<div class="title"><a href="login.do" style="text-decoration:none; color:black">YAZASOO</a></div>
			<form id="frm" action="regiAf.do" method="post">
				<label>아이디</label><br> <input type="text" class="put" name="id"
					id="id" placeholder="아이디를 입력해주세요">&nbsp;<input type="button" id="btn" onclick="btnClick()" value="확인"><br>
				<p id="idcheck" style="font-size: 8px"></p>
				<br> <label>비밀번호</label> <br> <input type="password"
					class="put" name="pw" id="pw" placeholder="비밀번호를 입력해주세요"> <br>
				<br> <label>비밀번호 확인</label> <br> <input type="password"
					class="put" name="pw2" id="pw2" placeholder="비밀번호를 다시 입력해주세요">
				<br>
				<br> <label>이름</label> <br> <input type="text" class="put"
					name="name" id="name" placeholder="이름을 입력해주세요"> <br>
				<br> <label>성별</label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="gender" id="male" value="남" checked>
				&nbsp; <span id="male">남</span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="gender" id="female" value="여"> &nbsp; <span
					id="female">여</span> <br>
				<br> <label>생년월일</label> <br> <input type="date"
					class="put" name="birth" id="birth"> <br>
				<br> <label>이메일</label> <br> <input type="email"
					class="put" name="email" id="email" placeholder="이메일을 입력해주세요">&nbsp;
					<input type="button" id="btnEmail" onclick="ebtnClick()" value="확인"><br>
				<p id="emailcheck" style="font-size: 8px"></p>
				<br>
				<br> <label>전화번호</label> <br> <input type="text"
					class="put" name="phone" id="phone" placeholder="전화번호를 입력해주세요">
				<br>
				<br> <label>별명</label> <br> <input type="text" class="put"
					name="nickName" id="nickName" placeholder="별명을 입력해주세요"> <br>
				<br>
				<button type="button" onclick="account1()">회원가입</button>

				<div class="goLogin">
					<a href="login.do">로그인</a>
				</div>
			</form>

		</div>
	</div>


</body>
</html>