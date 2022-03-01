<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<c:if test="${empty login and empty login2}">
   <script>
   	alert('로그인이 필요한 서비스 입니다')
   location.href = 'login.jsp'
   	</script>
   
</c:if> 

<main>
   <div class="main_component">
      <div class="left_nav">
         <ul>
            <li style="background-color: white; color: black;">
               <span>01</span> <span>상영시간</span>
            </li>
            <li style="background-color: #FF243E; color: white;">
               <span>02</span> <span>인원/좌석</span>
            </li>
            <li><span>03</span> <span>결제</span></li>
         </ul>
      </div>
      <div style="width: 1200px; border: 1px solid black; background-color: black;">
         <div class="seat_palce"><h4>좌석 선택</h4></div>
         <div class="screen"><h2>SCREEN</h2></div>
         	<div class="seat_div">
		         <div class="seat_wrapper">
					<!-- 표 -->
		         	</div>
			         
			         <form method="POST" action="main.jsp">			         	
			            <div><p><input type="hidden" name="name" value="${login2.name}" ><p></div>
			            <div><p><input type="hidden" name="pnum" value="${login2.ph}" ><p></div>
			            <div><p><input type="hidden" name="check_pw" value="${login2.pw2}" ><p></div>
			            <div><p><input type="hidden" name="user_id" value="${param.user_id}" ><p></div>
			            <div><p><input type="hidden" name="movie_name" value="${param.movie_name}" ><p></div>
			            <div><p><input type="hidden" name="run_house" value="${param.run_house}"><p></div>
			            <div><p><input type="hidden"  name="start_time" value="${param.start_time}"><p></div>
			            <div><p><input type="hidden"  name="run_date" value="${param.run_date}"><p></div>
			            <div><p><input type="hidden"  name="city" value="${param.city}"><p></div>
			            <div><p><input type="hidden"  name="branch" value="${param.branch}"><p></div>
			            <div style="display:flex; margin:10px; box-sizing:border-box;">
			               <div><p><input type="hidden" id="p1" name="seat1" ><p></div>
			               <div><p><input type="hidden" id="p2" name="seat2"><p></div>
			               <div><p><input type="hidden" id="p3" name="seat3"><p></div>
			               <div><p><input type="hidden" id="p4" name="seat4"><p></div>
			            </div>
			            <p><input type="submit" value="예매하기"></p>
			         </form>
		         </div>
         </div>
      </div>
      <!--<c:if test="${pageContext.request.method == 'POST'}">
         <jsp:useBean id="ticket" class="ticketing.TicketingDTO"/>
         <jsp:setProperty property="*" name="ticket"/>
         <script>
          const row = '${Tdao.insert_ticket(ticket)}'
                 alert(row == 1 ? '성공' : '실패');
         </script>
      </c:if>
      -->
      <div class="main_section"></div>
</main>

<script>

    var selectedSeats = new Array();
    const seatWrapper = document.querySelector(".seat_wrapper");
    
    var clicked = ""; 
    var div = "";
    

    for (var i = 0; i < 7; i++) {
        div = document.createElement("div");
        seatWrapper.append(div);
        
        for (var j = 0; j < 7; j++) {//6
            const input = document.createElement('input');                  
            input.type = "button";   
            input.name = "seats"
            input.classList = "seat";
            //3중포문을 사용하지 않기위해 
            mapping(input, i, j);
            div.append(input);
           
            
            
            input.addEventListener('click', function(e) {
                console.log(e.target.value);
                
                //중복방지 함수   
                selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

                //click class가 존재할때(제거해주는 toggle)
                if (input.classList.contains("clicked")) {
                    input.classList.remove("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                    clicked.forEach((data) => {
                    selectedSeats.push(data.value);
                     
                      
                   /* p1.setAttribute("hidden", "");
                   p2.setAttribute("hidden", "");
                   p3.setAttribute("hidden", "");
                   p4.setAttribute("hidden", ""); */
                   
                    });
                    //click class가 존재하지 않을때 (추가해주는 toggle)
                } else {
                    input.classList.add("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                   var p1=document.getElementById('p1');
                   var p2=document.getElementById('p2');
                   var p3=document.getElementById('p3');
                   var p4=document.getElementById('p4');
                   
                   p1.setAttribute("value", selectedSeats[0]);
                   p2.setAttribute("value", selectedSeats[1]);
                   p3.setAttribute("value", selectedSeats[2]);
                   p4.setAttribute("value", selectedSeats[3]);
                   
                   p1.removeAttribute('hidden');
                   p2.removeAttribute('hidden');
                   p3.removeAttribute('hidden');
                   p4.removeAttribute('hidden');
                    })
                    if (selectedSeats.length > 4) {
                    	alert('4명 초과 예매 할수 없습니다')
                    	location.href = 'seat.jsp?user_id=${param.user_id}&run_date=${param.run_date}&city=${param.city}&branch=${param.branch}&movie_name=${param.movie_name}&start_time=${param.start_time}&run_house=${param.run_house}';
                    	return;
                    }
                }
                console.log(selectedSeats);
            })
           
            
        }
    }
    
    
    function mapping(input, i, j) {
        if (i == 0) {
            input.value = "A" + j;
        } else if (i == 1) {
            input.value = "B" + j;
        } else if (i == 2) {
            input.value = "C" + j;
        } else if (i == 3) {
            input.value = "D" + j;
        } else if (i == 4) {
            input.value = "E" + j;
        } else if (i == 5) {
            input.value = "F" + j;
        } else if (i == 6) {
            input.value = "G" + j;
        }
    }
</script>

<%@ include file="footer.jsp" %>
