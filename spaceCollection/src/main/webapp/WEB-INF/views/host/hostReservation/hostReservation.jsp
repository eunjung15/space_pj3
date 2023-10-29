<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp" %>
<style type="text/css">
	.reservation-header{
		border : 5px solid #193D76;
		margin-top :75px;
		padding:5% 16% 5% 16%;
	}
	.search-box{
		border : 5px solid #193D76;
		border-radius : 1rem;
		padding: 4% 4% 4% 4%;
		color: transparent;
 		text-shadow: 0 0 0 black;
		
	}
	input[name=reservationInfo]{
		font-size:25px;
		width: 71%;
		height: 60px;
		margin-left: 3%;
		padding-left:1%;
		border : 3px solid lightgrey;
		border-radius: 0.5rem;
	
		
	}
	input[name=reservationInfo]::placeholder{
		color:lightgrey;
		font-weight: bold;
		font-size: 18px;
		
	}
	.searchBt{
		border: none;
		width: 10%;
		padding: 1.3% 0% 1% 0%;
		margin-bottom:1%;
		margin-left:4%;
		color: white;
		font-weight: bold;
		background: #ffd014;
		font-size: 20px;
		caret-color:none;
		color: transparent;
 		text-shadow: 0 0 0 black;
		border-radius: 1rem;
	}
	.orderSelector{
		width: 100%;
	}
	.statusSelector{
		width: 100%;
	}
	.calendarBtn{
		width: 80%;
		padding:4% 0% 4% 0%;
		border:none;
		background: #ffd014;
		color: black;
		font-size:18px;
		font-weight: bold;
		border-radius: 1rem;
	}
	.row{
		margin-top:2%;
		color: transparent;
 		text-shadow: 0 0 0 black;
	}
	select{
		height: 45px;
		border: lightgrey solid 2px;
		padding:0% 0% 0% 4%;
		border-radius: 1rem;
	}
	.reservationData{
		border: 3px solid lightgrey;
	}
	.row.dataTitle{
		/*border: 2px solid lightgrey;*/
		padding:1% 0% 1% 0%;
		margin-bottom:2%;
		font-size:16px;
		font-weight: bold;
	}
	.row.data{
		border: 2px solid lightgrey;
		padding:0% 2% 0% 2%;
		margin-top:0;
		height: 70px;
		font-size:16px;
		font-weight: bold;
	}
	.row.data .col-1{
		padding:1.8% 0% 0% 0%;
	}
	.row.data .col-2{
		padding:1.8% 0% 0% 0%;
	}
	.row.data .col-4{
		padding:1.8% 0% 0% 0%;
	}
	
	
	.checkReservation{
		border : none;
		border-radius: 0.5rem;
		background : #ffd014;
		width:100%;
		padding: 0% 0% 0% 0%;
		height: 30px;
		
	}
	.pageBox{
		width:20%;
		padding: 3% 47% 0% 47%;	
	}
	button:hover{
		background:#193D76;
		color: white;
		transition : 0.34s;
	}
	
