package com.sc.spaceCollection.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.sc.spaceCollection.common.AjaxVO;
import com.sc.spaceCollection.common.ConstUtil;
import com.sc.spaceCollection.common.FileUploadUtil;
import com.sc.spaceCollection.common.PaginationInfo;
import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.email.AdminEmailSender;
import com.sc.spaceCollection.email.EmailVO;
import com.sc.spaceCollection.host.model.SpaceTypeVO;
import com.sc.spaceCollection.space.model.SpaceListVO;
import com.sc.spaceCollection.space.model.SpaceService;
import com.sc.spaceCollection.space.model.SpaceVO;
import com.sc.spaceCollection.spaceFile.model.SpaceFileService;
import com.sc.spaceCollection.spaceFile.model.SpaceFileVO;
import com.sc.spaceCollection.spaceType.model.SpaceTypeListVO;
import com.sc.spaceCollection.spaceType.model.SpaceTypeService;
import com.sc.spaceCollection.spaceTypeCategory.model.SpaceTypeCategoryListVO;
import com.sc.spaceCollection.spaceTypeCategory.model.SpaceTypeCategoryService;
import com.sc.spaceCollection.spaceTypeCategory.model.SpaceTypeCategoryVO;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/space")
@RequiredArgsConstructor
public class AdminSpaceController {
	private static final Logger logger = LoggerFactory.getLogger(AdminSpaceController.class);
	
	private final SpaceTypeCategoryService spaceTypeCategoryService;
	private final SpaceTypeService spaceTypeService;
	private final SpaceService spaceService;
	private final SpaceFileService spaceFileService;
	private final AdminEmailSender admin;
	private final FileUploadUtil fileuploadUtil;
	
	@RequestMapping("/spaceTypeCategoryList")
	public void spaceTypeCategoryList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("공간타입 카테고리 조회");
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<SpaceTypeCategoryVO> list = spaceTypeCategoryService.selectSpaceTypeCategory(searchVo);
		logger.info("공간타입 카테고리 조회 결과, list.size = {}", list.size());
		
		int totalRecord = spaceTypeCategoryService.getTotalRecord(searchVo);
		logger.info("전체 공간타입 카테고리 수,  totalRecord = {}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		
	}
	
