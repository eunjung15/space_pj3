<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/spaceDetail.css">
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<title>스페이스 클라우드</title>
<style type="text/css">
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
    	
  .content{
  	animation:fadeInDown 1s;
  }
#QNAWrite{
    padding: 0% 0% 0% 0%;
    height: 40px;
    float: right;
    width: 20%;
    margin: 0% 0% 2% 82%;
}
.textLimit.limit{
  	 animation: shake 0.5s 0.08s;
  	 color:red !important;
  }
  .modal-content{
  	margin-top: 50% !important;
  }
  .QnAHead{
 	font-size:20px;
  	font-weight: bold;
  	margin-bottom:15px;
    display: -webkit-inline-box;
    padding-left: 4%;
    width: 100%;
  }
  .qnaBody{
  	font-size:16px;
  	padding: 1% 5% 0% 5% !important;
  	text-align: left;
  	color:black;
  	margin-bottom:10px;
  	word-wrap: break-word;
  }
  .reviewHead{
	font-size:20px;
  	font-weight: bold;
  	margin-bottom:15px;
    display: -webkit-inline-box;
    padding-left: 4%;
    width: 100%;
  }
  #star{
		width: 29px;
		height: 35px;
		padding:0% 0% 4% 0%;
		margin:0% -5% 0% 0%;
	}
	.reviewContent{
		animation: fadeInDown 1s;
	}
	.qnaContent{
		animation: fadeInDown 1s;
	}
	
  .date-deleteCol{
  	/*padding-right:27%;*/
  }
  .date-deleteCol.qna{
  	/*padding-right:30% !important;*/
  }
  
  .delete-dateCol{
  	/*padding-left:40% !important;*/
  }
  
@keyframes shake {
  0%, 100% {
    transform: translateX(0);
  }
  10%, 30%, 50%, 70%, 90% {
    transform: translateX(-5px);
  }
  20%, 40%, 60%, 80% {
    transform: translateX(5px);
  }
 }
 .bi-person-badge{
 	font-size:20px;
 	margin-left:8px;
 }
 .d-block.img{
 	width:800px;
 	height: 680px;
 }
 #QnAPagination{
 	display: flex;
 	justify-content: center;
 }
 #reviewPagination{
 	display: flex;
 	justify-content: center;
 }
 .breadcrumb-item{
 	color: white !important;
 	background:rgba(255,255,255,0.2);
 	margin:0px 3px 0px 3px;
 	font-size:18px;
 	border-radius:2rem;
 	border: white 1px solid;
 	font-weight:500;
 	padding-right:8px;
 	padding-left:8px;
 	padding-top:8px;
 	padding-bottom:8px;
 }
 .breadcrumb-item + .breadcrumb-item::before {
 	content:"";
 }
 .space-title{
 	font-weight: bold; 
 	margin-top:5px;
 }
 .space-intro{
 	margin-bottom:15px;
 	color:grey;
 }
 .title-span{
 	background: rgba(200, 200, 200, 0.2);
 	border:rgba(200, 200, 200, 0.8) 1.7px solid;
 	border-radius:2rem;
 	padding:8px 8px 8px 8px;
 	font-size:15px;
 	font-weight:550;
 	margin-right : 8px;
 	color:grey;
 	box-shadow:0px 0px 0px 0px;
 }
 #spaceIntro{
 	font-weight:300; 
 }
 .facility-icon{
 	width: 60px !important;
 	height: 60px !important;
 }
 .sticky-top{
 	top:125px !important;
 }
 #QNAWrite:hover{
 	background:white;
 	color:black;
 	border:#193D76 1px solid !important;
 }
 .nav-item:hover{
 	background:rgba(255, 208, 20, 0.3) !important;
 }
 .navbar{
 	border-top:rgba(0,0,0,0.05) 2px solid !important;
 }
</style>
<section class = "sapceDetailSection">
	<input type="hidden" value="${userId}" id="userId">
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>


	<div class="hero page-inner overlay" style="background-image: url('space_images/${mainImg}');">

		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
				<!-- 공간명이 들어갈 자리 -->
					<h1 class="heading" data-aos="fade-up">${vo.spaceName }</h1>
					<h2 class="heading" id = "spaceIntro"data-aos="fade-up">${vo.spaceIntro }</h2>
					<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
						<c:if test="${!empty vo.spaceTag}">
						    <c:forEach items="${fn:split(vo.spaceTag, '/')}" var="tags">
						        <li class="breadcrumb-item active text-white" aria-current="page">#${tags}</li>
						    </c:forEach>
						</c:if>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
