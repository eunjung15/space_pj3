<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %> 
<style>

section{
	width:100%;
	display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: flex-start;
    max-width: 1200px;
    margin: 0 auto;
    margin-bottom: 100px;
}
.rouletter {
  position: relative;
  width: 186px;
  height: 400px;
  margin-top: 200px;
}
.rouletter-bg {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 350px;
  height: 350px;
  border-radius: 350px;
  overflow: hidden;
}
.rouletter-wacu {
  width: 100%;
  height: 100%;
  background: #f5f5f2;
  background-size: 100%;
  transform-origin: center;
  transition-timing-function: ease-in-out;
  transition: 2s;
}
.rouletter-arrow {
  position: absolute;
  top: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 1px;
  height: 1px;
  border-right: 10px solid transparent;
  border-left: 10px solid transparent;
  border-top: 40px solid red;
  border-bottom: 0px solid transparent;
}
.rouletter-btn {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 80px;
  height: 80px;
  border-radius: 80px;
  background: #fff;
  border-image: linear-gradient(to right, #fbfcb9be, #ffcdf3aa, #65d3ffaa);
  border: 2px solid;
}

.hidden-input {
  display: none;
}
#generateButton,#roulette{
	 justify-content: center;
      max-width: 1200px;
      margin: 0 auto; 
      margin-left: 500px; 
      position: center;
	 width: 200px;
}
.rouletter-wacu {
    background-image: url(<c:url value='/images/roulette.png'/>);
}
div#textBox{
    margin-top: 0;
    margin-bottom: 1rem;
    width: 1000px;
    text-align: center;
    margin-left: 100px;
    font-weight: bold;
}
.myCoupon {
}
.CouponIcon{
    width: 10%;
}
</style>
<section>
  <div id="roulette" class="roulette">
	    <input type="hidden" value="${sessionScope.userId }"/>
	    <div id="app">
	    </div>
  </div>
  
  <div id="textBox">
    <span id="textBox">가운데 Start 버튼을 클릭시 룰렛이 실행됩니다.
    <br> * 쿠폰은 로그인 후 발급 가능합니다. *</span>
     <br><br>
     <a href="<c:url value='/user/couponList'/>"><img src=<c:url value='/images/couponIcon.png'/>  class="CouponIcon"></a>
     => 나의 쿠폰함 이동 
     
  </div>	    
	    
</section>

<script>

    var rolLength = 6; // 해당 룰렛 콘텐츠 갯수
    var setNum; // 랜덤숫자 담을 변수
    var hiddenInput = document.createElement("input");
    hiddenInput.className = "hidden-input";

    //랜덤숫자부여
    const rRandom = () => {
      var min = Math.ceil(0);
      var max = Math.floor(rolLength - 1);
      return Math.floor(Math.random() * (max - min)) + min;
    };

const rRotate = () => {
	
	if (${empty sessionScope.userId }) {
		alert("로그인이 필요합니다.");
		window.location.href = '/spaceCollection/login/login';
		return;
	} else {
		alert("행운을 빌어요!! ${sessionScope.userId} 님!");

      var panel = document.querySelector(".rouletter-wacu");
      var btn = document.querySelector(".rouletter-btn");
      var deg = [];
      // 룰렛 각도 설정(rolLength = 6)
      for (var i = 1, len = rolLength; i <= len; i++) {
        deg.push((360 / len) * i);
      }
      
      // 랜덤 생성된 숫자를 히든 인풋에 넣기
      var num = 0;
      document.body.append(hiddenInput);
      setNum = hiddenInput.value = rRandom();
    	
      // 애니설정
      var ani = setInterval(() => {
        num++;
        panel.style.transform = "rotate(" + 360 * num + "deg)";
        btn.disabled = true; //button,input
        btn.style.pointerEvents = "none"; //a 태그
        
        // 총 50에 다달했을때, 즉 마지막 바퀴를 돌고나서
        if (num === 40) {
          clearInterval(ani);
          panel.style.transform = `rotate(${deg[setNum]}deg)`;
        }
      }, 40);
      
	}
};

    // 정해진 alert띄우기, custom modal등
    const rLayerPopup = (num) => { 
      switch (num) {
        case 1:
        	alert("당첨!! 쿠폰 일련번호를 확인해주세요.");
      		window.location.href = './coupon2';
          break;
        default:
        	alert("당첨!! 쿠폰 일련번호를 확인해주세요.");
      		window.location.href = './coupon2';
      }
    };

    // reset
    const rReset = (ele) => {
      setTimeout(() => {
        ele.disabled = false;
        ele.style.pointerEvents = "auto";
        rLayerPopup(setNum);
        hiddenInput.remove();
      }, 5500);
    };

    // 룰렛 이벤트 클릭 버튼
    document.addEventListener("click", function (e) {
   		var target = e.target;
      	if (target.tagName === "BUTTON") {
	        rRotate();
	        rReset(target);
      	}
    });

    //룰렛 생성  
    document.getElementById("app").innerHTML =
    	    `<div class="rouletter">
	        <div class="rouletter-bg">
	            <div class="rouletter-wacu"></div>
	        </div>
	        <div class="rouletter-arrow"></div>
	        <button class="rouletter-btn">start</button>
	    	</div>`;
    	
		    	
	    	
	
    </script>
    
<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>
 
