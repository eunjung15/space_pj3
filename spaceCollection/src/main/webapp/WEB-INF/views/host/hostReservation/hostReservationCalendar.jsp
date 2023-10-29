<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/form/hostTop.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.8/index.global.min.js"></script>
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/main.css'
		rel='stylesheet' />
	<script>
	  //#,### 포멧 적용시키는 정규식 함수
		 
	  	
	  	
		var memoColor = "";
	  	
		function setMemoColor(colorCode){
			memoColor = colorCode;	
			$('#colorModal').modal('hide');
			setTimeout(() => {
				alert('날짜를 지정하여 주세요');
			}, 200);
		}
	  	
	    document.addEventListener('DOMContentLoaded', function() {
	    	  var calendarEl = document.getElementById('calendar');
	    	  var popup = null; // 팝업 요소
	    	  var savedInfo = null; // 클릭한 이벤트 정보
	    	  var startDate = "";
	    	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    	    timeZone: 'local',
	    	    initialView: 'dayGridMonth',
	    	    locale: 'ko',
	    	    aspectRatio: 1.35,
	    	    height: 900,
	    	    dayMaxEventRows: true,
	    	    selectable:false,
	    	    views: {
	    	      timeGrid: {
	    	        dayMaxEventRows: 4 
	    	      }
	    	    },
	    	    headerToolbar: {
	    	        center: 'addEventButton'
	    	      },
	    	      customButtons: {
	    	          addEventButton: {
	    	            text: '일정 추가',
	    	            click: function() {
	    	              $('#colorModal').modal('show');
						  calendar.setOption('selectable', true);
						  
	    	            }
	    	          }
	    	        },
	    	        select: function(info) {
	    	        	if (calendar.getOption('selectable')) { // 선택 가능한 상태일 때만 처리
	    	        	  
	    	        	  startDate = info.startStr; // 시작 날짜 저장
    	        	      calendar.setOption('selectable', false); // 시작 날짜 선택 후 선택 불가능하게 변경
   	        	          endDate = info.endStr; // 끝나는 날짜 저장
   	        	         
   	        	          calendar.setOption('selectable', false); // 선택 불가능하도록 변경
   	        	          var title = prompt('일정 이름을 입력하세요');
   	    	              var contentStr = prompt('일정 내용을 입력하세요');
   	        	          $.ajax({
		            			url:"<c:url value='/insertMemo'/>",
							    data:{
							    	title:title,
									content:contentStr,
									start:startDate+"",
									end:endDate+"",
									color:memoColor
							    },
							    success:function(response){
							    	console.log(response);
							    	location.reload();
							    },
							    error:function(error, xhr, status){
							    	console.log(error);
							    	console.log(xhr);
							    	console.log(status);
							    }
		            		});
		                	startDate = null; // 초기화
    	        	        endDate = null;
    	        		}
                  	},
	    	    events: [
	    	    	<c:forEach var ="i" items="${list}">
			    	      {
			    	        title: '${i.SPACE_NAME }',
			    	        start: '${i.RESERVE_START_DAY}',
			    	        extendedProps: {
			    	            content: '${i.SD_TYPE} / ${i.RESERVE_START_HOUR}시 ~ ${i.RESERVE_FINISH_HOUR}시 ${i.RESERVE_PEOPLE}명',
			    	            reservationNum: '${i.RESERVATION_NUM}'
			    	        }
			    	      },
	    	      	</c:forEach>
					<c:forEach var ="i" items="${calList}">
					{
		    	        title: '${i.memoTitle}',
		    	        start: '${i.memoStartDay}',
		    	        end: '${i.memoEndDay}',
		    	        color:'${i.memoColor}',
		    	        extendedProps: {
		    	            content: '${i.memoContent}',
		    	            num:'${i.memoNum}'
		    	        }
		    	      },
					</c:forEach>
		    	    ],
		    	    eventDidMount: function (info) {
		                $(info.el).popover({
		                    title: info.event.title,
		                    placement: 'top',
		                    trigger: 'hover',
		                    content: info.event.extendedProps.content,
		                    container: 'body'
		                });
		            },
		            dateClick: function(info) {
		            	console.log(info);
		            	$('.fc-day').attr('style','none');
		                var date = info.dateStr;
		                
		                
		                if(info.dayEl.classList.contains('selectedCell')){
		                	info.dayEl.classList.remove('selectedCell');
		                	$('.fc-day').attr('style','none');
		                	$('#sumPrice').css('padding-top', '5%');
		                	$('#sumPrice').html('일별 매출액, 날짜를 클릭하세요.');
		                }else{
		                	$('.fc-day').each(function(item){
			                	if($(this) !== info){
			                		$(this).removeClass('selectedCell');
			                	}
			                });
			                $.ajax({
			                	url:"<c:url value='/host/calendarDate?date="+date+"'/>",
			                	type:"get",
			                	success:function(data){
			                		console.log(data);
			                		var totalPrice = 0;
			                		data.forEach(function(item){
			                			totalPrice += item;
			                		});
			                		
			                		$('#sumPrice').css('padding-top', '1%');
									$('#sumPrice').html(date+ "일<br> 매출액은  " + addComma(totalPrice)+"원");         		
			                	},
			                	error:function(xhr, status, error){
			                		alert("error : ", error);
			                		alert("others = " + xhr, status, error);
			                	}
			                });
			                info.dayEl.style.backgroundColor = '#ffd014';
			                info.dayEl.classList.add('selectedCell');
		                }
	              	},
		            eventClick: function(data){
		            	const event = data.jsEvent.srcElement;
		            	var reservationNum = data.event.extendedProps.reservationNum;
						console.log(reservationNum);
		            	$.ajax({
		            		url:"<c:url value='/host/calendarDetail?reservationNum="+reservationNum+"'/>",
		            		type:'get',
		            		success:function(response){
		            			console.log(response)
		            			
							var htmlStr =   '<div class="contentWrapper">' +
											'<div class="contetnHead">'+
											'<div class="row">'+
											'<div class="col-9">'+
											'	예약내용'+
											'</div>'+
											'<div class="col-2 reservationNum">'+
											'예약번호 &nbsp;:&nbsp;&nbsp;&nbsp; '+response.RESERVATION_NUM+''+ 					 	
											'</div>'+
											'</div>'+
											'</div>'+
											'<div class="contentBox">'+
											'<div class="row">'+
											'	<div class="col-4">신청일</div>'+
											'<div class="col-8" style="font-weight:bold; font-size:21px">'+response.RESERVER_PAY_DAY+'</div>'+
											'</div>'+
											'<hr>'+
											'<div class="row">'+
											'	<div class="col-4">예약공간</div>'+
											'	<div class="col-8" style="font-weight:bold; font-size:21px">'+response.SPACE_NAME + response.SD_TYPE+'</div>'+
											'</div>'+
											'<hr>'+
											'<div class="row">'+
											'		<div class="col-4">예약내용</div>'+
											'			<div class="col-8" style="font-weight:bold; font-size:23px"> '+ response.RESERVE_START_DAY + '('+response.RESERVE_START_HOUR +'시'+ ~ response.RESERVE_FINISH_HOUR시+')</div>'+
											'		</div>'+
											'		<hr>'+
											'		<div class="row">'+
											'			<div class="col-4">예약인원</div>'+
											'			<div class="col-8" style="font-weight:bold; font-size:23px">'+response.RESERVE_PEOPLE +'명</div>'+
											'		</div>'+
											'		<hr>'+
											'		<div class="row">'+
											'			<div class="col-4">결제정보</div>'+
											'			<div class="col-8" style="font-weight:bold; font-size:23px">카카오페이('+response.RESERVE_PRICE+'원)</div>'+
											'		</div>'+
											'	</div>'+
											'</div>';
			            			
		            			$('#reservationModalBody').html(htmlStr);
		            			$('#reservationModalHeader').text(data.event.title);
		    	            	event.setAttribute('data-bs-target', '#modal');
		    	            	event.setAttribute('data-bs-toggle', 'modal');
		    	            	$("#modal").modal("show");
		            		},
		            		error:function(xhr, status, error){
		            			console.log(data.event.extendedProps);
		            			$('#memoModalHeader').text(data.event.title);
		            			$('#memoModalBody').text(data.event.extendedProps.content);
		            			$('#memoNum').val(data.event.extendedProps.num);
		            			$("#memoModal").modal("show");
		            		}
		            	});//ajax
		            	
		            }//eventClick
	              	
	    	    });
	    	  calendar.render();
	    	});
	    
	    function deleteMemo(){
	    	$.ajax({
	    		url:'<c:url value="/host/deleteMemo"/>',
	    		data:{
	    			memoNum:$('#memoNum').val()
	    		},
	    		success:function(data){
	    			if(data === 1){
	    				alert('메모삭제완료');
	    			}
	    			location.reload();
	    		}
	    	});
	    }
	    
	    function addComma(value){
		    value = value+"";
	        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        return value; 
	 	}
	    
	    </script>
	  
	<script type="text/javascript">
	    </script>
	<style type="text/css">
	@keyframes 
	fadein {from {opacity: 0;}to {opacity: 1;}}

	
	.fc-license-message {
		z-index: -1 !important;
	}
	
	.fade-in {
		animation: fadein 2s;
	}
	
	body {
		background: lightgrey;
	}
	
	.row {
		margin-top: 6%;
		margin-bottom: 3%;
	}
	
	.row.body {
		margin-top: 1%;
		margin-bottom: 3%;
	}
	
	.col-3 {
		margin: 0% 0% 0% 2.5%;
		padding: 0% 0% 0% 0%;
		background: white;
		border-left: #193D76 solid 4px;
		border-top: #193D76 solid 4px;
		border-bottom: #193D76 solid 4px;
	}
	.fc .fc-popover{
		z-index:10;
	}
	#calendar {
		border: #193D76 solid 4px;
	}
	
	.calendarHeader {
		margin-top: 75px;
	}
	
	.calendar-wrapper {
		width: 70%;
		background: white;
		padding: 0;
	}
	
	.fc .fc-button {
		border:white 2px solid;
		background: #193D76 !important;
		font-weight: bold;
		border-radius: 0.5rem;
	}
	
	.fc .fc-button:disabled {
		opacity: 1 !important;
		background: #193D76 !important;
		color: grey;
	}
	
	.fc-icon .fc-icon-chevron-right {
		background: #193D76 !important;
	}
	
	.fc-icon .fc-icon-chevron-left {
		background: #193D76 !important;
	}
	
	.fc-header-toolbar.fc-toolbar {
		background: #ffd014;
		margin-bottom: 0 !important;
		padding: 0.5% 2% 0.5% 2% !important;
	}
	.fc-col-header-cell{
		padding:0.4% 0% 0.4% 0% !important;	
		font-size: 20px;
		font-weight: bold;
		border-bottom: #193D76 solid 3px !important;
	}
	
	.fc-event, .fc-event-dot {
		cursor: pointer;
	}
	
	.event-popup {
		height: 100px;
		background: red;
		z-index: 1000;
	}
	
	.fc-col-header-cell {
		background: inherit !important;
	}
	.fc-col-header-cell.fc-day.fc-day-sun{
		background: rgba(255, 0, 0, 0.2) !important;
		border-right:none !important;
	}
	
	.fc-col-header-cell.fc-day.fc-day-sat{
		background: rgba(0, 0, 255, 0.2) !important;
		border-left:none !important;
	}
	
	.fc-day-sat.fc-day-other {
		background: inherit;
	}
	
	.fc-day-sun.fc-day-other {
		background: inherit;
	}
	
	.fc-col-header-cell.fc-day.fc-day-sun .fc-col-header-cell-cushion {
		color: red;
	}
	
	.fc-col-header-cell.fc-day.fc-day-sat .fc-col-header-cell-cushion {
		color: blue;
	}
	
	.fc-day-sat {
		border-left: rgba(0, 0, 255, 0.2) 3px solid !important; /* 토요일 배경색 */
		background: rgba(0, 0, 255, 0.04); /* 토요일 배경색 */
	}
	
	.fc-day-sun {
		border-right: rgba(255, 0, 0, 0.2) 3px solid !important; /* 일요일 배경색 */
		background: rgba(255, 0, 0, 0.04); /* 일요일 배경색 */
	}
	
	.fc-day-today {
		background-color: rgba(255, 173, 20, 0.5);
	}
	
	.fc-daygrid-day-number {
		font-size: 16px;
		font-weight: bold;
	}
	
	.fc-toolbar-title {
		font-weight: bolder;
		font-size:1.9rem !important;
	}
	
	.popover {
		z-index: 100000 !important;
	}
	
	.col-10.sum {
		opacity: 1;
		transition: 0.3s;
	}
	
	#wonIcon {
		background: rgba(255, 208, 20, 0.8);
		display: inline-block;
		font-weight: bold;
		font-size: 26px;
		border-radius: 2rem;
		margin-left: 1%;
		padding: 3% 2% 1% 2%;
		width: 12%;
		text-align: center;
		color: white;
		animation: fadein 0.7s;
	}
	
	#sumPrice {
		display: inline-block;
		margin-left: 4%;
		font-weight: bold;
		padding-top: 5%;
		line-height: 1;
		margin-bottom: 0;
		animation: fadein 2s;
	}
	
	.statisticHeader {
		width: 100%;
		padding: 4% 0% 3% 4%;
		border: 1px solid #ffd014;
		background: #193D76;
	}
	
	.statisticBody {
		padding: 5% 4% 5% 4%;
	}
	
	.fc-theme-standard .fc-popover-header {
		background: #ffd014;
		color: black;
		font-weight: bold;
	}
	
	.fc-theme-standard .fc-popover {
		border: 2px solid #193D76 !important;
	}
	
	.selectedCell{
 		animation : fadein 0.7s;
	}
	
	.fc .fc-daygrid-body-balanced .fc-daygrid-day-events{
 		animation : fadein 1s;
 	}	
	
	.modal-dialog.modal-center {
	  display: inline-block;
	  text-align: left;
	  vertical-align: middle;
	}
	.modal-fullscreen .modal-content {
		height: 90%;
		border: 0;
		border-radius: 0;
		width: 90%;
		margin: 2% 0% 0% 5%;
	}
	
	.modal-header {
		background: #ffd014;
	}
	
	
	.modal-body {
		padding: 2% 8% 2% 8%; 
		.contentWrapper { border : rgba( 0, 0, 0, 0.1)
		solid 2px;
		border-radius: 1rem;
		margin-top: 1%;
	}
	
	.contetnHead {
		background: rgba(0, 0, 0, 0.06);
		border-top-right-radius: 0.8rem;
		border-top-left-radius: 0.8rem;
		padding: 1% 0% 1% 2%;
		font-weight: bold;
		font-size: 28px;
	}
	
	.contentBox {
		margin-top: 1%;
		padding: 1% 2% 2% 2%;
	}
	
	.row {
		margin-top: 1%;
		margin-bottom: 1%;
	}
	
	.col-9 {
		color: rgba(0, 0, 0, 0.8);
	}
	
	.col-2.reservationNum {
		background: white;
		border: rgba(0, 0, 0, 0.3) 2px solid;
		border-radius: 1.5rem;
		font-size: 20px;
		font-weight: bold;
		color: rgba(0, 0, 0, 0.8);
		padding: 0.7% 0% 0.5% 1%;
	}
	
	.col-4 {
		font-weight: bolder;
		font-size: 26px;
		color: rgba(0, 0, 0, 0.33);
	}
	
	.col-10 {
		text-align: left;
		padding: 0% 0% 0% 0%;
		color: black;
		font-size: 20px;
		font-weight: bold;
	}
	
	.goback {
		padding-left: 2%;
		padding-top: 5%;
		font-size: 40px;
	}
	
	}
	.incomeBox {
		height: 65px;
		padding: 0% 0% 0% 0%
	}
	.fc .fc-button:hover{
		color:black;
		background:white !important;
		transition: 0.3s;
	}
	.fc-toolbar-title:hover{
		color:#193D76;
		transition: 0.3s;
	}
	.fc-highlight{
		background: rgba(25, 61, 118, 0.8) !important;
	} 
	.fc-daygrid-day:hover{
		background:rgba(20, 173, 255, 0.2);
	}
	.colorBtn{
		border-radius: 1rem;
		height: 40px;
	}
	.modal-header.color{
		background: white;
	}
	.numberCell{
		text-align: center;
		font-weight: bold;
	}
	.table tbody tr:hover{
		background:rgba(20, 173, 255, 0.2);
	}
	
	</style>
	<%
	  // 현재 날짜를 구합니다.
	  Calendar calendar = Calendar.getInstance();
	  
	  // 내일 날짜를 계산합니다.
	  calendar.add(Calendar.DATE, 1);
	  
	  // SimpleDateFormat을 사용하여 형식을 지정합니다.
	  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	  String tomorrowDate = dateFormat.format(calendar.getTime());
	  
	  // JSTL 변수에 저장합니다.
	  pageContext.setAttribute("tomorrowDate", tomorrowDate);
	%>
	
	<div class="calendarHeader"></div>
	<div class="modal fade" id="modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-fullscreen modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header" >
					<h1 class="modal-title fs-5" id="reservationModalHeader"
						style="font-weight: bold;">예약정보</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id="reservationModalBody">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="memoModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="memoModalHeader"
						style="font-weight: bold;"></h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" id="memoModalBody"
					style="font-weight: bold; color: black; font-size: 24px; padding: 5% 5% 5% 5%;">
					...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
						<input type="hidden" id="memoNum">
					<button type="button" onclick="deleteMemo()" class="btn btn-primary">일정 삭제</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="colorModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-lg ">
	    <div class="modal-content">
	      <div class="modal-header color">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">메모 배경색 지정</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body" style="padding:5% 14% 5% 13%">
	      	<div>
		      	<h4 style="text-align: center; margin-bottom:15px;">작성 할 메모의 색을 지정해 주세요</h4>
	      	</div>
	      	<button type="button" onclick="setMemoColor('#193D76')" class="btn btn-primary colorBtn">&nbsp;&nbsp;&nbsp;</button>
			<button type="button" onclick="setMemoColor('#6c757d')" class="btn btn-secondary colorBtn">&nbsp;&nbsp;&nbsp;</button>
			<button type="button" onclick="setMemoColor('#157347')" class="btn btn-success colorBtn">&nbsp;&nbsp;&nbsp;</button>
			<button type="button" onclick="setMemoColor('#dc3545')" class="btn btn-danger colorBtn">&nbsp;&nbsp;&nbsp;</button>
			<button type="button" onclick="setMemoColor('#ffc107')" class="btn btn-warning colorBtn">&nbsp;&nbsp;&nbsp;</button>
			<button type="button" onclick="setMemoColor('#0dcaf0')" class="btn btn-info colorBtn">&nbsp;&nbsp;&nbsp;</button>
			<button type="button" onclick="setMemoColor('#212529')" class="btn btn-dark colorBtn">&nbsp;&nbsp;&nbsp;</button>
	      </div>
	        <button type="button" class="btn" data-bs-dismiss="modal">Close</button>
	    </div>
	  </div>
	</div>
	<div class="row">
		<div class="col-3">
			<div class="statisticHeader">
				<h4 style="color: white; font-weight: bold">${sessionScope.userId}님
					환영합니다.</h4>
			</div>
			<div class="statisticBody">
				<div class="row body">
					<div class="col-2" id="wonIcon" style="display: inline-block;">
						<h4 style="color: white; font-weight: bold; font-size: 24px;">₩</h4>
					</div>
					<div class="col-10 sum" style="display: inline-block;">
						<h4 id="sumPrice">일별 매출액, 날짜를 클릭하세요.</h4>
					</div>
				</div>
				
				<br>
				<hr>
				
		    	<jsp:useBean id="now" class="java.util.Date" />
		    	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />	
				<div class="todayList">
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th><h2 style="font-weight: bold;">To-do 리스트</h2></th>
								<th><i class="bi bi-calendar-check" style="font-size: 35px;"></i></th>
							</tr>
						</thead>
					  <tbody>
						  	<tr class="table-secondary">
						    	<th class="numberCell">번호</th>
						    	<th>제목</th>
						    	<th>내용</th>
					    	</tr>
					    	<c:set var="cnt" value="1"/>
					    	<c:forEach var="toDoList" items="${calList}">
						    	<fmt:parseDate var="endDate" value="${toDoList.memoEndDay}" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd" var="formattedEndDate" />
						    	<fmt:parseDate var="startDate" value="${toDoList.memoStartDay}" pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd" var="formattedStartDate" />
								    <tr>
										<c:if test="${formattedStartDate <= today}">
										    <c:if test="${today <= formattedEndDate || formattedEndDate == tomorrowDate}">
											    	<td class="numberCell">${cnt}</td>
											    	<td>${toDoList.memoTitle}</td>
											    	<td>${toDoList.memoContent}</td>
											    	<c:set var="cnt" value="${cnt+1}"/>
										    </c:if>
									    </c:if>										    	
								    </tr>
						   </c:forEach>
					  </tbody>
					</table>
				</div>
								
				<br>
				<hr>
				
				<div class="reservationList">
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th><h2 style="font-weight: bold;">예약 리스트</h2></th>
								<th><i class="bi bi-card-checklist" style="font-size: 35px;"></i></th>
							</tr>
						</thead>
					  <tbody>
					  	<tr class="table-warning">
					    	<th class="numberCell">예약번호</th><th>공간</th><th>정보</th>
				    	</tr>
				    	<c:forEach var="reservationList" items="${list}" varStatus="status">
						    <c:if test="${today == reservationList.RESERVE_START_DAY}">
								    <tr>
								    	<td class="numberCell">${reservationList.RESERVATION_NUM}</td>
								    	<td>${reservationList.SPACE_NAME }</td>
								    	<td>${reservationList.SD_TYPE } &nbsp;${reservationList.RESERVE_PEOPLE}명</td>
								    </tr>
						    </c:if>
					   </c:forEach>
					  </tbody>
					</table>
				</div>
				
			</div>
		</div>
		<div class="col-8 calendar-wrapper">
			<div id='calendar'></div>
		</div>
	</div>
	