</style>
<section>
	<div class="reservation-header">
		<div class="search-box">
			<label style="font-size: 18px; font-weight: bold"> 예약 정보 검색</label>
			<input type="text" id = "searchKeyword" name = "reservationInfo" placeholder="예약자 아이디로 조회"
				<c:if test="${!empty param.keyword}"> value="${param.keyword}"</c:if>>
			<button class="searchBt" onclick="search()">검색</button>
		</div>
		<div class="row">
			<div class = "col-6"></div>
			<div class="col-2">
				<select class = "orderSelector">
					<option value="default">정렬기준</option>
					<option <c:if test="${param.order == 'RESERVATION_NUM'}">selected</c:if> 
						value="RESERVATION_NUM">예약 번호순 정렬</option>
					<option <c:if test="${param.order == 'RESERVE_START_DAY'}">selected</c:if>
						value="RESERVE_START_DAY">이용 일자순 정렬</option>
				</select>
			</div>		
			<div class="col-2">
				<select class = "statusSelector">
					<option value = "default">전체상태</option>
					<option <c:if test="${param.status == 'finished'}">selected</c:if> 
						value = "finished">이용완료</option>
					<option <c:if test="${param.status == 'before'}">selected</c:if> 
						value = "before">이용전</option>
					<option <c:if test="${param.status == 'canceled'}">selected</c:if>
						value = "canceled">취소환불</option>
				</select>
			</div>		
			<div class="col-2">
				<button class="calendarBtn">
					캘린더보기
				</button>
			</div>		
		</div>
		<div class="row dataTitle">
			<div class = "col-1">예약번호</div>
			<div class = "col-2" style="padding-left:2.7%">예약자</div>
			<div class = "col-4" style="padding-left:2%;">공간정보</div>
			<div class = "col-2" style="padding-left:1.7%;width: 8%;">날짜</div>
			<div class = "col-2" style="padding-left:7%;">이용구분</div>
			<div class = "col-2" style="padding-left:9.5%;">확인</div>
		</div>
		<jsp:useBean id="now" class="java.util.Date"/>
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
		<c:if test="${!empty list}">
			<c:forEach var="reservation" items="${list}">
			<fmt:parseDate value="${reservation.RESERVE_START_DAY}" var="parsedDate" pattern="yyyy-MM-dd" />
			<c:set var="status" value="default" />
				<div class="row data">
					<div class = "col-1">${reservation.RESERVATION_NUM }</div>
					<div class = "col-2" style="padding:1.8% 0% 0% 0% !important;">${reservation.USER_ID }</div>
					<div class = "col-4">${reservation.SPACE_NAME }</div>
					<div class = "col-2">${reservation.RESERVE_START_DAY}</div>
					<c:if test="${reservation.RESERVATION_DEL_FLAG == 'Y'}">
						<div class = "col-2">환불완료</div>
						<c:set var="status" value="환불됨" />
					</c:if>
					<c:if test="${reservation.RESERVATION_DEL_FLAG == 'N'}">
						<c:if test="${now.before(parsedDate)}">
							<div class = "col-2">이용전</div>
							<c:set var="status" value="이용전" />
						</c:if>
						<c:if test="${now.after(parsedDate)}">
							<div class = "col-2">이용완료</div>
							<c:set var="status" value="이용완료" />
						</c:if>
					</c:if>
					<div class = "col-1" style="padding-top:1.4% !important;">
						<button class = "checkReservation" onclick="goReservation('${reservation.RESERVATION_NUM}')">
							정보
						</button>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<div class="row" style = "text-align:center">
				<h2>예약 내역이 없습니다</h2>
			</div>
		</c:if>
		<div class="pageBox">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <li class="page-item">	<!-- <c:url value='/host/reservation?page=${param.page-1}'/>	<c:url value='/host/reservation?page=${param.page+1}'/> -->
			      <a class="page-link" id="previous" onclick="movePage('${param.page-1}')" href="javascript:void(0)" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    
			    
			    <li class="page-item">
			      <a class="page-link" id="next" onclick="movePage('${param.page+1}')" href="javascript:void(0)" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</div>
		
		
	</div>
</section>
<script type="text/javascript">
	$(function(){
		$('input[name=reservationInfo]').focus();
		
		$('#previous').click(function(){
			var page = ${param.page};
			if(page == 1){
				alert('첫 페이지 입니다');
				event.preventDefault();
			}
		});
		$('#next').click(function(){
			if(${empty list}){
				alert('더이상 기록이 없습니다');
				event.preventDefault();
			}
		});
		
		$('.calendarBtn').click(function(){
			location.href="<c:url value='/host/reservationCalendar'/>";
		});
	});
	
	
	const queryString = window.location.search;
	const params = new URLSearchParams(queryString);
	var currentTotalUrl = window.location.href;
	var currentUrl = currentTotalUrl.split("?");
	
	function goReservation(reservationNum){
		location.href="<c:url value='/host/reservationDetail?reservationNum="+reservationNum+"'/>";
	}
	
	function movePage(page){
		params.set('page', page);
		location.href = currentUrl[0]+"?"+params;
	}
	
	function search(){
		var searchKeyword = document.getElementById('searchKeyword');
		if(searchKeyword.value.length == 0){
			alert('검색어를 입력하세요');
			searchKeyword.focus();
		}else{
			params.set("keyword",searchKeyword.value);
			location.href = currentUrl[0]+"?"+params;
		}
	}
	
	var orderSelector = document.getElementsByClassName('orderSelector');
	orderSelector[0].addEventListener('change',function(){
		if(this.value !== 'default'){
			params.set("order",this.value);
			location.href = currentUrl[0]+"?"+params;
		}else{
			params.delete("order");
			location.href = currentUrl[0]+"?"+params;
		}
	});
	
	var statusSelector = document.getElementsByClassName('statusSelector');
	statusSelector[0].addEventListener('change',function(){
		if(this.value !== 'default'){
			params.set("status",this.value);
			location.href = currentUrl[0]+"?"+params;
		}else{
			params.delete("status");
			location.href = currentUrl[0]+"?"+params;
		}
	});
	
</script>
<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>