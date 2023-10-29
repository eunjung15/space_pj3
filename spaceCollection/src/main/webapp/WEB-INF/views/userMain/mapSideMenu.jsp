<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
 @keyframes fadeInDown {
        0% {
            opacity: 0;
            transform: translate3d(0, 15%, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    	}
.offcanvas-header{
	background: rgba(255, 208, 20, 0.6);
}
.offcanvas-title{
	font-weight: bold;
}
::-webkit-scrollbar {
    width: 10px;
    background-color: white;
  }
::-webkit-scrollbar-thumb{
	background: #193D76;
	border-radius: 1rem;
	trans
} 
.offcanvas-start{
	scroll-behavior: smooth;
	transition: all 0.4s ease;
	width:450px;
}
#orderBtn{
	background:#193D76;
	color:white;
}
.movePoint{
	text-decoration: none;
	color:black;
}
.avgPrice{
	font-weight: bold;
	color:#193D76;
}
.carousel-control-next:hover{
	border-radius:0 0.8rem 0 0 !important;
	background:linear-gradient(to left, rgba(0, 0, 0, 0.64), rgba(0, 0, 0, 0));
}
.carousel-control-prev:hover{
	border-radius: 0.8rem 0 0 0 !important;
	background:linear-gradient(to right, rgba(0, 0, 0, 0.64), rgba(0, 0, 0, 0));
}
.addressBtn{
	color:black !important;
	text-decoration: none;
}
.collapse{
	margin-top:10px;
	box-shadow: 5px 10px 5px 5px rgba(0, 0, 0, 0.06) !important;
}
.collapsing{
	margin-top:10px;
	box-shadow: 5px 10px 5px 5px rgba(0, 0, 0, 0.06) !important;
}
</style>

<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasExampleLabel">${title}</h5>
    <button type="button" class="btn-close" id="sideBarClose" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <div>
      <c:forEach var="map" items="${spaceMap}">
      <c:set var="vo" value="${map}" />
      	<a style="cursor:pointer; display: inline-block" onclick="panTo('${vo.key.latitude}',${vo.key.longitude})" class="movePoint">
      		${vo.key.spaceName}
   		</a>
   			<a style="display:inline-block; float:right; margin-right:10px;"class="addressBtn" data-bs-toggle="collapse" href="#collapseExample${vo.key.spaceNum}" role="button" aria-expanded="false" aria-controls="collapseExample">
    			<i class="bi bi-arrow-down-square"></i>&nbsp;주소
  			</a>
   			&nbsp;<span class="avgPrice" style="float:right; margin-right:10px;"><fmt:formatNumber value="${map.value}" pattern="#,###원"/></span>
  			<div class="collapse" id="collapseExample${vo.key.spaceNum}">
			  <div class="card card-body">
			  	${vo.key.spaceAddress} ${vo.key.spaceAddressDetail}
			  	${vo.key.spaceLocation }
			  </div>
			</div>
      	<hr>
      </c:forEach>
    </div>
  </div>
</div>
