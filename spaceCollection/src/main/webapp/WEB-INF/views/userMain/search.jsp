<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
 @keyframes fadeInDown {
        0% {
            opacity: 0;
            transform: translate3d(0, -5%, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    	}
    	
p{
	margin-bottom:5px;
}
.row{
	padding: 4% 0% 0% 0%;
}
.row.top{
	padding : 0% 0% 0% 0%;
}
.row.region{
	padding : 0% 0% 0% 0%;
}
.row.top.filter{
	padding: 2% 4% 0% 7%;
}
.row.top.filter.facility{
	margin-bottom: 7%;
}

.col.region{
	text-align: center;
    border: 3px solid rgba(0, 0, 0, 0.3);
    border-radius: 0.7rem;
    background-color: white;
    padding: 3% 8% 0% 8%;
    height: 50px;
    width: 98%;
    margin: 0% 1% 2% 1%;
}
.col.region:hover{
	background-color: rgba(255, 208, 20, 0.74);
	border : 3px solid #ffc000;
}
.region-find{
	margin-bottom:8%;
}


.row.people{
	padding: 9% 7% 5% 9%;
}
.col.people{
	padding:0% 0% 0% 0%;
}
.col-3.filter{
	padding:0% 0% 0% 0%;
}
.filterBtn{
	border : 3px solid rgba(0, 0, 0, 0.3);
	border-radius : 0.7rem;
	background-color: white;
	padding: 0% 8% 0% 8%;
	height: 50px;
    width: 98%;
}
.filterBtn:hover{
	background-color: rgba(255, 208, 20, 0.74);
	border : 3px solid #ffc000;
}
.filterBtn.selected{
	background-color: rgba(255, 208, 20, 0.74);
	border : 3px solid #ffc000;
}
#searchText{
	width : 65%;
	height: 35px;
	padding-left: 5%;
}

.region-findBtn{
	border:none;
	background:#193D76;
	color : white;
	width : 23%;
	height: 35px;
}

.region-a{
	display:contents;
}

.menu{
	width:100% !important; 
}
.dropdown-menu.region.show {
   	padding: 10% 8% 6% 8%;
    margin: 0% 0% 0% 2% !important;
    min-width: 24rem;
}
.dropdown-menu.people.show{
   	display: block;
   	padding: 2% 0% 0% 0% !important;
   	padding-bottom: 0% !important;
   	min-width: 22rem;
}
.dropdown-menu.filter.show{
   	display: block;
   	padding: 2% 0% 0% 0% !important;
   	padding-bottom: 0% !important;
   	min-width: 32rem;
}
.search-wrapper{
	height:144.5px;
}
.search-section{
	height:100%;
	padding-bottom:3%;
	background: white;
	min-height: 648px;
}
.dropdown-toggle{
	display:inline-block;
}
.carousel-inner{
	border-radius: 2.3rem 2.28rem 0 0;
}
.w-100{
  transition: all 0.3s linear;
}
.w-100:hover{
  transform: scale(1.2);
}

.carousel-control-next:hover{
	border-radius:0 2.2rem 0 0 !important;
	background:linear-gradient(to left, rgba(0, 0, 0, 0.64), rgba(0, 0, 0, 0));
}
.carousel-control-prev:hover{
	border-radius: 2.2rem 0 0 0 !important;
	background:linear-gradient(to right, rgba(0, 0, 0, 0.64), rgba(0, 0, 0, 0));
}
.carousel-control-prev{
	z-index:0;
}
.carousel-control-next{
	z-index:0;
}

.asd{
	text-align: center;
    padding: 2% 0% 1% 0%;
    position:sticky;
    top:123px;
    z-index:1;
    background: white;
    transition:1s;
    
    .btn-group{
		width: 50%;
	}
	.dropdown{
		margin-left: 2%;
		width:100%
	}
	.dropdown-toggle{
		width:100%;
	}
	.input-group.mb-3{
		width:70%;
		float: right;
	}
}
	.w-100{
		height: 286px;
	}
	.card {
	    position: relative;
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	    -webkit-box-orient: vertical;
	    -webkit-box-direction: normal;
	    -ms-flex-direction: column;
	    flex-direction: column;
	    min-width: 0;
	    word-wrap: break-word;
	    background-color: #fff;
	    background-clip: border-box;
	    border: 1px solid rgba(25, 61, 118, 0.4);
	    border-radius: 2.5rem;
	    width:95% !important;
	    margin: 0% 0% 0% 0%;
	    margin-bottom:8%;
	    box-shadow: 5px 5px 15px 10px rgba(0, 0, 0, 0.2);
	    animation : fadeInDown 1s;
	    height: 500px;
	}
	.card-body{
		padding: 4% 6% 4% 6%;
	}
	.h5{
    	font-weight: bold;
    	display: inline-block;
    }
    .h5:hover{
    	color:#ffd014;
    }
	
	.dropdounUl.filter{
		padding-top:5%;
	}
	.dropdounUl{
		list-style-type: none;
   		/*padding: 10% 5% 5% 5% !important;*/
   		padding-left:0 !important;
   		margin-bottom:0 !important;
	}
	.dropdownPeople{
		padding:4% 3% 3% 3%;;
		min-width: 25rem;
		display: block;
	}
	.people-btnGroup{
		padding:0% 0% 0% 0%;
	}
	.people-numGroup{
		padding:0% 0% 0% 0%;
	}
	.btn.btn-outline-dark{
		border: lightgrey 2px solid !important;
	}
	#peopleMinus{
		border: #193D76 solid 2px !important;
		
    	padding-top: 10px !important;
		padding-bottom: 10px !important;
		padding-left: 20px !important;
		padding-right: 20px !important;
	}
	#peoplePlus{
		border: #193D76 solid 2px !important;
		
    	padding-top: 10px !important;
		padding-bottom: 10px !important;
		padding-left: 20px !important;
		padding-right: 20px !important;
	}
	#people{
		border: grey solid 2px !important;
	    height: auto;
	    text-align: center;
	    font-size: 18px;
	    font-weight: bold;
	}
	
	#peopleResetBtn{
		box-sizing: border-box !important;
    	float: left !important;
    	width: 30%;
    	height: 60px;
   	    background: #ffd014;
    	font-weight: bold;
    	border : none;
    	

	}
	#peopleApplyBtn{
		box-sizing: border-box !important;
    	float: left !important;
    	width: 70%;
    	height: 60px;
    	background:#193D76;
    	font-weight: bold;
    	color : white;
    	border : none;
	}
	#filterResetBtn{
		box-sizing: border-box !important;
    	float: left !important;
    	width: 30%;
    	height: 60px;
   	    background: #ffd014;
    	font-weight: bold;
    	border : none;
    	

	}
	#filterApplyBtn{
		box-sizing: border-box !important;
    	float: left !important;
    	width: 70%;
    	height: 60px;
    	background:#193D76;
    	font-weight: bold;
    	color : white;
    	border : none;
	}
	.nodata{
		font-weight:bold;
		text-align: center;
		margin-top:10%;
	}
	
	
	.priceDiv{
		text-align:center;
	}
	.emptySpace{
		display: inline-block;
		width: 20%;
		font-weight	:500;
		font-size: 28px;
	}
	.form-floating{
		width: 30%;
		display: inline-block;
		margin-bottom:8%;
	}
	.form-control{
		border: grey 2px solid;
	}
	.form-control:disabled{
		border: grey 2px solid;
		background: white;
	}
	.noUi-connect{
		background: #ffd014;
	}
	.noUi-handle {
    border: 3px solid rgba(25, 61, 118, 0.5);
    border-radius: 1rem;
    background: #FFF;
    cursor: default;
    box-shadow: inset 0 0 1px #FFF, inset 0 1px 7px #EBEBEB, 0 3px 6px -3px #BBB;
	}
	.noUi-handle:hover{
		background: lightgrey;
	}
	.order-select{
	}
	#order-selectBox{
		margin-bottom:15px;
		width:10%;
		float:right;
	}
	.select-option:hover{
		background-color: #ffd014 !important;
	}
	.all-reset{
		margin-left:5%;
		width:100%;
	}
	
	#all-resetBtn{
		white-space: nowrap;
		display: inline-block;
	    text-decoration: none !important;
	    border-radius: 30px;
	    padding-top: 15px;
	    padding-bottom: 15px;
	    padding-left: 30px;
	    padding-right: 30px;
	    border-width: 2px;
	    border-color: transparent;
	    border: none !important;
	    top: 0;
	    position: relative;
	    -webkit-transition: .3s all ease;
	    -o-transition: .3s all ease;
	    transition: .3s all ease;
		font-weight:bold;
		border: rgba(204,140,40, 0.6) 10px solid;
	    background: #ffd014;
		
	}
	#mapBtn{
		white-space: nowrap;
		display: inline-block;
	    text-decoration: none !important;
	    border-radius: 30px;
	    padding-top: 15px;
	    padding-bottom: 15px;
	    padding-left: 30px;
	    padding-right: 30px;
	    border-width: 2px;
	    border-color: transparent;
	    border: 2px lightgrey solid !important;
	    top: 0;
	    position: relative;
	    -webkit-transition: .3s all ease;
	    -o-transition: .3s all ease;
	    transition: .3s all ease;
		font-weight:bold;
	}
	.all-reset:hover{
		#all-resetBtn{
			border:2px solid #ffd014 !important; 
			background: white !important;
		}
	}
	.nav-bar {
    width: 45px;
    height: 3px;
    background: #ffd014;
    margin-bottom: 10px;
}

