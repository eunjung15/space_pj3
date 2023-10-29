<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
*{
font: 'nanum gothic', 맑은 고딕, 한컴돋움, 돋움;
}

.narrow-w.form-search.d-flex.align-items-stretch.mb-3.aos-init.aos-animate {
    margin-top: 20px;
    margin-right: 190px;
}

a.logo.m-0.float-start {
    font-size: 40px;
    font-weight: bolder;
}
#hboldfont{
font-weight: bold;
}
a.btn.btn-primary.py-2.px-3 {
    margin-bottom: 20px;
    
}

.property-items-container {
    display: flex;
    flex-direction: row; /* Display items in a row */
    justify-content: flex-end; /* Align items to the right */
    gap: 20px; /* Add some spacing between items */
   
}

.img-fluid{
    border-top-left-radius: 1rem;
    border-top-right-radius: 1rem;
    
}
.property-content{
 box-shadow: 3px 3px 8px 8px rgba(0, 0, 0, 0.2) !important;
 padding:3% 6% 0% 6%!important;
 border-bottom-left-radius: 1rem;
 border-bottom-right-radius: 1rem;
 }
.property-item {
    /* Add any specific styles for each property item */
     
}

.icon-star-half-reverse {
        transform: scaleX(-1);
 }
 .nav-bar{
    width: 400px;
    height: 4px;
    background: #ffd014;
    margin-top:15px;
 }
 #reviewBox{
    background: white;
    box-shadow: 0px 7px 10px 5px rgba(0, 0, 0, 0.15) !important;
    border: 2px solid #193D76;
    border-radius: 5px;
 }
#tns3 {
    width: calc(480%);
}
#tns3 > .tns-item {
    word-wrap: break-word;
}
.tns-ovh{
	padding-right:1%;
	padding-left:1%;
}
.newTitle{
	 color: #193D76;
}
.newTitle:hover{
	color:#ffd014;
}
a#nowWeather {
    font-size: 17px;
}
div#weatherBox {
    background: #00204a;
    padding: 14px;
    margin-bottom: 30px;
    height: 208px;
}
div#temperature {
    color: white;
    margin-top: 8%;
    margin-right: 8%;
}
div#description {
    color: white;
}
div#place {
    color: white;
}
.img-fluid {
	width:412px;
	height:400px !important;
    top: 80% !important; /* 이미지를 수직 중앙으로 이동합니다. */
    left: 50%; /* 이미지를 수평 중앙으로 이동합니다. */
	overflow: hidden; 
}
.contentBody{
	height:40px;
}
.btn-primary:hover{
	border:none;
}
.countup{
	font-size:100px;
}
.col-lg-9{
	width:100% !important;
}
.btn:hover{
	background:lightgrey !important;
	color:black !important;
	transition:0.2s;
}
.caption{
	color:black;
	font-weight: bold;
	font-size:16px;
}
.reviewName:hover{
	color:#ffd014;
}
</style>

<script >
	$(function(){
		getWeather();
	});
	

	var weatherIcon = {
		    '01' : 'fas fa-sun',
		    '02' : 'fas fa-cloud-sun',
		    '03' : 'fas fa-cloud',
		    '04' : 'fas fa-cloud-meatball',
		    '09' : 'fas fa-cloud-sun-rain',
		    '10' : 'fas fa-cloud-showers-heavy',
		    '11' : 'fas fa-poo-storm',
		    '13' : 'far fa-snowflake',
		    '50' : 'fas fa-smog'
		};
	
	function getWeather(){
		$.ajax({
			url : "https://api.openweathermap.org/data/2.5/weather?lat=37.5683&lon=126.9778&appid=a408e82232cf7c21d3264d12924a62ab",
			method : 'get',
			dataType : 'json',
			success:function(res){
				console.log("res=", res);
				console.log("icon=",res.weather[0].icon);
				console.log("temperature=", res.main.temp);
				console.log("place=", res.name);
				console.log("description=", res.weather[0].description);
				
				var nowTeamp = (res.main.temp -273.15).toFixed(1);
                var lowTemp = (res.main.temp_min - 273.15).toFixed(1);
                var hightTemp = (res.main.temp_max - 273.15).toFixed(1);
                console.log("nowTeamp=", nowTeamp);
				
                var weathericonUrl =
                    '<img src= "http://openweathermap.org/img/wn/'
                    + res.weather[0].icon +
                    '.png" alt="' + res.weather[0].description + '"/>'

                $('#iconWeather').html(weathericonUrl);
				$("#temperature").text(nowTeamp+" C°");
				$("#place").text(res.name);
				$("#description").text(res.weather[0].description); 
				
				
			},error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});
	}
