<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>

<div class="join_title">
		<div>아이디 찾기</div>
</div>
<div class="member_component">
	<div class="find_pw">

		<form method="POST" action="findpw-pro.jsp">


			<input type="text" name="user_id" placeholder="아이디입력"> 
			<input type="email" name="email" placeholder="이메일"> 
			<input type="submit" value="찾기">
		</form>
	</div>
</div>
<%@include file="footer.jsp"%>