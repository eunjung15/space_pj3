<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>SpaceCollection - 공간에 사람을 더하다.</title>
<style type="text/css">
	i.bi.bi-exclamation-circle {
 		color: #ffd600;
   		font-size: 40px;
   		display: block;
   		margin-block: -13px;
	}
	
	#button{
		width: 250px;
		margin-top: -1px;
	}
	
	#kakaoImg{
		width: 225px;
	}
	
	#kakaoLogin{
		border: none;
		background-color: white;
	}
</style>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
		$(function() {
			$('#logoutBtn').click(function() {
				location.href="<c:url value='/admin/adminLogout'/>";
			});
			
			$('#button').click(function() {
				if($('#userId').val().trim().length<1){
					$('.modal-body').html('아이디를 입력하세요.');
					$('#confirm1').modal('show');
					return false;
				}
				
				if($('#pwd').val().trim().length<1){
					$('.modal-body').html('비밀번호를 입력하세요.');
					$('#confirm1').modal('show');
					return false;
				}
			});
			
			$('#kakaoLogin').click(function() {
				location.href = 'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=15dc3b6f1122f8cd6e57caf12231842b&redirect_uri=http://59.6.102.18:9091/spaceCollection/admin/adminKakaoLogin';
			});
		});
	</script>
<meta content="" name="description">
<meta content="" name="keywords">

<link href="<c:url value='/css/adminLogin.css'/>" rel="stylesheet">

<!-- Favicons -->
<link href="<c:url value='/NiceAdmin-pro/assets/img/favicon.png'/>"
	rel="icon">
<link
	href="<c:url value='/NiceAdmin-pro/assets/img/apple-touch-icon.png'/>"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/bootstrap-icons/bootstrap-icons.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/boxicons/css/boxicons.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/quill/quill.snow.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/quill/quill.bubble.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/remixicon/remixicon.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/NiceAdmin-pro/assets/vendor/simple-datatables/style.css'/>"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="<c:url value='/NiceAdmin-pro/assets/css/style.css'/>"
	rel="stylesheet">
<link href="<c:url value='/css/adminLogin.css'/>" rel="stylesheet"/>
</head>
<body>
	<section class="section" style="text-align: center;">
		<div class="mb-3">
			<form name="frm" action="<c:url value='/admin/adminLogin'/>" method="post">
				<h4>Space Collection(관리자용)</h4>
  				<div class="mb-3" id="center">
    				<label for="exampleInputEmail1" class="form-label">아이디</label>
    				<input type="text" class="form-control" id="userId" name="adminId" value="${cookie.ck_adminId.value }">
  				</div>
  				<div class="mb-3" id="center">
    				<label for="exampleInputPassword1" class="form-label">비밀번호</label>
    				<input type="password" class="form-control" id="pwd" name="adminPwd">
  				</div>
  				<div class="mb-3 form-check" id="chk">
					<input type="checkbox" class="form-check-input" id="exampleCheck1" name="chkSave" 
					<c:if test="${!empty cookie.ck_adminId }">
						checked
					</c:if>>
					
					<label class="form-check-label" for="exampleCheck1">아이디 저장</label>
  				</div>
  				<button type="submit" id="button" class="btn btn-primary">로그인</button>
  				<button type="button" id="kakaoLogin">
  					<img alt="카카오 로그인" src="<c:url value = '/img/icons/kakaoLogin.png'/>" id="kakaoImg"> 
  				</button>
			</form>
		</div>
	</section>
	<!-- Modal1 -->
	<div class="modal fade" id="confirm1" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"><i class="bi bi-exclamation-circle"></i></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="confirm">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal1 -->

	<!-- Vendor JS Files -->
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/apexcharts/apexcharts.min.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/chart.js/chart.umd.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/echarts/echarts.min.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/quill/quill.min.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/simple-datatables/simple-datatables.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/tinymce/tinymce.min.js'/>"></script>
	<script
		src="<c:url value='/NiceAdmin-pro/assets/vendor/php-email-form/validate.js'/>"></script>

	<!-- Template Main JS File -->
	<script src="<c:url value='/NiceAdmin-pro/assests/js/main.js'/>"></script>

</body>

</html>