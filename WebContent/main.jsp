<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<c:if test="${pageContext.request.method == 'POST'}">
	
	<c:if test="${not empty login }">
		<jsp:useBean id="info_ticket" class="ticketing.TicketingDTO" />
		<jsp:setProperty property="*" name="info_ticket" />
		<script>
	             const row = '${Tdao.insert_ticket(info_ticket)}'
	                    alert(row == 1 ? '예매 성공' : '예매 실패');
	    </script>
    </c:if>
    
    <c:if test="${not empty login2 }">
    	<jsp:useBean id="noinfo_ticket" class="nticketing.NticketingDTO"></jsp:useBean>
    	<jsp:setProperty property="*" name="noinfo_ticket"/>
    	
    	<script>
	             const row = '${Ndao.insert_Nticket(noinfo_ticket)}'
	                    alert(row == 1 ? '예매 성공' : '예매 실패');
	    </script>
    </c:if>
    
</c:if>
<main>
<div class="main_component">
	<div class="left_nav">
		<ul>
			<li><span>01</span> <span>상영시간</span></li>
			<li><span>02</span> <span>인원/좌석</span></li>
			<li><span>03</span> <span>결제</span></li>
		</ul>
	</div>
	<div class="movie_place">
		<div class="movie_place_tab">
			<h4 id="bs">영화관</h4>
		</div>
		<div class="place_choose">전체</div>
		<div class="movie_selector">
			<div id="busan">
				<ul>
					<li id="select1">
						<button onclick="btn1()" id="b1input">부산</button>
						<div>
							<img src="image/check.png" hidden="" id="img1">
						</div>
					</li>
					<li id="select2">
						<button onclick="btn2()" id="b2input">서울</button>
						<div>
							<img src="image/check.png" hidden="" id="img2">
						</div>
					</li>
				</ul>
			</div>
			<div style="width: 50%; display: none;" id="list1">
				<ul>
					<li>
						<button onclick="btn11()" id="col11">센텀</button>
						<div>
							<img src="image/check.png" hidden="" id="img11">
						</div>
					</li>
					<li>
						<button onclick="btn12()" id="col12">사상</button>
						<div>
							<img src="image/check.png" hidden="" id="img12">
						</div>
					</li>
					<li>
						<button onclick="btn13()" id="col13">서면</button>
						<div>
							<img src="image/check.png" hidden="" id="img13">
						</div>
					</li>
				</ul>
			</div>

			<div style="width: 50%; display: none;" id="list2">
				<ul>
					<li>
						<button onclick="btn21()" id="col21">강남</button>
						<div>
							<img src="image/check.png" hidden="" id="img21">
						</div>
					</li>
					<li>
						<button onclick="btn22()" id="col22">명동</button>
						<div>
							<img src="image/check.png" hidden="" id="img22">
						</div>
					</li>
					<li>
						<button onclick="btn23()" id="col23">이태원</button>
						<div>
							<img src="image/check.png" hidden="" id="img23">
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="movie_choose">
		<div class="movie_choose_tab">
			<h4 id="select_mov">영화 선택</h4>
		</div>

		<div class="selector_option"></div>
		<div class="movie_list">

			<ul>
				<li><c:if
						test="${not empty dailyResult.dailyBoxOfficeList.dailyBoxOffice}">
						<c:forEach
							items="${dailyResult.dailyBoxOfficeList.dailyBoxOffice}"
							var="boxoffice" varStatus="st">
							<div>
								<div id="${st.index }">
									<button onclick="selectmov(${st.index})">${boxoffice.movieNm }</button>
									<div>
										<img src="image/check.png" hidden="" id="${boxoffice.movieNm }">
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if></li>
			</ul>

		</div>
	</div>
	<div class="date">
		<div class="date_tab">
			<h4><%=today%>(오늘)
			</h4>
		</div>
		<div class="clock"></div>
		<div id="select_t">
			<div>
				<form action="seat.jsp">
					<input type="hidden" name="user_id" value="${login.user_id }">
					<input type="hidden" name="run_date" value="<%=today%>"> 
					<input type="hidden" id="area1" name="city"> 
					<input type="hidden" id="area2" name="branch"> 
					<input type="hidden" id="selectmov" name="movie_name"> <input type="hidden"
						id="time2" name="start_time"> <input type="hidden"
						id="house" name="run_house">
					<c:forEach var="i" begin="9" end="22" step="2" varStatus="vs">
						<c:forEach var="j" begin="0" end="59" step="30">
							<button id="time" data-start_time="${i}:${j eq 0 ? '00': j}"
								data-run_house="${vs.count }">
								${i}:${j eq 0 ? '00': j}<br> ${vs.count }관
							</button>

						</c:forEach>
					</c:forEach>
				</form>

			</div>
		</div>
	</div>