<!--  여기까지 이미지 포함 상단 부분  -->

	<div class="section">
		<div class="container">
			<div class="row justify-content-between" >
			<!-- 섹션의 이미지 슬라이드 부분 -->
				<div class="col-lg-7">
				<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
				  <div class="carousel-inner">
				  	<c:set var="i" value="0"/>
				  	<c:forEach var="img" items="${imgList}">
				  		<c:if test="${i != '0'}">
						    <div class="carousel-item">
						      <img src="space_images/${img}" class="d-block img" alt="...">
						    </div>
					  	</c:if>
				  		<c:if test="${i == '0'}">
						    <div class="carousel-item active">
						      <img src="space_images/${img}" class="d-block img" alt="...">
						    </div>
						  	<c:set var="i" value="1"/>
					  	</c:if>
				    </c:forEach>
				  </div>
				   <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
					
				<br>
				<h1 class="space-title">${vo.spaceName }</h1>
				<h4 class="space-intro">${vo.spaceIntro}</h4>
				<div style="margin-bottom:15px; overflow: visible;width : 1000px; margin-top:40px">
					<c:if test="${!empty vo.spaceTag}">
					    <c:forEach items="${fn:split(vo.spaceTag, '/')}" var="tags">
					    	<span class="title-span">#${tags}</span>
					    </c:forEach>
					</c:if>
				</div>
				<br>
				<div class="sticky-top" style="z-index:1">
					<nav class="navbar navbar-expand-lg bg-light bd-highlight sticky-top custom-nav" style="justify-content:center !important; border-bottom : 1px #6d3bff solid;">
					  <div>
					    <div  id="navbarNav">
					      <ul class="nav nav-pills flex-column flex-sm-row bg-light" style="width: 100%">
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">공간소개</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">시설안내</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">유의사항</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">환불정책</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">Q&A</a>
					        </li>
					        <li class="nav-item p-2 flex-fill bd-highlight">
					          <a class="nav-link" href="javascript:void(0)">이용후기</a>
					        </li>
					      </ul>
					    </div>
					  </div>
					</nav>
				</div>
				<br><br>
				<div class="detail-content">
					<div class = "detail-navTab">
						<h5 >공간 소개</h5>
						<div class = "nav-bar"></div>
						<p>
							${vo.spaceInfo }
						</p>
					</div>
					
					<div  class = "detail-navTab">
						<h5 style="font-weight: bold;">시설 안내</h5>
						<div class = "nav-bar"></div>
						<ol>
							<c:if test="${!empty vo.spaceFacility }">
								<c:forEach var="facilities" items="${fn:split(vo.spaceFacility, '||')}">
									<li class = "ol-list"> ${facilities}</li>
									<br>
								</c:forEach>
							</c:if>
						</ol>
						
					</div>
					
					<div  class = "detail-navTab">
						<h5 style="font-weight: bold;">유의사항</h5>
						<div class = "nav-bar"></div>
						<c:if test="${!empty vo.spaceFacility }">
							<ol>
								<c:forEach var="warns" items="${fn:split(vo.spaceWarn, '||')}">
									<li class = "ol-list"> ${warns}</li>
									<br>
								</c:forEach>
							</ol>
						</c:if>
					</div>
					
					<div class = "detail-navTab">
						<h5 style="font-weight: bold;">환불정책</h5>
						<div class = "nav-bar"></div>
						<c:if test="${!empty refundVo }">
						<c:set var="refund" value="${refundVo}" />
							<ol>
								<li class = "ol-list">7일전 ${refund.refund7Day}</li>
								<br>
								<li class = "ol-list">6일전 ${refund.refund6Day}</li>
								<br>
								<li class = "ol-list">5일전 ${refund.refund5Day}</li>
								<br>
								<li class = "ol-list">4일전 ${refund.refund4Day}</li>
								<br>
								<li class = "ol-list">3일전 ${refund.refund3Day}</li>
								<br>
								<li class = "ol-list">2일전 ${refund.refund2Day}</li>
								<br>
								<li class = "ol-list">1일전 ${refund.refund1Day}</li>
								<br>
								<li class = "ol-list">당일 ${refund.refundDay}</li>
								<br>
							</ol>
						</c:if>
					</div>
					
					
					<div id="map"style="height:500px; border: 1px solid black"></div>
					<!-- 지도 -->
					
					<div class = "detail-navTab">
						<h5 style="display: inline-block;color:#193D76; font-weight: bold;">Q&A&nbsp; </h5>
							<button type="button" class="btn btn-primary" id = "QNAWrite" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">
								질문 등록하기
							</button>
						<span id="totalQnA" style="display: inline-block; font-weight:bold; font-size:17px;color:#193D76">
							:  ${totalQnA}개
						</span>
						<div class = "nav-bar"></div>
						<div class = 'row'>
							<c:if test="${!empty sessionScope.userId}">
							<c:if test="${sessionScope.userId != user_id}">
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header" style=" background: #ffd014;">
							        <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: bold; font-size:24px">질문 작성하기</h1>
							        <button type="button" class="btn-close" id="closeBTN"onclick="resetQna()" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        <form>
							          <div class="mb-3">
							            <label for="message-text" class="col-form-label" style="float:left; font-size:16px;font-weight: bold;color:black; margin-bottom:1%;">
								            질문:
							            </label>
							            <label class = "textLimit" style="float:left; font-size:16px;color:black;margin-left:50%;margin-top:1%;">최대 0 / 200자 제한</label>
							            
							            <textarea class="form-control" id="message-text" rows="10"></textarea>
							          </div>
							        </form>
							        <p style="color:red"> 단, 공간 및 예약에 대한 문의가 아닌 글은 무통보 삭제될 수 있습니다.</p>
							      </div>
							      <div class="modal-footer" style="padding:2% 30% 2% 0%;">
							        <button type="button" id="modalQuit" class="btn" onclick="resetQna()" style="background: #ffd014;" data-bs-dismiss="modal">취소</button>
							        <button type="button" onclick="QnAWriteBtn()" class="btn" style="background: #193D76; color:white" >등록</button>
							      </div>
							    </div>
							  </div>
							</div>
							</c:if>
							</c:if>
							<div class="modal fade" id="answerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<input type="hidden" id="answerNumVal">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header" style=" background: #ffd014;">
							        <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: bold; font-size:24px">답변 작성하기</h1>
							        <button type="button" class="btn-close" id="closeBTN"onclick="resetQna()" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        <form>
							          <div class="mb-3">
							            <label for="message-text" class="col-form-label" style="float:left; font-size:16px;font-weight: bold;color:black; margin-bottom:1%;">
								            답변:
							            </label>
							            <label class = "textLimit" style="float:left; font-size:16px;color:black;margin-left:50%;margin-top:1%;">최대 0 / 200자 제한</label>
							            
							            <textarea class="form-control" id="answerMessage" rows="10"></textarea>
							          </div>
							        </form>
							        <p style="color:red"> 단, 공간 및 예약에 대한 문의가 아닌 글은 무통보 삭제될 수 있습니다.</p>
							      </div>
							      <div class="modal-footer" style="padding:2% 30% 2% 0%;">
							        <button type="button" id="modalQuit" class="btn" onclick="resetQna()" style="background: #ffd014;" data-bs-dismiss="modal">취소</button>
							        <button type="button" onclick="answerQna()" class="btn" style="background: #193D76; color:white" >등록</button>
							      </div>
							    </div>
							  </div>
							</div>
						</div>
						<div class = "question-box">
						
						
						</div>
						<div class="row">
							<div class="pageArea" style="margin-bottom:5%;">
							<input type="hidden" id="QnAPage" value="99999">
								<nav aria-label="Page navigation example">
								  <ul class="pagination" id = "QnAPagination">
								   
								   
								  </ul>
								</nav>
							</div>
						</div>
					</div>
					
					<div class = "detail-navTab">
						<h5 style="display: inline-block;color:#193D76; font-weight: bold;">이용 후기&nbsp;${totalReview.COUNT} </h5>
						<span id="totalReview" style="display: inline-block; font-weight:bold; font-size:17px;color:#193D76">개</span>
						<h5 style="display: inline-block;color:#193D76; font-weight: bold;margin-left: 2%;">평균 평점 : &nbsp;${avgReview}</h5>
						<div class = "nav-bar"></div>
						<div class = "review-box">
						
						</div>
						<div class="pageArea">
						<input type="hidden" id="reviewPage" value="99999">
							<nav aria-label="Page navigation example">
							  <ul class="pagination" id = "reviewPagination">
							   
							   
							  </ul>
							</nav>
						</div>
						
					</div>
				</div>
			</div>
			<!-- 여기까지 이미지 슬라이드 -->	
				<div class="col-lg-4">
				<!-- 여기부터 이미지 오른쪽 설명 블럭 -->	
					<div style="margin-bottom : 4%; ">
						<h5 style="font-weight: bold;display : inline-block;padding-top:11px;">세부공간 선택</h5>
						<a href = "javascript:void(0)" onclick="zzim()"><div style = "display : inline-block; float : right; margin-right : 1%;padding-top:5px;" >
							<img alt="" id = "zzim" src="<c:url value = '/img/icons/zzim.png'/>" width="35">
						</div></a>
						
						<a href = "https://docs.google.com/forms/d/e/1FAIpQLSeuiNC6V2HLHtm0dW-XLVu87KrVwNhTAxD0nddpUWLFYOJZOg/viewform"><div style = "display : inline-block; float : right; margin-right : 5%;" >
							<img alt="" src="<c:url value = '/img/icons/report.png'/>" width="41">
						</div></a>
						
						<a href = "#" onclick="clip()"><div style = "display : inline-block; float : right; margin-right : 4.5%;padding-top:3px;" >
							<img alt="" src="<c:url value = '/img/icons/link.png'/>" width="37">
						</div></a>
					</div>			
					<div class="d-block agent-box p-3" style="border: 4px #193D76 solid;  text-align: left;">
					<h3 class="h5 text" style="margin:4% 1% 5% 1%; text-align: center; font-weight: bold">결제후 바로 예약 확정</h3>
					<p class = "tempP">빠르고 확실한 예약을 위해 스페이스 클라우드에서<br>온라인 결제를 진행하세요 :-)</p>
					<hr style = "border-color:#193D76; height: 3px;">
						<ul class = "accordionUl">
						<c:if test="${!empty map }">
							<c:forEach var="detail" items="${map }">
							<c:set var="user_id" value="${detail.USER_ID}" />
							  <li class = "accordionLi">
							    <button class="button">
							    <input type="hidden" value="${detail.SD_NUM }">
							    	<span>${detail.SD_TYPE}</span> 
							    	<div style="float: right;">
								    	<span class="price mb-2" style= "color:#193D76;">
											 <fmt:formatNumber value="${detail.SD_PRICE}" pattern="₩#,###"/>
										</span>
										<span style= "color:grey; font-weight: 400">/(시간단위)</span>
									</div>
							    </button>
							    <div id="menu2" class="content">
							    <div style="margin-top: 5px">	
									<img src="space_images/${mainImg}" alt="Image" class="img-fluid" style="height:350px; margin-top: 20px; margin-bottom:20px; padding-right:5px; padding-left:5px;">
								</div>
								<div class="property-item">
								  <div class="property-content">
									<span class="price mb-2" style= "color:#193D76">
										 <fmt:formatNumber value="${detail.SD_PRICE}" pattern="₩#,###"/>
									</span>
									<span>/(시간단위)</span>
									<hr>
									<div>
										<span class="d-block mb-1 text-black" style="font-weight: bold; font-size: 15px">${vo.spaceZipcode } ${vo.spaceAddress } ${vo.spaceAddressDetail }</span>
									<hr>
										<span class="city d-block mb-3">${vo.spaceAddress }, 대한민국</span>
									<hr>
									<span class="d-block mb-1 text-black">
									${vo.spaceInfo }
									</span>
									<hr>
									<span class="tit">공간유형</span>
									<span class="city text-black">${detail.SD_TYPE}</span>
									<hr>
									<span class="tit">공간면적</span>
									<span class="city text-black">${detail.SD_AREA }㎡</span>
									<hr>
									<span class="tit">수용인원</span>
									<span class="city text-black">최소 ${detail.SD_MIN_PEOPLE }명 ~ 최대${detail.SD_MAX_PEOPLE }명</span>
									<hr>
								    <div class = "row facility-box" style = "display: inline-block; width:100%;">
										<c:forEach var="key" items="${detail.keySet()}">
										    <c:if test="${fn:contains(key, 'FAC_')}" >
										    	<div class="col-4" style="display:inline">
													<img class = "facility-icon"src="<c:url value='/img/icons/facilityIcons/${key }.png'/>" >
												</div>
										    </c:if>
										</c:forEach>
									</div>
									<div class="specs d-flex mb-4 " style="border-bottom:#6d3bff solid 2px; margin-top:5px"></div>
									</div>
										<span class="city d-block">예약선택</span>
									<hr>
									<ul class = "inAccordionUl">
									 <li class = "inAccordionLi">
									    <button class="inButton">시간 단위 예약하기(최소 ${detail.SD_MIN_TIME}부터)</button>
									    <div class = "inContent" style="width: 100%; animation:fadeInDown 1s">
									    <hr>
									    <!-- 시작시 기본 날짜 설정은 value를 이용 -->
										<div>
											 <input type="text" class="datepicker">
											 <input type="hidden" class = 'selectedDate'>
											 <input type="hidden" class = 'calSdNum' value="${detail.SD_NUM }">
											 <input type="hidden" class = 'calSdPrice' value="${detail.SD_PRICE }">
										</div>
									    <hr>
										 <div class="swiper mySwiper" style="visibility:hidden; animation:fadeInDown 0.8s;">
										    <div class="swiper-wrapper">
											    <fmt:parseNumber var="openTime" type="number" value="${detail.SD_OPEN_TIME}" />
											    <fmt:parseNumber var="closeTime" type="number" value="${detail.SD_CLOSE_TIME}" />
											    <c:forEach begin="${openTime}" end="${closeTime}" var="i">
										    			<div class="swiper-slide">
										    					<c:if test="${i == 0}">
												    				<p class = "swiper-p">오전</p>
												    				<p class = "swiper-p">${i}</p>
										    					</c:if>
										    					<c:if test="${i == 12}">
												    				<p class = "swiper-p">오후</p>
												    				<p class = "swiper-p">${i}</p>
										    					</c:if>
										    					<c:if test="${i != 0 && i != 12}">
												    				<p class = "swiper-p">&nbsp;</p>
										    						<p class = "swiper-p">${i}</p>
										    					</c:if>
										    				<button class = "swiper-inBox item-${i }th" value="${detail.SD_PRICE }" id="${i}">
										    					<fmt:formatNumber value="${detail.SD_PRICE}" pattern="#,###"/>
									    					</button>
										    			</div>
										     	</c:forEach>
										    </div>
										  </div>
										  <br>
										  	<input type="hidden" class="hiddenPrice"/>
								     	  	<span class="price mb-2 totalPrice" style= "color:#193D76" ></span>
										  <br><br>
										  <button class="btn btn-primary py-2 px-3" onclick="timeTableReset()" style="width:100%">초기화</button>
										  <br><br>
									    <hr>
									    	<span class="price mb-2" style= "color:#193D76" >인원 선택</span>
									    	<br><br>
									    	<div class="input-group mb-3">
	 											<button class="btn btn-outline-secondary peopleMinus" type="button" >&nbsp;-</button>
		  										<input type="text" class="form-control people" disabled aria-label="Example text with button addon" aria-describedby="button-addon1"  value = "1">
		  										<button class="btn btn-outline-secondary peoplePlus" type="button" >+</button>
											</div>
											<input type= "hidden" class="min-people" value="${detail.SD_MIN_PEOPLE }">
											<input type= "hidden" class="max-people" value="${detail.SD_MAX_PEOPLE }">
										    <div style = "padding:1% 3% 1% 3%; text-align: center;">
										    <a href = "javascript:void(0);" style = "text-decoration: none;">
												<div class="payment_type" value="kakaopay" onclick="paymentType('kakaopay')">
													<img alt="" class = "payment_type" src="<c:url value='/img/paymentIcons/kakaoPay.png'/>"width="75"/>
												</div>
											</a>
											
										    <a href = "javascript:void(0);" style = "text-decoration: none;" onclick="paymentType('kcp')">
													<div class="payment_type" value = "kcp">
														<img alt="" class = "payment_type" src="<c:url value='/img/paymentIcons/card.png'/>" width="75" style="border-radius: 1rem"/>
													</div>
											</a>
											</div>
											<hr>
											<div style="text-align: center;">
												<a href="property-single.html" class="btn btn-primary py-2 px-3" data-bs-toggle="modal" data-bs-target="#myModal" style="width: 40%">전화</a>
												<a onclick="requestPay('${detail.SD_MIN_TIME}')"  class="btn btn-primary py-2 px-7" style="width: 40%">결제하기</a>
											</div>
										</div>
							  		</li>
							  		</ul>
								  </li>
								  </c:forEach>
							  </c:if>
							</ul>
						</div> 
					</div>
				</div>
				<div class="modal" id = "myModal" tabindex="-1" >
				  <div class="modal-dialog">
				    <div class="modal-content" style = "font-weight : bold">
				      <div class="modal-header" style="background:#ffd014;">
				        <h4 class="modal-title" >${vo.spaceName}</h5>
				      </div>
				      <div class="modal-body">
				        <h3>전화번호 : ${vo.spacePhoneNum }</h3>
				      </div>
				      <div class="modal-footer" style = "justify-content: center;">
				        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
			<!-- 여기까지 오른쪽 부분-->				
			</div>
	<!-- 여기까지 섹션-->				
