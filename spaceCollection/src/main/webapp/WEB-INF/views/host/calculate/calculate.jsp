<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/air-datepicker@3.4.0/air-datepicker.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/air-datepicker@3.4.0/air-datepicker.min.css" rel="stylesheet">
<style type="text/css">
	.reservation-header{
		border : 5px solid #193D76;
		margin-top :75px;
		padding:5% 16% 5% 16%;
	}
	.headerTitle{
		margin-bottom:6%;
	}
	.search-box{
		border : 5px solid #193D76;
		border-radius : 1rem;
		padding: 3% 4% 3% 4%;
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
	.headerRow{
		margin-bottom:2%;
		margin-left:0 !important;
		margin-right:0 !important;
	}
	.headerBt{
		text-align: center;
		background: rgba(0,0,0,0.06);
		border-top:5px double #ffd014;
		padding-right:0%;
		padding-left:0%;
	}
	.headerBt button{
		width: 100%;
		border:none;
		background: none;
		padding:2% 0% 2% 0%;
		color:grey;
		font-size: 21px;
		font-weight: bold;
	}
	.headerBt.selected{
		background:#ffd014;
		
		.calBt{
			color:white;
		}
	}
	#beforeCalculate{
		border-right: 2px solid #ffd014;
	}
	.bodyRow{
		margin-bottom:1%;
	}
	
	.contentBody select{
		width:100%;
		height: 40px;
		border:lightgrey 2px solid;
		padding-left:1%;
	}
	.contentBody input{
		width:100%;
		height: 40px;
		border:lightgrey 2px solid;
		padding-left:3%;
	}
	.contentHeader{
		font-weight: bold;
		font-size: 18px;
	}
	
</style>

<section class = "calculateSection">
	<div class="reservation-header">
	<div class="headerTitle"><h1 style="font-weight: bold; text-align: center">정산 센터</h1></div>
		<div class="row headerRow">
			<div class="col-6 headerBt" id="beforeCalculate"><button class="calBt">정산 예정</button></div>
			<div class="col-6 headerBt" id="afterCalculate"><button class="calBt">정산 완료</button></div>
		</div>
	
		<div class="search-box">
			<div class="row bodyRow">
				<div class="col-6 contentHeader">정산기간</div>
				<div class="col-1 contentHeader">PG사</div>
				<div class="col-1 contentHeader">결제수단</div>
				<div class="col-4 contentHeader">공간선택</div>
			</div>
			<div class="row bodyRow">
				<div class="col-2 contentBody">
					<select id = "dateSelector">
						<option>정산일</option>
						<option>결제일</option>
						<option>이용일</option>
					</select>
				</div>
				<div class="col-2 contentBody"><input type="text" id="startDatepicker" placeholder="클릭하여 날짜 선택"></div>
				<div class="col-2 contentBody"><input type="text" id="endDatepicker" placeholder="클릭하여 날짜 선택"></div>
				<div class="col-1 contentBody">
					<select id = "PGSelectior">
						<option>정산일</option>
						<option>결제일</option>
						<option>이용일</option>
					</select></div>
				<div class="col-1 contentBody">
					<select id = "paymentType">
						<option>정산일</option>
						<option>결제일</option>
						<option>이용일</option>
					</select>
				</div>
				<div class="col-4 contentBody">
					<select id="spaceSelector">
						<option>정산일</option>
						<option>결제일</option>
						<option>이용일</option>
					</select>
				</div>
			</div>
		</div>
	</div>	

</section>

<script type="text/javascript">
	$(function(){
		
	});
	
	var calBt = document.querySelectorAll('.calBt');
	
	
	calBt.forEach(function(calBt){
		calBt.addEventListener('click',function(item){
		 	var parent = this.parentElement;

		 	if (!parent.classList.contains('selected')) {
		 		var parents = document.querySelectorAll('.headerBt');
			 	parents.forEach(function(parents){
			 		parents.classList.remove('selected');	
			 	});
		 		parent.classList.add('selected');
		    }
		});
	})
	
	var startDatepicker = document.getElementById('startDatepicker');
	var endDatepicker = document.getElementById('endDatepicker');
	
	startDatepicker = new AirDatepicker('#startDatepicker', {
	    inline: false,
	    locale:{
	    	days:["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
	    	daysShort:["일","월","화","수","목","금","토"],
	    	daysMin:["일","월","화","수","목","금","토"],
	    	months:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	    	monthsShort:["1","2","3","4","5","6","7","8","9","10","11","12"],
	    	today:"오늘",clear:"초기화",
	    	dateFormat:"yyyy-MM-dd",
	    	timeFormat:"HH:mm",
	    	firstDay:1},
	    onSelect:function(){
	    	startDatepicker.hide();
	    }
	});

	
	endDatepicker = new AirDatepicker('#endDatepicker', {
	    inline: false,
	    locale:{
	    	days:["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
	    	daysShort:["일","월","화","수","목","금","토"],
	    	daysMin:["일","월","화","수","목","금","토"],
	    	months:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	    	monthsShort:["1","2","3","4","5","6","7","8","9","10","11","12"],
	    	today:"오늘",clear:"초기화",
	    	dateFormat:"yyyy-MM-dd",
	    	timeFormat:"HH:mm",
	    	firstDay:1},
	    onSelect:function(){
	    	endDatepicker.hide();
	    }
	});
	
</script>


<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>