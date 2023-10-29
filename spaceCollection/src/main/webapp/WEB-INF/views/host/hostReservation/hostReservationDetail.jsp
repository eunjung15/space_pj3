<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp" %>
<style type="text/css">
	.reservation-header{
		border : 5px solid #193D76;
		margin-top :75px;
		padding:2% 16% 5% 16%;
	}
	.contentWrapper{
		border: rgba(0, 0, 0, 0.1) solid 2px;
		border-radius: 1rem;
		margin-top:1%;
	}
	.contetnHead{
		background: rgba(0, 0, 0, 0.06);
		border-top-right-radius: 0.8rem; 
		border-top-left-radius: 0.8rem;
		
		padding: 1% 0% 1% 2%;
		
		font-weight: bold;
		font-size: 28px;
		
	}
	.contentBox{
		margin-top:1%;
		padding:1% 2% 2% 2%;
	}
	.col-9{
		padding-top:0.5%;
		color:rgba(0, 0, 0, 0.8);
	}
	.col-2.reservationNum{
		background: white;
		border : rgba(0, 0, 0, 0.3) 2px solid; 
		border-radius:1.5rem;
		
		font-size: 20px;
		font-weight: bold;
		color:rgba(0, 0, 0, 0.8);
		padding:0.7% 0% 0.5% 1%;
		
	}
	.col-4{
		font-weight: bolder;
		font-size: 26px;
		color: rgba(0, 0, 0, 0.33);	
	}
	.col-8{
		text-align: left;
		padding:0% 0% 0% 0%;
		
		color:black;	
		font-size: 20px;
		font-weight: bold;
	}
	.goback{
		padding-left:2%;
		padding-top:5%;
		font-size: 40px;
	}
</style>
<section>
	<div class="reservation-header">
		<a href="javascript:void(0)" onclick="goBack()" class="goback"> < </a>
		<div class="contentWrapper">
			<div class="contetnHead">
				<div class="row">
					<div class="col-9">
						예약내용
					</div>
					<div class="col-2 reservationNum">
						예약번호 &nbsp;:&nbsp;&nbsp;&nbsp; ${map.RESERVATION_NUM} 					 	
					</div>
				</div>
			</div>
			<div class="contentBox">
				<div class="row">
					<div class="col-4">신청일</div>
					<div class="col-8">${map.RESERVER_PAY_DAY }</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-4">예약공간</div>
					<div class="col-8">${map.SPACE_NAME} ${map.SD_TYPE }</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-4">예약내용</div>
					<div class="col-8">${map.RESERVE_START_DAY } (${map.RESERVE_START_HOUR }시 ~ ${map.RESERVE_FINISH_HOUR }시)</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-4">예약인원</div>
					<div class="col-8">${map.RESERVE_PEOPLE }명</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-4">결제정보</div>
					<div class="col-8">카카오페이(<fmt:formatNumber value="${map.RESERVE_PRICE }" pattern="#,###"/>원)</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">

function goBack(){
	history.go(-1);
}

</script>

<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>