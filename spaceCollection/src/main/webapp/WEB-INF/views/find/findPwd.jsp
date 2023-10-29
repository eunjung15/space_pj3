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
<script type="text/javascript">
		$(function () {
			/* alert("gd");
			// 팝업 사이즈 재조정
			if (window.innerWidth < 600) {
				window.resizeTo(630, 701);
			}
			$("html").css("overflow", "hidden");
			$("[finda2sopt]").click(function (event) {
				MemberA2S.Click("MEMBERS_FIND_PW", $(this).attr("finda2sopt"));
			}); */
			
			$("#ucInputLoginID_btnNext").click(function(){
			
				if($('#userId').val().length<1){
					alert("아이디를 입력해주세요.");
					return false;
				}
				
				$("form[name=frmFindPwd]").submit();
			});
			
		});
		
</script>
</head>
<body>
<div class="popupFind2">
	<ul class="find2Tab">
		<li class="id"><a href="<c:url value='/guest/findId'/>" finda2sopt="FindId">스페이스 컬렉션ID찾기</a></li>	<!-- A094 -->
		<li class="password"><a class="on">비밀번호찾기</a></li>
	</ul>
<form action="<c:url value='/guest/findPwd'/>" name="frmFindPwd" method="post">
	<h2 class="hiddenTit">비밀번호찾기</h2>
	<div class="contents">
		<p class="stit">비밀번호 찾기를 위한 스페이스 컬렉션ID를 입력해주세요.</p>
		<div class="findPwSec">
			<dl class="findPwInput">
				<dt>아이디</dt>
				<dd>
					<div class="inputCnts">
						<div id="inputWrap" class="inputWrap "> <!-- error color <div class="inputWrap errorInput"> --> <!-- success color <div class="inputWrap successInput"> -->
							<p class="inputTxtSec"><input name="userId" type="text" id="userId" class="inputTxt2 errorInput" placeholder="스페이스 컬렉션ID를 입력해주세요." /></p>
							<div class="inputAlertSec">
								<p class="delBt" style="display:none;"><button type="button"><span class="hidden">입력삭제</span></button></p>
							</div>
						</div>
						<p id="errorMsg" class="errorMsg"></p>
					</div>
				</dd>
				<dt></dt>
				
			</dl>
			<div class="btSec">
				<a id="ucInputLoginID_btnNext" class="bt3" finda2sopt="Cfm" href="javascript:__doPostBack(&#39;ucInputLoginID$btnNext&#39;,&#39;&#39;)">다음</a>		<!-- A021 -->
			</div>
		</div>
	</div>
</form>
	<div class="noticeSec">
		<ul>
            <li>외부계정(<a target="_blank" href="https://www.facebook.com/" class="link3" findA2sOpt="GoFacebook">페이스북</a>, <a target="_blank" href="https://www.google.com/" class="link3" findA2sOpt="GoGoogle">구글</a>, <a target="_blank" href="https://www.naver.com/" class="link3" findA2sOpt="GoNaver">네이버</a>, <a target="_blank" href="https://www.apple.com/" class="link3" findA2sOpt="GoApple">애플</a> 등)을 통해 스페이스 컬렉션에 로그인하시는 고객님은 해당 서비스에서 비밀번호 찾기를<br />이용해주세요.</li>	<!-- A482, A483 -->
		</ul>
	</div>	
</div>

	<script type="text/javascript" src="https://ssl.nexon.com/s1/global/ngb_bodyend.js" charset="euc-kr"></script>
</body>
</html>