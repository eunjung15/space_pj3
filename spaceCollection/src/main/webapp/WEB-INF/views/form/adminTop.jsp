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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#btLogout').click(function() {
			location.href = "<c:url value = '/admin/adminLogout'/>";
		});		
	});
</script>

<meta content="" name="description">
<meta content="" name="keywords">

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
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">


		<div class="d-flex align-items-center justify-content-between">
			<a href="<c:url value='/admin/adminMain'/>"
				class="logo d-flex align-items-center"> <img
				src="<c:url value='/img/icons/SpaceCollection.png'/>" alt="마크">
				<span class="d-none d-lg-block">SpaceCollection</span>
			</a> <i class="bi bi-list toggle-sidebar-btn" id="togglebtn"></i>
		</div>
		<!-- End Logo -->


		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">
				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"><span
						class="d-none d-md-block dropdown-toggle ps-2">관리자</span>
				</a> 
					<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li><a class="dropdown-item d-flex align-items-center"
							data-bs-toggle="modal" href="#basicModal"> <i
								class="bi bi-box-arrow-right"></i> <span>로그아웃</span>
						</a></li>
					</ul>
				</li>
			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->
	<!-- logoutModal -->
	<div class="modal fade" id="basicModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">로그아웃</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">로그아웃 하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="btLogout">로그아웃</button>
				</div>
			</div>
		</div>
	</div>


	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">
		<ul class="sidebar-nav" id="sidebar-nav">
			<li class="nav-item"><a class="nav-link collapsed"
				href="<c:url value='/admin/adminMain'/>"> <i class="bi bi-grid"></i>
					<span>메인보드</span>
			</a></li>
			<!-- 메인보드 끝 -->
			
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#board-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>게시판 관리</span><i
					class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="board-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
					<li>
						<a href="<c:url value='/admin/board/boardList'/>"> 
							<i class="bi bi-circle"></i>
							<span>게시물 관리</span>
						</a>
					</li>
					<li>
						<a href="<c:url value='/admin/board/boardTypeList'/>"> 
							<i class="bi bi-circle"></i>
							<span>게시판 생성/관리</span>
						</a>
					</li>
					
				</ul>
			</li>
			<!-- 게시판 관리 끝 -->
			
			

			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-person"></i>
					<span>회원 관리</span>
					<i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li>
						<a href="<c:url value = '/admin/member/memberList'/>"> <i class="bi bi-circle"></i>
							<span>회원 관리</span>
						</a>
					</li>
					<li>
						<a href="<c:url value = '/admin/member/withdrawalMemberList'/>"> <i class="bi bi-circle"></i>
							<span>탈퇴회원 관리</span>
						</a>
					</li>
				</ul>
			</li>

			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-layout-text-window-reverse"></i>
					<span>공간 관리</span>
					<i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="tables-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li>
						<a href="<c:url value='/admin/space/spaceTypeCategoryList'/>"> 
							<i class="bi bi-circle"></i>
							<span>공간 카테고리 관리</span>
						</a>
					</li>
					<li>
						<a href="<c:url value='/admin/space/spaceTypeList'/>">
							<i class="bi bi-circle"></i>
							<span>공간 타입 관리</span>
						</a>
					</li>
					<li>
						<a href="<c:url value='/admin/space/spaceConfirmList'/>">
							<i class="bi bi-circle"></i>
							<span>공간 승인 관리</span>
						</a>
					</li>
					<li>
						<a href="<c:url value='/admin/space/spaceList'/>">
							<i class="bi bi-circle"></i>
							<span>공간 관리</span>
						</a>
					</li>
					
				</ul>
			</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<c:url value='/admin/chatting'/>"> <i class="bi bi-question-circle"></i> 
				<span>실시간 채팅</span>
			</a></li>
		</ul>
	</aside>