</div>
<div class="main_section"></div>
</main>


<script>
		window.onload = btn1();
		
		const times = document.querySelectorAll('#time')
		times.forEach(th => th.style.cursor = 'pointer')
		times.forEach(btn => {
		   btn.onclick = function(){
			      var  time1 = btn.dataset.start_time
			      var time2 = document.getElementById('time2');
			      time2.setAttribute("value", time1);
			      
			      var  house1 = btn.dataset.run_house
			      var house2 = document.getElementById('house');
			      house2.setAttribute("value", house1);				   
			  }
		})
   
      function btn1() {
         var va = document.getElementById('area1');
         va.setAttribute("value", "부산")
         var el = document.getElementById('list1');
         el.setAttribute("style", "width: 50%;")
         var ell = document.getElementById('list2');
         ell.setAttribute("style", "width: 50%; display: none;")
         
         document.getElementById('select1').setAttribute("style", "background-color: white;");
         document.getElementById('select2').removeAttribute('style');
         
         document.getElementById('img1').removeAttribute('hidden');
         document.getElementById('img2').setAttribute("hidden", "");      
         
         document.getElementById('b1input').setAttribute("style", "width: 90%;background-color: white;border: none;text-align: left;padding: 7px 16px;cursor: pointer;font-size: 13px;margin: 2px;font-weight: bold;");
         document.getElementById('b2input').setAttribute("style", "width: 90%;background-color: rgb(245,245,245);border: none;text-align: left;padding: 7px 16px;cursor: pointer;font-size: 13px;margin: 2px;font-weight: bold;");
         
         var va2 = document.getElementById('area2');
         va2.removeAttribute('value');
         document.getElementById('select_t').setAttribute("style", "display: none;");
         
      }
      function btn2() {
         var va = document.getElementById('area1');
         va.setAttribute("value", "서울");
         var el = document.getElementById('list2');
         el.setAttribute("style", "width: 50%;");
         var ell = document.getElementById('list1');
         ell.setAttribute("style", "width: 50%; display: none;")
         
         document.getElementById('select2').setAttribute("style", "background-color: white;");
         document.getElementById('select1').removeAttribute('style');
         
         document.getElementById('img2').removeAttribute('hidden');
         document.getElementById('img1').setAttribute("hidden", "");
         
         document.getElementById('b2input').setAttribute("style", "width: 90%;background-color: white;border: none;text-align: left;padding: 7px 16px;cursor: pointer;font-size: 13px;margin: 2px;font-weight: bold;");
         document.getElementById('b1input').setAttribute("style", "width: 90%;background-color: rgb(245,245,245);border: none;text-align: left;padding: 7px 16px;cursor: pointer;font-size: 13px;margin: 2px;font-weight: bold;");
         
         var va2 = document.getElementById('area2');
         va2.removeAttribute('value');
         
         document.getElementById('select_t').setAttribute("style", "display: none;");
      }
      function btn11() {
         var va = document.getElementById('area2');
         va.setAttribute("value", "센텀");
         
         document.getElementById('img11').removeAttribute('hidden');
         document.getElementById('img12').setAttribute("hidden", "");
         document.getElementById('img13').setAttribute("hidden", "");
         
         document.getElementById('col11').setAttribute("style", "color: red;")
         document.getElementById('col12').removeAttribute('style');
         document.getElementById('col13').removeAttribute('style');
         
         var b = document.getElementById('bs');
         b.innerHTML = "센텀";
         document.getElementById('select_t').setAttribute("style", "");
      }
      function btn12() {
         var va = document.getElementById('area2');
         va.setAttribute("value", "사상");
         
         document.getElementById('img12').removeAttribute('hidden');
         document.getElementById('img11').setAttribute("hidden", "");
         document.getElementById('img13').setAttribute("hidden", "");
         
         document.getElementById('col12').setAttribute("style", "color: red;")
         document.getElementById('col11').removeAttribute('style');
         document.getElementById('col13').removeAttribute('style');
         
         var b = document.getElementById('bs');
         b.innerHTML = "사상";
         document.getElementById('select_t').setAttribute("style", "");
      }
      function btn13() {
         var va = document.getElementById('area2');
         va.setAttribute("value", "서면");
         
         document.getElementById('img13').removeAttribute('hidden');
         document.getElementById('img12').setAttribute("hidden", "");
         document.getElementById('img11').setAttribute("hidden", "");
         
         document.getElementById('col13').setAttribute("style", "color: red;")
         document.getElementById('col12').removeAttribute('style');
         document.getElementById('col11').removeAttribute('style');
         
         var b = document.getElementById('bs');
         b.innerHTML = "서면";
         document.getElementById('select_t').setAttribute("style", "");
      }
      function btn21() {
         var va = document.getElementById('area2');
         va.setAttribute("value", "강남");
         
         document.getElementById('img21').removeAttribute('hidden');
         document.getElementById('img22').setAttribute("hidden", "");
         document.getElementById('img23').setAttribute("hidden", "");
         
         document.getElementById('col21').setAttribute("style", "color: red;")
         document.getElementById('col22').removeAttribute('style');
         document.getElementById('col23').removeAttribute('style');
         
         var b = document.getElementById('bs');
         b.innerHTML = "강남";
         document.getElementById('select_t').setAttribute("style", "");
      }
      function btn22() {
         var va = document.getElementById('area2');
         va.setAttribute("value", "명동");
         
         document.getElementById('img22').removeAttribute('hidden');
         document.getElementById('img21').setAttribute("hidden", "");
         document.getElementById('img23').setAttribute("hidden", "");
         
         document.getElementById('col22').setAttribute("style", "color: red;")
         document.getElementById('col23').removeAttribute('style');
         document.getElementById('col21').removeAttribute('style');
         
         var b = document.getElementById('bs');
         b.innerHTML = "명동";
         document.getElementById('select_t').setAttribute("style", "");
      }
      function btn23() {
         var va = document.getElementById('area2');
         va.setAttribute("value", "이태원");
         
         document.getElementById('img23').removeAttribute('hidden');
         document.getElementById('img22').setAttribute("hidden", "");
         document.getElementById('img21').setAttribute("hidden", "");
         
         document.getElementById('col23').setAttribute("style", "color: red;")
         document.getElementById('col22').removeAttribute('style');
         document.getElementById('col21').removeAttribute('style');
         
         var b = document.getElementById('bs');
         b.innerHTML = "이태원";
         document.getElementById('select_t').setAttribute("style", "");
      }
      
      
      var list = new Array();
      <c:forEach items="${dailyResult.dailyBoxOfficeList.dailyBoxOffice}" var="boxoffice">
         list.push("${boxoffice.movieNm }");
      </c:forEach>
      function selectmov(e) {
         
         var va = document.getElementById('selectmov');
         var vb = document.getElementById('select_mov');
         for (var i = 0 ; i < list.length ; i++) {
          if (e == i) {
             	va.setAttribute("value", list[i]);   
             	vb.innerHTML = list[i];
        document.getElementById(list[i]).removeAttribute('hidden');
        document.getElementById(e).setAttribute("style", "flex-wrap: wrap; justify-content: flex-start; display: flex; align-items: center; border: 2px solid black; box-sizing: border-box;width: 348px;height: 48px; position: absolute;");
          }
          else {
          	document.getElementById(list[i]).setAttribute("hidden", "");
          	document.getElementById(i).setAttribute("style", "flex-wrap: wrap; justify-content: flex-start; display: flex; align-items: center; box-sizing: border-box;width: 348px;height: 48px; position: absolute;");
          }
       }
         
      }
      
   </script>

<%@ include file="footer.jsp"%>