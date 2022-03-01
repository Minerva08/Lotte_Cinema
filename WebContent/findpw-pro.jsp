<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
    <%@ include file="header-java.jsp" %>
    
   <jsp:useBean id="info" class="cinemaMember.CinemaMemberDTO"/>
   <jsp:setProperty property="*" name="info"/>
   <c:set var="findpw" value="${Mdao.findPw(info.user_id, info.email) }"/>
   <c:set var="update" value="${Mdao.updatePw(findpw ,info.user_id) }"/>
   <c:set var="findpwaf" value="${Mdao.findPw(info.user_id, info.email) }"/>
   
   <c:if test="${empty findpw }">
      	<script>
      		alert('가입된 정보가 없습니다')
      		history.go(-1)
      	</script>
      </c:if>
      <c:if test="${not empty findpw }">
      	<script>
      		alert('${info.name } 회원님의 임시비밀번호는 ${findpwaf} 입니다')
      		
      		location.href = 'login.jsp'
      	</script>
      </c:if>
   
      <%-- <c:if test="${not empty findpw }">
      <div>
         <div>
            <div>
               <p>${info.name } 회원님의 임시비밀번호는 ${findpwaf}</p>
                  
            </div>
         </div>
      </div>
      </c:if>
      <c:if test="${empty findpw  }">
      <div class="container">
            <div class="found-fail">
               <h4>등록된 정보가 없습니다</h4>
            </div>
         <div class="found-login">
            <p><input type="button" id="btnback" value="다시 찾기" onClick="history.back()"></p>
         </div>
      </div>
      </c:if> --%>
   
    