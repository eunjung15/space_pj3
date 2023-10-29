<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp"%>
<style type="text/css">
.asd {
	padding: 3% 0% 3% 0%;
}

.receiption {
	padding-top: 3%;
	width: 100%;
	height: 70%;
	text-align: center;
	margin-bottom:5%;
}

.row-cols-auto {
	font-weight: 600;
	font-size: 21px;
	margin-bottom:12px;
}
.text-center{
	margin-bottom:4%;
}
h4{
color:#193D76;
font-weight : bold;
}
.yellowBar {
	width: 20px;
    height: 3px;
    background: #ffd014;
    margin-bottom: 10px;
    margin-left : 3.5%;
    padding-left: 8%;	
}
.reserveBt{
	width: 6%;
	height:55px;
	border:none;
	font-size: 20px;
	font-weight: bold;
	
}
#reservationList{
	background : #ffd014;
}
#reservationList:hover{
	background : white;
	border:#ffd014 4px solid;
}

#home{
	background :#193D76;
	color:white;
}
#home:hover{
	background : white;
	border:#193D76 4px solid;
	color:black;
}
#cancle:hover{
	background : white;
	border:#dc3545 4px solid;
	color:black;	
}
.reviewBt{
	width: 6%;
	height:55px;
	border:none;
	font-size: 20px;
	font-weight: bold;
}
.reviewBt:hover{
	width: 6%;
	height:55px;
	background:white;
	color:black;
	border:#198754 4px solid;
	font-size: 20px;
	font-weight: bold;
}
.container.text-center{
	border: 3px solid lightgrey;
	border-radius: 2rem;
	padding:1.5% 1.5% 1.5% 1.5%;
	width:50%;
}

</style>
<section>
	<div class="asd"></div>
	<div class="receiption">
		<h1 style = "margin-bottom:2%; font-weight: 800">예약 내역</h1>
		<div class="container text-center">
			<div class="row row-cols-auto">
				<div class="col-2"><h4>공간 정보</h4></div>
			</div>
			<div class = "yellowBar"></div>
			<hr>
			<br>
			<div class="row row-cols-auto">
				<div class="col-2">공간명</div>
				<div class="col-9">${map.SPACE_NAME }</div>
			</div>
			<div class="row row-cols-auto">
				<div class="col-2">타입</div>
				<div class="col-9">${map.SD_TYPE}</div>
			</div>
			<div class="row row-cols-auto">
				<div class="col-2">주소</div>
				<div class="col-9">(우)${map.SPACE_ZIPCODE} ${map.SPACE_ADDRESS}
					${map.SPACE_ADDRESS_DETAIL} ${map.SPACE_LOCATION}</div>
			</div>
			<div class="row row-cols-auto">
				<div class="col-2">연락처</div>
				<div class="col-9">
					<c:if test='${fn:length(map.SPACE_PHONE_NUM) > 9}'>
						${fn:substring(map.SPACE_PHONE_NUM, 0, 3)} -
						${fn:substring(map.SPACE_PHONE_NUM, 3, 7)} -
						${fn:substring(map.SPACE_PHONE_NUM, 7, 11)}  						
					</c:if>
					<c:if test='${fn:length(map.SPACE_PHONE_NUM) eq 9}'>
						${fn:substring(map.SPACE_PHONE_NUM, 0, 2)} -
						${fn:substring(map.SPACE_PHONE_NUM, 2, 4)} -
						${fn:substring(map.SPACE_PHONE_NUM, 4, 9)}  						
					</c:if>
				</div>
			</div>
			<br>
			<div class="row row-cols-auto">
				<div class="col-2"><h4>상세 내용</h4></div>
			</div>
			<div class = "yellowBar"></div>
			<hr>
			<br>
			<div class="row row-cols-auto">
				<div class="col-2">예약 인원</div>
				<div class="col-9">${map.RESERVE_PEOPLE}명</div>
			</div>
			<div class="row row-cols-auto">
				<div class="col-2">날짜</div>
				<div class="col-9">${map.RESERVE_START_DAY}/
					${map.RESERVE_START_HOUR}시 ~ ${map.RESERVE_FINISH_HOUR}시</div>
			</div>
			<div class="row row-cols-auto">
				<div class="col-2">금액</div>
				<div class="col-9">
					<fmt:formatNumber value="${map.RESERVE_PRICE}" pattern="#,###"/> 원
				</div>
			</div>
			<div class="row row-cols-auto">
				<div class="col-2">결제 수단</div>
				<div class="col-9">
					${map.PAYMENT_INFO }
				</div>
			</div>
			<div class="row row-cols-auto">
				<div class="col-2">결제일</div>
				<div class="col-9">${map.RESERVER_PAY_DAY}</div>
			</div>
			<div class="row row-cols-auto">
			<div class="col-2">예약번호</div>
			<div class="col-9">${map.RESERVATION_NUM}</div>
		</div>
			<div class="row row-cols-auto">
			<div class="col-2">예약고유번호</div>
			<div class="col-9">${map.RESERVATION_UID}</div>
		</div>
		</div><!-- 아래는 컨테이너 밖에있는거임 -->
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
		<fmt:parseDate value="${map.RESERVE_START_DAY}" var="parsedDate" pattern="yyyy-MM-dd" />
		<c:if test="${map.RESERVATION_DEL_FLAG != 'Y' }">
			<c:if test="${now.before(parsedDate)}">
				<button class = 'btn-danger reserveBt' id = "cancle" onclick="cancelPay()">환불하기</button>
			</c:if>
			<c:if test="${now.after(parsedDate)}">
				<c:if test="${!isReviewed}">
					<button class = 'btn-success reviewBt' id = "review" onclick="goReview()">리뷰작성</button>
				</c:if>
				<c:if test="${isReviewed}">
					<button class = 'btn-success reviewBt' id = "review" onclick="goSpace()">리뷰보기</button>
				</c:if>
			</c:if>
		</c:if>
		<button class = 'reserveBt' id = "reservationList" onclick="reservationList()">예약 내역</button>
		<button class = 'reserveBt' id = "home" onclick="home()">홈</button>
	</div>
