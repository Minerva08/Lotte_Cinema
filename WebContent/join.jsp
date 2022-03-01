<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form action="join-pro.jsp" class="join_form" method="POST">
	<div class="join_title">
		<div>회원 가입</div>
	</div>
	<div class="join_component">
		<div class="join_box">
			<div class="join_names">
				<ul>
					<li>이름<span>*</span></li>
					<li>아이디<span>*</span></li>
					<li>비밀번호<span>*</span></li>
					<li>생년월일<span>*</span></li>
					<li>이메일<span>*</span></li>
				</ul>
			</div>
			<div class="join_input">
				<input type="text" name="name" placeholder="이름" required="required">
				<input type="text" name="user_id" placeholder="아이디" required="required">
				<input type="password" name="user_pw" placeholder="비밀번호" required="required">
				<div>
					<select name="year_u" style="width: 80px;">
						<option>년</option>
						<c:forEach var="i" begin="1950" end="2021">
							<option value="${i}">${i }</option>
						</c:forEach>
					</select>
					<select name="month_u" style="width: 65px;">
						<option>월</option>
						<c:forEach var="i" begin="1" end="12">
							<option value="${i}">${i }</option>
						</c:forEach>
					</select>
					<select name="day_u" style="width: 65px;">
						<option>일</option>
						<c:forEach var="i" begin="1" end="31">
							<option value="${i}">${i }</option>
						</c:forEach>
					</select>
				</div>
				<input type="text" name="email" placeholder="이메일" required="required">
			</div>
		</div>
		<div class="join_submit">
			<input type="submit" value="회원가입">
		</div>
	</div>
</form>

<%@ include file="footer.jsp" %>