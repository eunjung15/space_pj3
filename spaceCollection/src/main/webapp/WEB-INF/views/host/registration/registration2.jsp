<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp"%>

<style type="text/css">
	body {background: #f6f6f6;}

	article {
		margin: 140px 0 150px 0; 
		font-size: 16px;
    	line-height: 20px;
		display: flex;
		justify-content: center;
	}

	.main {width: 1000px;}
	
	.heading {
		border-bottom: 4px solid #704de4;
		padding-bottom: 24px;
	}
	
	.hd1 {
		font-size: 26px;
		color: black;
	}
	
	.hd2 {
		float: right;
		color: red;
	}
	
	.boxForm {
		margin-top: 80px;
	}
	
	.boxTitle {
		font-size: 17px;
		font-weight: bold;
		color: black;
		margin-bottom: 15px;
	}
	
	.boxIcon {
		width: 20px;
		height: 20px;
		margin: 0 0 4px 15px;
	}
	
	.tooltip-text {
	    display: none;
	    position: absolute;
	    background-color: #7b7b7b;
	    color: white;
	    padding: 5px;
	    border-radius: 4px;
	    z-index: 999;
	    font-size: 13px;
	}
	
	.boxIcon:hover + .tooltip-text {
	    display: block;
	}
	
	.spText, .spBusiness, .spTel, .floor {
		width: 100%;
		height: 50px;
		border: 1px solid #b7b7b7;
		font-size: 15px;
		margin-top: 15px;
		padding: 8px 8px 8px 8px;
		resize: none;
	}
	
	.spText::placeholder, .address::placeholder, .addressDetail::placeholder {
		color: #b7b7b7;
		font-weight: bold;
	}
	
	.boxnoti {
		margin: 20px 0 0 0;
	}
	
	.boxnoti p {
		font-size: 14px;
		color: #7b7b7b;
	}
	
	.boxnoti img {
		width: 18px;
		height: 18px;
		float: left;
		margin-right: 5px;
	}
	
	.typeTip {margin-top: 15px;}
	
	.typeTip img {
		width: 15px;
		height: 15px;
		float: left;
		margin-top: 2px;
	}
	
	.typeTip p {
		margin: 0 0 0 25px;
		font-size: 14px;
		color: #7b7b7b;
	}
	
	.typeTitle {
		width: 100px;
		height: 40px;
		background: #656565;
		color: white;
		border-radius: 1rem;
		font-size: 12px;
		border: 0;
		margin: 10px 20px 10px 0;
	}
	
	.typeSub {
		width: 100px;
		height: 40px;
		border-radius: 1rem;
		font-size: 12px;
		border: 0;
		background: white;
		color: #656565;
		box-shadow: 2px 2px 8px;
		margin-left: 10px;
	}
	
	.typeSub.checked {
		background: #ffd014;
	}
	
	.typeTitle.checked {
		background: #704de4;
	}
	
	.subTitle {
		float: right;
		font-size: 14px;
		color: #767676;
	}
	
	.subTitleTag {
		float: right;
		font-size: 14px;
		color: #767676;
	}
	
	.btAdd {
		float: right;
		margin-top: 15px;
		width: 130px;
		height: 50px;
		background: #704de4 !important;
		color: white;
		border: 0;
		font-weight: bold;
		border-radius: 0;
	}
	
	.spTag {
		width: 100%;
		border: 1px solid #b7b7b7;
		font-size: 16px;
		margin-top: 15px;
		padding: 13px 8px 8px 8px;
		resize: none;
		background: white;
		color: black;
		font-weight: bold;
		display: inline-block;
		min-height: 50px;
	}
	
	.spaceImg, .BusinessLicense {
		display: flex;
	}
	
	.spImg {
		width: 850px;
		min-height: 50px;
		border: 1px solid #b7b7b7;
		font-size: 15px;
		margin-top: 15px;
		padding: 8px 8px 8px 8px;
		resize: none;
		display: inline-block;
		background: white;
	}
	
	.inner {
		color: #b7b7b7;
		font-weight: bold;
	}
	
	.address {
		width: 85%;
		border: 1px solid #b7b7b7;
		font-size: 15px;
		margin-top: 1px;
		padding: 12px 8px 8px 8px;
		resize: none;
		background: white;
		height: 50px;
	}
	
	.addressDetail {
		width: 100%;
		height: 50px;
		border: 1px solid #b7b7b7;
		font-size: 15px;
		margin-top: 15px;
		padding: 12px 8px 8px 8px;
		resize: none;
		background: white;
	}
	
	.btBar {
		display: flex;
		justify-content: center;
		margin: 100px 0 0 0;
	}
	
	.btBar button {
		border-radius: 0.5rem;
		width: 100%;
		height: 80px;
		margin: 0 10px 60px 10px;
		color: white;
		font-size: 20px;
		font-weight: bold;
	}
	
	.imgClose {
		width: 25px;
		height: 25px;
	}
	
	.tagRe {
		display: inline-block;
		margin-left: 8px;
	}
	
	.file {
		margin-left: 20px;
		text-align: center;
		padding-top: 16px;
	}
	
	.btBox {
		width: 130px;
		height: 50px;
	}
	
	.imgBox {
		width: 122px;
		height: 122px;
		margin-right: 8px;
	}
	
	.imgBox img {
		width: 122px;
		height: 122px;
	}
	
	.spRefund {
		display: flex;
    	align-items: center;
    	margin-bottom: 25px; 
	}
	
	.lbRefund {
		cursor: default;
		font-weight: 600;
		display: inline-block; 
		vertical-align: middle;
		font-size: 18px;
		width: 163px;
		padding-right: 16px; 
		color: rgb(17, 17, 17);
	}
	
	.opRefund {
		display: flex;
    	align-items: center;
		width: 50%;
		margin-left: 22px;
	}
	
	.opRefund span {
		font-size: 18px;
		color: #656565;
	}
	
	.form-select {
		font-size: 18px;
		width: 135px;
		margin: 0 10px 0 10px;
	}
	
	.form-check-input {
		padding-top: 20px;
	}
	
	.form-check-label {
		font-size: 18px;
		color: black;
	}
	
	.form-check.form-check-inline {
		margin: 0 10px 25px 0;
	}
	
</style>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=daa469d4ff476714bf26432374f5ebff&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="<c:url value='/js/space.js'/>"></script>
<script type="text/javascript">
	$(function() {
		
		// 가져온 값에 따라 체크박스 체크 여부 설정
        if ('${totalVo.facWifi}' == "Y") {
        	$('input[name="facWifi"]').prop('checked', true);
        }
        if ('${totalVo.facPrinter}' == "Y") {
        	$('input[name="facPrinter"]').prop('checked', true);
        }
        if ('${totalVo.facChairTable}' == "Y") {
        	$('input[name="facChairTable"]').prop('checked', true);
        }
        if ('${totalVo.facSmoke}' == "Y") {
          $('input[name="facSmoke"]').prop('checked', true);
        }
        if ('${totalVo.facRestRoom}' == "Y") {
          $('input[name="facRestRoom"]').prop('checked', true);
        }
        if ('${totalVo.facPC}' == "Y") {
          $('input[name="facPC"]').prop('checked', true);
        }
        if ('${totalVo.facTV}' == "Y") {
          $('input[name="facTV"]').prop('checked', true);
        }
        if ('${totalVo.facWhiteBoard}' == "Y") {
          $('input[name="facWhiteBoard"]').prop('checked', true);
        }
        if ('${totalVo.facElevator}' == "Y") {
          $('input[name="facElevator"]').prop('checked', true);
        }
        if ('${totalVo.facParking}' == "Y") {
          $('input[name="facParking"]').prop('checked', true);
        }
        if ('${totalVo.facFood}' == "Y") {
          $('input[name="facFood"]').prop('checked', true);
        }
        if ('${totalVo.facDrink}' == "Y") {
          $('input[name="facDrink"]').prop('checked', true);
        }
        if ('${totalVo.facCook}' == "Y") {
          $('input[name="facCook"]').prop('checked', true);
        }
        if ('${totalVo.facPet}' == "Y") {
          $('input[name="facPet"]').prop('checked', true);
        }
        if ('${totalVo.facAudio}' == "Y") {
          $('input[name="facAudio"]').prop('checked', true);
        }
        
     	// 해당 값을 가지는 옵션을 선택
     	if ('${refundVo.refund7Day}' !== '') {
     		$('.re7').val('${refundVo.refund7Day}').prop("selected",true);
            $('.re6').val("${refundVo.refund6Day}").prop("selected",true);
            $('.re5').val('${refundVo.refund5Day}').prop("selected",true);
            $('.re4').val('${refundVo.refund4Day}').prop("selected",true);
            $('.re3').val('${refundVo.refund3Day}').prop("selected",true);
            $('.re2').val('${refundVo.refund2Day}').prop("selected",true);
            $('.re1').val('${refundVo.refund1Day}').prop("selected",true);
            $('.re').val('${refundVo.refundDay}').prop("selected",true);
     	}
        
        
		//공간 이름 정규화
        $(".spText.name").on("input", function() {
            var isValid = validate_spaceName($(".spText.name").val());

            if (!isValid) {
                alert('사용 가능한 특수문자는 ( ), [ ], -, .(마침표), ,(쉼표) 입니다.');
            }
        });
		
      	//사업자 등록번호 정규화
        $(".spBusiness").on("input", function() {
            var isValid = validate_business($(".spBusiness").val());

            if (!isValid) {
                alert('숫자와 -만 입력 가능합니다.');
                $(this).val('');
            }
        });
      	
      	//대표 전화번호 정규화
        $(".spTel").on("input", function() {
            var isValid = validate_number($(this).val());

            if (!isValid) {
                alert('숫자만 입력 가능합니다.');
                $(this).val('');
            }
        });
		
		//사용자가 입력한 글자수 표시
		$('.spText').on('input', function() {
			var txtLen = $(this).val().length;
			var maxLen = parseInt($(this).attr('maxlength'));
			var subTxt = $(this).closest('.boxForm').find('.subTitle');
			
			subTxt.text(txtLen + '자/' + maxLen + '자');
		});
		
			
		/* //수정일때 컨트롤러에서 받은 값도 표시
		$('#${spaceTypeVo.spaceTypeName}').addClass('checked');
			
		//.typeSub에 해당하는 .typeTitle에도 checked 클래스 추가하기
		$('.typeSub.checked').prevAll('.typeTitle').first().addClass('checked');
			
		$('#spaceTypeName').val($('.typeSub.checked').val()); */

		
		//태그 확인 숨기기
		if ('${param.spaceTypeName}' != null) {
			$('.spTag').hide();
		}
		
		
		// 사용자가 입력한 값을 저장할 배열
        var tag = [];
		
        // 버튼을 클릭할 때 이벤트 핸들러를 등록합니다.
        $('.btAdd.tag').click(function() {
        	var inputValue = $(this).siblings('.spText').val();
		    var tagContainer = $(this).siblings('.spTag');
			
		    if (inputValue.length < 1) {
		    	alert('내용을 입력해주세요.');
		    } else {
		    	// 입력값이 비어 있지 않고, 최대 5개까지만 저장하도록 합니다.
	            if (inputValue && tag.length < 5) {
	                tagContainer.show();
	                
	                // 입력값을 배열에 저장
	                tag.push(inputValue);
	                
	             	// 화면에 입력값을 표시할 부분을 업데이트합니다.
	        	    tagContainer.append('<span class="tagRe"> # ' + inputValue + ' <span class="tagClose"> <img class="imgClose" src="<c:url value='/images/btClose.png' />"/></span></span>');
	             	
	        		// 입력값을 String으로 변환합니다.
	        	    var inputValueString = tag.join('/');

	        		// hidden input에 값을 설정합니다.
	        	    $('#spaceTag').val(inputValueString);

	        		// 입력 필드 초기화
	                $(this).siblings('.spText').val('');
	        		
	            } else {
	                alert('태그는 최대 5개까지 입력할 수 있습니다.');
	            }
		    }
        });
        
	    // 삭제 버튼(.tagClose)을 클릭할 때 해당 태그를 배열과 화면에서 삭제
	    $(document).on('click', '.tagClose', function() {
	        var removedValue = $(this).closest('.tagRe').text().trim().substring(2); // "# " 제거
	        var index = tag.indexOf(removedValue);
	        if (index !== -1) {
	        	tag.splice(index, 1); // 배열에서 제거
	        }
	        $(this).closest('.tagRe').remove(); // 화면에서 제거
	    	$('#spaceTag').val(tag.join('/')); // hidden input 업데이트
	    });
	     
		// 사용자가 입력한 값을 저장할 배열
        var facility = [];

        // 버튼을 클릭할 때 이벤트 핸들러를 등록합니다.
        $('.btAdd.fa').click(function() {
        	var inputValue = $(this).siblings('.spText').val();
		    var tagContainer = $(this).siblings('.spTag');
		    var count = tagContainer.find('.tagRe').length;
		    
		    if (inputValue.length < 1) {
		    	alert('내용을 입력해주세요.');
		    } else {
		    	// 입력값이 비어 있지 않고, 최대 10개까지만 저장하도록 합니다.
	            if (inputValue && facility.length < 10) {
	                tagContainer.show();
	                
	                // 입력값을 배열에 저장
	                facility.push(inputValue);
	                
	             	// 화면에 입력값을 표시할 부분을 업데이트합니다.
	        	    tagContainer.append('<span class="tagRe"><span class="num"> ' + ++count + '</span>. '  + inputValue 
	        	    		+ ' <span class="tagClose"> <img class="imgClose" src="<c:url value='/images/btClose.png' />"/></span></span><br>');
	             	
	        		// 입력값을 String으로 변환합니다.
	        	    var inputValueString = facility.join('||');

	        		// hidden input에 값을 설정합니다.
	        	    $('#spaceFacility').val(inputValueString);

	        		// 입력 필드 초기화
	                $(this).siblings('.spText').val('');
	        		
	             	// 태그 삭제 이벤트 핸들러 등록
	             	var tagReElements = tagContainer.find('.tagRe');
	                
	                tagReElements.find('.tagClose').click(function() {
	                    var tagRe = $(this).closest('.tagRe');
	                    var index = tagRe.index();
	                    facility.splice(index, 1); // 배열에서 제거
	                    tagRe.remove(); // 화면에서 제거
	                    
	                 	// 남은 태그의 숫자를 다시 설정
	                    tagContainer.find('.tagRe').each(function(i) {
	                        $(this).find('.num').text((i + 1));
	                    });

	                    // hidden input 업데이트
	                    $('#spaceFacility').val(facility.join('||'));
	                });
	                
	            } else {
	                alert('태그는 최대 10개까지 입력할 수 있습니다.');
	            }
			}
		    
        });
	     
		// 사용자가 입력한 값을 저장할 배열
        var warn = [];

        // 버튼을 클릭할 때 이벤트 핸들러를 등록합니다.
        $('.btAdd.pre').click(function() {
        	var inputValue = $(this).siblings('.spText').val();
		    var tagContainer = $(this).siblings('.spTag');
		    var count = tagContainer.find('.tagRe').length;

		    if (inputValue.length < 1) {
		    	alert('내용을 입력해주세요.');
		    } else {
		    	// 입력값이 비어 있지 않고, 최대 5개까지만 저장하도록 합니다.
	            if (inputValue && warn.length < 10) {
	                tagContainer.show();
	                
	                // 입력값을 배열에 저장
	                warn.push(inputValue);
	                
	             	// 화면에 입력값을 표시할 부분을 업데이트합니다.
	        	    tagContainer.append('<span class="tagRe"><span class="num"> ' + ++count + '</span>. ' + inputValue 
	        	    		+ ' <span class="tagClose"> <img class="imgClose" src="<c:url value='/images/btClose.png' />"/></span></span><br>');
	             	
	        		// 입력값을 String으로 변환합니다.
	        	    var inputValueString = warn.join('||');

	        		// hidden input에 값을 설정합니다.
	        	    $('#spaceWarn').val(inputValueString);

	        		// 입력 필드 초기화
	                $(this).siblings('.spText').val('');
	        		
	             	// 태그 삭제 이벤트 핸들러 등록
	                tagContainer.find('.tagClose').click(function() {
	                    var tagRe = $(this).closest('.tagRe');
	                    var index = tagRe.index();
	                    facility.splice(index, 1); // 배열에서 제거
	                    tagRe.remove(); // 화면에서 제거
	                    
	                 	// 남은 태그의 숫자를 다시 설정
	                    tagContainer.find('.tagRe').each(function(i) {
	                        $(this).find('.num').text((i + 1));
	                    });

	                    // hidden input 업데이트
	                    $('#spaceFacility').val(facility.join('||'));
	                });
	                
	            } else {
	                alert('태그는 최대 10개까지 입력할 수 있습니다.');
	            }
		    }
            
        });
		
		// 이미지를 누르면 해당 태그 제거
		$('.spTag').on('click', '.tagClose', function() {
			$(this).closest('.tagRe').remove();
		});
		
		//사업자 등록증 첨부
		$('.btAdd.file.license').click(function() {
			//기존에 이미지가 있으면
			if ($('#license').val().length > 1) {
			    //기존에 있던 이미지 지우기
			    $('.spImg.license').empty().append('<span class="inner">사업자 등록증을 추가해 주세요.</span>');
			    $('#license').val('');
			}
		});

		$('#license').change(function() {
		  	var file = this.files[0];
			if (file) {
		      	var reader = new FileReader();
		      	reader.onload = function(e) {
		        	$('.spImg.license').empty().append('<div class="imgBox"><img src="' + e.target.result + '"></div>');
		      	};
		      	reader.readAsDataURL(file);
		    } else {
		        // 파일 선택이 취소되거나 없을 경우 기본 이미지 또는 안내 메시지를 보여줄 수 있음
		        $('.spImg.license').empty().append('<span class="inner">사업자 등록증을 추가해 주세요.</span>');
		    }
		});
		
		//메인 이미지 첨부
		$('.btAdd.file.main').click(function() {
			//기존에 이미지가 있으면
			if ($('#mainImage').val().length > 1) {
			    //기존에 있던 이미지 지우기
			    $('.spImg.main').empty().append('<span class="inner">이미지 파일을 추가해 주세요.</span>');
			    $('#mainImage').val('');
			}
		});

		$('#mainImage').change(function() {
		  	var file = this.files[0];
			if (file) {
		      	var reader = new FileReader();
		      	reader.onload = function(e) {
		        	$('.spImg.main').empty().append('<div class="imgBox"><img src="' + e.target.result + '"></div>');
		      	};
		      	reader.readAsDataURL(file);
		    } else {
		        // 파일 선택이 취소되거나 없을 경우 기본 이미지 또는 안내 메시지를 보여줄 수 있음
		        $('.spImg.main').empty().append('<span class="inner">이미지 파일을 추가해 주세요.</span>');
		    }
		});
		
		//공간 이미지 첨부
		$('.btAdd.file.sub').click(function() {
			//기존에 이미지가 있으면
			if ($('#subImage').val().length > 1) {
			    //기존에 있던 이미지 지우기
			    $('.spImg.sub').empty().append('<span class="inner sub" style="color: #3c3c3c;"></span>');
			    $('#subImage').val('');
			}
		});
		
		$('#subImage').on('change', function() {
            var fileList = $(this)[0].files;
            var innerSub = $('.inner.sub');

            innerSub.empty(); // 기존 파일명 초기화

            if (fileList.length > 0) {
                for (var i = 0; i < fileList.length; i++) {
                    var fileName = fileList[i].name;
                    innerSub.append('<p>' + fileName + '</p>'); // 파일 이름 추가
                }
            }
        });
		
		
		//파일 사이즈 지정
		$('#fileInput').on('change', function() {
			var fileInput = this;
		    var maxSizeInBytes = 3 * 1024 * 1024; // 3MB

		    if (fileInput.files.length > 0) {
		    	var fileSize = fileInput.files[0].size; // 선택된 파일의 크기 (바이트 단위)

		        if (fileSize > maxSizeInBytes) {
		          alert('파일 크기가 너무 큽니다. 3MB 이하의 파일을 선택해주세요.');
		          $('#fileInput').val(''); // 파일 선택 취소
		        }
			}
		});
		
	    
	    //하단 버튼
		$('#back').click(function() {
			history.back();
		});
		
		$('#next').click(function() {
			//필수 입력
			//공간명
			if ($('.spaceName').find($('.spText')).val() < 1) {
				alert('공간명을 입력하세요.');
				$('.spaceName').find($('.spText')).focus();
				
				scrollMove('.spaceName');
				
				return false;
			}
			
			//공간 타입
            if ($('.typeSub.checked').length === 0) {
                alert("적어도 하나 이상의 유형을 선택해주세요.");
                
                scrollMove('.spaceType');
                
                return false;
            }
			
		  	//사업자 등록번호
    		if ($('.spBusiness').val().length < 1) {
    			alert('사업자 등록번호를 입력하세요.');
    			$('.spBusiness').focus();
    			
    			scrollMove($('.spBusiness'));
    			
    			return false;
    		}
		  	
    		//공간 대표번호
    		if ($('.spTel').val().length < 1) {
    			alert('대표전화를 입력하세요.');
    			$('.spTel').focus();
    			
    			scrollMove($('.spTel'));
    			
    			return false;
    		}
			
			//공간 한 줄 소개
			if ($('.spaceIntro').find($('.spText')).val() < 1) {
				alert('한 줄 소개를 입력하세요.');
				$('.spaceIntro').find($('.spText')).focus();
				
				scrollMove('.spaceIntro');
				
				return false;
			}
			
			//공간 소개
			if ($('.spaceInfo').find($('.spText')).val() < 1) {
				alert('공간 소개를 입력하세요.');
				$('.spaceInfo').find($('.spText')).focus();
				
				scrollMove('.spaceInfo');
				
				return false;
			}
			
			//공간 소개
			if ($('.spaceInfo').find($('.spText')).val().length > 1
					&& $('.spaceInfo').find($('.spText')).val().length < 21) {
				alert('공간 소개는 20자 이상 입력하셔야 합니다.');
				$('.spaceInfo').find($('.spText')).focus();
				
				scrollMove('.spaceInfo');
				
				return false;
			}

    		//공간 층수
    		if ($('.floor').val().toString().length < 1) {
    			alert('공간 층수를 입력하세요.');
    			$('.floor').focus();
    			
    			scrollMove($('.floor'));
    			
    			return false;
    		}

			//공간 태그
			if ($('.spaceTag.tag').find('.tagRe').length < 1) {
				alert('공간 태그를 하나라도 입력하세요.');
				$('.spaceTag.tag').find($('.spText')).focus();
				
				scrollMove('.spaceTag.tag');
				
				return false;
			}

			//시설 안내
			if ($('.spaceTag.fa').find($('.tagRe')).length < 1) {
				alert('시설 안내를 하나라도 입력하세요.');
				$('.spaceTag.fa').find($('.spText')).focus();
				
				scrollMove('.spaceTag.fa');
				
				return false;
			}
			
			// 편의시설 체크박스 중 하나라도 체크되었는지 확인
	        if ($('input[name^="fac"]:checked').length === 0) {
	            // 하나라도 체크되지 않았을 때
	            alert('하나 이상의 편의시설을 선택하세요.'); // 사용자에게 메시지 표시
	            
				scrollMove('.facility');
				
				return false;
	        }

			//예약 시 주의사항
			if ($('.spaceTag.pre').find($('.tagRe')).length < 1) {
				alert('예약 시 주의사항을 하나라도 입력하세요.');
				$('.spaceTag.pre').find($('.spText')).focus();
				
				scrollMove('.spaceTag.pre');
				
				return false;
			}
			
			//대표 이미지
			if ($('.spImg.main .imgBox').length === 0) {
		        alert('대표 이미지를 첨부해 주세요.');
		        
		        scrollMove('.spaceImg.main');
		        
		        return false;
		    }
			
			//주소
			if ($('.address').length === 0) {
		        alert('주소를 입력해 주세요.');
		        $('.address').focus();
		        
		        scrollMove('.address');
		        
		        return false;
		    }
			
			$('form[name=frmRegi2]').submit();
		});
		
$('.typeTitle').prop('disabled', true); // 공간타입 타이틀버튼 비활성화
		
		//버튼 누르면 색 변환
		$('.typeSub').click(function() {
			var spaceType = $(this).closest('.spaceType');

		    // 모든 버튼에서 클래스 제거
		    spaceType.find('.typeSub').removeClass('checked');

		    // 클릭한 버튼에 클래스 추가
		    $(this).addClass('checked');

		    // 모든 typeTitle 버튼을 초기화
		    spaceType.find('.typeTitle').removeClass('checked');
		    
		    // 클릭한 버튼의 상위에 있는 typeTitle의 배경색 변경
		    $(this).prevAll('.typeTitle').first().addClass('checked');
		});
		
		// 가져온 spaceTypeName 값을 가진 버튼에 checked 클래스를 추가합니다.
		if ('${param.spaceTypeName }' != null) {
			$('#${param.spaceTypeName}').addClass('checked');
			
			//.typeSub에 해당하는 .typeTitle에도 checked 클래스 추가하기
			$('.typeSub.checked').prevAll('.typeTitle').first().addClass('checked');
				
			$('#spaceTypeName').val($('.typeSub.checked').val());
		}
		
	});

	//스크롤이동
	function scrollMove(val) {
		var offset = $(val).offset(); //해당 위치 반환
		$("html, body").animate({
			scrollTop : offset.top - 150}, 200); //선택한 위치로 이동. 두번째 인자는 시간 0.2초
	}
	
	//공간 타입 val넣기
	function stNameHidden(spaceTypeName) {
		$('#spaceTypeName').val(spaceTypeName);
	}
	
	//태그 삭제
	function tagRe(tagContainer) {
		// 태그 삭제 이벤트 핸들러 등록
        tagContainer.find('.tagClose').click(function() {
            var tagRe = $(this).closest('.tagRe');
            var index = tagRe.index();
            facility.splice(index, 1); // 배열에서 제거
            tagRe.remove(); // 화면에서 제거
            
         	// 남은 태그의 숫자를 다시 설정
            tagContainer.find('.tagRe').each(function(i) {
                $(this).find('.num').text((i + 1));
            });

            // hidden input 업데이트
            $('#spaceFacility').val(facility.join('||'));
        });
	}
	
	var geocoder = new kakao.maps.services.Geocoder();

	//우편번호
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	console.log(data);
            	
            	var callback = function(data, status) {
            	    if (status === kakao.maps.services.Status.OK) {
            	        console.log(data);
            	        console.log(data[0].x);
            	        console.log(data[0].y);
            	        
            	        $('input[name="longitude"]').val(data[0].x);
            	        $('input[name="latitude"]').val(data[0].y);
            	    }
            	};
            	
            	geocoder.addressSearch(data.address, callback);
            	
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
				console.log('addr' + addr);
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addressDetail").focus();
            }
        }).open();
    }