	@PostMapping("/spaceTypeCategoryWrite")
	public String spaceTypeCategoryWrite(@ModelAttribute SpaceTypeCategoryVO vo, Model model) {
		logger.info("공간 타입 카테고리 등록, 파라미터 vo = {}", vo);
		
		int cnt = spaceTypeCategoryService.insertSpaceTypeCategory(vo);
		logger.info("공간 타입 카테고리 등록 결과, cnt = {}", cnt);
		
		String msg = "카테고리 등록 중 오류가 발생했습니다. 다시 시도해주시기 바랍니다.", url = "/admin/space/spaceTypeCategoryList";
		if(cnt==SpaceTypeCategoryService.PASS) {
			return "redirect:/admin/space/spaceTypeCategoryList";
		}else if(cnt==SpaceTypeCategoryService.DUB) {
			msg = "이미 사용중인 카테고리명 입니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
		
	}
	
	@RequestMapping("/spaceTypeCategoryActive")
	public String spaceTypeCategoryActive(@ModelAttribute SpaceTypeCategoryListVO listVo, Model model) {
		logger.info("카테고리 활성화, 파라미터 listVo = {}", listVo);
		
		int cnt = spaceTypeCategoryService.spaceTypeCategoryActivation(listVo);
		
		String msg = "카테고리 활성화에 실패했습니다. 관리자에게 문의해주시기 바랍니다.", url = "/admin/space/spaceTypeCategoryList";
		if(cnt>0) {
			msg = "카테고리가 활성화 되었습니다.";
		}else if(cnt == -1) {
			msg = "카테고리 활성화 중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
		
	}
	
	@RequestMapping("/spaceTypeCategoryDeActive")
	public String spaceTypeCategoryDeActive(@ModelAttribute SpaceTypeCategoryListVO listVo, Model model) {
		logger.info("카테고리 비활성화, 파라미터 listVo = {}", listVo);
		
		int cnt = spaceTypeCategoryService.spaceTypeCategoryDeactivation(listVo);
		
		String msg = "카테고리 비활성화에 실패했습니다. 관리자에게 문의해주시기 바랍니다.", url = "/admin/space/spaceTypeCategoryList";
		if(cnt>0) {
			msg = "카테고리가 비활성화 되었습니다.";
		}else if(cnt == -1) {
			msg = "카테고리 비활성화 중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/spaceTypeList")
	public void spaceTypeList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("공간타입 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> list = spaceTypeService.selectSpaceType(searchVo);
		logger.info("공간타입 조회 결과, list.size = {}", list.size());
		
		int totalRecord = spaceTypeService.getTotalRecord(searchVo);
		logger.info("전체 공간타입 수,  totalRecord = {}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
	}
	
	@RequestMapping("/spaceTypeActive")
	public String spaceTypeActive(@ModelAttribute SpaceTypeListVO listVo, Model model) {
		logger.info("공간 타입 활성화, 파라미터 listVo = {}", listVo);
		
		int cnt = spaceTypeService.spaceTypeActivation(listVo);
		
		String msg = "공간 타입 활성화에 실패했습니다. 관리자에게 문의해주시기 바랍니다.", url = "/admin/space/spaceTypeList";
		if(cnt>0) {
			msg = "공간 타입이 활성화 되었습니다.";
		}else if(cnt == -1) {
			msg = "공간 타입 활성화 중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@GetMapping("/spaceType/spaceTypeWrite")
	public String spaceTypeWrite_get(Model model) {
		logger.info("공간 카테고리 출력");
		List<SpaceTypeCategoryVO> list = spaceTypeCategoryService.selectSpaceTypeCategoryAll();
		logger.info("공간 카테고리 출력 결과, list.size = {}", list.size());
		
		model.addAttribute("list", list);
		
		return "admin/space/spaceTypeWrite";
	}
	
	@PostMapping("/spaceType/spaceTypeWrite")
	public String spaceTypeWrite_post(@ModelAttribute SpaceTypeVO spaceTypeVo, Model model) {
		logger.info("공간 타입 등록, 파라미터 spaceTypeVo = {}", spaceTypeVo);
		
		int cnt = spaceTypeService.insertSpaceType(spaceTypeVo);
		logger.info("공간 타입 등록 결과, cnt = {}", cnt);
		
		String msg = "공간 등록 중 문제가 발생했습니다. 관리자에게 문의해주시기 바랍니다.", 
				url = "/admin/space/spaceType/spaceTypeWrite";
		if(cnt == SpaceTypeService.DUB) {
				msg = "이미 사용중인 공간 타입명입니다.";
		}else if(cnt == SpaceTypeService.PASS) {
				return "redirect:/admin/space/spaceTypeList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/spaceTypeDeActive")
	public String spaceTypeDeActive(@ModelAttribute SpaceTypeListVO listVo, Model model) {
		logger.info("공간 타입 비활성화, 파라미터 listVo = {}", listVo);
		
		int cnt = spaceTypeService.spaceTypeDeactivation(listVo);
		
		String msg = "공간 타입 비활성화에 실패했습니다. 관리자에게 문의해주시기 바랍니다.", url = "/admin/space/spaceTypeList";
		if(cnt>0) {
			msg = "공간 타입이 비활성화 되었습니다.";
		}else if(cnt == -1) {
			msg = "공간 타입 비활성화 중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/spaceType/spaceTypeDetail")
	public String spaceTypeDetail(@RequestParam String spaceTypeName, Model model) {
		logger.info("공간 타입 상세보기, 파라미터 spaceTypeName = {}", spaceTypeName);
		
		Map<String, Object> map = spaceTypeService.selectBySpaceTypeName(spaceTypeName);
		logger.info("공간 타입 상세보기 결과, map = {}", map);
		
		model.addAttribute("map", map);
		
		return "admin/space/spaceTypeDetail";
	}
	
	@GetMapping("/spaceType/spaceTypeEdit")
	public String spaceTypeEdit_get(@RequestParam String spaceTypeName, Model model) {
		logger.info("공간 타입 조회, 파라미터 spaceTypeName = {}", spaceTypeName);
		
		List<SpaceTypeCategoryVO> list = spaceTypeCategoryService.selectSpaceTypeCategoryAll();
		
		Map<String, Object> map = spaceTypeService.selectBySpaceTypeName(spaceTypeName);
		logger.info("공간 타입 조회 결과, map = {}", map);
		
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		
		return "admin/space/spaceTypeWrite";
	}
	
	@PostMapping("/spaceType/spaceTypeEdit")
	public String spaceTypeEdit_post(@ModelAttribute SpaceTypeVO spaceTypeVo, Model model) throws UnsupportedEncodingException {
		logger.info("공간 타입 수정, 파라미터 spaceTypeVo = {}", spaceTypeVo);
		SpaceTypeVO spaceTypeVo2 = spaceTypeService.selectSpaceTypeBySpaceTypeNo(spaceTypeVo.getSpaceTypeNo());
		int cnt = spaceTypeService.updateSpaceType(spaceTypeVo);
		logger.info("공간 타입 수정 결과, cnt = {}", cnt);
		
		String msg = "공간 타입 수정 처리 중 문제가 발생했습니다. 다시 시도해주시기 바랍니다.", url = "/admin/space/spaceType/spaceTypeEdit?spaceTypeName="+spaceTypeVo2.getSpaceTypeName();
		if(cnt == SpaceTypeService.PASS ) {
			String trans = URLEncoder.encode(spaceTypeVo.getSpaceTypeName(), "UTF-8");
			return "redirect:/admin/space/spaceType/spaceTypeDetail?spaceTypeName="+trans;
		}else if(cnt == SpaceTypeService.DUB) {
			msg = "이미 사용중인 공간 타입명 입니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/spaceList")
	public void spaceList(Model model) {
		logger.info("공간 조회");
	}
	
	@RequestMapping("/spaceConfirmList")
	public void spaceConfirmList() {
		logger.info("공간 승인 목록 화면");
		
	}
	
	@RequestMapping("/spaceConfirmList/ajax_spaceConfirmList")
	@ResponseBody
	public AjaxVO ajax_spaceConfirmList(@ModelAttribute SearchVO searchVo) {
		logger.info("ajax - 공간 승인 요청 내역 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		pagingInfo.setKindFlag("spaceConfirmList");
		logger.info("pagining = {}", pagingInfo.getBlockSize());
		
		searchVo.setRecordCountPerPage(20);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> spaceList = spaceService.selectSpaceConfirmList(searchVo);
		logger.info("ajax - 공간 등록 내역 조회 결과, spaceList.size = {}", spaceList.size());
		
		int totalRecord = spaceService.getTotalRecordSpaceConfrimList(searchVo);
		logger.info("ajax -전체 공간 등록 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		AjaxVO ajaxVo = new AjaxVO();
		ajaxVo.setPagingInfo(pagingInfo);
		ajaxVo.setAjaxList(spaceList);
		ajaxVo.setSearchVo(searchVo);
		
		return ajaxVo;
	}
	
	@RequestMapping("/spaceConfirmList/ajax_spaceConfirmHistoryList")
	@ResponseBody
	public AjaxVO ajax_spaceConfirmHistoryList(@ModelAttribute SearchVO searchVo, @RequestParam(defaultValue = "space_num desc")String order, @RequestParam String status) {
		logger.info("ajax - 공간 승인 내역 조회, 파라미터 searchVo = {}, order = {}, status = {}", searchVo, order, status);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		pagingInfo.setKindFlag("spaceConfirmHistoryList");
		logger.info("pagining = {}", pagingInfo.getBlockSize());
		
		searchVo.setRecordCountPerPage(20);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> spaceList = spaceService.selectSpaceConfirmHistoryList(searchVo, order, status);
		logger.info("ajax - 공간 승인 내역 조회 결과, spaceList.size = {}", spaceList.size());
		
		int totalRecord = spaceService.getTotalRecordSpaceConfirmHistoryList(searchVo, order, status);
		logger.info("ajax -전체 공간 승인 내역 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		Map<String, Object> map = new HashMap<String, Object>();
		
		AjaxVO ajaxVo = new AjaxVO();
		ajaxVo.setPagingInfo(pagingInfo);
		ajaxVo.setAjaxList(spaceList);
		ajaxVo.setSearchVo(searchVo);
		ajaxVo.setOrder(order);
		ajaxVo.setStatus(status);
		
		return ajaxVo;
	}
	
	@RequestMapping("/spaceConfirmList/confirm")
	public String spaceConfirm(@ModelAttribute SpaceListVO listVo, Model model) {
		logger.info("공간 승인, 파라미터 listVo = {}", listVo);
		
		int cnt = spaceService.spaceConfirm(listVo);
		
		String msg = "요청 처리중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.", url = "/admin/space/spaceConfirmList";
		if(cnt>0) {
			msg = "승인 처리가 완료되었습니다.";
			for(SpaceVO vo : listVo.getSpaceItemList()) {
				EmailVO emailVo = new EmailVO();
				if(vo.getSpaceNum() > 0) {
					Map<String, Object> map = spaceService.selectSpaceConfirmDetailBySpaceNum(vo.getSpaceNum());
					if(map.get("USER_EMAIL") != null) {
						emailVo.setSpaceNum(Integer.parseInt(map.get("SPACE_NUM")+""));
						emailVo.setUserEmail(map.get("USER_EMAIL")+"");
						emailVo.setSpaceTypeName(map.get("SPACE_TYPE_NAME")+"");
						emailVo.setSpaceName(map.get("SPACE_NAME")+"");
						emailVo.setSpaceRegDate(map.get("SPACE_REG_DATE")+"");
						emailVo.setSpaceRequestStatus(map.get("SPACE_REQUEST_STATUS")+"");
						emailVo.setSpaceRegDate(map.get("SPACE_REG_DATE")+"");
					
						try {
							admin.sendSpaceConfirmEmail(emailVo);
						} catch (MessagingException e) {
							e.printStackTrace();
						}
					}
					
					
				}
			}
			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
		
	}
	
	@RequestMapping("/spaceConfirmList/denine")
	public String spaceDenine(@ModelAttribute SpaceListVO listVo, Model model) {
		logger.info("공간 거절, 파라미터 listVo = {}", listVo);
		
		int cnt = spaceService.spaceDenine(listVo);
		
		String msg = "요청 처리중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.", url = "/admin/space/spaceConfirmList";
		if(cnt>0) {
			msg = "거절 처리가 완료되었습니다.";

			for(SpaceVO vo : listVo.getSpaceItemList()) {
				EmailVO emailVo = new EmailVO();
				if(vo.getSpaceNum() > 0) {
					Map<String, Object> map = spaceService.selectSpaceConfirmDetailBySpaceNum(vo.getSpaceNum());
					if(map.get("USER_EMAIL") != null) {
						emailVo.setSpaceNum(Integer.parseInt(map.get("SPACE_NUM")+""));
						emailVo.setUserEmail(map.get("USER_EMAIL")+"");
						emailVo.setSpaceTypeName(map.get("SPACE_TYPE_NAME")+"");
						emailVo.setSpaceName(map.get("SPACE_NAME")+"");
						emailVo.setReason("검토 후 일괄 거절");
						emailVo.setSpaceRegDate(map.get("SPACE_REG_DATE")+"");
						emailVo.setSpaceRequestStatus(map.get("SPACE_REQUEST_STATUS")+"");
						emailVo.setSpaceRegDate(map.get("SPACE_REG_DATE")+"");
						
						try {
							admin.sendSpaceConfirmEmail(emailVo);
						} catch (MessagingException e) {
							e.printStackTrace();
						}
					}

				}
			}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/spaceConfirmList/confirmOne")
	public String spaceConfirm(@ModelAttribute EmailVO vo, Model model) {
		logger.info("공간 승인, 파라미터 vo = {}", vo);
		
		int cnt = spaceService.spaceConfirmOne(vo.getSpaceNum());
		vo.setSpaceRequestStatus("Y");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		vo.setSpaceRegDate(sdf.format(date));
		
		String msg = "요청 처리중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.", url = "/admin/space/spaceConfirmList";
		if(cnt>0) {
			msg = "승인 처리가 완료되었습니다.";
			if(vo.getUserEmail()!=null && !vo.getUserEmail().isEmpty()) {
				try {
					admin.sendSpaceConfirmEmail(vo);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
		
		
	}
	
	@RequestMapping("/spaceConfirmList/denineOne")
	public String spaceDenine(@ModelAttribute EmailVO vo, Model model) {
		logger.info("공간 승인, 파라미터 vo = {}", vo);
		
		int cnt = spaceService.spaceDenineOne(vo.getSpaceNum());
		vo.setSpaceRequestStatus("N");
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		vo.setSpaceRegDate(sdf.format(date));
		String msg = "요청 처리중 문제가 발생하였습니다. 다시 시도해주시기 바랍니다.", url = "/admin/space/spaceConfirmList";
		if(cnt>0) {
			msg = "거절 처리가 완료되었습니다.";
			if(vo.getUserEmail()!=null && !vo.getUserEmail().isEmpty()) {
				try {
					admin.sendSpaceConfirmEmail(vo);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/spaceConfirmList/spaceConfirmDetail")
	public String spaceConfirmDetail(@RequestParam(defaultValue = "0")int spaceNum, Model model) {
		logger.info("공간 승인 관리 상세보기, 파라미터 spaceNum = {}", spaceNum);
		
		Map<String, Object> map = spaceService.selectSpaceConfirmDetailBySpaceNum(spaceNum);
		logger.info("공간 승인 관리 상세보기 조회 결과, map = {}", map);
		
		String str = spaceFileService.selectLicenceImgBySpaceNum("S"+spaceNum);
		
		
		List<String> imgList = spaceFileService.selectSpaceImgBySpaceNum("S"+spaceNum);
		for(int i=0; i<imgList.size(); i++) {
			if(imgList.get(i).contains("license")) {
				imgList.remove(i);
			}
		}
		
		SpaceFileVO fileVo = spaceFileService.selectSpaceFileBySpaceNum("S"+spaceNum);
		
		logger.info("이미지 이름 imgList= {}", imgList);
		
		model.addAttribute("map", map);
		model.addAttribute("imgList", imgList);
		model.addAttribute("str", str);
		model.addAttribute("spaceFileVo", fileVo);
		return "admin/space/spaceConfirmDetail";
	}
	
	@RequestMapping("/download")
	public ModelAndView licenceDownload(@RequestParam String spaceNum, @RequestParam String fileName, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		String upPath = fileuploadUtil.getUploadPath(request, ConstUtil.UPLOAD_SPACE_IMAGE_FLAG);
		logger.info("업로드 경로를 확인해보자 = {}", upPath);
		File file = new File(upPath, fileName);
		map.put("file", file);

		ModelAndView mav = new ModelAndView("boardDownloadView", map);
		
		return mav;
	}
	
	@RequestMapping("/space/ajax_spaceList")
	@ResponseBody
	public AjaxVO ajax_spaceList(@ModelAttribute SearchVO searchVo, @RequestParam(defaultValue = "space_num desc")String order, @RequestParam(defaultValue = "Y")String status) {
		logger.info("ajax - 공간 승인 내역 조회, 파라미터 searchVo = {}, order = {}", searchVo, order);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		pagingInfo.setKindFlag("spaceConfirmHistoryList");
		logger.info("pagining = {}", pagingInfo.getBlockSize());
		
		searchVo.setRecordCountPerPage(20);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> spaceList = spaceService.selectSpaceConfirmHistoryList(searchVo, order, status);
		logger.info("ajax - 공간 승인 내역 조회 결과, spaceList.size = {}", spaceList.size());
		
		int totalRecord = spaceService.getTotalRecordSpaceConfirmHistoryList(searchVo, order, status);
		logger.info("ajax -전체 공간 승인 내역 수, totalRecord = {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		Map<String, Object> map = new HashMap<String, Object>();
		
		AjaxVO ajaxVo = new AjaxVO();
		ajaxVo.setPagingInfo(pagingInfo);
		ajaxVo.setAjaxList(spaceList);
		ajaxVo.setSearchVo(searchVo);
		ajaxVo.setOrder(order);
		
		return ajaxVo;
	}
	
	@RequestMapping("/spaceList/spaceDetail")
	public String spaceDetail(@RequestParam(defaultValue = "0")int spaceNum, Model model) {
		logger.info("공간 상세보기, 파라미터 spaceNum = {}", spaceNum);
		
		Map<String, Object> spaceDetail = spaceService.selectSpaceConfirmDetailBySpaceNum(spaceNum);
		List<Map<String, Object>> spaceDetailList = spaceService.selectSpaceDtailViewBySpaceNum(spaceNum);
		
		Map<String, Object> spaceTotalInfo = new HashMap<>();
		
		spaceTotalInfo.put("spaceDetail", spaceDetail);
		spaceTotalInfo.put("spaceDetailList", spaceDetailList);
		
		List<String> imgList = spaceFileService.selectSpaceImgBySpaceNum("S"+spaceNum);
		for(int i=0; i<imgList.size(); i++) {
			if(imgList.get(i).contains("license")) {
				imgList.remove(i);
			}
		}
		
		logger.info("이미지 이름 imgList= {}", imgList);
		
		logger.info("spaceTotalInfo = {}", spaceTotalInfo);
		model.addAttribute("spaceTotalInfo", spaceTotalInfo);
		model.addAttribute("imgList", imgList);
		
		return "admin/space/spaceDetail";
	}
}