#mapBtn:hover{

	#mapIcon{
		color:white;
	}
}
</style>
<div class="search-wrapper"></div>
<div class = "asd">
<div class="btn-group">
	<div class="dropdown">
		  <button class="btn btn-secondary dropdown-toggle menu" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		    지역
		  </button>
		  <div class="dropdown-menu region">
			<div class = "region-find">
				<svg width="25" height="25" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M9.55026 9.55053L13 13M9.46531 2.45285C11.4021 4.38973 11.4021 7.5297 9.46531 9.46709C7.52957 11.403 4.3888 11.403 2.45256 9.46709C0.515813 7.5297 0.515813 4.38973 2.45256 2.45285C4.38931 0.515464 7.52907 0.51597 9.46531 2.45285Z" stroke="#767676"/>
				</svg>
				<input type="text" id="searchText"  placeholder='"구" 를 입력하세요'>
				<button class = "region-findBtn" onclick="regionFind()">찾기</button>
			</div>
				<ul class = "dropdounUl" style="padding: 1% 5% 4% 5% !important;">
					<li>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('종로구')"><div class = "col region">종로구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('중구')"><div class = "col region">중구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('용산구')"><div class = "col region">용산구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('성동구')"><div class = "col region">성동구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('광진구')"><div class = "col region">광진구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('동대문구')"><div class = "col region">동대문구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('중랑구')"><div class = "col region">중랑구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('성북구')"><div class = "col region">성북구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('강북구')"><div class = "col region">강북구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('도봉구')"><div class = "col region">도봉구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('노원구')"><div class = "col region">노원구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('은평구')"><div class = "col region">은평구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('서대문구')"><div class = "col region">서대문구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('마포구')"><div class = "col region">마포구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('양천구')"><div class = "col region">양천구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('강서구')"><div class = "col region">강서구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('구로구')"><div class = "col region">구로구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('금천구')"><div class = "col region">금천구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('영등포구')"><div class = "col region">영등포구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('동작구')"><div class = "col region">동작구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('관악구')"><div class = "col region">관악구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('서초구')"><div class = "col region">서초구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('강남구')"><div class = "col region">강남구</div></a>
						<a href="#" class="region-a" onclick="addRegionParam('송파구')"><div class = "col region">송파구</div></a>
					</div>
					<div class = "row region">
						<a href="#" class="region-a" onclick="addRegionParam('강동구')"><div class = "col region">강동구</div></a>
						<a href="#" class="region-a" ><div class = "col region">-</div></a>
					</div>
					</li>
				</ul>
		</div><!-- 지역 -->
	</div>
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle menu" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		   	 	인원
		  	</button>
			<div class="dropdown-menu people">
				<ul class = "dropdounUl">
					<li>
						<div class = "row top people">
							<div class = "col people">
									<h5 style="float: left; margin-top:3%; font-weight: bold;">인원</h5>
									<div class="input-group mb-3">
										<button class="btn btn-outline-secondary" id = "peopleMinus" type="button">-</button>
										<input type="text" class="form-control" id = "people" disabled aria-label="Recipient's username with two button addons" value="1">
										<button class="btn btn-outline-secondary" id = "peoplePlus" type="button">+</button>
									</div>
							</div>
						</div>
					</li>
					<li>
						<div class = "row top">
							<div class = "col">
								<div class="people-btnGroup">
									<button  id ="peopleResetBtn">초기화</button>
									<button  id ="peopleApplyBtn" onclick="addPeopleParam()">인원수 적용하기</button>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div><!-- 인원 -->
	<div class="dropdown">
			<button class="btn btn-outline-dark dropdown-toggle menu" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		   	 	필터
		  	</button>
			<div class="dropdown-menu filter">
				<ul class = "dropdounUl filter">
					<li>
						<div class = "row top filter">
							<div class = "col filter">
									<div class = "priceDiv">
										<div><h5 style="font-weight: bold;text-align: left">가격</h5></div>
										<br>
										<div class="form-floating">
									      <input type="text"  class="form-control" id="slider-snap-value-lower" placeholder="name@example.com" value="0">
									      <label for="floatingInputGrid">최소가격</label>
									    </div>
									    <div class = "emptySpace"> ~ </div>
										<div class="form-floating">
									      <input type="text"  class="form-control" id="slider-snap-value-upper" placeholder="name@example.com" value="0">
									      <label for="floatingInputGrid">최대가격</label>
									    </div>
										<div id="slider-snap"></div>
									</div>
							</div>
						</div>
					</li>
					<br>
					<br>
					<li>
						<div class = "row top filter">
						<div><h5 style="font-weight: bold">편의 시설</h5></div>
						<br>
						<br>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="WIFI">WI-FI</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="PRINTER">프린터</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="CHAIR_TABLE">의자/테이블</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="SMOKE">흡연장</button>
							</div>
						</div>
						<div class = "row top filter">
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="REST_ROOM">화장실</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="PC">PC/노트북</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="TV">TV/프로젝터</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="WHITE_BOARD">화이트보드</button>
							</div>
						</div>
						<div class = "row top filter">
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="ELEVATOR">엘레베이터</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="PARKING">주차</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="DRINK">음료반입</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="FOOD">음식반입</button>
							</div>
						</div>
						<div class = "row top filter facility">
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="COOK">취사가능</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="PET">애완동반</button>
							</div>
							<div class = "col-3 filter">
								<button class = 'filterBtn' value="AUDIO">음향장비</button>
							</div>
						</div>
					</li>
					<li>
						<div class = "row top">
							<div class = "col">
								<div class="people-btnGroup">
									<button  id ="filterResetBtn" onclick="resetFilter()">초기화</button>
									<button  id ="filterApplyBtn" onclick="addFilter()">필터 적용하기</button>
									<input type = "hidden" name="lowerPrice">
									<input type = "hidden" name="upperPrice">
									<input type = "hidden" name="filters">
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div><!-- 인원 -->
	<c:if test="${!empty param.spaceTypeNo }">
		<a href="<c:url value = '/search/map?spaceTypeNo=${param.spaceTypeNo}'/> "style="margin-left:1%;width:100%">
	</c:if>
	<c:if test="${!empty param.spaceName }">
		<a href="<c:url value = '/search/map?spaceName=${param.spaceName}'/>"style="margin-left:1%;width:100%">
	</c:if>
	<c:if test="${empty param.spaceName && empty param.spaceTypeNo }">
		<a href="<c:url value = '/search/map'/>"style="margin-left:1%;width:100%">
	</c:if>
	<button type="button" id="mapBtn"class="btn btn-outline-dark menu"><span style="font-size:16px;"><i style="font-size:16px;" id="mapIcon" class="bi bi-geo-alt"></i>지도</span>
	 <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
	    <span class="badge rounded-pill text-bg-danger">Map!</span>
	  </span>
	</button></a>
