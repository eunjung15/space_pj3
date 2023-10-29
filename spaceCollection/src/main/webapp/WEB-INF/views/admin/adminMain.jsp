<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../form/adminTop.jsp"%>
<style type="text/css">
	.dropdown-item{
		cursor: pointer;
	}
	
	@keyframes fadeInDown {
        0% {
            opacity: 0;
            transform: translate3d(0, -5%, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    }
    
    #line0{
		animation: fadeInDown 0.1s
	}
	#line1{
		animation: fadeInDown 0.5s
	}
	#line2{
		animation: fadeInDown 0.9s
	}
	#line3{
		animation: fadeInDown 1.3s
	}
	#line4{
		animation: fadeInDown 1.7s
	}
	#line5{
		animation: fadeInDown 2.1s
	}
	#line6{
		animation: fadeInDown 2.5s
	}
	#line7{
		animation: fadeInDown 2.9s
	}
	#line8{
		animation: fadeInDown 3.3s
	}
	#line9{
		animation: fadeInDown 3.7s
	}
	
	#rline1{
		animation: fadeInDown 0.1s
	}
	#rline2{
		animation: fadeInDown 0.5s
	}
	#rline3{
		animation: fadeInDown 0.9s
	}
	#rline4{
		animation: fadeInDown 1.3s
	}
	#rline5{
		animation: fadeInDown 1.7s
	}
	#rline6{
		animation: fadeInDown 2.1s
	}
	#rline7{
		animation: fadeInDown 2.5s
	}
	#rline8{
		animation: fadeInDown 2.9s
	}
	#rline9{
		animation: fadeInDown 3.3s
	}
	#rline10{
		animation: fadeInDown 3.7s
	}
		
