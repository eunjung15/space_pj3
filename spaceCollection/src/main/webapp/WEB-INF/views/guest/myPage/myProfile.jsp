<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../form/userTop.jsp" %>
<%-- <%@include file="myPageMenu.jsp" %> --%>
<script type="text/javascript" src="<c:url value='/js/guest.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
		 $(".hiddenText").hide(); // 처음에 숨기기
		 
		 $("input[name=userProfileImage]")
		 
		 $("input[name=userProfileImage]").change(function() {
		        var selectedFile = this.files[0]; // 선택한 파일 정보 가져오기
		        fileCheck(selectedFile);
		 });
		 
		 function fileCheck(file) {
			    var pathPoint = file.name.lastIndexOf(".");
			    var filePoint = file.name.substring(pathPoint + 1, file.name.length);
			    var fileType = filePoint.toLowerCase();

			    if (fileType == 'jpg' || fileType == 'gif' || fileType == 'jpeg' || fileType == 'png' || fileType == 'bmp') {
			        // 정상적인 파일 확장자
			        /* var formData = new FormData(); // FormData 객체 생성
        			formData.append('file', file); // 파일 데이터 추가
			        $.ajax({
			        	url:"<c:url value='/guest/myPage/editImage'/>",
			        	type: 'post',
			        	data: $('form[name=editProfile]').serialize(),
			            contentType: false, // 컨텐츠 타입 설정하지 않음
			            processData: false, // 데이터 처리 방지
			        	success:function(res){
							 alert("성공");
						},
						error:function(xhr,status,error){
							alert("실패");
						}
			        }); */
			        $("form[name=editProfile]").attr("action","<c:url value='/guest/myPage/editImage'/>");
			        $("form[name=editProfile]").submit();
			        	
			    } else {
			        alert("이미지 파일만 선택할 수 있습니다.");
			        return false;
			    }

			    if (fileType == 'bmp') {
			        var upload = confirm('bmp 파일은 웹에서 사용하기에 적합하지 않을 수 있습니다.\n그래도 계속 하시겠습니까?');
			        if (!upload) {
			            return false;
			        }
			    }
		}
		 
		 if($("input[name=userMarketingSmsOk]").val() =='Y'){
			 $("input[name=userMarketingSmsOk]").prop("checked",true);
		 }else{
			 $("input[name=userMarketingSmsOk]").prop("checked",false);
		 }
		 
		 if($("input[name=userMarketingEmailOk]").val() == 'Y'){
			 $("input[name=userMarketingEmailOk]").prop("checked",true);
		 }else{
			 $("input[name=userMarketingEmailOk]").prop("checked",false);
		 }
		 
		 var snsCode=$("input[name=userSnsCode]").val();
		 if(snsCode=="kakao"){
			 $("input[name=kakaoLink]").prop("checked",true);
		 }else if(snsCode=="naver"){
			 $("input[name=naverLink]").prop("checked",true);
		 }
			
		 //사용자 SMS 마케팅 동의
 		 $("input[name=userMarketingSmsOk]").change(function(){
			 var status="";
			 var inputElement = $(this);
			 if($(this).is(":checked")) {
		     	status= "Y";
			 } else {
			 	status = "N";
			 }
			 
			 $.ajax({
					url:"<c:url value='/guest/agreementSms'/>",
					type:'get',
					data:{
						userMarketingSmsOk : status
					},
					success:function(res){
						
						if(res=='Y'){
							inputElement.prev().text("동의").css("color","gray");
						}else if(res=='N'){
							inputElement.prev().text("비동의").css("color","#ea5454");
						}else{
							inputElement.prev().text("변경실패").css("color","#ea5454");
						}
						
					},
					error:function(xhr, status, error){
						alert(status+" : " + error);
					}
				}); 
		 });
 		 
		 
 		 //사용자 Email 마케팅 동의
 		 $("input[name=userMarketingEmailOk]").change(function(){
			 var status="";
			 var inputElement = $(this);
			 if($(this).is(":checked")) {
		     	status= "Y";
			 } else {
			 	status = "N";
			 }
			 
			 $.ajax({
					url:"<c:url value='/guest/agreementEmail'/>",
					type:'get',
					data:{
						userMarketingEmailOk : status
					},
					success:function(res){
						
						if(res=='Y'){
							inputElement.prev().text("동의").css("color","gray");
						}else if(res=='N'){
							inputElement.prev().text("비동의").css("color","#ea5454");
						}else{
							inputElement.prev().text("변경실패").css("color","#ea5454");
						}
						
					},
					error:function(xhr, status, error){
						alert(status+" : " + error);
					}
				}); 
		 });
		 
         $(".editInfo").click(function() {
        	 
        	 if($(this).text()==="변경하기"){
	             $(this).parent().find("p").hide();
	             $(this).parent().find(".hiddenText").show();
	             $(this).text("취소");
	             return false;
        	 }
        	 
        	 if($(this).text()==="취소"){
        		 $(this).parent().find("p").show();
        		 $(this).parent().find(".hiddenText").hide();
        		 $(this).parent().find(".hiddenText").find("input[type=text]").val("");
        		 $(this).text("변경하기");
        		 return false;
        	 }
         });
		 
		 $("#edit-name").click(function(){
			 var newName=$("#edit-name").prev().val();
			 if(newName.length>2){
				 $.ajax({ 
					 url:"<c:url value='/guest/editName'/>",
					 type:'post',
					 data:{
						userName : $("input[name=userName]").val(),
					 },
					 success:function(res){
						 
					 	alert("정보수정이 완료되었습니다.");
					 	$("#dbUserName").html(newName);
					 	$(".userName").find("p").html(newName);
						$(".userName").find("p").show();
			        	$(".userName").find(".hiddenText").hide();
			        	$(".userName").find(".editInfo").text("변경하기"); 
					 },
					 error:function(xhr,status,error){
						 alert(error+"정보 수정의 실패했습니다.");
					 }
				 });//ajax
			 }else{
				 
			 }
			 
		 });
		 
		 $("#edit-hp").click(function(){
			 var newHp = $("#edit-hp").prev().val();
			 
			 if(validate_hp(newHp) && newHp.length>10){
				 $.ajax({ 
					 url:"<c:url value='/guest/editHp'/>",
					 type:'post',
					 data:{
						userHp : $("input[name=userHp]").val(),
					 },
					 success:function(res){
						 if(res){
							 alert("정보수정이 완료되었습니다.");
							 $("#dbUserHp").html(newHp);
			        		 $("#dbUserHp").next().hide();
							 $("#dbUserHp").show();
			        		 $("#dbUserHp").next().next().text("변경하기");
						 }
						 
					 },
					 error:function(xhr,status,error){
						 alert(error+"정보 수정의 실패했습니다.");
					 }
				 });//ajax
			 }else{
				 $('.error').text('\n전화번호 규칙에 맞지 않습니다.').css("color","#ea5454");
			 }
			 
		 });
		 //등록하기
		 $("#edit-hp").click(function(){
			 var newHp = $("#edit-hp").prev().val();
			 
			 if(validate_hp(newHp) && newHp.length>10){
				 $.ajax({ 
					 url:"<c:url value='/guest/insertHp'/>",
					 type:'post',
					 data:{
						userHp : $("input[name=userHp]").val(),
					 },
					 success:function(res){
						 if(res){
							 alert("정보수정이 완료되었습니다.");
							 $("#dbUserHp").html(newHp);
			        		 $("#dbUserHp").next().hide();
							 $("#dbUserHp").show();
			        		 $("#dbUserHp").next().next().text("변경하기");
						 }
						 
					 },
					 error:function(xhr,status,error){
					 }
				 });//ajax
			 }else{
				 $('.error').text('\n전화번호 규칙에 맞지 않습니다.').css("color","#ea5454");
			 }
			 
		 });
		 
		 $("#edit-pwd").click(function(){
			 var newPwd = $("#userPwd").val();
			 
			 if(validate_userPwd(newPwd) && newPwd.length>8){
				 $.ajax({ 
					 url:"<c:url value='/guest/editPwd'/>",
					 type:'post',
					 data:{
					 	userPwd : $("input[name=userPwd]").val(),
					 },
					 success:function(res){
						 if(res){
							 alert("정보수정이 완료되었습니다.");
						 }else{
							 alert("정보수정에 실패하였습니다.");
						 }
			        		 $(".userPwd").find('.hiddenText').hide();
			        		 $('.userPwd').find('.editInfo').text("변경하기");
						 
					 },
					 error:function(xhr,status,error){
						 alert(error+"정보 수정의 실패했습니다.");
					 }
				 });//ajax
			 }else{
				 $(".userPwd").find(".error").text('\n비밀번호 규칙에 맞지 않습니다.').css("color","#ea5454");
			 }
			 
		 });
		 
		 $("#deleteGuest").click(function(){
			 if(confirm("탈퇴 삭제하시겠습니까?")){
				 if(confirm("확인 시 즉시 회원탈퇴가 진행됩니다.")){
					 location.href="<c:url value='/guest/deleteGuest'/>";
				 }
			 }
		 });
		 
	});
	
	function qnaList(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
</script>
<style type="text/css">
	.wrapProfile{
	  min-height: 130vh;
	  background: -webkit-gradient(linear, left bottom, right top, from(#F6F6F6), to(#F6F6F6));
      background: -webkit-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: -moz-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: -o-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: linear-gradient(to top right, #F6F6F6 0%, #F6F6F6 100%);
      padding-top:150px;
      width:100%;
	}
	
	.myProfile{
		width: 250px;
	    height: 300px;
	    background: white;
	    float: left;
	    margin-left: 120px;
	    border: 0.5px solid #193d76;
	    box-shadow: 5px 5px 5px gray;
	    margin-top: 3%;
	}
	
	.align_center{
		width: 1500px;
		margin: 0 auto;
	}
	
	#userImage{
		width: 150px;
		height: 150px;
		border-radius: 70%;
		border: 0.5px solid gray;
		margin: 30px 0px -19px 50px;
	}
	
	h1{
		padding:50px;
		text-align: center;
	}
	
	.profileInfo{
		width: 584px;
	    height: 500px;
	    float: left;
	    margin-left: 6%;
	    box-shadow: 5px 5px 5px gray;
	    display: inline-block;
	    margin-top: 3%;
	}
	
	.tbProfile{
		background: white;
		width: 584px;
		border: 0.5px solid	#193d76;
		border-bottom: none;
		border-radius: 20px 20px 0 0;
		padding-top: 30px;
	}
	
	.tbProfile tr:first-child{
		background: #193d76;
		color: #d1d8e4;
		padding: 17px;
		font-weight: bold;
	}
	
	.tbProfile th{
		color: #656565;
		width: 150px;
		padding-left: 17px;
		padding-top: 5px;
		
	}
	
	.tbProfile td{
		color: black;
		font-size: 15px;
		padding-top: 5px;
		
	}
	
	.tbProfile th,
	.tbProfile td {
	  padding: 8px;
	  text-align: left;
	}
	
	
	
	.SNSLogo{
		width: 20px;
		height: 20px;
	}
	
	#flexSwitchCheckChecked{
		float: right;
		margin-right: 20px;
	}
	
	.editInfo{
		margin-top: 0px;
		margin-bottom: 5px;
		color: gray;
	}
	
	.footProfile{
		padding: 20px;
		background: white;
		border: 0.5px solid #193d76;
    	border-top: none;
    	box-shadow: 5px 5px 5px gray;
	}
	
	.edit-textbox{
		display: inline-block;	
		width: 250px;
		height: 35px;
		border: 1px solid gray;
		margin-right: -5px;
		font-size: 12px;
		font-weight: bold;
	}
	
	.edit-button{
		display: inline-block;
		border: 1px solid #5a6ff2;
		background: #6e81e5;
		color: white;
		font-size: 12px;
		padding: 9px 13px 7px 13px;
	}
	
	.userInfo{
		margin-bottom: 0px;
	}
	.error{
		font-size: 11px;
	}
	
	sub{
		margin-left: 160px;
	}
	
	.todaySpaceImg{
		width: 200px;
		height: 180px;
		border-radius: 1rem 1rem 0 0;
	}
	
	#recentSpaceList{
		width: 200px;
	    float: left;
	    display: inline-block;
	    margin-left: 9%;
	}
	
	.recentSpace{
		height: 240px;
		border-radius: 1rem;
		background: #d9dbe400;
		font-family: "Work Sans", sans-serif;
		font-weight:bold;
    	color: #00204a;
    	box-shadow: 5px 5px 5px gray;
    	border: 1px solid #a3b1c8;
	}
	
	.recentSpace a{
		margin: 0px 2px 0px 2px;
	}
	
	hr[name=boundary]{
		height: 3px;
	    background: #ffd014;
	    margin: 4px 4px 4px 4px;
	}
	
	.divPage {
		text-align:center;
		font-size:0;
		display: inline-block;
	}
	.divPage {
		padding-top: 3px;
	}
	.divPage .none {
		display:none;
	}
	.divPage a {
		display:block;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:12px;
		color:#999999;
		text-decoration:none;
		display: inline-block;
	}
	.divPage .arrow {
		border:1px solid #193d76;
	}
	.divPage .prev {
		background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
	}
	.divPage .next {
		background:#f8f8f8 url('img/page_next.png') no-repeat center center;
	}
	.divPage .active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	
	h5{
		text-align: center;
		display: inline-block;
		font-weight: bold;
		font-size: 24px;
		padding-top: 5px;
		margin: 0 5px 0 5px;
	}
	
	.flex{
		display: flex;
		justify-content: center;
	}
	
	
</style>

<div class="wrapProfile">
<form name="frmPage" method="get" action="<c:url value='/guest/myPage/myProfile'/>">
	<input type="hidden" name="currentPage">
</form>
	<form name="editProfile" method="post" enctype="multipart/form-data" 
	action="<c:url value='/guest/myPage/editProfile'/>">
		<input type="hidden" name="userProfileImage" value="${guestVo.userProfileImage }">
		<input type="hidden" name="userSnsCode" value="${guestVo.userSnsCode }">
		<input type="hidden" name="userNum" value="${guestVo.userNum }">
		<div class="align_center">
			<h1>프로필 관리</h1>
			<div class="myProfile">
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
				" id="userImage" alt="사용자 이미지"><br><br><br>
				<strong style="color: black; margin: 0px;">
					<c:if test="${!empty guestVo.userName }">
						<div style="text-align: center;" id="dbUserName">
						${guestVo.userName }
						</div>
					</c:if>
				</strong><br>
				<c:if test="${empty sessionScope.code}">
					<label for="file-input">
			        	<img alt="프로필 사진 변경.png" src="<c:url value='/images/editProfileImg.png'/>" style="width: 104.48px; height: 30.48px; margin-left: 72.76px;">
				    </label>
				    <input type="file" id="file-input" name="userProfileImage" value="1" style="display: none; margin-bottom: 50px;"
				    	accept="image/gif,image.jpeg,image/png"/>
				</c:if>
			</div>
			<div class="profileInfo">
			<c:set var="emailOk" value="${guestVo.userMarketingEmailOk }"/>
			<c:set var="smsOk" value="${guestVo.userMarketingSmsOk }"/>
				<table class="tbProfile">
					<tr>
						<th colspan="2" style="color: white;">내 프로필</th>
					</tr>
					<tr>
						<th>
							<label>이름</label>
						</th>
						<td>
						<c:if test="${empty sessionScope.code }">
							<div class="userName">
								<p id="dbUserName" class="userInfo">${guestVo.userName }</p>
								<div class="hiddenText" >
									<input type="text" class="edit-textbox" name="userName">
									<button type="button" class="edit-button" id="edit-name">확인</button>
								</div>
								<a href="#" class="editInfo">변경하기</a>
							</div>
						</c:if>
						<c:if test="${!empty sessionScope.code }">
							${guestVo.userName }<br>
						</c:if>
						</td>
					</tr>
					<tr>
						<th>
							<label>이메일</label>
						</th>
						<td>
						<c:if test="${!empty guestVo.userEmail }">
							${guestVo.userEmail }
						</c:if>
						</td>
					</tr>
					<tr>
						<th>
							<label>연락처</label>
						</th>
						<td>
						<c:if test="${!empty guestVo.userHp }">
							<div class="userHp">
						 		<p class="userInfo" id="dbUserHp">${guestVo.userHp }</p>
								<div class="hiddenText">
									<input type="text" class="edit-textbox" name="userHp" placeholder=" -를 제외한 번호">
									<button type="button" class="edit-button" id="edit-hp">확인</button>
									<br><span class="error"></span>
								</div>
								<a href="#" class="editInfo">변경하기</a>
							</div>
						</c:if>
						<c:if test="${empty guestVo.userHp }">
							<div class="userHp">
								<div class="hiddenText">
										<input type="text" class="edit-textbox" name="userHp" placeholder=" -를 제외한 번호">
										<button type="button" class="edit-button" id="edit-hp">확인</button>
										<br><span class="error"></span>
								</div>
								<a href="#" class="editInfo" id="insertHp">등록하기</a>
							</div>
						</c:if>
						</td>
					</tr>
					<c:if test="${!empty guestVo.address }">
						<tr>
							<th>
								<label>주소</label>
							</th>
							<td>
								<div class="userAddress">
									<p class="userInfo" id="dbUserAddress">${guestVo.address } 
										<c:if test="${!empty guestVo.addressDetail }">
											${guestVo.addressDetail }
										</c:if>
									</p>
								</div>
							</td>
						</tr>
					</c:if>
					<tr>
						<th>
							<label>SNS연동</label>
						</th>
						<td>
							<div class="form-check form-switch" style="margin-left: -36px;">
								<img alt="네이버로고.png" src="<c:url value='/images/naverLogo.png'/>" class="SNSLogo">
								<label class="form-check-label">네이버 계정</label>
								<input class="form-check-input" type="checkbox" name="naverLink" role="switch" id="flexSwitchCheckChecked" onclick="return false">
							</div>
						</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>
							<div class="form-check form-switch" style="margin-left: -36px;">
								<img alt="카카오로고.png" src="<c:url value='/images/kakaoLogo.jpg'/>" class="SNSLogo">
								<label class="form-check-label">카카오 계정</label>
								<input class="form-check-input" type="checkbox" name="kakaoLink" role="switch" id="flexSwitchCheckChecked" onclick="return false">
							</div>
							<a style="color: gray; font-size: 7px">소셜계정만 연동이 가능하며, 연동된 소셜계정은 해제가 불가합니다.</a>
						</td>
					</tr>
					<tr>
					<c:if test="${empty sessionScope.code }">
						<th><label>비밀번호</label></th>
						<td>
							<div class="userPwd">
								<div class="hiddenText">
									<input type="password" class="edit-textbox" name="userPwd" id="userPwd" placeholder="-문자/숫자/특수문자 3가지 조합 (8~30자)">
									<button type="button" class="edit-button" id="edit-pwd">확인</button>
									<br><span class="error"></span>
								</div>
								<a href="#" class="editInfo">변경하기</a>
							</div>
						</td>
					</c:if>
					<c:if test="${!empty sessionScope.code }">
						<th><label>비밀번호</label></th>
						<td>
							<span class="editInfo">SNS계정은 변경이 불가능합니다.</span>
						</td>
					</c:if>
					</tr>
					<tr>
						<th><label>마케팅 수신 동의</label></th>
						<td>
							<div class="form-check form-switch" style="margin-left: -38px;">
								<label class="form-check-label" for="flexSwitchCheckChecked">이메일</label>
								<span class="msg"></span>
								<input class="form-check-input" type="checkbox" name="userMarketingEmailOk" role="switch"
								 id="flexSwitchCheckChecked" value="${guestVo.userMarketingEmailOk}" checked>
							</div>
						</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td>
							<div class="form-check form-switch" style="margin-left: -36px;">
								<label class="form-check-label" for="flexSwitchCheckChecked">SMS</label>
								<span class="msg"></span>
								<input class="form-check-input" type="checkbox" name="userMarketingSmsOk" role="switch"
								 id="flexSwitchCheckChecked" value="${guestVo.userMarketingSmsOk}" checked>
							</div>
						</td>
					</tr>
				</table>
				<div class="footProfile">
					<hr>
					<a href="#" class="editInfo" style="margin-left: 210px;" id="deleteGuest"
						>서비스 탈퇴하기</a>
					<c:if test="${!empty sessionScope.code }">
						<br><sub>SNS계정인 경우 해당 SNS를 이용해주세요.</sub>
					</c:if>
				</div>
			</div>
			<c:if test="${!empty todaySdList }">
				<div id="recentSpaceList">
				<div class="flex">
					<div class="divPage">
						<c:if test="${pageVo.firstPage>1 }">
							<a href="#" onclick="qnaList(${pageVo.firstPage-1})" class="arrow prev">			
						    <img src='<c:url value="/images/page_prev.png" />'  border="0">	</a>
						</c:if>
					</div>
						<h5>최근 본 공간</h5>
					<div class="divPage">
						<c:if test="${pageVo.lastPage<pageVo.totalPage }">
							<a href="#" onclick="qnaList(${pageVo.lastPage+1})" class="arrow next">			
								<img src="<c:url value="/images/page_next.png" />" border="0" >
							</a>
						</c:if>
				 	</div>
				</div>
					<c:set var="num" value="${pageVo.num }"/>
					<c:set var="curPos" value="${pageVo.curPos }"/>
					<c:forEach var="i" begin="1" end="${pageVo.pageSize }">
						<c:if test="${num>=1 }">
							<c:set var="map" value="${todaySdList[curPos] }"/>
							<c:set var="curPos" value="${curPos+1 }"/>
							<c:set var="num" value="${num-1 }"/>
						<div class="recentSpace">
							<img src="<c:url value='/space_images/${map["IMG_TEMP_NAME"] }'/>"  alt="${map['SPACE_NAME'] } 이미지" class="todaySpaceImg"><br>
							<hr name="boundary">
							<a href="<c:url value='/detail?spaceNum=${map["SPACE_NUM"] }'/>">${map['SPACE_NAME'] }</a>
						</div>
						</c:if>
						<br>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</form>
	
</div>
<%@include file="../../form/userBottom.jsp" %>
