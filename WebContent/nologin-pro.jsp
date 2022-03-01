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
	
	<jsp:useBean id="user" class="cinemaMember.NoMemberDTO" />
	<jsp:setProperty property="*" name="user" />
	<c:choose>
		<c:when test="${user.pw1 eq user.pw2 }">
			
			<c:set var="login2" value="${Mdao.nologin(user)}" scope="session" />
			
			<script>
			      location.href = 'main.jsp'
			</script>		
		</c:when>
		<c:otherwise>
			<script>
			      alert('비밀번호가 같지 않습니다');
			      history.go(-1);
			</script>
		</c:otherwise>
	</c:choose>
		
	
</body>
</html>