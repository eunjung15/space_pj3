package com.sc.spaceCollection.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.comments.model.CommentsService;
import com.sc.spaceCollection.common.AjaxVO;
import com.sc.spaceCollection.common.ConstUtil;
import com.sc.spaceCollection.common.PaginationInfo;
import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.reservation.model.ReservationService;
import com.sc.spaceCollection.review.model.ReviewService;
import com.sc.spaceCollection.space.model.SpaceService;
import com.sc.spaceCollection.userInfo.model.UserInfoListVO;
import com.sc.spaceCollection.userInfo.model.UserInfoService;
import com.sc.spaceCollection.userInfo.model.UserInfoVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/member")
@RequiredArgsConstructor
public class AdminMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);
	
	private final UserInfoService userInfoService;
	private final ReservationService reservationService;
	private final ReviewService reviewService;
	private final CommentsService commentsService;
	private final SpaceService spaceService;
	
	@RequestMapping("/memberList")
	public void memberList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("회원목록 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<UserInfoVO> list = userInfoService.selectMember(searchVo);
		logger.info("회원목록 조회 결과, list.size = {}", list.size());
		
		int totalRecord = userInfoService.getTotalRecord(searchVo);
		logger.info("전체 회원 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list );
		model.addAttribute("searchVo", searchVo );
		model.addAttribute("pagingInfo", pagingInfo );
	}
	
	@RequestMapping("/memberDetail")
	public String memberDetail(@RequestParam(defaultValue = "0")String userId, Model model) {
		logger.info("회원정보 조회, 파라미터 userNum = {}", userId);
		
		Map<String, Object> memberMap = userInfoService.selectByUserId(userId);
		logger.info("회원정보 조회 결과, memberMap = {}", memberMap);
		
		model.addAttribute("memberMap", memberMap);
		
		return "admin/member/memberDetail";
	}
	
	@RequestMapping("/memberDetail/ajax_reservationList")
	@ResponseBody
	public AjaxVO ajax_reservationList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("ajax - 예약 내역 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(5);
		
		//게시물 구분
		pagingInfo.setKindFlag("reservation");
		
		searchVo.setRecordCountPerPage(5);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> reservationList = reservationService.selectReservationAll(searchVo);
			
		logger.info("ajax - 예약 내역 조회 결과, reservationList.size = {}", reservationList.size());
		
		int totalRecord = reservationService.getTotalRecord(searchVo);
		logger.info("ajax -전체 예약 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		AjaxVO AjaxVo = new AjaxVO();
		AjaxVo.setPagingInfo(pagingInfo);
		AjaxVo.setAjaxList(reservationList);
		AjaxVo.setSearchVo(searchVo);
		
		return AjaxVo;
	}
	
	@RequestMapping("/memberDetail/ajax_reviewList")
	@ResponseBody
	public AjaxVO ajax_reviewList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("ajax - 리뷰 내역 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(5);
		
		pagingInfo.setKindFlag("review");
		
		searchVo.setRecordCountPerPage(5);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> reviewList = reviewService.selectReviewEachUser(searchVo);
		logger.info("ajax - 리뷰 내역 조회 결과, reviewList.size = {}", reviewList.size());
		
		int totalRecord = reviewService.getTotalRecord(searchVo);
		logger.info("ajax -전체 리뷰 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		AjaxVO ajaxVo = new AjaxVO();
		ajaxVo.setPagingInfo(pagingInfo);
		ajaxVo.setAjaxList(reviewList);
		ajaxVo.setSearchVo(searchVo);
		
		return ajaxVo;
	}
	
	@RequestMapping("/memberDetail/ajax_commentsList")
	@ResponseBody
	public AjaxVO ajax_commentsList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("ajax - 리뷰 내역 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		
		logger.info("pagingInfo = {}", pagingInfo);
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(5);
		
		pagingInfo.setKindFlag("comments");
		
		searchVo.setRecordCountPerPage(5);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> commentsList = commentsService.selectCommentsEachUser(searchVo);
		logger.info("ajax - 리뷰 내역 조회 결과, commentsList.size = {}", commentsList.size());
		
		int totalRecord = commentsService.getTotalRecordEachUser(searchVo);
		logger.info("ajax -전체 리뷰 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		
		
		AjaxVO ajaxVo = new AjaxVO();
		ajaxVo.setPagingInfo(pagingInfo);
		ajaxVo.setAjaxList(commentsList);
		ajaxVo.setSearchVo(searchVo);
		
		return ajaxVo;
	}
	
	@RequestMapping("/memberDetail/ajax_spaceList")
	@ResponseBody
	public AjaxVO ajax_spaceList(@ModelAttribute SearchVO searchVo) {
		logger.info("ajax - 공간 등록 내역 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(5);
		
		pagingInfo.setKindFlag("space");
		
		searchVo.setRecordCountPerPage(5);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> spaceList = spaceService.selectSpaceListViewByUserId(searchVo);
		logger.info("ajax - 공간 등록 내역 조회 결과, spaceList.size = {}", spaceList.size());
		
		int totalRecord = spaceService.getTotalRecordSpaceListViewByUserId(searchVo);
		logger.info("ajax -전체 공간 등록 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		AjaxVO ajaxVo = new AjaxVO();
		ajaxVo.setPagingInfo(pagingInfo);
		ajaxVo.setAjaxList(spaceList);
		ajaxVo.setSearchVo(searchVo);
		
		return ajaxVo;
	}
	
	@GetMapping("/memberWithdrawal")
	public String memberWithdrawal_get(@RequestParam String userId, Model model) {
		logger.info("회원탈퇴, 파라미터 userId = {}", userId);
		
		int cnt = userInfoService.memberWithdrawal(userId);
		logger.info("회원탈퇴 결과, cnt = {}", cnt);
		
		String msg = "탈퇴처리에 실패하였습니다. 관리자에게 문의해주시기 바랍니다.", url = "/admin/member/memberDetail?memberId=" + userId;
		if(cnt>0) {
			msg = "회원 탈퇴가 완료되었습니다.";
			url = "/admin/member/memberList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@PostMapping("/memberWithdrawal")
	@Transactional
	public String memberWithdrawal_post(@ModelAttribute UserInfoListVO listVo, Model model) {
		logger.info("회원탈퇴, 파라미터 listVo = {}", listVo);
		
		int sum = 0;
		int total = 0;
		int cnt = 0;
		for(UserInfoVO vo : listVo.getUserInfoItemList()) {
			if(vo.getUserId() != null && !vo.getUserId().isEmpty()) {
				cnt = userInfoService.memberWithdrawal(vo.getUserId());
				sum += cnt;
				logger.info("회원탈퇴 결과, cnt = {}", cnt);
				total ++;
			}
		}
		
		String msg = "탈퇴처리에 실패하였습니다. 관리자에게 문의해주시기 바랍니다.", url = "/admin/member/memberList";
		if(sum == total) {
			msg = "회원 탈퇴가 완료되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/withdrawalMemberList")
	public void withdrawalMemberList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("탈퇴 회원목록 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<UserInfoVO> list = userInfoService.selectWithdrawalMember(searchVo);
		logger.info("탈퇴 회원목록 조회 결과, list.size = {}", list.size());
		
		int totalRecord = userInfoService.getWithdrawalTotalRecord(searchVo);
		logger.info("전체 탈퇴 회원 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list );
		model.addAttribute("searchVo", searchVo );
		model.addAttribute("pagingInfo", pagingInfo );
	}
	
	@GetMapping("/memberReturn")
	public String memberReturn_get(@RequestParam String userId, Model model) {
		logger.info("회원 복구, 파라미터 userId = {}", userId);
		
		int cnt = userInfoService.memberReturn(userId);
		logger.info("회원 복구 결과, cnt = {}", cnt);
		
		String msg = "회원 복구에 실패하였습니다. 관리자에게 문의해주시기 바랍니다.", url = "/admin/member/memberDetail?userId="+userId;
		if(cnt>0) {
			msg = "회원 복구가 완료되었습니다.";
			url = "/admin/member/withdrawalMemberList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
		
	}
	
	@PostMapping("/memberReturn")
	@Transactional
	public String memberReturn_post(@ModelAttribute UserInfoListVO listVo, Model model) {
		logger.info("회원복구, 파라미터 listVo = {}", listVo);
		
		int sum = 0;
		int total = 0;
		int cnt = 0;
		for(UserInfoVO vo : listVo.getUserInfoItemList()) {
			if(vo.getUserId() != null && !vo.getUserId().isEmpty()) {
				cnt = userInfoService.memberReturn(vo.getUserId());
				sum += cnt;
				logger.info("회원복구 결과, cnt = {}", cnt);
				total ++;
			}
		}
		
		String msg = "복구처리에 실패하였습니다. 관리자에게 문의해주시기 바랍니다.", url = "/admin/member/withdrawalMemberList";
		if(sum == total) {
			msg = "회원 복구가 완료되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}

}