</script>



   <div class="hero">
      <div class="hero-slide">
         <div class="img overlay" style="background-image: url('images/hero_bg_3.jpg')"></div>
         <div class="img overlay" style="background-image: url('images/hero_bg_2.jpg')"></div>
         <div class="img overlay" style="background-image: url('images/hero_bg_1.jpg')"></div>
      </div>
      
      <div class="container">
         <div class="row justify-content-center align-items-center">
            <div class="col-lg-9 text-center">
               <h1 class="heading" id="mainTitle" data-aos="fade-up" style="font-size:65px">Space Collection에 오신 것을 환영합니다.</h1>
            </div>
         </div>
      </div>
   </div>

<div class="section">
      <%@ include file="/WEB-INF/views/userMain/userMain.jsp" %>
    </div>
    
   <div class="section">
      <div class="container">
      
	         <div class="row mb-5 align-items-center">
	            <div class="col-lg-6">
	               <h2 class="font-weight-bold heading text-primary mb-4 mb-md-0" id="hboldfont">신규 스페이스 컬렉션</h2>
	            <div class="nav-bar"></div>
	            </div>
	            <div class="col-lg-6 text-lg-end">
	               <p><a href="<c:url value='/search?page=1'/>" target="_blank" class="btn btn-primary text-white py-3 px-4">등록된 공간 전체 보기</a></p>
	            </div>
	         </div>
	         <div class="row">
				<div class="col-12">
					<div class="property-slider-wrap">
						<div class="property-slider">
							<c:forEach var="map" items="${list}">
							  	  <div class="property-item">
							  	  <c:forEach var="entry" items="${imgList}" varStatus="status">
										<fmt:parseNumber var="entryVal" type="number" value="${entry.key}" />
										<fmt:parseNumber var="mapVal" type="number" value="${map.SPACE_NUM}" />
											<c:if test="${entryVal == mapVal}">
										  	  	<a href="<c:url value='/detail'/>?spaceNum=${entry.key}" class="img">
													<img src="<c:url value="/space_images/${entry.value}"/>" alt="Image" class="img-fluid">
												</a>
											</c:if>
									</c:forEach>
									<div class="property-content">
										<div>
											<h5 ><a class="newTitle" style="font-weight:900;" href="<c:url value='detail?spaceNum=${map.SPACE_NUM}'/>">${map.SPACE_NAME}</a></h5>
										</div>
										<div class="price mb-2"><span>
										<fmt:formatNumber value="${map.AVGPRICE }" pattern="#,###원" />
										</span></div>
										<div class="contentBody">
											<span class="d-block mb-2 text-black-50">${map.SPACE_TAG}</span>
										</div>
										<span class="city d-block mb-3">${map.SPACE_ADDRESS}</span>
										<a href="<c:url value='/detail'/>?spaceNum=${map.SPACE_NUM}" class="btn btn-primary py-2 px-3">상세보기</a>
									</div>
							  	</div>
					    	</c:forEach>
				    	</div>
				    	 <div id="property-nav" class="controls" tabindex="0" aria-label="Carousel Navigation">
				             <span class="prev" data-controls="prev" aria-controls="property" tabindex="-1">이전</span>
				             <span class="next" data-controls="next" aria-controls="property" tabindex="-1">다음</span>
				       </div> 
			    	</div>
		    	</div>
			</div>
       </div>
     
     </div>

               

   <section class="features-1">
      <div class="container">
         <div class="row">
            <div class="col-6 col-lg-3"  data-aos="fade-up" data-aos-delay="300">
               <div class="box-feature">
                  <span class="flaticon-house"></span>
                  <h3 class="mb-3" id="hboldfont">새로운 공간보기</h3>
                  <p><a href="search?order=spaceRegDate_desc" class="learn-more">Learn More</a></p>
               </div>
            </div>
            <div class="col-6 col-lg-3"  data-aos="fade-up" data-aos-delay="500">
               <div class="box-feature">
                  <span class="flaticon-building"></span>
                  <h3 class="mb-3" id="hboldfont">공간 판매하기</h3>
                  <p><a href="host/index" class="learn-more">Learn More</a></p>
               </div>
            </div>
            <div class="col-6 col-lg-3"  data-aos="fade-up" data-aos-delay="400">
               <div class="box-feature">
                  <span class="flaticon-house-3"></span>
                  <h3 class="mb-3" id="hboldfont">시즌 이벤트</h3>
                  <p><a href="<c:url value='/user/boardList'/>" class="learn-more">Learn More</a></p>
               </div>
            </div>
            <div class="col-6 col-lg-3"  data-aos="fade-up" data-aos-delay="600">
             	<div class="box-feature" id="weatherBox">
                   <%-- <span class="flaticon-house-1"></span>
                  <h3 class="mb-3" id="hboldfont">시즌 공간 기획전</h3>
                  <p><a href="<c:url value='/collection?scNum=1'/>"  class="learn-more">Learn More</a></p> --%>
            	<!-- <div id="weatherBox" style="background-color : rgb(101, 178, 255); padding : 40px;color : #fff; height : 240px"> -->
				   <a href="https://weather.naver.com/'/>" id="nowWeather">
				   <div style="float : left;">
					        <div id="iconWeather"></div>
				   </div>
				   <div class="weaterMinBox">
					        <div class="current_temp" id="temperature" style="font-size : 40pt"></div>
					        <div class="weather_description" id="description" style="font-size : 20pt"></div>
					        <div class="city" id="place" style="font-size : 13pt"></div>
				   </div>
				   </a>
               </div> 
            </div>   
         </div>
      </div>
   </section>