</section>
<script type="text/javascript">
	function reservationList(){
		location.href = "<c:url value = '/reservation/reservationList'/>";
	}
	function home(){
		location.href = "<c:url value = '/'/>";
	}
	function goSpace(){
		location.href = "<c:url value = '/detail?spaceNum=${map.SPACE_NUM}'/>";
	}
	function goReview(){
		  const popupWidth = 700;
		  const popupHeight = 600;

		  const leftPosition = (window.screen.width - popupWidth) / 2;
		  const topPosition = (window.screen.height - popupHeight) / 2;

		  window.open("<c:url value='/writeReview?spaceNum=${map.SPACE_NUM}&reservationNum=${map.RESERVATION_NUM}&userId=${map.USER_ID}'/>"
				  ,'PopupWin','width='+popupWidth+',height='+popupHeight+',left='+leftPosition+',top='+topPosition+''); 
	}
</script>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script>
  function cancelPay() {
	  if(confirm('예약을 취소하시겠습니까?')){
	    jQuery.ajax({
	      // 예: http://www.myservice.com/payments/cancel
	      "url": "<c:url value='/reservation/showReservation/cancle'/>", 
	      "type": "POST",
	      "contentType": "application/json",
	      "data": JSON.stringify({
	        "merchant_uid": "${map.RESERVATION_UID}", // 예: ORD20180131-0000011
	        "cancel_request_amount": "${map.RESERVE_PRICE}", // 환불금액
	        "reason": "예약 환불" // 환불사유
	      }),
	      "dataType": "json"
	    }).done(function(result) { // 환불 성공시 로직 
	        alert("환불 성공");
	    	location.href = "<c:url value='/reservation/reservationList'/>"
	    }).fail(function(error) { // 환불 실패시 로직
	     	console.log(error.status);
	    	if(error.status === 200){
	    		alert("환불 성공");
		    	location.href = "<c:url value='/reservation/reservationList'/>"	
	    	}
	    });
	  }
  }
  
</script>
<%@ include file="../form/userBottom.jsp"%>