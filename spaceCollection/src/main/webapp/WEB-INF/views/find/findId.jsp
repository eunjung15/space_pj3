<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스페이스 컬렉션ID찾기 &lt; 스페이스컬렉션</title>
	<link rel="stylesheet" type="text/css" href="https://ssl.nexon.com/s3/membership/global.css" />
	<link rel="stylesheet" type="text/css" href="https://ssl.nexon.com/s3/membership/find2.css" />

<script type="text/javascript">
	try {
    (function (w, d, s, l, i) { w[l] = w[l] || []; w[l].push({ 'gtm.start': new Date().getTime(), event: 'gtm.js' }); var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f); })(window, document, 'script', 'dataLayer', 'GTM-PSZ9ZLQ');
  }
  catch (ex) { }
</script>

	<script type="text/javascript" src="https://ssl.nexon.com/s1/jquery/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="https://ssl.nexon.com/s1/global/ngb_head.js" charset="euc-kr"></script>
	<script type="text/javascript" src="../js/MemberUtil.js?v=638278049305424567"></script>
	<script type="text/javascript" src="../js/jquery.alphanumeric.js"></script>
	<script type="text/javascript" src="../js/jquery.center.js"></script>
	<script type="text/javascript" src="../js/jquery.popupWindow.js"></script>
	<script type="text/javascript" src="../js/jquery.autotab.js"></script>	
</head>
<body>
	<script type="text/javascript" src="https://ssl.nexon.com/s1/global/ngb_bodystart.js" charset="euc-kr"></script>
<script type="text/javascript">
	$(function(){
		$("#ucSelectAuthMethod_btnConfirmOwnEmail").click(function(){
			window.open("${pageContext.request.contextPath}/email/emailCheck?type=findId"
					,"이메일 인증 팝업","width=768,height=434,scrollbars=no, resizable=no");
		});
	});
</script>
<div class="popupFind2">
	<ul class="find2Tab">
		<li class="id"><a class="on">스페이스 컬렉션ID찾기</a></li>
		<li class="password"><a href="<c:url value='/guest/findPwd'/>" finda2sopt="FindPwd">비밀번호찾기</a></li>		<!-- A090 -->
	</ul>
    <h2 class="hiddenTit">아이디 찾기</h2>
	<div class="contents">
		<p class="stit">스페이스 컬렉션ID 찾기를 위한 본인확인 방법을 선택해주세요.</p>
		<ul class="authNType">
			<li><a href="#" id="ucSelectAuthMethod_btnConfirmOwnEmail" name="ucSelectAuthMethod$btnConfirmOwnEmail" memberbutton="true" class="auth4" finda2sopt="UEmail">
					<span class="txt1">이메일 인증</span>
					<span class="txt2">등록된 이메일로 인증</span>
					<span class="txt3">인증하기</span>
				</a></li>
            <li><a href="#" id="ucSelectAuthMethod_btnConfirmMobilePhone" name="ucSelectAuthMethod$btnConfirmMobilePhone" memberbutton="true" class="auth1" title="휴대폰 인증" finda2sopt="Phone"><span class="txt1">휴대폰 인증</span><span class="txt2">고객님 명의의 휴대폰으로 인증</span><span class="txt3">인증하기</span></a></li>       <!-- A002 -->
            <li><a href="#" id="ucSelectAuthMethod_btnConfirmCard" name="ucSelectAuthMethod$btnConfirmCard" memberbutton="true" class="auth7" title="신용/체크카드 인증" finda2sopt="Card"><span class="txt1">신용/체크카드 인증</span><span class="txt2">고객님 명의의 신용카드 또는 체크카드로 인증</span><span class="txt3">인증하기</span></a></li>		<!-- A506 -->
		</ul>
	</div>
    <div class="noticeSec">
		<ul>
			<li>본인확인된 계정만 스페이스 컬렉션ID찾기가 가능합니다.</li>
		</ul>
	</div>
</div>

<input type="hidden" id="Certification_hResponse" name="Certification_hResponse" value="" />
<input type="hidden" id="Certification_hResponse_data" name="Certification_hResponse_data" value="" />

<script type="text/javascript" src="https://ssl.nexon.com/s1/global/ngb_bodyend.js" charset="euc-kr"></script>
</body>
</html>