<a class = "all-reset" onclick="allReset()"><button id = "all-resetBtn" type="button" class="menu" >초기화</button></a>
</div>
<br>
<br>
<div style=" padding-right: 25%;height: 20px;display: inline-block;width: 100%;">
	<select class="form-select" id="order-selectBox" onfocus='this.size=4;' onblur='this.size=0;' 
           onchange='this.size=1; this.blur();'>
	  <option class = "select-option" selected>정렬</option>
	  <option value="avgprice_desc" class = "select-option">가격 높은순</option>
	  <option value="avgprice_asc" class = "select-option">가격 낮은순</option>
	  <option value="zzimCount_desc" class = "select-option">베스트 공간순</option>
	  <option value="spaceRegDate_desc" class = "select-option">공간 등록순</option>
	</select>
</div>
<br>
</div>
<hr>
<section class = "search-section">
<div class="order-select">
	</div>
	<div class="container" >
	  <div class="row" id = "data-container">
	  
  </div>
</div>
</section>


<script src="https://cdn.jsdelivr.net/npm/nouislider@15.7.1/dist/nouislider.min.js"></script>
<script type="text/javascript">
$(function(){
		$('#peopleMinus').click(function(){
			var people = $(this).siblings('#people');
			if(people.val() > 1){
		        people.val(parseInt(people.val())-1);
			}
		});
		
		$('#peoplePlus').click(function(){
			var people = $(this).siblings('#people');
		    	people.val(parseInt(people.val())+1);
		});
		$('#peopleResetBtn').click(function(){
			var people = $('#people');
			people.val(1);
		})
		
		$(window).on('scroll', function() {
		    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
		        loadMoreData();
		    }
		});
		
		$('#filterResetBtn').click(function(){
		});
		
		$('.filterBtn').click(function(){
			if($(this).hasClass('selected')){
				$(this).removeClass('selected');
			}else{
				$(this).addClass('selected');
			}
		});
		
		
});

	function allReset(){
		var tempParam = "";
		if(${!empty param.spaceTypeNo}){
			tempParam = "spaceTypeNo=${param.spaceTypeNo}";
		}else if(${!empty param.spaceName}){
			tempParam = "spaceName=${param.spaceName}";
		}
		location.href = "<c:url value = '/search?"+tempParam+"'/>";
	}
	
	

	//금액 범위 지정하는 range bar 관련 영역
	var snapSlider = document.getElementById('slider-snap');
	var upperPrice = 0;
	var lowerPrice = 0;
	var lower = document.getElementById('slider-snap-value-lower');
	var upper = document.getElementById('slider-snap-value-upper');
	
	if(${!empty param.minPrice}){
		lower.value = addComma(${param.minPrice})+"원";
		lowerPrice ="${param.minPrice}";
	}else{
		lowerPrice = 0;
	}
	if(${!empty param.maxPrice}){
		upper.value = addComma(${param.maxPrice})+"원";
		upperPrice = "${param.maxPrice}";
	}else{
		upperPrice = 300000;
	}
	
	noUiSlider.create(snapSlider, {
	    start: [lowerPrice, upperPrice],
	    connect: true,
	    range: {
	        'min': 5000,
	        'max': 300000
	    },
		format: {
	    	to: (value) => parseFloat(value).toFixed(0),
	    	from: (value) => parseFloat(value).toFixed(0)
		}
	});

	var snapValues = [
	    document.getElementById('slider-snap-value-lower'),
	    document.getElementById('slider-snap-value-upper')
	];
	   
	
	snapSlider.noUiSlider.on('update', function (values, handle) {
	    var value = values[handle];
	    	snapValues[handle].value = addComma(values[handle])+"원";
	    	if(handle == 1){
	    		upperPrice = values[handle];
	    	}else{
	    		lowerPrice = values[handle];
	    	}
	});
	lower.addEventListener('change', function () {
		lowerPrice = this.value;
		snapSlider.noUiSlider.set([this.value, null]);
	});

	upper.addEventListener('change', function () {
		upperPrice = this.value;
		snapSlider.noUiSlider.set([null, this.value]);
	});
	
	
	
	//선택된(selected) 필터요소들을 filterList에 추가한 뒤 addFilterParam를 호출하는 함수 
	var selectedFilter = [];
	var filters = document.querySelectorAll('.filterBtn');
	var filterList = [];
	function addFilter(){
		filterList.length = 0;
		filters.forEach(function(item){
			if(hasClass(item, 'selected')){
				filterList.push(item.value);
			}			
		});
		if(filterList.length == 0 && lowerPrice == 0 && upperPrice == 0){
			alert('필터 조건을 선택해 주세요!');
			return false;
		}
		
		
		const urlSearchParams = new URLSearchParams(window.location.search);
		var currentTotalUrl = window.location.href;
		var currentUrl = currentTotalUrl.split("?");
				
		if(filterList.length == 0){
			urlSearchParams.delete("filterList");
		}else{
			filterStr = "";
			for(var i = 0; i < filterList.length; i++){
				filterStr += filterList[i] + ',';
			}
			
			urlSearchParams.set("filterList",filterStr);
		}

		if(lowerPrice == 0){
			urlSearchParams.delete("minPrice");
		}else{
			urlSearchParams.set("minPrice", lowerPrice);
		}

		if(upperPrice == 0){
			urlSearchParams.delete("maxPrice");
		}else{
			urlSearchParams.set("maxPrice", upperPrice);
		}
		
		location.href = currentUrl[0] + "?" + urlSearchParams;
	}
	var filterItems = document.querySelectorAll('.filterBtn');
	function resetFilter(){
		filterItems.forEach(function(item){
			item.classList.remove('selected');
		});
		var upper = 300000;
		var lower = 5000;
		snapSlider.noUiSlider.set([lower, null]);
		snapSlider.noUiSlider.set([null, upper]);
	}
	
	//가격순,베스트순 select박스 선택시 파라미터 적용하는 함수
	const selectElement = document.getElementById("order-selectBox");

	selectElement.addEventListener("change", function(event) {
	    const selectedValue = event.target.value;
		addOrderParam(selectedValue);	    
	});
	
	//ajax이용 무한스크롤 페이징 관련 변수들
	var page = 1;
	var size = 9;
	var isLoading = false;
	var condition = "";
	var keyword = "";
	
	//ajax로 처리된 파라미터들이 있으면 url에 파라미터 추가하는 영역

	//무한스크롤 ajax 함수 영역
	var noDataNum = 0;
	