<!-- 리뷰 시작 -->
   <div class="section sec-testimonials">
      <div class="container">
      
         <div class="row mb-5 align-items-center">
            <div  class="col-md-6">
               <h2 class="font-weight-bold heading text-primary mb-4 mb-md-0" id="hboldfont">생생한 이용자 리뷰</h2>
            </div>
            <div class="col-md-6 text-md-end">
               <div id="testimonial-nav">
                  <span class="prev" data-controls="prev">이전</span>
                  
                  <span class="next" data-controls="next">다음</span>
               </div>
            </div>
         </div>

         <div class="row">
            <div class="col-lg-4">
               
            </div>
         </div>
         
		<div class="testimonial-slider-wrap"  id="reviewBox">
		<div class="testimonial-slider" style='margin:2%; margin-right:70%'>
			 <c:forEach var="map" items="${map}">
				 <div class="item">
			        <div class="testimonial">
			            <a href="<c:url value='/detail'/>?spaceNum=${map.SPACE_NUM}" class="img">
			                <!-- <img src="images/person_1-min.jpg" alt="Image" class="img-fluid w-140 mb-4 rounded"> --> 
			                <%-- ${map.IMG_ORIGINAL_NAME} --%>
			            </a>
			            <div class="rate">
			                 <c:forEach begin="1" end="${map.REVIEW_RATE/2 - 1}">
			                    <span class="icon-star text-warning"></span>
			                </c:forEach>
			                <c:choose>
			                    <c:when test="${map.REVIEW_RATE%1 < 1}">
			                        <span class="icon-star-half icon-star-half-reverse text-warning"></span>
			                    </c:when>
			                    <c:otherwise>
			                        <span class="icon-star-empty text-warning"></span>
			                    </c:otherwise>
			                </c:choose> 
			            </div>
			            <!-- 리뷰 -->
			            <h3 class="h5 text-primary mb-4" style="font-weight: bold;"><a class="reviewName" href="<c:url value='/detail?spaceNum=${map.SPACE_NUM }'/>"> ${map.SPACE_NAME}<br>${map.SD_TYPE}</a></h3>
			            <blockquote>
			                <p>&ldquo;리뷰내용 ${map.REVIEW_CONTENT }&rdquo;</p>
			            </blockquote>
			            <p class="text-black-50">가격정보(1박 기준) ${map.SD_PRICE }</p>
			        </div>
			    </div>
			</c:forEach>
            </div>
         </div>
         
      </div>
   </div>
<!-- 리뷰 끝 -->


   <div class="section section-15 bg-light">
      <div class="container">
	        <div  class="content-center text-center" style= "margin-top: 20px;">
            <div class="row section-counter" var="map" items="${usercount}">
		        <div class="col-4 col-sm-4 col-md-4 col-lg-4" data-aos="fade-up" data-aos-delay="">
		            <div class="counter-wrap mb-5 mb-lg-0">
		                <span class="number"><span class="countup text-primary">${usercount.SPACE_COUNT}</span></span>
		                <span class="caption text-black-100"># 등록 된 공간</span>
		            </div>
		        </div>
		        <div class="col-5 col-sm-6 col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="400">
		            <div class="counter-wrap mb-5 mb-lg-0">
		                <span class="number"><span class="countup text-primary">${usercount.RESERVATION_COUNT}</span></span>
		                <span class="caption text-black-100"># 예약 된 공간</span>
		            </div>
		        </div>
		        <div class="col-5 col-sm-6 col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="">
		            <div class="counter-wrap mb-5 mb-lg-0">
		                <span class="number"><span class="countup text-primary">${usercount.USER_COUNT}</span></span>
		                <span class="caption text-black-100"># 사용자 수</span>
		            </div>
		        </div>
			</div>
			</div>
      
            <div class="row justify-content-center  text-center mb-15" style= "margin-top: 40px;">
            <div class="col-lg-15">
               <h2 class="font-weight-bold heading text-primary mb-4" style= "font-weight: bold;"> SpaceCollection을 선택해주신 많은 고객님들께 감사드립니다. </h2>
               <p class="text-black-50">우리의 다양한 공간 옵션은 회의, 세미나, 워크샵, 파티룸 및 이벤트 등 다양한 목적에 부합하도록 구성되었습니다. 
               <br>당신의 아이디어와 목표를 현실로 이끌어 줄 공간을 찾아보세요. 지금 바로 예약하여 성공적인 첫 걸음을 내딛어보세요.</p>
            </div>
            </div>
      </div>
   </div>

   <%@ include file="/WEB-INF/views/form/userBottom.jsp" %>