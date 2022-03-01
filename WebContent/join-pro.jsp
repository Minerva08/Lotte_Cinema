<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header-java.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="user" class="cinemaMember.CinemaMemberDTO" />
	<jsp:setProperty property="*" name="user" />

	<script type="text/javascript">
		const row = ${Mdao.insertAccount(user)}
		
		if (row == 1) {
			alert('회원가입 되었습니다')
			location.href = 'login.jsp';
		}
		else {
			alert('회원가입 실패')
			history.go(-1)
		}
		
	</script>
</body>
</html>