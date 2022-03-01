<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<div class="join_kinds">
   <ul>
      <li><button onclick="memberBtn()">회원</button></li>
      <li><button onclick="noMemberBtn()">비회원</button></li>
      <li><button onclick="noMemberTicketCheck()">비회원 예매확인</button></li>
   </ul>
</div>
<div class="login_banner"><img src="image/login_banner.jpg"></div>
<form id="member_form" style="display: block;" action="login-pro.jsp" method="POST">
   <div class="member_component">
      <div class="L_POINT">
         <span>L.POINT, 롯데시네마 ID로 별도의 회원가입 없이 이용 가능 합니다</span>
      </div>
      <div class="login_form">
         <div class="idpw">
            <input type="text" name="user_id" value="${cookie.ck.value }" placeholder="아이디 또는 이메일을 입력해 주세요." required="required"> 
            <input type="password" name="user_pw" placeholder="비밀번호를 입력해 주세요." required="required">
         </div>
         <div class="login_button">
            <input type="submit" value="로그인" >
         </div>
      </div>
      <div class="login_nav">
         <div class="save">
            <input type="checkbox"  name="autologin" ${cookie.ck ne null ? 'checked' : ''}>아이디 저장
         </div>
         <div class="find">
            <ul>
               <li><a href="join.jsp">회원가입    |</a></li>
               <li><a href="findid.jsp">아이디 찾기    |</a></li>
               <li><a href="findpw.jsp">비밀번호 찾기</a></li>
            </ul>
         </div>
      </div>
   </div>
</form>
<form id="noMember_form" style="display: none;" method="POST" action="nologin-pro.jsp">
   <div class="noMember_component">
      <div class="main_box">
         <div class="names">
            <ul>
               <li>이름<span>*</span></li>
               <li>휴대폰 번호<span>*</span></li>
               <li>생년월일<span>*</span></li>
               <li>예매 비밀번호<span>*</span></li>
               <li>예매 비밀번호 확인<span>*</span></li>
            </ul>
         </div>
         
         <div class="inputs">
            <input type="text" name="name" placeholder="이름을 입력해 주세요" required="required">
            <input type="text" name="ph" placeholder="휴대폰 번호(- 생략)를 입력해 주세요." required="required">
            <div>
               <select id="br1" name="br1">
                     <option>출생년도</option>      <!-- 반복문으로 해결 -->
                  <c:forEach var="i" begin="1950" end="2021">
                     <option value="${i}">${i}</option>
                  </c:forEach>      <!-- 반복문으로 해결 -->
               </select>
               <select id="br2" name="br2">
                     <option>월</option>
                  <c:forEach var="i" begin="1" end="12">
                     <option value="${i}">${i}</option>
                  </c:forEach>
               </select>
               <select id="br3" name="br3">
                     <option>일</option>
                  <c:forEach var="i" begin="1" end="31">
                     <option value="${i}">${i}</option>
                  </c:forEach>
               </select>
            </div>            
            <input type="password" name="pw1" placeholder="예매 비밀번호 (4자리)를 입력해 주세요." required="required">
            <input type="password" name="pw2" placeholder="예매 비밀번호 (4자리)를 재입력해 주세요." required="required">
         </div>
      </div>
      <div class="notice">비회원 로그인 시 예매 및 예매확인/취소 메뉴만 이용 가능하며 관람권, 할인권을 포함한 기타 결제, 할인수단은 정회원 로그인 시 사용 가능 합니다.</div>
      <div class="bottom_button">
         <a href="join.jsp">회원가입</a>
         <input type="submit" value="비회원 로그인">
      </div>
   </div>
</form>

<form action="checkTicket.jsp" id="ticketCheck_form" method="POST">
   <div class="ticketCheck_component">
		<div>
			<span>예매하신 전화번호와 비밀번호를 입력해주세요.</span>
		</div>   	
	   <div>
	      <input type="text" name="pnum" placeholder="전화번호를 입력해주세요." required="required"> 
	      <input type="password" name="check_pw" placeholder="비회원 비밀번호를 입력해주세요." required="required">
	      <input type="submit" value="확인하기">
	   </div>
   </div>
</form>
<script>
   
   function memberBtn() {
      var noMemberForm = document.getElementById('noMember_form');
      var memberForm = document.getElementById('member_form');
      var TicketCheckForm = document.getElementById('ticketCheck_form');
      var memberBtn = document.querySelector('.join_kinds > ul > li:nth-child(1)')
      var noMemberBtn = document.querySelector('.join_kinds > ul > li:nth-child(2)')
      var TicketCheckBtn = document.querySelector('.join_kinds > ul > li:nth-child(3)')
      noMemberForm.style.display = 'none';
      memberForm.style.display = 'block';
      TicketCheckForm.style.display = 'none';
      memberBtn.style.borderBottom = '3px solid black';
      noMemberBtn.style.borderBottom = '1px solid #dadada';
      TicketCheckBtn.style.borderBottom = '1px solid #dadada';
   }
   
   function noMemberBtn() {
      var noMemberForm = document.getElementById('noMember_form');
      var memberForm = document.getElementById('member_form');
      var TicketCheckForm = document.getElementById('ticketCheck_form');
      var memberBtn = document.querySelector('.join_kinds > ul > li:nth-child(1)')
      var noMemberBtn = document.querySelector('.join_kinds > ul > li:nth-child(2)')
      var TicketCheckBtn = document.querySelector('.join_kinds > ul > li:nth-child(3)')
      noMemberForm.style.display = 'block';
      memberForm.style.display = 'none';
      TicketCheckForm.style.display = 'none';
      memberBtn.style.borderBottom = '1px solid #dadada';
      noMemberBtn.style.borderBottom = '3px solid black';
      TicketCheckBtn.style.borderBottom = '1px solid #dadada';
   }
   
   function noMemberTicketCheck() {
      var noMemberForm = document.getElementById('noMember_form');
      var memberForm = document.getElementById('member_form');
      var TicketCheckForm = document.getElementById('ticketCheck_form');
      var memberBtn = document.querySelector('.join_kinds > ul > li:nth-child(1)')
      var noMemberBtn = document.querySelector('.join_kinds > ul > li:nth-child(2)')
      var TicketCheckBtn = document.querySelector('.join_kinds > ul > li:nth-child(3)')
      noMemberForm.style.display = 'none';
      memberForm.style.display = 'none';
      TicketCheckForm.style.display = 'block';
      memberBtn.style.borderBottom = '1px solid #dadada';
      noMemberBtn.style.borderBottom = '1px solid #dadada';
      TicketCheckBtn.style.borderBottom = '3px solid black';
   }
</script>


<%@ include file="footer.jsp" %>