function loadMoreData() {
    if (isLoading) {
        return;
    }
	if(${!empty param.spaceTypeNo}){
		condition = "spaceTypeNo="+"${param.spaceTypeNo}";
	}else if(${!empty param.spaceName}){
		condition = "spaceName="+"${param.spaceName}";
	}
	
	if(${!empty param.region}){
		condition += "&region="+"${param.region}";
	}
	if(${!empty param.maxPeople}){
		condition += "&maxPeople="+"${param.maxPeople}";
	}
	if(${!empty param.filterList}){
		condition += "&filterList="+"${param.filterList}";
		selectedFilter = "${param.filterList}".split(',');
		for(var i = 0; i < selectedFilter.length; i++){
			filters.forEach(function(item){
				if(item.value === selectedFilter[i]){
					item.classList.add('selected');
				}			
			});
		}
	}
	if(${!empty param.minPrice}){
		condition += "&minPrice="+"${param.minPrice}";
	}
	if(${!empty param.maxPrice}){
		condition += "&maxPrice="+"${param.maxPrice}";
	}
	if(${!empty param.order}){
		condition += "&order="+"${param.order}";
	}
    isLoading = true;

    $.ajax({
        url: '<c:url value="/getSearchData?page='+page+'&size='+size+'&'+condition+'"/>',
        type:'get',
        success: function(data) {
        	if(data != null){
				makeList(data);
                page++;
			}
        	if(data.length == 0 ){
				if(noDataNum == 0){
					noData();
				}
				noDataNum++;
				return;
        	}
			
        },
        complete: function() {
            isLoading = false;
        }
    });
}

	loadMoreData();
	
	// ajax로 불러온 데이터들 html 생성하는 함수
	var num =1;
	function makeList(data) {
	    $.each(data, function(index) {
	    var htmlStr = "";
	    	var innerVal = Object.values(this);
	    	var innerMap =Object.keys(this)[0];
			var input = innerMap;
			console.log(input);
			
			var keyValueRegex = /(\w+)=(.*?)(?=, \w+=|$)/g;

			// 결과를 저장할 객체 생성
			var space = {};

			if (input !== undefined && input !== null) {
				// 정규 표현식과 매치하여 키-값 쌍 추출
				var matches = input.matchAll(keyValueRegex);
	
				for (const match of matches) {
				    var key = match[1];
				    var value = match[2];
	
				    // 값이 따옴표로 감싸져 있지 않으면 따옴표로 감싸기
	
				    // 결과 객체에 키-값 쌍 추가
				    space[key] = value;
				}
	
				// 결과 출력
				console.log(space);
				console.log(typeof(innerVal[index]));
				
				htmlStr += '<div class="col-sm-12 col-lg-4 col-md-6">';
		        htmlStr += '<div class="card" style="width: 18rem;">';
		        htmlStr += '<div id="carouselExampleAutoplaying'+num+'" class="carousel slide" data-bs-ride="carousel">';
		        htmlStr += '<div class="carousel-inner">';
				for(var i = 0; i < innerVal[0].length; i++){
					if(i == 0){
				        htmlStr += '<div class="carousel-item active">';
				        htmlStr += '<a href = "<c:url value = "/detail?spaceNum=' + space.SPACE_NUM + '"/>"><img src="<c:url value="/space_images/'+innerVal[0][i]+'"/>" class="d-block w-100" alt="..."></a>';
				        htmlStr += '</div>';
					}else{
				        htmlStr += '<div class="carousel-item">';
				        htmlStr += '<a href = "<c:url value = "/detail?spaceNum=' + space.SPACE_NUM + '"/>"><img src="<c:url value="/space_images/'+innerVal[0][i]+'"/>" class="d-block w-100" alt="..."></a>';
				        htmlStr += '</div>';
					}
				}
		        htmlStr += '</div>';
		        htmlStr += '<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying'+num+'" data-bs-slide="prev">';
		        htmlStr += '<span class="carousel-control-prev-icon" aria-hidden="true"></span>';
		        htmlStr += '<span class="visually-hidden">Previous</span>';
		        htmlStr += '</button>';
		        htmlStr += '<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying'+num+'" data-bs-slide="next">';
		        htmlStr += '<span class="carousel-control-next-icon" aria-hidden="true"></span>';
		        htmlStr += '<span class="visually-hidden">Next</span>';
		        htmlStr += '</button>';
		        htmlStr += '</div>';
		        htmlStr += '<div class="card-body"><div class="nav-bar" style="width:200px"></div>';
		        htmlStr += '<a href = "<c:url value = "/detail?spaceNum=' + space.SPACE_NUM + '"/>"><h5 class="h5">' + space.SPACE_NAME + '</h5></a>';
		        htmlStr += '<p>(우편) '+ space.SPACE_ZIPCODE +',<br> '+space.SPACE_ADDRESS +space.SPACE_ADDRESS_DETAIL +' '+ space.SPACE_LOCATION+ '</p>';
		        htmlStr += '<h5 style="font-weight:bold;color:#193D76;">'+addComma(space.AVGPRICE)+'원</h5><div class="nav-bar"></div> 평균최대 인원'+space.AVGMAXPEOPLE+' 명';
		        htmlStr += '</div>';
		        htmlStr += '</div>';
		        htmlStr += '</div>';
			}
		        num++;
		    $('#data-container').append(htmlStr);
	    });
	}
	
	//ajax로 불러올 데이터가 없을때 호출하는 함수
	function noData(){
		var htmlStr = "<div style='text-align:center; animation:fadeInDown 1.5s;'><h1 class='nodata'>표시 할 공간이 없어요</h1><i class='bi bi-emoji-dizzy' style='font-size:70px;font-weight:bolder; color:#193D76'></i></div>";
		 $('#data-container').append(htmlStr);
		 isLoading = true;
	 }
	
	//#,### 포멧 적용시키는 정규식 함수
	 function addComma(value){
		    value = value+"";
	        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        return value; 
	    }
	 //html태그(element)의 클래스명에 className이 포함되는지 검사하는 함수
	 function hasClass(element, className) {
		    return element.classList.contains(className);
		}
	 
	 
	//지역 파라미터를 추가한 URL 반환하는 함수
	 function addRegionParam(region){
		 
		 var currentUrl = window.location.pathname; 
		 var currentParam = window.location.search.substring(1);
		 
		 var resultUrl = "";
		 var resultParam = "?";
		 
		 if(${!empty param.region}){
			var tempParam = currentParam.split('&');
			 for(var i = 0; i < tempParam.length; i++){
				 if(tempParam[i].indexOf('region') != -1){
					tempParam[i] = "region=" + region;
				 }
				 if(i > 0){
					 resultParam += "&" + tempParam[i]; 
				 }else{
					 resultParam += tempParam[i]; 
				 }
			 }
			 resultUrl = currentUrl + resultParam;
			 
		 }else{
			 var addRegion = "&region="+region;
			 resultUrl = currentUrl + "?" + currentParam + addRegion;
		 }
		 location.href = resultUrl; 
	 }
	 
	//인원 파라미터를 추가한 URL 반환하는 함수
	 function addPeopleParam(){
		 var people = document.getElementById('people').value;
		 var currentUrl = window.location.pathname; 
		 var currentParam = window.location.search.substring(1);
		 
		 var resultUrl = "";
		 var resultParam = "?";
		 
		 if(${!empty param.maxPeople}){
			var tempParam = currentParam.split('&');
			 for(var i = 0; i < tempParam.length; i++){
				 if(tempParam[i].indexOf('maxPeople') != -1){
					tempParam[i] = "maxPeople=" + people;
				 }
				 if(i > 0){
					 resultParam += "&" + tempParam[i]; 
				 }else{
					 resultParam += tempParam[i]; 
				 }
			 }
			 resultUrl = currentUrl + resultParam;
			 
		 }else{
			 var addPeople = "&maxPeople="+people;
			 resultUrl = currentUrl + "?" + currentParam + addPeople;
		 }
		 location.href = resultUrl; 	 
	 }

	 //필터조건(가격 높은순, 낮은순) 파라미터를 추가한 URL 반환하는 함수
	 function addOrderParam(selectedValue){
		 var currentUrl = window.location.pathname; 
		 var currentParam = window.location.search.substring(1);
		 
		 var resultUrl = "";
		 var resultParam = "?";
		 
		 if(${!empty param.order}){
			var tempParam = currentParam.split('&');
			 for(var i = 0; i < tempParam.length; i++){
				 if(tempParam[i].indexOf('order') != -1){
					tempParam[i] = "order=" + selectedValue;
				 }
				 if(i > 0){
					 resultParam += "&" + tempParam[i]; 
				 }else{
					 resultParam += tempParam[i]; 
				 }
			 }
			 resultUrl = currentUrl + resultParam;
			 
		 }else{
			 var addOrder = "&order="+selectedValue;
			 resultUrl = currentUrl + "?" + currentParam + addOrder;
		 }
		 location.href = resultUrl; 	
	 }
	 
	 function regionFind(){
		 var inputRegion = document.getElementById("searchText").value;
		 if(inputRegion.length === 0){
			 alert('검색어를 입력해 주세요');
		 }else{
			 addRegionParam(inputRegion);
		 }
	 }
		
//부트스트랩 드롭다운 요소들을 가져옴
var dropdownItems = document.querySelectorAll('.dropdown-menu');

// 각 드롭다운 요소에 클릭 이벤트 리스너 추가
dropdownItems.forEach(function(item) {
  item.addEventListener('click', function(event) {
    event.stopPropagation(); // 클릭 이벤트 전파 중단
  });
});

</script>
<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>