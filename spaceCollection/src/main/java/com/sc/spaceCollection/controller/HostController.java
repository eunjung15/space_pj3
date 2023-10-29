package com.sc.spaceCollection.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sc.spaceCollection.board.model.BoardService;
import com.sc.spaceCollection.board.model.BoardVO;
import com.sc.spaceCollection.calendar.model.CalendarService;
import com.sc.spaceCollection.calendar.model.CalendarVO;
import com.sc.spaceCollection.common.ConstUtil;
import com.sc.spaceCollection.common.FileUploadUtil;
import com.sc.spaceCollection.facility.model.FacilityVO;
import com.sc.spaceCollection.facility.model.SpaceToTalFacilityVO;
import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.host.model.HostService;
import com.sc.spaceCollection.host.model.SpaceCategoryAllVO;
import com.sc.spaceCollection.host.model.SpaceTypeVO;
import com.sc.spaceCollection.refund.model.RefundVO;
import com.sc.spaceCollection.reservation.model.ReservationService;
import com.sc.spaceCollection.space.model.SpaceVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;
import com.sc.spaceCollection.spaceFile.model.SpaceFileService;
import com.sc.spaceCollection.spaceFile.model.SpaceFileVO;
import com.sc.spaceCollection.userInfo.model.UserInfoVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/host")
public class HostController {
	private static final Logger logger = LoggerFactory.getLogger(HostController.class);
	private final GuestService guestService;
	private final HostService hostService;
	private final ReservationService reservationService;
	private final CalendarService calendarService;
	private final BoardService boardService;
	private final FileUploadUtil fileUploadUtil;
	private final SpaceFileService spaceFileservice;
	
	
	@RequestMapping("/index")
	public String hostMain(Model model) {
		logger.info("호스트 메인 보여주기");
		
		List<BoardVO> boardVo = hostService.selectNotice("b00012");
		logger.info("공지사항 조회, boardVo = {}", boardVo);
		
		model.addAttribute("boardVo", boardVo);
		
		return "host/index";
	}
	
	@RequestMapping("/registration/registration1")
	public String registration1(Model model) {
		//1
		logger.info("공간등록 페이지1 보여주기");
		
		//2
		List<SpaceCategoryAllVO> type = hostService.selectSpaceCategory();
		logger.info("type = {}", type);

		//3
		model.addAttribute("type", type);
		
		//4
		return "host/registration/registration1";
	}
	
	@GetMapping("/registration/registration2")
	public String registration2(@RequestParam(defaultValue = "0") int spaceNum, Model model) {
		//1
		logger.info("공간 입력 페이지 보여주기, spaceNum = {}", spaceNum);
		
		//2
		List<SpaceCategoryAllVO> type = hostService.selectSpaceCategory();
		logger.info("type = {}", type);
		
		SpaceVO spaceVo = new SpaceVO();
		SpaceTypeVO spaceTypeVo = new SpaceTypeVO();
		SpaceToTalFacilityVO spaceToTalFacilityVO = new SpaceToTalFacilityVO();
		RefundVO refundVo = new RefundVO();
		
		if (spaceNum > 0) {
			spaceVo = hostService.selectSpaceByspaceNum(spaceNum);
			logger.info("spaceVo = {}" + spaceVo);
			
			spaceTypeVo = hostService.selectSpaceTypeBySpaceTypeNo(spaceVo.getSpaceTypeNo());
			logger.info("spaceTypeVo = {}", spaceTypeVo);
			
			spaceToTalFacilityVO = hostService.selectTotalFacilityBySpaceNum(spaceNum);
			logger.info("spaceToTalFacilityVO = {}", spaceToTalFacilityVO);
			
			refundVo = hostService.selectRefundByRefundNum(spaceVo.getRefundNum());
			logger.info("refundVo = {}", refundVo);
		}
		
		//3
		model.addAttribute("type", type);
		model.addAttribute("spaceVo", spaceVo);
		model.addAttribute("spaceTypeVo", spaceTypeVo);
		model.addAttribute("totalVo", spaceToTalFacilityVO);
		model.addAttribute("refundVo", refundVo);
		
		//4
		return "host/registration/registration2";
	}
	