</script>

<c:if test="${!empty param.spaceTypeName }" >
	<c:set var="next" value="등록" />
	<c:set var="url" value="/host/registration/registration2/write" />
	<c:set var="spaceNum" value="0" />
	<c:set var="spaceZipcode" value="0" />
	<c:set var="latitude" value="0" />
	<c:set var="longitude" value="0" />
	<c:set var="refundNum" value="0" />
</c:if>
<c:if test="${empty param.spaceTypeName }" >
	<c:set var="next" value="수정" />
	<c:set var="url" value="/host/registration/registration2/edit" />
	<c:set var="spaceNum" value="${param.spaceNum }" />
	<c:set var="spaceZipcode" value="${spaceVo.spaceZipcode }" />
	<c:set var="latitude" value="${spaceVo.latitude }" />
	<c:set var="longitude" value="${spaceVo.longitude }" />
	<c:set var="refundNum" value="${spaceVo.refundNum }" />
</c:if>


<article>
	<div class="main">
		<form name="frmRegi2" method="post" action="<c:url value='${url }' />"
			enctype="multipart/form-data">
			
			<input type="hidden" name="spaceNum" value="${spaceNum }">
			<input type="hidden" name="spaceZipcode" value="${spaceZipcode }">
			<input type="hidden" name="latitude" value="${latitude }">
			<input type="hidden" name="longitude" value="${longitude }">
			<input type="hidden" name="refundNum" value="${refundNum }">
			
			<div class="heading">
				<span class="hd1">공간 정보를 입력해주세요.</span>
				<span class="hd2">* 필수입력</span>
			</div>
			<!-- 공간명 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간명 <span style="color: red;">*</span></span>
					<span class="subTitle">0자/18자</span>
					<img class="boxIcon" src="https://partner.spacecloud.kr/static/media/info-circle-solid.d9a24d05.svg">
					<div class="tooltip-text">
						• 다른 공간과 구별될 수 있는 공간의 고유 업체명(브랜드명)을 입력해주세요! <br>
						※ 검수 반려 사유 : 업체명이 확인 되지 않는 공간명 <br><br>
						(예시) 인디워커스 하이브(o), 홍대 뷰가 예쁜 파티룸(x), 강남 회의실(x)
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceName">
						<input type="text" class="spText name" value="${spaceVo.spaceName}" name="spaceName"
							placeholder=" 고유 업체명을 입력해주세요. (예시) 인디워커스 하이브 회의실" maxlength="18">
					</div>
					<div class="boxnoti">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>사용 가능한 특수문자 : ( ), [ ], -, .(마침표), ,(쉼표)</p>
					</div>
				</div>
			</div>
			<!-- 공간 유형 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 유형 <span style="color: red;">*</span></span>
					<span class="subTitle" style="color: red;">필수선택</span>
					<img class="boxIcon" src="https://partner.spacecloud.kr/static/media/info-circle-solid.d9a24d05.svg">
					<div class="tooltip-text">
						• 모임/연습/촬영/행사/캠핑으로 구분된 용도 중 1개의 용도 안에서만 유형을 선택할 수 있어요! <br>
						• 1개의 용도 안에서 등록하는 공간에 적절한 유형을 모두 선택해주세요. <br>
						• 검수 신청 후, 유형변경은 고객센터를 통해서만 가능합니다. <br>
						※ 검수 반려 사유 : 공간 상세 소개/이미지에서 선택한 유형에 대한 사용성이 충분히 확인되지 않는 경우
					</div>
					<div class="typeTip">
						<img src="https://partner.spacecloud.kr/static/media/exclamation_mark-gray.7fb4cd60.svg">
						<div class="typeTip2">
							<p>빠른 검수 통과를 위해 반드시 공간에 적합한 유형을 선택해주세요!<br>
								부적합한 유형 선택시 검수 반려 사유가 됩니다.</p>
						</div>
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceType">
						<c:forEach var="allVo" items="${type }">
							<input type="button" class="typeTitle" value="${allVo.spaceCategoryVo.categoryName }">
							<c:forEach var="list" items="${allVo.spaceTypeList }" >
								<input type="button" id="${list.spaceTypeName}" class="typeSub" 
									onclick='stNameHidden("${list.spaceTypeName }")' value="${list.spaceTypeName }">
							</c:forEach><br>
						</c:forEach>
						<input type="hidden" name="spaceTypeName" id="spaceTypeName">
					</div>
				</div>
			</div>
			<!-- 사업자 등록번호 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>사업자 등록번호 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="spacepBusiness">
						<input type="text" class="spBusiness" name="spaceBusinessNum" 
						value="${spaceVo.spaceBusinessNum }" maxlength="12" required >
					</div>
					<div class="boxnoti">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>-를 포함해서 입력해주세요. ex) 111-11-11111</p>
					</div>
				</div>
			</div>
			<!-- 사업자 등록증 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>사업자 등록증 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="BusinessLicense">
						<div class="spImg license" style="min-height: 50px; padding-top: 15px;">
							<div class="inner license">사업자 등록증을 추가해 주세요.</div>
						</div>
						<div class="btBox">
							<label>
								<div class="btAdd file license" >파일첨부</div>
								<input type="file" id="license" name="license"
									accept="image/jpg, image/png, image/jpeg" style="display: none;" >
							</label>
						</div>
					</div>
				</div>
			</div>
			<!-- 공간 대표전화 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>대표전화 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="spacepTel">
						<input type="text" class="spTel" name="spacePhoneNum" value="${spaceVo.spacePhoneNum }" 
						maxlength="20" required >
					</div>
					<div class="boxnoti">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>숫자만 입력해주세요.</p>
					</div>
				</div>
			</div>
			<!-- 공간 한 줄 소개 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 한 줄 소개 <span style="color: red;">*</span></span>
					<span class="subTitle">0자/27자</span>
					<img class="boxIcon" src="https://partner.spacecloud.kr/static/media/info-circle-solid.d9a24d05.svg">
					<div class="tooltip-text">
						아래 항목중에 해당 사항이 있는 내용으로 한 줄 소개를 매력적으로 작성해보세요!<br>
						• 유니크한 인테리어 컨셉<br>• 이용가능한 특별 장비<br>• 합리적인 이용 단가 등<br><br>
						(예시)<br>층고 4.5m 살수차 진입 가능 대형 촬영스튜디오<br>
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceIntro">
						<input type="text" class="spText" value="${spaceVo.spaceIntro }" name="spaceIntro"
							placeholder=" 공간의 특장점을 한 문장으로 작성해주세요." maxlength="27">
					</div>
				</div>
			</div>
			<!-- 공간 소개 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 소개 <span style="color: red;">*</span></span>
					<span class="subTitle">0자/500자<span style="color: #704de4;">(최소 20자)</span></span>
					<img class="boxIcon" src="https://partner.spacecloud.kr/static/media/info-circle-solid.d9a24d05.svg">
					<div class="tooltip-text">
						온라인 예약을 선호하는 게스트들은 공간에 대한 정보와 이미지만으로 예약 여부를 결정합니다.<br>
						아래 항목을 참고해 게스트들에게 공간의 매력과 이용 방식을 자세히 소개해보세요!<br><br>
						• 공간에 대한 콘셉/브랜딩 스토리<br>• 공간 이용 정보<br>
						 - 공간 이용 가능 인원, 진행 가능한 행사 및 규모, 이용 가능한 시설 및 이용방식, 공간 이용 시간 등<br>
						• 장비나 시설 이용에 대한 추가 비용 정보<br> - 공간 세부 상품 옵션 설정에서 해당 금액을 청구할 수 있어요!<br>
						• 공간의 차별점 (해당 사항만)<br> - 지리적 장점, 이용 가능한 서비스, 특별한 콘텐츠 등<br>
						• 현재 진행중인 이벤트 내용 등<br><br>※ 검수 반려 사유<br>
						• 직거래 유도, 타 예약 서비스에 대한 안내, 개인 정보가 표기된 경우<br>
						• 공간 이용 외 다른 재화/서비스 필수 구매인 경우<br>
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceInfo">
						<textarea class="spText" name="spaceInfo"
							placeholder=" 게스트들에게 필요한 공간 정보를 상세하게 소개해주세요. 툴팁을 클릭해 작성 가이드를 확인할 수 있습니다." 
							maxlength="500" rows="6" >${spaceVo.spaceInfo }</textarea>
					</div>
				</div>
			</div>
			<!-- 공간 층수 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 층수 <span style="color: red;">*</span></span>
				</div>
				<div class="boxContents">
					<div class="spaceText">
						<input type="text" class="spText floor" value="${spaceVo.spaceLocation }" maxlength="20"
							name="spaceLocation" placeholder="층수 여부를 입력하세요. ex. 지상 1층, 지하 2층">
					</div>
				</div>
			</div>
			<!-- 공간 태그 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>공간 태그 <span style="color: red;">*</span></span>
					<span class="subTitleTag">최대 5개</span>
				</div>
				<div class="boxContents">
					<div class="spaceTag tag">
						<input type="text" class="spText" style="width: 850px;"
							placeholder=" 게스트들이 선호할만한 주요 특징들을 키워드로 입력해주세요. (최대 5개)" maxlength="27">
						<input type="button" class="btAdd tag" value="추가 ▽">
						<div class="spTag tag" id="tag">
							<c:if test="${spaceVo.spaceTag != null }">
								<c:set var="tagList" value="${fn:split(spaceVo.spaceTag, '/')}" />
								<c:forEach var="tag" items="${tagList}" varStatus="loopStatus">
									<span class="tagRe"># ${tag } 
			        	    			<span class="tagClose"> 
			        	    				<img class="imgClose" src="<c:url value='/images/btClose.png' />"/>
			        	    			</span>
			        	    		</span>
								</c:forEach>
							</c:if>
						</div>
						<input type="hidden" name="spaceTag" id="spaceTag">
					</div>
				</div>
			</div>
			<!-- 시설 안내 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>시설 안내 <span style="color: red;">*</span></span>
					<span class="subTitle">0자/100자</span>
				</div>
				<div class="boxContents">
					<div class="spaceTag fa">
						<input type="text" class="spText" style="width: 850px;"
							placeholder=" 이용 가능한 시설에 대해 최대한 상세하게 입력해주세요. (최대 10개)" maxlength="100">
						<input type="button" class="btAdd fa" value="추가 ▽">
						<div class="spTag fa">
							<c:if test="${spaceVo.spaceFacility != null }">
								<c:set var="faList" value="${fn:split(spaceVo.spaceFacility, '||')}" />
								<c:forEach var="fa" items="${faList}" varStatus="loopStatus">
									<span class="tagRe"><span class="num">${loopStatus.index + 1} </span>. ${fa } 
			        	    			<span class="tagClose">
			        	    				<img class="imgClose" src="<c:url value='/images/btClose.png' />"/>
			        	    			</span>
			        	    		</span><br>
								</c:forEach>
							</c:if>
						</div>
						<input type="hidden" name="spaceFacility" id="spaceFacility">
					</div>
				</div>
			</div>
			<!-- 편의시설 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>편의시설 <span style="color: red;">*</span></span>
					<br><hr>
				</div><br>
				<div class="boxContents">
					<div class="facility">
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facWifi" id="inlineCheckbox1" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox1">와이파이</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facPrinter" id="inlineCheckbox2" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox2">복사/인쇄기</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facChairTable" id="inlineCheckbox3" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox3">의자/테이블</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facSmoke" id="inlineCheckbox4" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox4">흡연가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facRestRoom" id="inlineCheckbox5" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox5">내부화장실</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facPC" id="inlineCheckbox6" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox6">PC/노트북</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facTV" id="inlineCheckbox7" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox7">TV/프로젝터</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facWhiteBoard" id="inlineCheckbox8" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox8">화이트보드</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facElevator" id="inlineCheckbox9" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox9">엘레베이터</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facParking" id="inlineCheckbox10" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox10">주차가능</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facFood" id="inlineCheckbox11" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox11">음식물섭취가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facDrink" id="inlineCheckbox12" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox12">주류반입가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facCook" id="inlineCheckbox13" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox13">취사가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facPet" id="inlineCheckbox14" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox14">애완동물동반가능여부</label>
						</div>
						<div class="form-check form-check-inline">
						  	<input class="form-check-input" type="checkbox" name="facAudio" id="inlineCheckbox15" value="Y">
						  	<label class="form-check-label" for="inlineCheckbox15">음향장비</label>
						</div>
					</div>
				</div>
			</div>
			<!-- 예약 시 주의사항 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>예약 시 주의사항 <span style="color: red;">*</span></span>
					<span class="subTitle">0자/100자</span>
				</div>
				<div class="boxContents">
					<div class="spaceTag pre">
						<input type="text" class="spText" style="width: 850px;"
							placeholder=" 게스트들이 예약 시 확인해야 하는 주의사항을 상세하게 입력해주세요. (최대 10개)" maxlength="100">
						<input type="button" class="btAdd pre" value="추가 ▽">
						<div class="spTag pre">
							<c:if test="${spaceVo.spaceWarn != null }">
								<c:set var="WaList" value="${fn:split(spaceVo.spaceWarn, '||')}" />
								<c:forEach var="Wa" items="${WaList}" varStatus="loopStatus">
									<span class="tagRe"><span class="num">${loopStatus.index + 1} </span>. ${Wa } 
			        	    			<span class="tagClose">
			        	    				<img class="imgClose" src="<c:url value='/images/btClose.png' />"/>
			        	    			</span>
			        	    		</span><br>
								</c:forEach>
							</c:if>
						</div>
						<input type="hidden" name="spaceWarn" id="spaceWarn">
					</div>
				</div>
			</div>
			<!-- 대표 이미지 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>대표 이미지 <span style="color: red;">*</span></span>
					<span class="subTitle">최대 3MB</span>
					<img class="boxIcon" src="https://partner.spacecloud.kr/static/media/info-circle-solid.d9a24d05.svg">
					<div class="tooltip-text">
						대표 이미지는 예약/이용이 가능한 공간의 전체 이미지가 잘 보이는 사진으로 등록해주세요!<br><br>
						※ 검수 반려 이미지<br>• 인물, 텍스트가 포함된 이미지<br>• 노출 등으로 제 3자에게 수치심을 주는 이미지<br>
						• 지도, 평면도, 약도 등의 이미지<br>• 홍보물/포스터, 이미지/도형 등이 합성된 편집 이미지<br>
						• 내용이 식별되지 않는 이미지<br>
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceImg main">
						<div class="spImg main" style="min-height: 150px;">
							<span class="inner">이미지 파일을 추가해 주세요.</span>
						</div>
						<div class="btBox">
							<label>
								<div class="btAdd file main" >파일첨부</div>
								<input type="file" id="mainImage" name="spaceMain" style="display: none;"
									accept="image/jpg, image/png, image/jpeg" >
							</label>
						</div>
					</div>
				</div>
			</div>
			<!-- 이미지 -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>이미지 <span style="color: red;">*</span></span>
					<span class="subTitle">한 장당 최대 3MB<span style="color: #704de4;">(최대 10장)</span></span>
					<div class="boxnoti">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>이미지는 한번에 업로드해야 합니다. 변경하고 싶으면 다시 첨부해야 합니다.</p>
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceImg sub">
						<div class="spImg sub" style="min-height: 50px; padding-top: 15px;">
							<div class="inner sub" style="color: #3c3c3c;" ></div>
						</div>
						<div class="btBox">
							<label>
								<div class="btAdd file sub" >파일첨부</div>
								<input type="file" id="subImage" accept="image/jpg, image/png, image/jpeg" 
									name="spaceSub" style="display: none;" multiple>
							</label>
						</div>
					</div>
				</div>
			</div>
			<!-- 주소(위치) -->
			<div class="boxForm">
				<div class="boxTitle">
					<span>주소(위치) <span style="color: red;">*</span></span>
					<div class="boxnoti">
						<img src="<c:url value='/images/pngwing.com.png' />" >
						<p>공간 주소는 최초 등록 이후 직접 변경할 수 없습니다. 고객센터를 통해 주소 변경을 요청해주세요.</p>
					</div>
				</div>
				<div class="boxContents">
					<div class="spaceZip">
						<input type="button" class="btAdd" value="주소등록" onclick="sample6_execDaumPostcode()"
							style="margin: 0 0 10px 20px;">
						<div class="spZip1">
							<input type="hidden" name="spaceZipcode" id="zipcode">
							<input type="text" class="address" name="spaceAddress" id="address"
								value="${spaceVo.spaceAddress }"
								placeholder="실제 서비스되는 공간의 주소를 입력해주세요." readonly="readonly">
						</div>
						<div class="spZip2">
							<input type="text" class="addressDetail" name="spaceAddressDetail" 
								value="${spaceVo.spaceAddressDetail }"
								id="addressDetail" placeholder="상세주소를 입력해주세요." >
							<a id="sample6_extraAddress" ></a>
							<input type="hidden" name="latitude">
							<input type="hidden" name="longitude">
						</div>
					</div>
				</div>
			</div>
			<div class="heading" style="margin-top: 120px;">
				<span class="hd1">환불 기준를 입력해주세요.</span>
			</div>
			<!-- 환불 기준 -->
			<div class="boxForm" style="margin-top: 60px;">
				<div class="boxContents">
					<div class="refund">
						<div class="spRefund">
							<label class="lbRefund">이용 7일전</label>
							<div class="opRefund">
								<span>총 금액의</span>
								<div>
									<select class="form-select re7" name="refund7Day"
										aria-label="Default select example">
										<option selected value="100%">100%</option>
									</select>
								</div>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 6일전</label>
							<div class="opRefund">
								<span>총 금액의</span>
								<select class="form-select re6" name="refund6Day"
									aria-label="Default select example">
									<option value="100%">100%</option>
									<option value="90%">90%</option>
									<option value="80%">80%</option>
									<option value="70%">70%</option>
									<option value="60%">60%</option>
									<option value="50%">50%</option>
									<option value="40%">40%</option>
									<option value="30%">30%</option>
									<option value="20%">20%</option>
									<option value="10%">10%</option>
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 5일전</label>
							<div class="opRefund">
								<span>총 금액의</span> 
								<select class="form-select re5" name="refund5Day"
									aria-label="Default select example">
									<option value="100%">100%</option>
									<option value="90%">90%</option>
									<option value="80%">80%</option>
									<option value="70%">70%</option>
									<option value="60%">60%</option>
									<option value="50%">50%</option>
									<option value="40%">40%</option>
									<option value="30%">30%</option>
									<option value="20%">20%</option>
									<option value="10%">10%</option>
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 4일전</label>
							<div class="opRefund">
								<span>총 금액의</span> 
								<select class="form-select re4" name="refund4Day"
									aria-label="Default select example">
									<option value="100%">100%</option>
									<option value="90%">90%</option>
									<option value="80%">80%</option>
									<option value="70%">70%</option>
									<option value="60%">60%</option>
									<option value="50%">50%</option>
									<option value="40%">40%</option>
									<option value="30%">30%</option>
									<option value="20%">20%</option>
									<option value="10%">10%</option>
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 3일전</label>
							<div class="opRefund">
								<span>총 금액의</span> 
								<select class="form-select re3" name="refund3Day"
									aria-label="Default select example">
									<option value="100%">100%</option>
									<option value="90%">90%</option>
									<option value="80%">80%</option>
									<option value="70%">70%</option>
									<option value="60%">60%</option>
									<option value="50%">50%</option>
									<option value="40%">40%</option>
									<option value="30%">30%</option>
									<option value="20%">20%</option>
									<option value="10%">10%</option>
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 2일전</label>
							<div class="opRefund">
								<span>총 금액의</span> 
								<select class="form-select re2" name="refund2Day"
									aria-label="Default select example">
									<option value="100%">100%</option>
									<option value="90%">90%</option>
									<option value="80%">80%</option>
									<option value="70%">70%</option>
									<option value="60%">60%</option>
									<option value="50%">50%</option>
									<option value="40%">40%</option>
									<option value="30%">30%</option>
									<option value="20%">20%</option>
									<option value="10%">10%</option>
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 전날</label>
							<div class="opRefund">
								<span>총 금액의</span> 
								<select class="form-select re1" name="refund1Day"
									aria-label="Default select example">
									<option value="100%">100%</option>
									<option value="90%">90%</option>
									<option value="80%">80%</option>
									<option value="70%">70%</option>
									<option value="60%">60%</option>
									<option value="50%">50%</option>
									<option value="40%">40%</option>
									<option value="30%">30%</option>
									<option value="20%">20%</option>
									<option value="10%">10%</option>
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
						<div class="spRefund">
							<label class="lbRefund">이용 당일</label>
							<div class="opRefund">
								<span>총 금액의</span> 
								<select class="form-select re" name="refundDay"
									aria-label="Default select example">
									<option selected value="0%">0%</option>
								</select>
								<span>환불</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="btBar">
				<button type="button" class="btn btn-secondary" id="back" >이전</button>
				<button type="button" class="btn btn-warning" id="next" >${next }</button>
			</div>
			
		</form>
	</div>
</article>

</body>
</html>