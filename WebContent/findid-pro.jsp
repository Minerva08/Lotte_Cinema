<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header-java.jsp" %>

	<jsp:useBean id="info" class="cinemaMember.CinemaMemberDTO"/>
   <jsp:setProperty property="*" name="info"/>
   <c:set var="findid" value="${Mdao.findId(info.name, info.email) }"/>
   
      <c:if test="${empty findid }">
      	<script>
      		alert('가입된 정보가 없습니다')
      		history.go(-1)
      	</script>
      </c:if>
      <c:if test="${not empty findid }">
      	<script>
      		alert('찾는 아이디는 [ ${findid} ] 입니다')
      		
      		location.href = 'login.jsp'
      	</script>
      </c:if>