	@PostMapping("/registration/registration2/write")
	public String registration2_write(@ModelAttribute SpaceVO spaceVo, @ModelAttribute SpaceTypeVO spaceTypeVO,
			RefundVO refundVo, SpaceToTalFacilityVO spaceTotalFacilityVo, HttpSession session, 
			HttpServletRequest request, MultipartHttpServletRequest multiFile, Model model) {
		logger.info("공간등록 처리, spaceVo = {}, spaceTypeVo = {}, refund = {}", spaceVo, spaceTypeVO, refundVo);
		
		//공간 번호 조회
		logger.info("공간번호 전 SpaceTypeName + {}", spaceTypeVO.getSpaceTypeName());
		SpaceTypeVO spaceTypeVO2 = hostService.selectSpaceTypeBySpaceTypeName(spaceTypeVO.getSpaceTypeName());
		logger.info("공간번호 후 spaceTypeVO2 = {}", spaceTypeVO2);
		spaceVo.setSpaceTypeNo(spaceTypeVO2.getSpaceTypeNo());
		logger.info("공간 타입 번호 조회, SpaceTypeNo = {}", spaceTypeVO2.getSpaceTypeNo());
		
		//사용자 번호 조회
		String userId = (String) session.getAttribute("userId");
		UserInfoVO user = hostService.selectUserById(userId);
		spaceVo.setUserNum(user.getUserNum());
		logger.info("유저 번호 조회, UserNum = {}", spaceVo.getUserNum());
		
		String spaceInfo = spaceVo.getSpaceInfo().replaceAll("\n", "<br>");
		spaceVo.setSpaceInfo(spaceInfo);
		
		//공간 등록
		int space = hostService.insertSpace(spaceVo, refundVo);
		logger.info("space = {}", space);
		
		//total facility
		spaceTotalFacilityVo.setSpaceNum(spaceVo.getSpaceNum());
		
		if (spaceTotalFacilityVo.getFacWifi() == null) {
			spaceTotalFacilityVo.setFacWifi("");
		}
		if (spaceTotalFacilityVo.getFacPrinter() == null) {
			spaceTotalFacilityVo.setFacPrinter("");
		}
		if (spaceTotalFacilityVo.getFacChairTable() == null) {
			spaceTotalFacilityVo.setFacChairTable("");
		}
		if (spaceTotalFacilityVo.getFacSmoke() == null) {
			spaceTotalFacilityVo.setFacSmoke("");
		}
		if (spaceTotalFacilityVo.getFacRestRoom() == null) {
			spaceTotalFacilityVo.setFacRestRoom("");
		}
		if (spaceTotalFacilityVo.getFacPC() == null) {
			spaceTotalFacilityVo.setFacPC("");
		}
		if (spaceTotalFacilityVo.getFacTV() == null) {
			spaceTotalFacilityVo.setFacTV("");
		}
		if (spaceTotalFacilityVo.getFacWhiteBoard() == null) {
			spaceTotalFacilityVo.setFacWhiteBoard("");
		}
		if (spaceTotalFacilityVo.getFacElevator() == null) {
			spaceTotalFacilityVo.setFacElevator("");
		}
		if (spaceTotalFacilityVo.getFacParking() == null) {
			spaceTotalFacilityVo.setFacParking("");
		}
		if (spaceTotalFacilityVo.getFacFood() == null) {
			spaceTotalFacilityVo.setFacFood("");
		}
		if (spaceTotalFacilityVo.getFacDrink() == null) {
			spaceTotalFacilityVo.setFacDrink("");
		}
		if (spaceTotalFacilityVo.getFacCook() == null) {
			spaceTotalFacilityVo.setFacCook("");
		}
		if (spaceTotalFacilityVo.getFacPet() == null) {
			spaceTotalFacilityVo.setFacPet("");
		}
		if (spaceTotalFacilityVo.getFacAudio() == null) {
			spaceTotalFacilityVo.setFacAudio("");
		}
		logger.info("TotalFacilityVo = {}", spaceTotalFacilityVo);
		
		int totalFac = hostService.insertSpaceTotalFacility(spaceTotalFacilityVo);
		logger.info("totalFac = {}", totalFac);
		
		//이미지 수정
		logger.info("request = {}" + request);
		SpaceFileVO spaceFileVo = new SpaceFileVO();
		
		try {
			List<Map<String, Object>> list = 
					fileUploadUtil.spaceImageUpload(request, ConstUtil.UPLOAD_SPACE_IMAGE_FLAG, spaceVo.getSpaceNum());
			logger.info("파일 list.size = {}", list.size());
			
			for (Map<String, Object> map : list) {
				if(map.get("fileName") != null && map.get("fileName") != ""){
					String fileName = (String)map.get("fileName");
					String originalFileName = (String)map.get("originalFileName");
					long fileSize = (long)map.get("fileSize");
					
					spaceFileVo.setImgForeignKey("S" + spaceVo.getSpaceNum());
					spaceFileVo.setImgOriginalName(originalFileName);
					spaceFileVo.setImgTempName(fileName);
					spaceFileVo.setImgSize(fileSize);
					logger.info("spaceFileVo = {}", spaceFileVo);
					
					int spFile = spaceFileservice.insertSpaceFile(spaceFileVo);
					logger.info("이미지 저장, spFile = {}", spFile);
				}
			}//for
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/host/spaceManage";
	}

	@PostMapping("/registration/registration2/edit")
	public String registration2_edit(@ModelAttribute SpaceVO spaceVo, @ModelAttribute SpaceTypeVO spaceTypeVO,
			RefundVO refundVo, SpaceToTalFacilityVO spaceTotalFacilityVo, HttpSession session, 
			HttpServletRequest request, MultipartHttpServletRequest multiFile, 
			@RequestParam(defaultValue = "0") int spaceNum, Model model) {
		logger.info("공간수정 처리, spaceNum = {}, spaceVo = {}, spaceTypeVo = {}, refund = {}", 
				spaceNum, spaceVo, spaceTypeVO, refundVo);
		
		//공간 번호 조회
		SpaceTypeVO spaceTypeVO2 = hostService.selectSpaceTypeBySpaceTypeName(spaceTypeVO.getSpaceTypeName());
		logger.info("공간번호 후 spaceTypeVO2 = {}", spaceTypeVO2);
		spaceVo.setSpaceTypeNo(spaceTypeVO2.getSpaceTypeNo());
		logger.info("공간 타입 번호 조회, SpaceTypeNo = {}", spaceTypeVO2.getSpaceTypeNo());
		
		//사용자 번호 조회
		String userId = (String) session.getAttribute("userId");
		UserInfoVO user = hostService.selectUserById(userId);
		spaceVo.setUserNum(user.getUserNum());
		logger.info("유저 번호 조회, UserNum = {}", spaceVo.getUserNum());
		
		String spaceInfo = spaceVo.getSpaceInfo().replaceAll("\n", "<br>");
		spaceVo.setSpaceInfo(spaceInfo);
		
		//공간 수정
		spaceVo.setSpaceNum(spaceNum);
		int space = hostService.updateSpace(spaceVo);
		logger.info("space = {}", space);
		
		//refund 수정
		refundVo.setRefundNum(spaceVo.getRefundNum());
		int refund = hostService.updateRefund(refundVo);
		logger.info("refund = {}", refund);
		
		//total facility
		spaceTotalFacilityVo.setSpaceNum(spaceNum);
		
		if (spaceTotalFacilityVo.getFacWifi() == null) {
			spaceTotalFacilityVo.setFacWifi("");
		}
		if (spaceTotalFacilityVo.getFacPrinter() == null) {
			spaceTotalFacilityVo.setFacPrinter("");
		}
		if (spaceTotalFacilityVo.getFacChairTable() == null) {
			spaceTotalFacilityVo.setFacChairTable("");
		}
		if (spaceTotalFacilityVo.getFacSmoke() == null) {
			spaceTotalFacilityVo.setFacSmoke("");
		}
		if (spaceTotalFacilityVo.getFacRestRoom() == null) {
			spaceTotalFacilityVo.setFacRestRoom("");
		}
		if (spaceTotalFacilityVo.getFacPC() == null) {
			spaceTotalFacilityVo.setFacPC("");
		}
		if (spaceTotalFacilityVo.getFacTV() == null) {
			spaceTotalFacilityVo.setFacTV("");
		}
		if (spaceTotalFacilityVo.getFacWhiteBoard() == null) {
			spaceTotalFacilityVo.setFacWhiteBoard("");
		}
		if (spaceTotalFacilityVo.getFacElevator() == null) {
			spaceTotalFacilityVo.setFacElevator("");
		}
		if (spaceTotalFacilityVo.getFacParking() == null) {
			spaceTotalFacilityVo.setFacParking("");
		}
		if (spaceTotalFacilityVo.getFacFood() == null) {
			spaceTotalFacilityVo.setFacFood("");
		}
		if (spaceTotalFacilityVo.getFacDrink() == null) {
			spaceTotalFacilityVo.setFacDrink("");
		}
		if (spaceTotalFacilityVo.getFacCook() == null) {
			spaceTotalFacilityVo.setFacCook("");
		}
		if (spaceTotalFacilityVo.getFacPet() == null) {
			spaceTotalFacilityVo.setFacPet("");
		}
		if (spaceTotalFacilityVo.getFacAudio() == null) {
			spaceTotalFacilityVo.setFacAudio("");
		}
		logger.info("TotalFacilityVo = {}", spaceTotalFacilityVo);
		
		spaceTotalFacilityVo.setSpaceFacilityNum(spaceNum);
		int totalFac = hostService.updateTotalFacility(spaceTotalFacilityVo);
		logger.info("totalFac = {}", totalFac);
		
		//이미지를 다시 업로드하면 기존의 이미지 삭제
		logger.info("request = {}" + request);
		SpaceFileVO spaceFileVo = new SpaceFileVO();
		
		try {
			List<Map<String, Object>> list = 
					fileUploadUtil.spaceImageUpload(request, ConstUtil.UPLOAD_SPACE_IMAGE_FLAG, spaceVo.getSpaceNum());
			logger.info("파일 list.size = {}", list.size());
			
			for (Map<String, Object> map : list) {
				if(map.get("fileName") != null && map.get("fileName") != ""){
					String fileName = (String)map.get("fileName");
					String originalFileName = (String)map.get("originalFileName");
					long fileSize = (long)map.get("fileSize");
					
					spaceFileVo.setImgForeignKey("S" + spaceVo.getSpaceNum());
					spaceFileVo.setImgOriginalName(originalFileName);
					spaceFileVo.setImgTempName(fileName);
					spaceFileVo.setImgSize(fileSize);
					logger.info("spaceFileVo = {}", spaceFileVo);
					
					int spFile = spaceFileservice.insertSpaceFile(spaceFileVo);
					logger.info("이미지 저장, spFile = {}", spFile);
				}
			}//for
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/host/spaceManage";
	}
	
	@GetMapping("/registration/spDetail")
	public String spDetail(@RequestParam(defaultValue = "0") int sdNum, Model model) {
		logger.info("세부 공간등록 보여주기");
		
		SpaceDetailVO sdVo = new SpaceDetailVO();
		FacilityVO  faVo = new FacilityVO();
		if (sdNum != 0) {
			sdVo = hostService.selectSpaceDetailBySdNum(sdNum);
			logger.info("sdVo = {}", sdVo);
			faVo = hostService.selectFacilityByFaNum(sdVo.getFacilityNum());
			logger.info("faVo = {}", faVo);
			
		}
		
		model.addAttribute("sdVo", sdVo);
		model.addAttribute("faVo", faVo);
		
		return "host/registration/spDetail";
	}
	
	@PostMapping("/registration/spDetail/write")
	public String spDetail_write(SpaceDetailVO spaceDetailVo, FacilityVO facilityVo) {
		logger.info("세부 공간등록 처리, spaceDetailVo = {}, facilityVo = {}", spaceDetailVo, facilityVo);
		
		int cnt = hostService.insertSpaceDetail(spaceDetailVo, facilityVo);
		logger.info("세부공간 등록 결과, cnt = {}", cnt);
		
		return "redirect:/host/spaceDetailManage?spaceNum=" + spaceDetailVo.getSpaceNum();
	}

	@RequestMapping("/spaceDetailManage")
	public String spaceDetailManage(@RequestParam(defaultValue = "0") int spaceNum, HttpSession session, Model model) {
		logger.info("세부공간 관리 페이지");
		
		String userId = (String) session.getAttribute("userId");
		UserInfoVO userInfoVo = hostService.selectUserById(userId);
		int userNum = userInfoVo.getUserNum();
		logger.info("유저 정보 조회, userId = {}, userNum = {}", userId, userNum);
		
		List<SpaceDetailVO> spaceDetailVo = hostService.selectSpaceDetailBySpaceNum(spaceNum);
		logger.info("세부공간 조회, spaceDetailVo.size = {}", spaceDetailVo.size());
		
		for (int i = 0; i < spaceDetailVo.size(); i++) {
			SpaceDetailVO vo = spaceDetailVo.get(i);
			logger.info("vo = {}", vo);
		}
		
		model.addAttribute("spaceDetailVo", spaceDetailVo);
		
		return "host/spaceDetailManage";
	}
	
	
	@PostMapping("/registration/spDetail/edit")
	public String spDetail_edit(SpaceDetailVO spaceDetailVo, FacilityVO facilityVo) {
		logger.info("세부 공간수정 처리, spaceDetailVo = {}, facilityVo = {}", spaceDetailVo, facilityVo);

		int spaceDetail = hostService.updateSpaceDetail(spaceDetailVo);
		logger.info("세부공간 수정 결과, spaceDetail = {}", spaceDetail);
		
		facilityVo.setFacilityNum(spaceDetailVo.getFacilityNum());
		if (facilityVo.getFacWifi() == null) {
			facilityVo.setFacWifi("");
		}
		if (facilityVo.getFacPrinter() == null) {
			facilityVo.setFacPrinter("");
		}
		if (facilityVo.getFacChairTable() == null) {
			facilityVo.setFacChairTable("");
		}
		if (facilityVo.getFacSmoke() == null) {
			facilityVo.setFacSmoke("");
		}
		if (facilityVo.getFacRestRoom() == null) {
			facilityVo.setFacRestRoom("");
		}
		if (facilityVo.getFacPC() == null) {
			facilityVo.setFacPC("");
		}
		if (facilityVo.getFacTV() == null) {
			facilityVo.setFacTV("");
		}
		if (facilityVo.getFacWhiteBoard() == null) {
			facilityVo.setFacWhiteBoard("");
		}
		if (facilityVo.getFacElevator() == null) {
			facilityVo.setFacElevator("");
		}
		if (facilityVo.getFacParking() == null) {
			facilityVo.setFacParking("");
		}
		if (facilityVo.getFacFood() == null) {
			facilityVo.setFacFood("");
		}
		if (facilityVo.getFacDrink() == null) {
			facilityVo.setFacDrink("");
		}
		if (facilityVo.getFacCook() == null) {
			facilityVo.setFacCook("");
		}
		if (facilityVo.getFacPet() == null) {
			facilityVo.setFacPet("");
		}
		if (facilityVo.getFacAudio() == null) {
			facilityVo.setFacAudio("");
		}
		int facility = hostService.updateFacility(facilityVo);
		logger.info("세부공간 수정 결과, spaceDetail = {}, facility = {}", spaceDetail, facility);

		return "redirect:/host/spaceDetailManage?spaceNum=" + spaceDetailVo.getSpaceNum();
	}
	 
	
	@RequestMapping("/spaceManage")
	public String spaceManage(HttpSession session, Model model) {
		logger.info("공간 관리 페이지");
		
		String userId = (String) session.getAttribute("userId");
		UserInfoVO userInfoVo = hostService.selectUserById(userId);
		int userNum = userInfoVo.getUserNum();
		logger.info("유저 정보 조회, userId = {}, userNum = {}", userId, userNum);
		
		List<SpaceFileVO> spaceFileVo = new ArrayList<>();
		List<SpaceVO> spaceVo = hostService.selectSpaceByUserNum(userNum);
		logger.info("공간 조회, spaceVo.size = {}", spaceVo.size());

		for (int i = 0; i < spaceVo.size(); i++) {
			SpaceVO vo = spaceVo.get(i);
			logger.info("SpaceNum = {}", vo.getSpaceNum());
		}
		
		for (int i = 0; i < spaceVo.size(); i++) {
			SpaceVO space = spaceVo.get(i);
			int spaceNum = space.getSpaceNum();
			
			SpaceFileVO file = hostService.selectSpaceFile(spaceNum);
			logger.info("파일조회, file = {}", file);
			
			spaceFileVo.add(file);
		}
		logger.info("공간 메인이미지 조회, spaceFileVo.size = {}", spaceFileVo.size());
		
		
		model.addAttribute("spaceVo", spaceVo);
		model.addAttribute("spaceFileVo", spaceFileVo);
		
		return "host/spaceManage";
	}
	
	@GetMapping("/registration/deleteSpaceDetail")
	public String deleteSpaceDetail(@RequestParam(defaultValue = "0") int sdNum, 
			@RequestParam(defaultValue = "0") int spaceNum, Model model) {
		logger.info("세부공간 삭제, spaceNum = {}, sdNum = {}", spaceNum, sdNum);
		
		String msg = "세부공간 삭제를 실패했습니다.", url = "/host/spaceDetailManage?spaceNum=" + spaceNum;
		if (sdNum > 0) {
			int cnt = hostService.deleteSpaceDetail(sdNum);
			logger.info("cnt = {}, spaceNum = {}", cnt, spaceNum);
			
			msg = sdNum + " 세부공간이 삭제되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/registration/deleteSpace")
	public String deleteSpace(@RequestParam(defaultValue = "0") int spaceNum, Model model) {
		logger.info("공간 삭제, spaceNum = {}", spaceNum);
		
		String msg = "공간 삭제를 실패했습니다.", url = "/host/spaceManage?spaceNum=" + spaceNum;
		if (spaceNum > 0) {
			int cnt = hostService.deleteSpace(spaceNum);
			logger.info("cnt = {}", cnt);
			
			msg = spaceNum + " 공간이 삭제되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	//page=1&order=reservationNum&status=before&keyword=fd
	@RequestMapping("/reservation")
	public String hostReservation(HttpSession session, Model model,
									@RequestParam(defaultValue = "1") int page,
									@RequestParam(required = false) String status,
									@RequestParam(required = false) String order,
									@RequestParam(required = false) String keyword) {
		String userId = (String)session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			model.addAttribute("msg", "먼저 로그인을 해주세요");
			model.addAttribute("url", "/login/login");
			
			return "common/message";
		}
		
		
		int userNum = guestService.selectUserInfo(userId).getUserNum();
		logger.info("호스트 예약 조회, 파라미터 userNum = {}, page = {}", userNum, page);
		logger.info("호스트 예약 조회, 파라미터 status = {}, order = {}, keyword", status, order, keyword);
		
		int size = 5;
		List<Map<String, Object>> list = hostService.selectHostReservation(page,size,userNum,status,order,keyword);
		logger.info("호스트 예약 조회 결과 list = {}", list.size());
		
		model.addAttribute("list", list);
		
		return "host/hostReservation/hostReservation";
	}
	
	@RequestMapping("/reservationDetail")
	public String hostReservationDetail(@RequestParam int reservationNum, Model model) {
		logger.info("예약내역 확인, 파라미터 reservationNum = {}", reservationNum);
		Map<String, Object> map = reservationService.reservationReview(reservationNum);
		
		model.addAttribute("map", map);
		
		return "host/hostReservation/hostReservationDetail";
	}
	@GetMapping("/calendarDetail")
	@ResponseBody
	public Map<String, Object> calendarDetail(@RequestParam int reservationNum) {
		logger.info("ajax예약내역 확인, 파라미터 reservationNum = {}", reservationNum);
		Map<String, Object> map = reservationService.reservationReview(reservationNum);
		map.put("RESERVER_PAY_DAY", map.get("RESERVER_PAY_DAY") + "");
		logger.info("payday = {}", map.get("RESERVER_PAY_DAY"));
		logger.info("ajax예약내역 확인, 결과 map = {}", map);
		
		return map;
	}
	
	@GetMapping("/reservationCalendar")
	public String reservationCalendar(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			model.addAttribute("msg", "먼저 로그인을 해주세요");
			model.addAttribute("url", "/");
			
			return "common/message";
		}
		
		
		int userNum = guestService.selectUserInfo(userId).getUserNum();
		logger.info("호스트 캘린더, 파라미터 userNum = {}", userNum);
		
		
		
		List<CalendarVO> calList = calendarService.selectMemoByUserNum(userNum);
		List<Map<String, Object>> list = hostService.HostReservationCalendar(userNum);
		
		model.addAttribute("list", list);
		model.addAttribute("calList", calList);
		
		return "host/hostReservation/hostReservationCalendar";
	}
	
	@GetMapping("/calendarDate")
	@ResponseBody
	public List<Integer> getDataByDate(@RequestParam String date,HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		int userNum = guestService.selectUserInfo(userId).getUserNum();
		logger.info("날짜별 매출액 조회, 파라미터 date = {}, userId = {}",date, userId);
		
		List<Integer> result = hostService.getDataByDate(date,userNum);
		logger.info("매출액 조회 결과, result.size = {}", result);
		
		return result;
	}
	
	@RequestMapping("/calculate")
	public String calculate(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			model.addAttribute("msg", "정산 페이지는 로그인이 필요합니다");
			model.addAttribute("url", "/host/index");
			
			return "common/message";
		}
		return "host/calculate/calculate";
	}
	
	@RequestMapping("/notice")
    public String notice(Model model,
						@RequestParam(defaultValue = "1") int page,
						@RequestParam(required = false) String boardTitle,
						@RequestParam(required = false) String boardContent,
						@RequestParam(defaultValue = "1") int boardNum,
						@RequestParam(required = false) String searchKeyword) {
		
		
		//logger.info("공지사항 검색 조회, 파라미터 boardTitle = {}, boardContent = {}, page={}", boardTitle, boardContent);
		logger.info("검색, 파라미터 keyword = {}", searchKeyword);
		
		
		int size = 5;
		List<Map<String, Object>> list = boardService.selectNotice(page,size,boardTitle,boardContent,searchKeyword);
		logger.info("공지사항 조회 결과 list.size = {}", list);
		
		model.addAttribute("list", list);
        return "host/board/notice";
    }
	@RequestMapping("/deleteMemo")
	@ResponseBody
	public int deleteMemo(@RequestParam int memoNum) {
		logger.info("메모삭제, 파라미터 memoNum = {}", memoNum);
		int result = calendarService.deleteMemo(memoNum);
		
		
		return result;
	}
}