</section>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/navbar.js"></script>
    <script src="js/counter.js"></script>
    <script src="js/custom.js"></script>
    <script src="js/spaceDetail.js"></script>
    <script src="js/spaceDetail2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=daa469d4ff476714bf26432374f5ebff"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	<script type="text/javascript">
	$(function(){

		$('.peopleMinus').click(function(){
			var people = $(this).siblings('.people');
		    var minPeople = parseInt($(this).parent().siblings('.min-people').val());
		    
		    if(people.val() > minPeople){
		        people.val(parseInt(people.val())-1);
		    } else {
		        alert('예약가능 최소 인원은' + minPeople + '명 입니다');
		    }
		});
		
		$('.peoplePlus').click(function(){
			var people = $(this).siblings('.people');
		    var maxPeople = parseInt($(this).parent().siblings('.max-people').val());
		    if(people.val() < maxPeople ){
		    	people.val(parseInt(people.val())+1);
		    } else {
		        alert('예약가능 최대 인원은' + maxPeople + '명 입니다');
		    }
		});
		
		
		$('.nav-item').click(function(){
			$(this).css('background', '#ffd014');
			$('.nav-item').not($(this)).css('background', 'white');
		});
		
			
	  $(".datepicker").each(function(index, element) {
	  var datepickerId = $(element).data("id");
	  var sdNum = $(this).siblings('.calSdNum'); 
	  var sdPrice = $(this).siblings('.calSdPrice');
	  //new Date(new Date().setDate(new Date().getDate() + 1)),
	  $(element).datepicker({
	    language: 'ko',
	    inline: true,
	    minDate: new Date(new Date().setDate(new Date().getDate() + 1)),
	    maxDate: new Date(new Date().setMonth(new Date().getMonth() + 1)),
	    onSelect: function(selectedDates, instance) {
	      console.log("선택한 날짜:", selectedDates);
	      console.log("선택한 데이트피커의 sd_Num:", sdNum.val());
	      $('.selectedDate').val(selectedDates);
	      $('.mySwiper').css('visibility', 'visible');
	      $('.swiper-inBox').removeClass('on');
	      var requestData = {
	                sdNum: sdNum.val(),
	                selectedDates: selectedDates+""
	            };
	      
		$.ajax({
			url: 'reservation/ajaxSelectRes', // 서버의 엔드포인트 URL
			method: 'get', // 
			dataType:'json',
			data: requestData,
			success: function(data) {
				// AJAX 요청이 성공한 경우
				var begin = parseInt(data.startHour);
				var end = parseInt(data.endHour);
				var result = data.map.result;
				if(data.length == 0){
					console.log('예약내역 없음');
					noReservationRecord(result, begin, end, sdNum,sdPrice);                              
				} else{
					console.log('예약내역 있음');
					makeTimeTable(data,sdNum);
				}
			},
			error: function(xhr, status, error) {
				// AJAX 요청이 실패한 경우
				console.error('Error:', error);
			}
	      });
	    }
	  });
	});
		

	});
		$('#QNAWrite').click(function(){
			var userid = "";
			var targetId = ""; 
			targetId = '${user_id}';
			userid = '${sessionScope.userId}';
			if(userid.length === 0 || userid === targetId){
				if(userid.length === 0){
					alert('질문 등록은 로그인 이후 가능합니다');
				}else{
					alert('호스트는 질문을 작성 할 수 없습니다');
				}
			}
		});	
	
		
		$('.totalPrice').text("예약 시간을 선택해주세요.");
		$('.swiper-inBox').click(function(){
		   	var result = 0;
		   	var formattedTotalPrice = "";
		   	if($('.swiper-inBox.on').length > 0){
			    $('.swiper-inBox.on').each(function(){
			        result += parseInt($(this).val());
			    });
			    $('.hiddenPrice').val(result);
			    
			    formattedTotalPrice = addComma(result);
			    $('.totalPrice').text("₩" + formattedTotalPrice + "원");
		   	}else{
				$('.totalPrice').text("예약 시간을 선택해주세요.");
			}
		});
		function noReservationRecord(result, begin, end, sdNum,sdPrice){
 			var parent = sdNum.closest('.inAccordionLi');
			var times = parent.children('.swiper-inBox');
 			parent.find('.swiper-inBox').removeClass('reserved');
			parent.find('.swiper-inBox').prop('disabled', false);
			parent.find('.swiper-inBox').html(addComma(sdPrice.val()));
			parent.find('.swiper-inBox').val(sdPrice.val()); 			
 		}
 		
 	function makeTimeTable(data,sdNum){
			$.each(data,function(){
				console.log("makeTimeTable");
				console.log("data = ", this);
				var parent = sdNum.closest('.inAccordionLi');
				var times = parent.children('.swiper-inBox');
				var begin = this.startHour;
				var end = this.endHour;

				for(var i = begin; i < end; i++){
					parent.find('.swiper-inBox.item-'+i+'th').addClass('reserved');
					parent.find('.swiper-inBox.item-'+i+'th').prop('disabled', true);
					parent.find('.swiper-inBox.item-'+i+'th').html('예약됨');
				}	
			});
		}
			
	function QnAWriteBtn(){
		var qnaContent = document.getElementById('message-text').value;
		var userId = document.getElementById('userId').value;
		var spaceNum = '${vo.spaceNum}';
		if(userId == null || userId == ""){
			alert('질문을 하려면 로그인을 해야합니다.')
			return false;
		}
		 $.ajax({
			url:"<c:url value='/writeQnA'/>",
			type:"POST",
			dataType:"json",
			data:{
				qnaContent:qnaContent,
				spaceNum:spaceNum
			},
			success:function(rsp){
				if(rsp === 1){
					alert('QnA 등록 완료!');
				}else if(rsp === 0){
					alert('QnA 등록 실패!');
				}
			},
		 });
		 location.reload();
	 }
	 
	 var qnaText = document.getElementById('message-text');
	 var textLimit = document.getElementsByClassName('textLimit');
	 	qnaText.addEventListener('input',function(){
	 		if(this.value.length >= 200){
				var truncatedValue = this.value.substring(0, 200); // 200자로 잘라낸 값
		        this.value = truncatedValue;
				textLimit[0].classList.add('limit');
		        textLimit[0].textContent = "최대 200/ 200자 제한";
	 		}else{
	 			textLimit[0].classList.remove('limit');
	 			textLimit[0].textContent="최대 " + this.value.length + "/ 200자 제한";
	 		}
	 });
	</script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도의 중심좌표
	    mapOption = { 				
	        center: new kakao.maps.LatLng(${vo.latitude}, ${vo.longitude}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    }; 
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 지도에 마커를 표시합니다 
		var marker = new kakao.maps.Marker({
		    map: map, 
		    position: new kakao.maps.LatLng(${vo.latitude}, ${vo.longitude})
		});
		
		// 커스텀 오버레이에 표시할 컨텐츠 입니다
		// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		// 별도의 이벤트 메소드를 제공하지 않습니다 
		var content = '<div class="wrap">' + 
		            '    <div class="info">' + 
		            '        <div class="title">' + 
		            '            ${vo.spaceName}' + 
		            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		            '        </div>' + 
		            '        <div class="body">' + 
		            '            <div class="img">' +
		            '                <img src="space_images/${mainImg}" width="73" height="70">' +
		            '           </div>' + 
		            '            <div class="desc">' + 
		            '                <div class="ellipsis">${vo.spaceAddress} ${vo.spaceAddressDetail}</div>' + 
		            '                <div class="jibun ellipsis">(우) ${vo.spaceZipcode} </div>' + 
		            '                <div><a href="http://localhost:9091/spaceCollection/" target="_blank" class="link">홈페이지</a></div>' + 
		            '            </div>' + 
		            '        </div>' + 
		            '    </div>' +    
		            '</div>';
		
		// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var overlay = new kakao.maps.CustomOverlay({
		    content: content,
		    map: map,
		    position: marker.getPosition()       
		});
		
		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		    overlay.setMap(map);
		});
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay() {
		    overlay.setMap(null);     
		}
	</script>
	
	<script>
	//스와이프 스크립트
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 6,
      spaceBetween: 0,
      freeMode: true,
      on: {
          transitionEnd: function () {
              // 활성 슬라이드의 인덱스를 가져옵니다.
              const activeSlideIndex = this.activeIndex;

              // 활성 슬라이드에 있는 'on' 클래스를 유지합니다.
              const activeSlideSlots = document.querySelectorAll('.swiper-slide-active .swiper-inBox.on');
              activeSlideSlots.forEach(function (slot) {
                  slot.classList.add('on');
              });
          }
      }
  });
  	</script>
  	<script>
	
		var payType = "";
		var sdNum = "";
		var sdName = "";
	    function paymentType(type){
	        payType = type;
	    }
	    const sdBt = document.querySelectorAll('.button');

	    sdBt.forEach(function(button) {
	        button.addEventListener('click', function(e) {
	            e.preventDefault();

	            const hiddenNum = this.querySelector('input[type="hidden"]');
	            const hiddenName = this.querySelector('span').innerHTML;
	            if (hiddenNum !== null) {
	                const inputValue = hiddenNum.value;
	                sdNum = inputValue;
	                sdName = hiddenName;
	                console.log("Input value: " + inputValue + "," + sdNum + "," + sdName + ", " + hiddenName);
	            } else {
	                console.log("Input element not found.");
	            }
	        });
	    });

      
        var IMP = window.IMP; 
        IMP.init("imp04807210"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;

        
        function requestPay(minTime) {
        	var startHour = $('.swiper-inBox.on').first().attr('id');
        	var endHour = $('.swiper-inBox.on').last().attr('id');
        	var parsedEndHour = parseInt(endHour)+1;
        	if((endHour - parseInt(startHour))+1 < parseInt(minTime.substr(0,minTime.length-2))){
				alert('최소 이용 시간은' + minTime + '입니다');
				return false;
        	}
        	
        	
        	var userId = '${sessionScope.userId}';
        	if(userId === null || userId === ""){
        		alert('예약은 로그인 후 가능합니다');
        		return false;
        	}
            console.log(paymentType);
            console.log($('.hiddenPrice').val());
            
            // 아래 변수들을 선언
            var buyerEmail = "";
            var buyerName = "";
            var buyerTel = "";
            var buyerAddr = "";
            var buyerPostcode = "";
            
			
            $.ajax({
                url: 'guest/getUserInfo',
                method: 'get',
                //dataType: 'json',
                data: "userId=" + $('#userId').val(),
                success: function(rsp) {
                	
                	if(rsp==""){
                		alert('로그인 정보가 옳바르지 않습니다.');
                		return false;
                	}
                	
                    buyerEmail = rsp.userNum;
                    buyerName = rsp.userId;
                    buyerTel = rsp.userHp;
                    buyerAddr = rsp.address + " " + rsp.addressDetail;
                    buyerPostcode = rsp.zipcode;
                    console.log("userid = " + rsp.userId);

                    // $.ajax 요청이 완료된 후에 IMP.request_pay 함수 실행
                    callIMP(buyerEmail, buyerName, buyerTel, buyerAddr, buyerPostcode);
                },
                error: function(xhr, status, error) {
                	alert(status + " : " + error);
                }
            });
        }
		
        
       
        
        function callIMP(buyerEmail, buyerName, buyerTel, buyerAddr, buyerPostcode) {
       		var selectedDate = $('.selectedDate').val();
            var startHour = $('.swiper-inBox.on').first().attr('id');
            var endHour = $('.swiper-inBox.on').last().attr('id');
            var parsedEndHour = parseInt(endHour)+1;
            IMP.request_pay({
                pg: payType,
                pay_method: 'card',
                merchant_uid: ${vo.spaceNum} + "_" + sdNum + new Date().getTime(),
                name: ${vo.spaceNum} + "_" + sdName,
                amount: $('.hiddenPrice').val(),
                custom_data: {
                    START_DAY: selectedDate,
                    START_HOUR: startHour,
                    END_DAY: selectedDate,
                    END_HOUR: parsedEndHour,
                    SD_NUM: sdNum,
                    RESERVE_PEOPLE: $('.people').val()
                },
                buyer_email: buyerEmail,
                buyer_name: buyerName,
                buyer_tel: buyerTel,
                buyer_addr: buyerAddr,
                buyer_postcode: buyerPostcode
            }, function(rsp) {
                if (rsp.success) {
                    console.log(rsp.custom_data);
                    console.log(rsp);
                    var msg = '결제가 완료되었습니다.';
                    $.ajax({
                        url: 'reservation/ajaxReservation',
                        method: 'GET',
                        data: rsp,
                        success: function(rsp) {
                            //$('#result').html(data.message);
	                		console.log(rsp);
	        				location.href = "<c:url value='/reservation/showReservation?reservationNum="+rsp+"'/>"
                        },
                        error: function(xhr, status, error) {
                            console.error('Error:', error);
                        }
                    });

                } else {
                    var msg = '결제에 실패하였습니다.';
                    alert(msg);
                }
            });
        }
        
   	var imgElement = document.getElementById('zzim');
    function zzim(){
    	
		$.ajax({
			url : "<c:url value = '/zzim?spaceNum=${vo.spaceNum}'/>",
			method : 'get',
			success:function(data){
				if(data == 4){
					imgElement.src = '<c:url value="/img/icons/zzim on.png"/>';
				}else if(data == 5){
					imgElement.src = '<c:url value="/img/icons/zzim.png"/>';
				}else if(data == 0){
					alert('로그인 해주세요ㅋ');
					return false;
				}
			},
			error:function(xht, status, error){
				console.error('Error : ', error);
			}
		});
    }
    
    $.ajax({
		url : "<c:url value = '/showZzim?spaceNum=${vo.spaceNum}'/>",
		method : 'get',
		success:function(data){
			if(data == 1){
				imgElement.src = '<c:url value="/img/icons/zzim on.png"/>';
			}else if(data == 2){
				imgElement.src = '<c:url value="/img/icons/zzim.png"/>';
			}
		},
		error:function(xht, status, error){
			console.error('Error : ', error);
		}
	});
    
  
    

	  
    callReview(1);
    function callReview(reviewPage){
    	
    	if(reviewPage >= parseInt($('#reviewPage').val())+1){
    		alert('마지막 페이지 입니다');
    		event.PreventDefault();
    		return false;
    	}else if(reviewPage == 0){
    		alert('첫번째 페이지 입니다');
    		event.PreventDefault();
    		return false;
    	}
	    $.ajax({
	    	url:"<c:url value='/callReview?spaceNum=${param.spaceNum}&page="+reviewPage+"'/>",
	    	success:function(reviewList){
	    		var htmlStr = "";
				var resultStr = "";	    
				var cnt = 1;
				if(reviewList.length !== 0){
		    		$.each(reviewList, function(item){
		    			console.log(this);
		    			var starCount = 1
						if('${sessionScope.userId}' !== this.USER_ID){
							htmlStr = 	'<div class="reviewContent">'
										+'<div class="reviewHead" style="color:black; font-weight: bold">'
										+'<span padding:5px 8px 5px 8px !important;>'+this.USER_ID+'</span>'
										+'<div style="margin-left: 20%; padding-bottom: 1%">';
						}else if('${sessionScope.userId}' === this.USER_ID){
							htmlStr = 	'<div class="reviewContent" >'
										+'<div class="reviewHead" style="color:black; font-weight: bold;">'
										+'<span style="background:rgba(255, 208, 20, 0.5);border-radius:1rem; padding:5px 8px 5px 8px !important;">'+this.USER_ID+'<i class="bi bi-person-badge"></i></span>'
										+'<div style="margin-left: 20%; padding-bottom: 1%">';
						}
		    			for(var i = 0; i <= (this.REVIEW_RATE / 2)-1; i++){
							htmlStr += '<img alt="별.png" src="<c:url value='/images/fullStar.png'/>" id="star">';
							starCount++;
						}
						if(this.REVIEW_RATE % 2 != 0){
							htmlStr += '<img alt="별.png" src="<c:url value='/images/halfStar.png'/>" id="star">';
							
						}
						for(var j = starCount; j <= 4; j++){
							htmlStr += '<img alt="별.png" src="<c:url value='/images/emptyStar.png'/>" id="star">';						
						}
							htmlStr	+='</div>'
									+'</div>'
									+'<div class="qnaBody">'+this.REVIEW_CONTENT+'</div>'
									+'<div class="row" style="font-size:14px;">'
									+'<div class="col-6 date-deleteCol" style="padding-right:28% !important">'
									+'<span>'+(this.REVIEW_REG_DATE).substring(0,10)+'</span>'
									+'</div>';
						if('${sessionScope.userId}' === this.USER_ID){
							htmlStr +='<div class="col-6 delete-dateCol">'
									+'<a href="javascript:void(0)" style="font-size:14px;" onclick="deleteReview('+this.REVIEW_NUM+')">삭제하기</a>'
									+'</div>';
						}
							htmlStr +='</div>'
									+'</div>'
									+'<hr>';
						resultStr += htmlStr;
		    		});
	    			$(".review-box").html(resultStr);
		    		
	    			$.ajax({
	    				url:"<c:url value='/reviewPage?spaceNum=${param.spaceNum}&page="+reviewPage+"'/>",
	    				success:function(page){
	    					$('#reviewPage').val(page.reviewBlockPages);
	    					var pageStr = '<li class="page-item"><a class="page-link reviewPage" id="prevBt" href="javascript:void(0)" onclick="callReview('+(page.currentPage-1)+')"><</a></li>';
	    					for (var i = 1; i <= page.reviewBlockPages; i++) {
	    					    if (i === page.currentPage) {
	    					        pageStr += '<li class="page-item active">' +
	    					            '<a class="page-link">' + i + '</a>' +
	    					            '</li>';
	    					    } else {
	    					        pageStr += '<li class="page-item"><a class="page-link reviewPage" href="javascript:void(0)" onclick="callReview('+i+')">' + i + '</a></li>';
	    					    }
	    					}
	    					pageStr += '<li class="page-item">' 
	    					    +'<a class="page-link reviewPage" id="nextBt" href="javascript:void(0)" onclick="callReview('+(page.currentPage+1)+')">></a>' 
	    					    +'</li>';
	    					$('#reviewPagination').html(pageStr);
	    				}
	    			});
				}else{
					var resultStr = "<h4 style='font-weight:bold;'>등록된 이용 후기가 없습니다</h4>";
					$(".review-box").html(resultStr);
				}
	    	}
	    });
    }
    
   	callQnA(1);
    function callQnA(QnAPage){
    	
    	if(QnAPage >= parseInt($('#QnAPage').val())+1){
    		alert('마지막 페이지 입니다');
    		event.PreventDefault();
    		return false;
    	}else if(QnAPage == 0){
    		alert('첫번째 페이지 입니다');
    		event.PreventDefault();
    		return false;
    	}
	    $.ajax({
	    	url:"<c:url value='/callQnA?spaceNum=${param.spaceNum}&page="+QnAPage+"'/>",
	    	success:function(QnAList){
	    		var htmlStr = "";
				var resultStr = "";	    
				var cnt = 1;
				if(QnAList.length !== 0){
		    		$.each(QnAList, function(item){
		    			var starCount = 1

						htmlStr = '<div class="qnaContent">'
						if('${sessionScope.userId}' !== this.USER_ID){
							htmlStr +='<div class="QnAHead" style="color:black; font-weight: bold">'
									+'<span style="padding:5px 8px 5px 8px !important;">'+this.USER_ID+'</span>';
						}else if('${sessionScope.userId}' === this.USER_ID){
							htmlStr +='<div class="QnAHead">'
									+'<span  style="color:black; font-weight: bold;background:rgba(255, 208, 20, 0.5)!important; border-radius:1rem; padding:5px 8px 5px 8px !important;">'+this.USER_ID+'<i class="bi bi-person-badge"></i></span>';
						}
					 	htmlStr +='</div>'
								+'<div class="qnaBody">'+this.QNA_CONTENT+'</div>'
								+'<div class="row" style="font-size:14px;">'
								+'<div class="col-6 date-deleteCol" >'
								+'<span style="float:left; margin-left:10%;">'+this.QNA_REG_DATE+'</span>'
								+'</div>';
					 	if('${sessionScope.userId}' === '${user_id}' && this.QNA_ANSWER == null){
							htmlStr += '&nbsp;<div class="col-5 delete-dateCol" style="float:right">'
									+ '<a href="#" style="font-size:14px; display: inline-block;" onclick="setAnswerNum('+this.QNA_NUM+')" data-bs-toggle="modal" data-bs-target="#answerModal"><span>답글 달기&nbsp;&nbsp;</span></a>';
																
						}else{
							htmlStr += '<div class="col-5 delete-dateCol">';
						}
						if('${sessionScope.userId}' === this.USER_ID){
							htmlStr +='<a href="#" style="font-size:14px; display: inline-block;" onclick="deleteQna('+this.QNA_NUM+')">삭제하기</a>'
									+'</div>';
						}
							htmlStr +='</div>';
						if(this.QNA_ANSWER != null){
							htmlStr +='<div class="row" style = "text-align:left; background:rgba(255, 208, 20, 0.15);margin-top:15px; padding-top:20px; padding-left:65px;"><span style="font-weight:600; color:#193D76;font-size:15px;"><i style="font-size:15px; font-weight:bold"class="bi bi-arrow-return-right"></i>호스트님의 답글<span> <br><br>'
									+'<p>'+this.QNA_ANSWER+'</p>'
									+'</div>'
								}
							htmlStr+='</div>'
									+'<hr>';
						resultStr += htmlStr;
		    		});
	    			$(".question-box").html(resultStr);
		    		
	    			$.ajax({
	    				url:"<c:url value='/QnAPage?spaceNum=${param.spaceNum}&page="+QnAPage+"'/>",
	    				success:function(page){
	    					$('#QnAPage').val(page.QnABlockPages);
	    					var pageStr = '<li class="page-item"><a class="page-link qnaPage" id="prevBt" href="javascript:void(0)" onclick="callQnA('+(page.currentPage-1)+')"><</a></li>';
	    					for (var i = 1; i <= page.QnABlockPages; i++) {
	    					    if (i === page.currentPage) {
	    					        pageStr += '<li class="page-item active">' +
	    					            '<a class="page-link">' + i + '</a>' +
	    					            '</li>';
	    					    } else {
	    					        pageStr += '<li class="page-item"><a class="page-link qnaPage" href="javascript:void(0)" onclick="callQnA('+i+')">' + i + '</a></li>';
	    					    }
	    					}
	    					pageStr += '<li class="page-item">' 
	    					    +'<a class="page-link qnaPage" id="nextBt" href="javascript:void(0)" onclick="callQnA('+(page.currentPage+1)+')">></a>' 
	    					    +'</li>';
	    					$('#QnAPagination').html(pageStr);
	    				}
	    			});
				}else{
					var resultStr = "<h4 style='font-weight:bold;'>등록된 이용 후기가 없습니다</h4>";
					$(".question-box").html(resultStr);
				}
	    	} 
	    });
    }
    function setAnswerNum(qnaNum){
    	$('#answerNumVal').val(qnaNum);
    }
	function deleteReview(reviewNum){
		if(confirm('리뷰를 삭제하시겠습니까?')){
			location.href = "<c:url value='/deleteReview?reviewNum="+reviewNum+"&spaceNum="+"${param.spaceNum}"+"'/>"
		}
   	}
	function clip(){
		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
	}
		
		
	function resetQna(){
		document.getElementById('message-text').value="";
	}
			
			
			
	 function addComma(value){
		    value = value+"";
	        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        return value; 
	    }
	 
			
 
	
	function deleteQna(qnaNum){
		if(confirm('QnA를 삭제하시겠습니까?')){
			location.href = "<c:url value='/deleteQnA?qnaNum="+qnaNum+"&spaceNum="+"${param.spaceNum}"+"'/>";
		}
    }
    function answerQna(){
    	var qnaNum = $('#answerNumVal').val();
    	$.ajax({
    		url:'<c:url value="/qnaAnswer"/>',
    		type:'post',
    		data:{
    			qnaNum:qnaNum,
    			qnaAnswer:$('#answerMessage').val()
    		},
    		success:function(answer){
				if(answer === 1){
					alert('답변 등록 성공');
					location.reload();
				}else if(answer === 0){
					alert('답변 등록 실패');					
				}
    		}
    	});
    }
   //	let localData = JSON.parse(localStorage.getItem('recent'));
    //localStorage.setItem('recent', JSON.stringify(localData+"/"+'${vo.spaceNum}'));
    //let localData = JSON.parse(localStorage.getItem('recent'));
    // 수정된 배열을 다시 'recent'로 LocalStorage에 저장합니다.
    const localData = JSON.parse(localStorage.getItem('recent'));
    const newValue = '${vo.spaceNum}';

    // 기존 데이터와 새로운 값을 합칩니다.
    const combinedData = localData ? localData + "/" + newValue : newValue;

    // 중복을 제거하고 다시 'recent'로 LocalStorage에 저장합니다.
    const uniqueArr = [...new Set(combinedData.split("/"))];
    localStorage.setItem('recent', JSON.stringify(uniqueArr));
    </script>
	<script src="<c:url value='/js/datepickerJs/datepicker.js'/>"></script>
	<!--한국어  달력 쓰려면 추가 로드-->
	<script src="<c:url value='/js/datepickerJs/i18n/datepicker.ko.js'/>"></script> 
<%@ include file="../form/userBottom.jsp" %>
