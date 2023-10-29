<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기 &lt; 스페이스 컬렉션</title>
	<link rel="stylesheet" type="text/css" href="https://ssl.nexon.com/s3/membership/global.css" />
	<link rel="stylesheet" type="text/css" href="https://ssl.nexon.com/s3/membership/find2.css" />

	<script type="text/javascript">
	<!--
        document.domain = 'nexon.com';
	//-->
	</script>

    

<script type="text/javascript">
	try {
    (function (w, d, s, l, i) { w[l] = w[l] || []; w[l].push({ 'gtm.start': new Date().getTime(), event: 'gtm.js' }); var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f); })(window, document, 'script', 'dataLayer', 'GTM-PSZ9ZLQ');
  }
  catch (ex) { }
</script>

	<script type="text/javascript" src="https://ssl.nexon.com/s1/jquery/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="https://ssl.nexon.com/s1/global/ngb_head.js" charset="euc-kr"></script>
	<script type="text/javascript" src="../js/MemberUtil.js?v=638278009366933247"></script>
	<script type="text/javascript" src="../js/jquery.alphanumeric.js"></script>
	<script type="text/javascript" src="../js/jquery.center.js"></script>
	<script type="text/javascript" src="../js/jquery.popupWindow.js"></script>
	<script type="text/javascript" src="../js/jquery.autotab.js"></script>	
<script type="text/javascript" src="https://ssl.nexon.com/s1/global/ngb_bodystart.js" charset="euc-kr"></script>
<script type="text/javascript" src="<c:url value='/js/guest.js'/>"></script>
<script type="text/javascript">
		$(function () {
			if('${param.complete}' === 'true'){
				close.self();
			}
			
			$('#chkPwd,#userPwd').keyup(function(){
				if($('#chkPwd').val()!=$('#userPwd').val()){
					$('.errorPwd').text('비밀번호가 일치하지 않습니다.').css("color","#ea5454");	
				}else{
					$('.errorPwd').text('비밀번호가 일치합니다.').css("color","gray");
				}
			});
			
			
			$("#ucInputLoginID_btnNext").click(function(){
				if($('#userPwd').val().length<1){
					alert("재설정하실 비밀번호를 입력해주세요.");
					return false;
				}
				
				if (!validate_userPwd($('#userPwd').val())){
		    		alert("비밀번호 양식이 맞지 않습니다.");
		    		return false;
		    	}
				
				if ($('#userPwd').val() != $('#chkPwd').val()) {
					alert("비밀번호가 일치하지 않습니다.확인하세요");
					$("#userPwd").focus();
					return false;
				}
				
				$.ajax({ 
					 url:"<c:url value='/guest/resetPwd'/>",
					 type:'post',
					 data:{
						userId : $('input[name=userId]').val(),
						userPwd: $("#userPwd").val(),
					 },
					 success:function(res){
						 if(res){
							 alert("정보수정이 완료되었습니다.");
						 }else{
							 alert("정보수정에 실패하였습니다.");
						 }
						 self.close();
					 },
					 error:function(xhr,status,error){
						 alert(error+"정보 수정의 실패했습니다.");
						 self.close();
					 }
				 });//ajax
				
			});
		});
		
		
</script>
<style type="text/css">
	.popupFind2 .contents .findPwInput {
	    overflow: hidden;
	    width: 579px;
	    margin-bottom: 30px;
	    padding: 40px 0 40px 39px;
	    background-color: #f6f6f7;
	}
</style>
</head>
<body>
<div class="popupFind2">
	<ul class="find2Tab">
		<li><a class="on">비밀번호 재설정</a></li>
	</ul>
	<h2 class="hiddenTit">비밀번호 재설정</h2>
	<form name="frmResetPwd" class="validation-form" method="post" action="<c:url value='/guest/resetPwd'/>" novalidate>
        <input type="hidden" name="userId" value="${userId }">
	<div class="contents">
		<p class="stit">비밀번호 재설정을 위한 스페이스 컬렉션 비밀번호를 입력해주세요.</p>
		<div class="findPwSec">
			<dl class="findPwInput">
				<dt>비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</dt>
				<dd>
					<div class="inputCnts">
						<div id="inputWrap" class="inputWrap ">
							<p class="inputTxtSec"><input name="userPwd" type="password" id="userPwd" class="inputTxt2 errorInput" placeholder="재설정하실 비밀번호를 입력해주세요." /></p>
							<div class="inputAlertSec">
								<p class="delBt" style="display:none;"><button type="button"><span class="hidden">입력삭제</span></button></p>
							</div>	
						</div>
						<p id="errorMsg" class="errorMsg"></p>
					</div>
				</dd>
				<dt></dt>
				<dt>비밀번호 확인</dt>
				<dd>
					<div class="inputCnts">
						<div id="inputWrap" class="inputWrap "> <!-- error color <div class="inputWrap errorInput"> --> <!-- success color <div class="inputWrap successInput"> -->
							<p class="inputTxtSec"><input name="chkPwd" type="password" id="chkPwd" class="inputTxt2 errorInput" placeholder="-문자/숫자/특수문자 3가지 조합 (8~30자)" /></p>
						</div>
							<span class="errorPwd"></span>
						<p id="errorMsg" class="errorMsg"></p>
					</div>
				</dd>
			</dl>
			<div class="btSec">
				<a id="ucInputLoginID_btnNext" class="bt3" finda2sopt="Cfm" href="javascript:__doPostBack(&#39;ucInputLoginID$btnNext&#39;,&#39;&#39;)">다음</a>		<!-- A021 -->
			</div>
		</div>
	</div>
	</form>
	<div class="noticeSec">
		<ul>
            <li>외부계정(<a target="_blank" href="https://www.kakaocorp.com/page/" class="link3" findA2sOpt="GoFacebook">카카오</a>, <a target="_blank" href="https://www.google.com/" class="link3" findA2sOpt="GoGoogle">구글</a>, <a target="_blank" href="https://www.naver.com/" class="link3" findA2sOpt="GoNaver">네이버</a>, <a target="_blank" href="https://www.apple.com/" class="link3" findA2sOpt="GoApple">애플</a> 등)을 통해 스페이스 컬렉션에 로그인하시는 고객님은 해당 서비스에서 비밀번호 찾기를<br />이용해주세요.</li>	<!-- A482, A483 -->
		</ul>
	</div>	
</div>

	<script type="text/javascript" src="https://ssl.nexon.com/s1/global/ngb_bodyend.js" charset="euc-kr"></script>
</body>
</html>