<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
    
<form class="join_form" name="idfindscreen" method="post" action="findid-pro.jsp">
    <div class="join_title">
		<div>아이디 찾기</div>
	</div>
	<div class="member_component">
		<div class="join_div">
			<div class="search-title">
				<h3></h3>
			</div>
			<section class="form-search">
				<div class="find-name">
					<label>이름</label>
					<input type="text" name="name" class="btn-name" placeholder="등록한 이름">
				</div>
				<br>
				<div class="find-email">
					<label>이메일</label>
					<input type="email" name="email" class="btn-email" placeholder="itbank@itbank.com">
				</div>
				<br>
			</section>
			<div>
				<input type="submit" value="제출">
				<!--<input type="button" name="enter" value="찾기" onclick="id_search()">-->	
			</div>
		</div>
	</div>
	</form>
	<script>
	function id_search(){
		var frm = document.idfindscreen;
		if(frm.name.value.length<1){
			alert('이름을 입력해주세요');
			return;
		}
		if(frm.email.value.length<1){
			alert('이메일을 입력해주세요');
			return;
		}
		frm.action="findIdResult.jsp";
		frm.submit;
	}
</script>
<%@ include file="footer.jsp" %>