</style>
<script type="text/javascript">
	$(function() {
		$.loadReservationCnt();
		$.loadReservationTotalPrice();
		$.loadReservationType();
		$.loadReservationRank();
		$.loadRecentReservation();
		$.loadLineStatic();
		$.loadNaverNews();
		setInterval(function() {
			$.loadRecentReservation()	
		}, 8000);
		
		setInterval(function() {
			$.loadNaverNews()	
		}, 60000);
		
	})
	function rTotalCnt(val) {
		$('#intervalStandard').val(val);
		$.loadReservationCnt();
	}
	
	function rTotalPrice(val) {
		$('#intervalStandardPrice').val(val);
		$.loadReservationTotalPrice();
	}
	
	function rReserveType(val) {
		$('#intervalStandardType').val(val);
		$.loadReservationType();
	}
	
	function rRankInterval(val) {
		$('#intervalStandardRank').val(val);
		$.loadReservationRank();
	}
	
	function rRank(val) {
		$('#order').val(val);
		$.loadReservationRank();
	}
	
	$.loadReservationCnt = function() {
		$.ajax({
			url : "<c:url value = '/admin/adminMain/Ajax_getTotalReservation'/>",
			type : 'get',
			data : "intervalStandard=" + $('#intervalStandard').val(),
			dataType: 'json',
			success : function(res) {
				var str1 = "";
				var str2 = "";
				
				str1 += "| "+res.standard;
				
				str2 += "<h6>"+res.precentCnt+" 건</h6>";
				str2 += "<span class='text-muted small pt-2 ps-1'>("+res.str+"</span><span class='text-muted small pt-2 ps-1'>"+res.pastCnt+"건)</span>";
				str2 += "<br>";
				if(Number(res.percent)>0){
					str2 += "<span class='text-success small pt-1 fw-bold'>+"+res.percent+"% </span><span class='text-muted small pt-2 ps-1'>increase</span>";
				}else if(Number(res.percent)<0){
					str2 += "<span class='text-danger small pt-1 fw-bold'>"+res.percent+"% </span><span class='text-muted small pt-2 ps-1'>decrease</span>";
				}else{
					str2 += "<span class='small pt-1 fw-bold'>"+res.percent+"% </span><span class='text-muted small pt-2 ps-1'>-</span>";
				}
				
				$('#rStandard').html(str1);
				$('#totalReservationCnt').html(str2);
			},
			error : function(xhr, status, error) {
				alert(status + " : " + error);
				alert(str);
			}
		});
	}
	
	$.loadReservationTotalPrice = function() {
		$.ajax({
			url : "<c:url value = '/admin/adminMain/Ajax_getTotalReservationPrice'/>",
			type : 'get',
			data : "intervalStandard=" + $('#intervalStandardPrice').val(),
			dataType: 'json',
			success : function(res) {
				var str1 = "";
				var str2 = "";
				
				str1 += "| "+res.standard;
				
				str2 += "<h6>"+res.precentTotalPrice+"원</h6>";
				str2 += "<span class='text-muted small pt-2 ps-1'>("+res.str+"</span><span class='text-muted small pt-2 ps-1'>"+res.pastTotalPrice+"원)</span>";
				str2 += "<br>";
				if(Number(res.percent)>0){
					str2 += "<span class='text-success small pt-1 fw-bold'>"+res.percent+"% </span><span class='text-muted small pt-2 ps-1'>increase</span>";
				}else if(Number(res.percent)<0){
					str2 += "<span class='text-danger small pt-1 fw-bold'>"+res.percent+"% </span><span class='text-muted small pt-2 ps-1'>decrease</span>";
				}else{
					str2 += "<span class='small pt-1 fw-bold'>"+res.percent+"% </span><span class='text-muted small pt-2 ps-1'>-</span>";
				}
				
				
				$('#mStandard').html(str1);
				$('#totalReservationPrice').html(str2);
			},
			error : function(xhr, status, error) {
				alert(status + " : " + error);
				alert(str);
			}
		});
	}
	
	$.loadReservationType = function() {
		$.ajax({
			url : "<c:url value = '/admin/adminMain/Ajax_getReservationTypeByInterverStandard'/>",
			type : 'get',
			data : "intervalStandard=" + $('#intervalStandardType').val(),
			dataType: 'json',
			success : function(res) {
				
				var str1 = "";
				var str2 = "";
				
				var dataSet = [];
				$.each(res.list, function() {
					dataSet.push({
					    name: this.SPACE_TYPE_NAME,
					    value: this.RESERVATIONCNT
					  });
				}); 
					
				str2 += "| "+res.standard;
				$('#tStandard').html(str2);
				if(res.list.length>0){
					echarts.init(document.querySelector("#trafficChart")).setOption({
				           tooltip: {
				             trigger: 'item'
				           },
				           legend: {
				             top: '0%',
				             left: 'center'
				           },
				           series: [{
				             name: '',
				             type: 'pie',
				             radius: ['40%', '70%'],
				             avoidLabelOverlap: false,
				             label: {
				               show: false,
				               position: 'center'
				             },
				             emphasis: {
				               label: {
				                 show: true,
				                 fontSize: '18',
				                 fontWeight: 'bold'
				               }
				             },
				             labelLine: {
				               show: false
				             },
				             data: dataSet
				           }]
				         });
				}else{
					str1 += "진행된 예약이 없습니다.";
					$('#trafficChart').html(str1);
				}
				
			},
			error : function(xhr, status, error) {
				alert(status + " : " + error);
			}
		});
	}
	
	$.loadRecentReservation = function() {
		$.ajax({
			url : "<c:url value = '/admin/adminMain/Ajax_getRecentReservation'/>",
			type : 'get',
			data : "",
			dataType: 'json',
			success : function(res) {
				var str1 = "";
				var str2 = "";
				
				str1 += "| Today ( "+res.length+" 건 )";
				if(res.length > 0){
					var i=0;
					$.each(res, function() {
						str2 += "<tr id='line"+i+"'>";
						str2 += "<th scope='row'><a>"+this.RESERVATION_NUM+"</a></th>";
						str2 += "<th>"+this.USER_ID+"</th>";
						str2 += "<td><a class='text-primary'>"+this.SPACE_NAME+"-"+this.SD_TYPE+"</a></td>";
						str2 += "<td>"+this.RESERVE_PRICE+"원</td>";
						str2 += "<td><span>"+this.RESERVE_PEOPLE+"명</span></td>";
						str2 += "<td>";
						if(this.RESERVATION_DEL_FLAG === 'N'){
							str2 += "<span class='badge bg-success'>결재 완료</span>";		
						}else{
							str2 += "<span class='badge bg-danger'>환불 완료</span>";
						}
						str2 += "</td>";
						str2 += "</tr>";
						
						i++;
					});
				}else{
					str2 += "<tr>";
					str2 += "<td colspan='6'>예약된 공간이 없습니다.</td>";
					str2 += "<tr>";
				}
				$('#rrListCnt').html(str1);
				$('#recentReservation').html(str2);
			},
			error : function(xhr, status, error) {
				alert(status + " : " + error);
			}
		});
	}
	
	$.loadReservationRank = function() {
		$.ajax({
			url : "<c:url value = '/admin/adminMain/Ajax_getReservationRank'/>",
			type : 'get',
			data : "intervalStandard=" + $('#intervalStandardRank').val() +"&order=" + $('#order').val(),
			dataType: 'json',
			success : function(res) {
				var str1 = "";
				var str2 = "";
				str1 += "| "+res.standard;
				if(res.list.length > 0){
					var num = 1;
					$.each(res.list, function() {
						str2 += "<tr id='rline"+num+"'>";
						if(num == 1){
							str2 += "<th scope='row' style='text-align: center'><img src='<c:url value='/images/1st.png'/>' style='width: 25px'></a></th>";
						}else if(num == 2){
							str2 += "<th scope='row' style='text-align: center'><a><img src='<c:url value='/images/2nd.png'/>' style='width: 25px'></a></th>";
						}else if(num == 3){
							str2 += "<th scope='row' style='text-align: center'><a><img src='<c:url value='/images/3th.png'/>' style='width: 25px'></a></th>";
						}else{
							str2 += "<th scope='row' style='text-align: center'><a>"+num+"</a></th>";
						}
						str2 += "<td><a href='/spaceCollection/admin/space/spaceList/spaceDetail?spaceNum="+this.SPACE_NUM+"' class='text-primary fw-bold'>"+this.SPACE_NAME+"</a></td>";
						str2 += "<td>"+this.TOTALCNT+" 건</td>";
						str2 += "<td class='fw-bold'>"+this.TOTALPEOPLE+" 명</td>";
						str2 += "<td style='text-align: right;'>"+this.TOTALPRICE+" 원</td>";
						str2 += "</tr>";
						
						num++;
					});
				}else{
					str2 += "<tr>";
					str2 += "<td colspan='5'>예약 내역이 없어 순위를 표시할 수 없습니다.<td>";
					str2 += "<tr>"
				}
				$('#rrStandard').html(str1);
				$('#totalReservationRank').html(str2);
			},
			error : function(xhr, status, error) {
				alert(status + " : " + error);
			}
		});
	}
     
	
	 $.loadLineStatic = function() {
		 $.ajax({
				url : "<c:url value = '/admin/adminMain/Ajax_LineStatic'/>",
				type : 'get',
				data : "",
				dataType: 'json',
				success : function(res) {
					
					var regdateSet = [];
					var sCntSet = [];
					var uCntSet = [];
					var rCntSet = [];
					
					res.forEach(function(staticsVo) {
						
					    var day = staticsVo.day;
					    var scnt = staticsVo.scnt;
					    var ucnt = staticsVo.ucnt;
					    var rcnt = staticsVo.rcnt;

					    regdateSet.push(day);
					    sCntSet.push(scnt);
					    uCntSet.push(ucnt);
					    rCntSet.push(rcnt);
					});
						
					if(res.length>0){
						new ApexCharts(document.querySelector("#reportsChart"), {
	                        series: [{
	                          name: '공간예약건수',
	                          data: rCntSet
	                        }, {
	                          name: '공간등록건수',
	                          data: sCntSet
	                        }, {
	                          name: '회원가입자수',
	                          data: uCntSet
	                        }],
	                        chart: {
	                          height: 350,
	                          type: 'area',
	                          toolbar: {
	                            show: false,
	                            tools: {
	                            	download: false,
	                                selection: false,
	                                zoom: false,
	                                zoomin: false,
	                                zoomout: false,
	                                pan: false,
	                                reset: true | '<img src="/static/icons/reset.png" width="20">'
	                            }
	                          },
	                        },
	                        markers: {
	                          size: 4
	                        },
	                        colors: ['#4154f1', '#2eca6a', '#ff771d'],
	                        fill: {
	                          type: "gradient",
	                          gradient: {
	                            shadeIntensity: 1,
	                            opacityFrom: 0.3,
	                            opacityTo: 0.4,
	                            stops: [0, 90, 100]
	                          }
	                        },
	                        dataLabels: {
	                          enabled: true
	                        },
	                        stroke: {
	                          curve: 'smooth',
	                          width: 2
	                        },
	                        xaxis: {
	                          type: 'datetime',
	                          categories: regdateSet
	                        },
	                        tooltip: {
	                          x: {
	                            format: 'yyyy/MM/dd'
	                          },
	                        }
	                      }).render();
						
					}else{
						str1 += "진행된 예약이 없습니다.";
						$('#reportsChart').html(str1);
					}
					
				},
				error : function(xhr, status, error) {
					alert(status + " : " + error);
				}
			});
	}
	 
	 $.loadNaverNews = function() {
			$.ajax({
				url : "<c:url value = '/admin/ajax_news'/>",
				type : 'get',
				data : '',
				dataType : 'json',
				success:function(res){
					var str = "";

					$.each(res.items, function() {
						str += "<div>";
						str += "<p>";
						str += "<a href='"+this.originallink+"'>"+this.title+"</a>";
						str += "</p>";
						str += "<hr>";
						str += "</div>";
					});
					
					$("#ajaxNews").html(str);
				},
				error:function(xhr, status, error){
					alert(status + " : " + error);
				}
			});
		}
     
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>메인보드</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item active">메인보드</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section dashboard">
		<div class="row">

			<!-- Left side columns -->
			<div class="col-lg-8">
				<div class="row">

					<!-- 일일 예약건수 -->
					<div class="col-xxl-4 col-md-6">
						<div class="card info-card sales-card">
							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow" id="reservationCnt">
								 		<li><a class="dropdown-item" onclick="rTotalCnt('')">일</a></li>
								    	<li><a class="dropdown-item" onclick="rTotalCnt('month')">월</a></li>
								    	<li><a class="dropdown-item" onclick="rTotalCnt('year')">년</a></li>
									</ul>
							</div>
							<div class="card-body">
								<h5 class="card-title" style="font-weight: bold;">
									예약 건수 <span id="rStandard"><!-- ajax 출력 --></span>
								</h5>
								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-cart"></i>
									</div>
									<input type="hidden" name="intervalStandard"
										id="intervalStandard" value="">
									<div class="ps-3" id="totalReservationCnt">
										<!-- ajax 출력 -->
									</div>
		            
								</div>
							</div>

						</div>
					</div>
					
					<!-- 일일 예약건수 -->

					<!-- 일일 예약금액 -->
					<div class="col-xxl-4 col-md-6">
						<div class="card info-card revenue-card">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
								 		<li><a class="dropdown-item" onclick="rTotalPrice('')">일</a></li>
								    	<li><a class="dropdown-item" onclick="rTotalPrice('month')">월</a></li>
								    	<li><a class="dropdown-item" onclick="rTotalPrice('year')">년</a></li>
									</ul>
							</div>
							<div class="card-body">
								<h5 class="card-title" style="font-weight: bold;">
									예약 금액 <span id="mStandard"><!-- ajax 출력 --></span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-currency-dollar"></i>
									</div>
									<input type="hidden" name="intervalStandardPrice"
										id="intervalStandardPrice" value="">
									<div class="ps-3" id="totalReservationPrice">
										<!-- ajax 출력 -->
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- 일일 예약금액 -->

					<!-- 일일 방문자 수 -->
					<div class="col-xxl-4 col-xl-12">

						<div class="card info-card customers-card">
						

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
							</div>

							<div class="card-body">
								<h5 class="card-title" style="font-weight: bold;">
									방문자 수 <span>| Today</span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-people"></i>
									</div>
									<div class="ps-3">
										<h6>12 명</h6>
										<span class="text-danger small pt-1 fw-bold">12%</span> <span
											class="text-muted small pt-2 ps-1">decrease</span>
									</div>
								</div>

							</div>
						</div>

					</div>
					<!-- 일일 방문자 수 -->

					<!-- 종합 그래프 -->
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title" style="font-weight: bold;">
									종합 그래프 <span>/Today</span>
								</h5>

								<!-- Line Chart -->
								<div id="reportsChart"></div>

								<script>
                      
                  				</script>
								<!-- 종합 그래프 -->

							</div>

						</div>
					</div>
					<!-- End Reports -->

					<!-- 최근 예약 내역 시작 -->
					<div class="col-12">
						<div class="card recent-sales overflow-auto">

							<div class="card-body">
								<h5 class="card-title" style="font-weight: bold;">
									최근 예약 내역 <span id="rrListCnt"></span>
								</h5>

								<table class="table table-borderless">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">예약ID</th>
											<th scope="col">공간명</th>
											<th scope="col">결제액</th>
											<th scope="col">예약 인원</th>
											<th scope="col">예약 상태</th>
										</tr>
									</thead>
									<tbody id="recentReservation">
									
									</tbody>
								</table>

							</div>

						</div>
					</div>
					<!-- 최근 예약 내역 끝 -->

					<!-- 예약 순위 시작 -->
					<div class="col-12">
						<div class="card top-selling">
							<input type="hidden" name="intervalStandardRank" id="intervalStandardRank" value="">
							<input type="hidden" name="order" id="order" value="totalPrice">
							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li><a class="dropdown-item" onclick="rRankInterval('')">일</a></li>
									<li><a class="dropdown-item" onclick="rRankInterval('month')">월</a></li>
									<li><a class="dropdown-item" onclick="rRankInterval('year')">년</a></li>
								</ul>
							</div>

							<div class="card-body pb-0">
								<h5 class="card-title" style="font-weight:bold;">
									예약 TOP 10 <span id="rrStandard"></span>
								</h5>

								<table class="table table-borderless">
									<thead>
										<tr>
											<th scope="col">순위</th>
											<th scope="col">공간명</th>
											<th scope="col" style="cursor: pointer;" onclick="rRank('totalcnt')">예약건수</th>
											<th scope="col" style="cursor: pointer;" onclick="rRank('totalpeople')">이용 인원</th>
											<th scope="col" style="cursor: pointer;" onclick="rRank('totalprice')">예약 금액</th>
										</tr>
									</thead>
									<tbody id="totalReservationRank">
										
									</tbody>
								</table>

							</div>

						</div>
					</div>
					<!-- 예약 순위 끝 -->

				</div>
			</div>
			<!-- End Left side columns -->

			<!-- Right side columns -->
			<div class="col-lg-4">

				<!-- Recent Activity -->
				<div class="card">
					<div class="filter">
						<a class="icon" href="#" data-bs-toggle="dropdown"><i
							class="bi bi-three-dots"></i></a>
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
							<li class="dropdown-header text-start">
								<h6>Filter</h6>
							</li>

							<li><a class="dropdown-item" href="#">Today</a></li>
							<li><a class="dropdown-item" href="#">This Month</a></li>
							<li><a class="dropdown-item" href="#">This Year</a></li>
						</ul>
					</div>

					<div class="card-body">
						<h5 class="card-title">
							Recent Activity <span>| Today</span>
						</h5>

						<div class="activity">

							<div class="activity-item d-flex">
								<div class="activite-label">32 min</div>
								<i
									class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
								<div class="activity-content">
									Quia quae rerum <a href="#" class="fw-bold text-dark">explicabo
										officiis</a> beatae
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div class="activite-label">56 min</div>
								<i
									class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
								<div class="activity-content">Voluptatem blanditiis
									blanditiis eveniet</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div class="activite-label">2 hrs</div>
								<i
									class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
								<div class="activity-content">Voluptates corrupti
									molestias voluptatem</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div class="activite-label">1 day</div>
								<i
									class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
								<div class="activity-content">
									Tempore autem saepe <a href="#" class="fw-bold text-dark">occaecati
										voluptatem</a> tempore
								</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div class="activite-label">2 days</div>
								<i
									class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
								<div class="activity-content">Est sit eum reiciendis
									exercitationem</div>
							</div>
							<!-- End activity item-->

							<div class="activity-item d-flex">
								<div class="activite-label">4 weeks</div>
								<i
									class='bi bi-circle-fill activity-badge text-muted align-self-start'></i>
								<div class="activity-content">Dicta dolorem harum nulla
									eius. Ut quidem quidem sit quas</div>
							</div>
							<!-- End activity item-->

						</div>

					</div>
				</div>
				<!-- End Recent Activity -->

				<!-- 공간 타입별 예약 건수 시작 -->
				<div class="card">
					<div class="filter">
						<a class="icon" href="#" data-bs-toggle="dropdown"><i
							class="bi bi-three-dots"></i></a>
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
							<li><a class="dropdown-item" onclick="rReserveType('')">일</a></li>
							<li><a class="dropdown-item" onclick="rReserveType('month')">월</a></li>
							<li><a class="dropdown-item" onclick="rReserveType('year')">년</a></li>
						</ul>
					</div>

					<div class="card-body pb-0">
						<h5 class="card-title" style="font-weight: bold;">
							공간 타입별 예약 건수 <span id="tStandard"><!-- Ajax 출력 --></span>
						</h5>
						<input type="hidden" name="intervalStandard"
										id="intervalStandardType" value="">
						<div id="trafficChart" style="min-height: 400px;" class="echart text-center">
						</div>
						<script id="script">
						
						</script>

					</div>
				</div>
				<!-- 공간 타입별 예약 건수 끝 -->

				<!-- News & Updates Traffic -->
				<div class="card">
					<div class="card-body pb-0">
						<h5 class="card-title">
							News <span>|</span>
						</h5>

						<div id="ajaxNews">
							<!-- Ajax 출력 -->
						</div>
						<!-- End sidebar recent posts-->

					</div>
				</div>
				<!-- End News & Updates -->

			</div>
			<!-- End Right side columns -->

		</div>
	</section>

</main>
<!-- End #main -->
<%@ include file="../form/adminBottom.jsp"%>

