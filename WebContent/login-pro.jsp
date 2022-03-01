<%@ include file="header-java.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<jsp:useBean id="user" class="cinemaMember.CinemaMemberDTO" />
<jsp:setProperty property="*" name="user" />

<c:set var="login" value="${Mdao.login(user)}" scope="session" />
<%
   String checkbox = request.getParameter("autologin");
  // Object login = session.getAttribute("login");
   String saveid = request.getParameter("user_id");
   
   if(checkbox != null){
      Cookie ck = new Cookie("ck", saveid);
      ck.setMaxAge(3600); //자동로그인 허용 1시간제한
      response.addCookie(ck);
   }
%>

<c:if test="${login != null }">
	<c:redirect url="main.jsp"></c:redirect>
</c:if>
<c:if test="${login == null }">
	<c:remove var="login"/>
	<script>
		alert('로그인 실패')
		history.go(-1);
	</script>
</c:if>
<!-- 자동로긴 확인하기 -->



