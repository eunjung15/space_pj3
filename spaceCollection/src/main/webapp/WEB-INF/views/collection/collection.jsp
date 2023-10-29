<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
   @keyframes fadeInUp {
      0% {
          opacity: 0;
          transform: translate3d(0, -100%, 0);
      }
      to {
          opacity: 1;
          transform: translateZ(0);
      }
    }

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

.row{
	padding: 5% 0% 0% 0%;
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
    padding: 4% 0% 10% 0%;
	text-align:center;
	font-weight:bold;
	height:144.5px;
}
.search-section{
	height:100%;
	padding-bottom:3%;
	background: rgb(246, 246, 246);
	min-height: 648px;
}
.dropdown-toggle{
	display:inline-block;
}
.asd{
	text-align: center;
    padding: 2% 0% 0% 0%;
    background: rgba(45, 90, 205, 0.95);
    height: 300px;
    color: white;
    font-weight: bold;
    font-size: 23px;
    
    .btn-group{
		width: 28%;
	}
	.dropdown{
		margin-left: 2%;
		width: 26%;
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
	    animation: fadeInDown 1s;
	}
	.card-body{
		padding: 4% 8% 4% 8%;
	}
	.h5{
	    	font-weight: bold	
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
	    width: 8%;
	    margin-left: 64.2%;
	    padding-top: 36px;
	}
	#order-selectBox{
		margin-bottom:15px;
	}
	.select-option:hover{
		background-color: #ffd014 !important;
	}
	.all-reset{
		display : inline-block;
		text-align:center;
		padding: 0% 0% 0% 0%;
		width: 100%;
	}
	
	#all-resetBtn{
		border: rgba(204,140,40, 0.6) 10px solid;
		font-weight:bold;
		font-size : 15px;
	    background: #ffd014;
		border-radius: 30px;
	    padding-top: 15px;
	    padding-bottom: 15px;
	    padding-left: 30px;
	    padding-right: 30px;
	    border-width: 2px;
	}
	#all-resetBtn:hover{
		border: #ffd014 4px solid;
		background: white;
	}
	
	#headerKeyword{
	    font-weight: bold !important;
	    color: white;
	    border: 2.5px white solid;
	    border-radius: 4rem;
	    background: rgba(255, 255, 255, 0.2);
	    width: 20%;
	    padding: 2% 0% 2% 0%;
	    margin-left: 39%;
        margin-top: 5%;
	}
	.contentTitle{
		animation: fadeInUp 2s;
	}
</style>
<div class="hero page-inner overlay" style="background-image: url('images/collection_bg.png');">
		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
				<!-- 공간명이 들어갈 자리 -->
					<h5 id="headerKeyword"  data-aos="fade-up" >
						워케이션 기획전
					</h5>
					<h1 class="heading" data-aos="fade-up" style="padding-top:8%;">${collectionName.SC_TYPE}</h1>
					
				</div>
			</div>
		</div>
	</div>
<div class = "asd">
<p class= "contentTitle">
${collectionName.SC_CONTENT }</p>
</div>
<section class = "search-section">
	<div class="container" >
	<hr>
		<div class="row" id = "data-container">
		</div>
  	</div>
</section>


<script src="https://cdn.jsdelivr.net/npm/nouislider@15.7.1/dist/nouislider.min.js"></script>
<script type="text/javascript">
       
	loadCollection();
	
	
	function loadCollection(){
		$.ajax({
			url: '<c:url value="/getCollection?scCode='+${param.scCode}+'"/>',
	        type:'get',
	        success: function(data) {
	        	if(data != null){
					makeList(data);
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
	
	// ajax로 불러온 데이터들 html 생성하는 함수
	var num =1;
	function makeList(data) {
	    $.each(data, function(index) {
	    var htmlStr = "";
	    	var innerVal = Object.values(this);
	    	var innerMap =Object.keys(this)[0];
			var input = innerMap;
			console.log(this);
			
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
				
				htmlStr += '<div class="col-sm-4">';
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
		        num++;
		    $('#data-container').append(htmlStr);
			}
	    });
	}
	
	//ajax로 불러올 데이터가 없을때 호출하는 함수
	function noData(){
		 var htmlStr = "<h1 class='nodata'>표시 할 공간이 없어요</h1>";
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
</script>
<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>