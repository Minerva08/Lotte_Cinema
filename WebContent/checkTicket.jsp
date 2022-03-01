<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<c:set var="receipt_list" value="${Tdao.get_ticket(login.user_id)}" />
<jsp:useBean id="nTicket" class="nticketing.NticketingDTO"/>
<jsp:setProperty property="*" name="nTicket"/>
<c:set var="nTicket_DTO" value="${Ndao.get_Nticket(nTicket.check_pw, nTicket.pnum) }"/>

<c:set var="result" value="${Ndao.get_Nticket1(nTicket.check_pw, nTicket.pnum)}"></c:set>
<!-- <script>
	const row = ${Ndao.get_Nticket1(nTicket.check_pw, nTicket.pnum)}
	if (row == null) {
		alert('정보가 존재 하지 않습니다')
		history.go(-1);
	}
</script> -->
<c:if test="${empty result and empty login2 and empty login}">
	<script>
		alert('정보가 존재하지 않습니다')
		history.go(-1);
	</script>
</c:if>

<div class="checkTicket_section"></div>

<div class="checkTicket_main">
   <div class="left_box">
      <div class="benefits">
         <c:if test="${empty login }">
            <div>비회원</div>
         </c:if>
         <c:if test="${not empty login }">
            <div>회원</div>
         </c:if>
         <div>
            <span>
         		<%-- <c:if test="${not empty result }">
         			${result.name }
         		</c:if> --%>
               <c:if test="${not empty login }">
                  ${login.name }님
               </c:if>
               <c:if test="${not empty login2 }">
                  ${login2.name }님
               </c:if>
               <c:if test="${empty login and empty login2}">
                  <c:forEach var="dto" items="${nTicket_DTO}" begin="1" end="1">
                  	<c:if test="${dto.pnum eq param.pnum }">
                  		${dto.name }님
                  	</c:if>
                  </c:forEach>
               </c:if>
            </span> 반가워요 !
         </div>
         <div>지금 회원 가입 하시고 롯데시네마의 다양한 혜택을 만나 보세요.</div>
         <div>
               <c:if test="${empty login }">
                  <a href="join.jsp"><button style="cursor: pointer;">회원가입</button></a> 	
               </c:if>
               <c:if test="${not empty login }">
               </c:if>
         </div>
      </div>
   </div>
   <div class="right_box">
      <div class="right_component">
         <div class="right_title">
            <span>MY 영화관</span>
         </div>
         <div class="right_boxList">
            <div>
               <span>+</span> <span>1st</span>
            </div>
            <div>
               <span>+</span> <span>2st</span>
            </div>
            <div>
               <span>+</span> <span>2st</span>
            </div>
         </div>
         <div class="right_bottom">
               <span style="font-weight: bold; font-size: 20px;"><%= today %></span>
         </div>
      </div>
   </div>
</div>
<div class="checkTicket_title">
   <button>예매내역</button>
</div>



<div class="checkTicket_bottom">
   <div class="current_receipt_title">
      <table>
      <thead>
         <tr>
            <th>제목</th>
            <th>예매 날짜</th>
            <th>상영 시간</th>
            <th>관 번호</th>
            <th>좌석</th>
            <th>인원</th>
         </tr>
      </thead>
      <tbody>
         <c:if test="${not empty login }">
         <c:forEach var="receipt" items="${receipt_list }">
            <tr>
               <td>${receipt.movie_name}</td>
               <td>${receipt.run_date}</td>
               <td>${receipt.start_time}</td>
               <td>${receipt.run_house}관</td>
               <td>
                  ${receipt.seat1}
                  ${receipt.seat2 ne 'undefined' ? receipt.seat2 : ''}
                  ${receipt.seat3 ne 'undefined' ? receipt.seat3 : ''}
                  ${receipt.seat4 ne 'undefined' ? receipt.seat4 : ''}
               </td>
               <td>(총${receipt.person_count}명)</td>
            </tr>
         </c:forEach>
         </c:if>
         <c:if test="${empty login }">
         <c:forEach var="receipt" items="${nTicket_DTO }">
            <tr>
            
               <td>${receipt.movie_name}</td>
               <td>${receipt.run_date}</td>
               <td>${receipt.start_time}</td>
               <td>${receipt.run_house}관</td>
               <td>
                  ${receipt.seat1}
                  ${receipt.seat2 ne 'undefined' ? receipt.seat2 : ''}
                  ${receipt.seat3 ne 'undefined' ? receipt.seat3 : ''}
                  ${receipt.seat4 ne 'undefined' ? receipt.seat4 : ''}
               </td>
               <td>(총${receipt.person_count}명)</td>
            </tr>
         </c:forEach>
         </c:if>
         <c:if test="${not empty login2 }">
         <c:set var="login2_list" value="${Ndao.get_Nticket(login2.pw2, login2.ph )}" scope="session"></c:set>
         <c:forEach var="receipt" items="${login2_list}">
         
            <tr>
               <td>${receipt.movie_name}</td>
               <td>${receipt.run_date}</td>
               <td>${receipt.start_time}</td>
               <td>${receipt.run_house}관</td>
               <td>
                  ${receipt.seat1}
                  ${receipt.seat2 ne 'undefined' ? receipt.seat2 : ''}
                  ${receipt.seat3 ne 'undefined' ? receipt.seat3 : ''}
                  ${receipt.seat4 ne 'undefined' ? receipt.seat4 : ''}
               </td>
               <td>(총${receipt.person_count}명)</td>
            </tr>
         </c:forEach>
         </c:if>
      </tbody>
      </table>
   </div>
</div>




<%@ include file="footer.jsp"%>