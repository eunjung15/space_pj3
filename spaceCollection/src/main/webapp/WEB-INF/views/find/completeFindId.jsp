<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">

	.userInfo{
		border-top: 1px solid #c1c1c1; 
		border-bottom: 1px solid #c1c1c1;
	}
	th{
		color: black;
		font-weight: bold;
		font-size: 15px;
		padding: 10px 15px 10px 15px;
		background: #fafafb;
	}
	
	td{
		text-align: center;
		padding: 5px 7px 5px 7px;
		font-size: 14px;
		
	}
	
	#login{
		border: 1px solid #5a6ff2;
		background: #6e81e5;
		color: white;
		font-size: 17px;
		padding: 15px 35px 15px 35px;
		margin: 30px 0 0 170px;
	}
</style>
<body>
<script type="text/javascript" src="https://ssl.nexon.com/s1/global/ngb_bodystart.js" charset="euc-kr"></script>
<script type="text/javascript">
	$(function(){
		
		$("#ucSelectAuthMethod_btnConfirmOwnEmail").click(function(){
			window.open("<c:url value='/email/emailCheck' />"
					,"이메일 인증 팝업","width=768,height=434,scrollbars=no, resizable=no");
		});
		
		$("#login").click(function(){
			location.href="<c:url value='/login/login' />";
		});
		
		
	});
//<![CDATA[
var theForm = document.forms['m_form'];
if (!theForm) {
    theForm = document.m_form;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
	
</script>
<div class="aspNetHidden">

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="5006EFBC" />
</div>
<div class="popupFind2">
	<ul class="find2Tab">
		<li class="id"><a class="on">스페이스 컬렉션ID찾기</a></li>
		<li class="password"><a href="<c:url value='/guest/findPwd'/>" finda2sopt="FindPwd">비밀번호찾기</a></li>		<!-- A090 -->
	</ul>
    <h2 class="hiddenTit">아이디 찾기</h2>
	<div class="contents">
		<p class="stit">고객님의 정보와 일치하는 스페이스컬렉션ID 입니다.</p>
		<table class="userInfo">
			<tr>
				<th style="width: 150px;">스페이스컬렉션ID</th>
				<th style="width: 60px;">가입일</th>
				<th style="width: 70px;">회원상태</th>
				<th style="width: 80px;">탈퇴일</th>
			</tr>
			<c:forEach var="guestVo" items="${guestVo }">
				<tr>
					<td>${guestVo.userId }</td>
					<td>
						<fmt:formatDate value="${guestVo.userRegDate }" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<c:if test="${empty guestVo.userOutType }">
							<div style="color: green;">정상</div>
						</c:if>
						<c:if test="${!empty guestVo.userOutType }">
							<div style="color: #e4271a;">탈퇴</div>
						</c:if>
					</td>
					<td>
						<c:if test="${!empty guestVo.userOutDate }">
							<fmt:formatDate value="${guestVo.userOutDate }" pattern="yyyy-MM-dd"/>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<button type="button" id="login">로그인</button>
	</div>
    <div class="noticeSec">
		<ul>
			<li>본인확인된 계정만 스페이스 컬렉션ID찾기가 가능합니다.</li>
		</ul>
	</div>
</div>

<input type="hidden" id="Certification_hResponse" name="Certification_hResponse" value="" />
<input type="hidden" id="Certification_hResponse_data" name="Certification_hResponse_data" value="" />

<script type="text/javascript">MemberA2S.Contents("MEMBERS_FIND_ID", "TryFindId");	//A001 </script>
				<script type='text/javascript'>
					$('[memberbutton=true]').click(
						function(event)
						{
							if( $(this).data('validatorCol') != null )
							{
								for( var i = 0; i < $(this).data('validatorCol').length; i++ )
								{
									var retMsg = $(this).data('validatorCol')[ i ].validator();
									if( retMsg != null )
									{
										alert( retMsg );
										if( $(this).data('validatorCol')[ i ].id != null )
											$('#' + $(this).data('validatorCol')[ i ].id).focus();
										return false;
									}
								}
							}
							
							if( $(this).data('postbackHandler') != null )
								$(this).data('postbackHandler').handler();
							else
							{
								if( $(this).attr('iscrosspostback') == 'true' )
									location.href = $('#' + $(this).attr('id') + '_crosspostback').attr('href');
								else
									__doPostBack( $(this).attr('name'), '' );
							}
						
							return false;
						}
					);
				</script>
			</form>
	<script type="text/javascript" src="https://ssl.nexon.com/s1/global/ngb_bodyend.js" charset="euc-kr"></script>
</body>
</html>