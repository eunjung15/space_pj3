<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %> 
 
<style>
body {
    background-color: #f2f2f2;
}
section{
	display: flex;
	justify-content:center;
	width:100%;
}
.profile{
	background-color: white;
	width: 18%;
	height: 55%;
	text-align: -webkit-center;
}
.profileImg {
	background-color: white;
    width: 85%;
    border-radius: 50%;
    margin: 5%;
}

.couponList {
    width: 40%;
    background-color: white;
    height: 55%;
    margin-left: 4%;
    margin-bottom: 10%;
    text-align: center;
}
#userName{
	font-weight: bold;
	color: black;
}

#code{
    height: 44px;
    background-color: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 6px;
    padding: 0 0 0 15px;
    cursor: text;
    display: inline-block;
    position: relative;
    width: 80%;
    margin:3%;
}
#addCoupon{
	border: 1px solid #fff;
	width: 50px;
	height: 43px;
	margin: 0px;
	background-color: #07426b;
	border-radius: 10px;
	font-weight: 3px;
	font-size: 15px;
	line-height: 16px;
	text-align: center;
	letter-spacing: 1px;
	color: #fff;
}
input#addCode {
    height: 35px;
    margin-top: 4%;
    width: 70%;
}
o{
    float: right;
    margin-right: 3%;
    font-weight: bold;
}
.CouponBox {
    justify-content: flex-start;
    height: 95vh;
    align-items: flex-start;
    margin-top: 4%;
}
button#mypage {
    color: #999;
    background-color: white;
    border: 1px solid #a1a1a1;
    font-weight: bold;
}
table {
    caption-side: bottom;
    border-collapse: collapse;
    width: 100%;
}
tr#oneBox {
    border-bottom: 1px solid #999;
}
td{
     border-bottom: 0.1px solid lightgray;
}
td {
    height: 40px;
}
th#tdR {
    border-right: 1px solid white;
}
th{
    font-weight: bold;
    background-color: #193D76;
    color: white;
}
form#couponListForm {
    width: 100%;
}
.list-group-numbered {
    list-style-type: none;
    counter-reset: section;
    width: 100%;
}
span#left{
	float: left;
}
img#noCoupon {
    scale: 0.6;
}
h1 {
    margin-top: 4%;
}
</style>

<script>
	var userNum = ${guestVo.userNum }; 
	function makeList(data) {
		 console.log("로딩 시작");
		var str="";	
		 $.each(data, function() {  
				str+="<li class='list-group-item d-flex  align-items-start'>";
				str+="<div class='ms-2 me-auto'>";
				str+="<div class='fw-bold' ><span id='left'>쿠폰 코드 : "+this.couponName+"</span></div><br>";
				str+=""+this.couponStartDay+" ~ "+this.couponFinishDay+"";
				str+="</div>";
				str+="<span class='badge bg-primary rounded-pill'>"+this.couponType+" %</span>";
				str+="</li>";
			}); //each
			$('#selectCoupon').html(str);
	 }//makeList
	
	 loadCoupon(userNum);
	function loadCoupon(userNum){
	 console.log("로딩성공");
		$.ajax({
			url : '<c:url value="/user/couponList/couponLoad?userNum='+userNum+'"/>',
			type: 'get',
			success:function(data){
				if(data!=null && data.length>0){
					makeList(data);
				}else{  
					str = "<img id='noCoupon' alt='쿠폰없음' src='<c:url value="/images/couponSubmit.png"/>'>";
					console.log("없음 확인");
					$('#selectCoupon').html(str);
					return;
				}
			},
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});//ajax
	 }
	
$(function() {	
	$('#addCoupon').click(function() {
		event.preventDefault();
		
		var couponNumber = $('input[name="couponName"]');
		console.log(couponNumber.val().length);
		
        if (couponNumber.val().length === 0){
        	alert("쿠폰 번호를 입력해주세요.");
            return;
        }else if(couponNumber.val().length !== 12){
            alert("유효하지 않은 쿠폰입니다.");
            return;
        }
     
			var data = $('form[name=couponNum]').serialize();
			console.log(data);
		    $.ajax({
		        url: "<c:url value='/user/couponList/couponWrite' />",
		        method: 'post',
		        data: data,
		        success: function(data) {
       				console.log(data);
	       				if(data.status === "duplicate"){
	     						alert("이미 등록된 쿠폰입니다.");
							    location.reload();
							    return;
	       				}else if(date.status === "success"){
		        				console.log("추가 성공");
	     						alert("쿠폰을 등록했습니다.");
	     						console.log("쿠폰 추가 성공");
							    location.reload();
							    return;
	       				}
	       				
		        },//success
		    	error:function(xhr, status, error){
					alert(status + " : " + error);
				}
		    });//ajax 
		
	    
	});//#addCoupon
	
});	


</script>

<div style="text-align: center; padding-top:20%;padding-bottom:2%;">
	<h1>쿠폰 리스트</h1>
</div>
<section>
<article class="profile">
		<input type="hidden" name="snsCode" value="${guestVo.userSnsCode }">
		<input type="hidden" name=userNum value="${guestVo.userNum }">
			<div class="profileImg">
				<img src="
					<c:if test="${empty sessionScope.code}">
						<c:if test="${!empty guestVo.userProfileImage }">
							<c:url value='/user_images/${guestVo.userProfileImage }'/>
						</c:if>
						<c:if test="${empty guestVo.userProfileImage }">
							<c:url value='/user_images/default_profile.jpg'/>
						</c:if>
					</c:if>
					<c:if test="${!empty sessionScope.code}">
						${guestVo.userProfileImage }
					</c:if>	
				" id="userImage" alt="사용자 이미지" class="profileImg"><br><br><br>
				<strong style="color: black;" >
					<c:if test="${!empty guestVo.userName }">
						<div  id="userName">
						${guestVo.userName }
						</div>
					</c:if>
				</strong><br>
				<c:if test="${empty sessionScope.code}">
					<label for="file-input">
						<a href="<c:url value='/guest/myPage/myProfile'/>"><button id="mypage">마이페이지</button></a>
				    </label>
				    <input type="file" id="file-input" name="userProfileImage" value="1" style="display: none; 
				    		margin-bottom: 50px;" accept="image/gif,image.jpeg,image/png"/>
				</c:if>
			</div>
</article>
	
		<div class="couponList">
				<form name="couponNum" method="post" action="<c:url value='/user/couponList/couponWrite'/>">
					<input id="addCode" value="" name="couponName"  placeholder="쿠폰 일련번호를 입력하세요" type="text" />
					<button id="addCoupon" type="button" >등록</button>
					<input value="${guestVo.userNum } "  name="userNum" type="hidden" />
					<input value="10" name="couponType" type="hidden" />
				</form>	
					<br><o>총 ${count }장</o>
					
			<div class="CouponBox">
				<ol class="list-group list-group-numbered" id="selectCoupon">
				</ol>
			</div>
			
		</div>
		
</section>

<%@ include file="/WEB-INF/views/form/userBottom.jsp" %> 