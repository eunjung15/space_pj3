package com.sc.spaceCollection.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.server.CookieSameSiteSupplier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sc.spaceCollection.common.ConstUtil;
import com.sc.spaceCollection.common.Encryption;
import com.sc.spaceCollection.common.FileUploadUtil;
import com.sc.spaceCollection.common.PagingVO;
import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.guest.model.GuestVO;
import com.sc.spaceCollection.space.model.SpaceService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/guest/myPage")
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(GuestController.class);
	
	private final GuestService guestService;
	private final SpaceService spaceService;
	private final FileUploadUtil fileUploadUtil;
	private final Encryption encryption;
	
	
	@GetMapping("/myProfile")
	public String myPage_get(HttpSession session,Model model, HttpServletRequest request) {
		String userId = (String)session.getAttribute("userId");
		logger.info("마이페이지 처리, 파라미터 userId={}",userId);
		
		GuestVO userInfo = new GuestVO();
		userInfo = guestService.selectUserInfo(userId);
		
		logger.info("마이페이지 유저 정보 불러오기 결과, userInfo={}",userInfo);
		
		model.addAttribute("guestVo",userInfo);
		//최근 본 상품 쿠키 불러오기
		Cookie[] cookies=request.getCookies();
		
		List<Map<String, Object>> todaySdList = new ArrayList<Map<String, Object>>();
		if(cookies!=null){
	        for (int i=0; i<cookies.length; i++) {
	            if (cookies[i].getName().startsWith("today")) {
	            	logger.info("cookieName={}",cookies[i].getName());
	            	Map<String,Object> map=spaceService.selectSpaceFileViewBySpaceNum(cookies[i].getValue());
	            	todaySdList.add(map);
	            }
	        }
	        Collections.reverse(todaySdList);//최신 순으로
	        logger.info("쿠키찾기 결과 todaySd={}",todaySdList);
	    }
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int totalRecord=todaySdList.size();
		int pageSize=3;
		int blockSize=1;
		PagingVO pageVo = new PagingVO(currentPage,totalRecord,pageSize,blockSize);
		//최근 본 상품 끝
		
		model.addAttribute("todaySdList",todaySdList);
		model.addAttribute("pageVo",pageVo);
		return "guest/myPage/myProfile";
	} 
	
	@GetMapping("/myProfileSNS")
	public String myPageSNS_get(HttpSession session,Model model) {
		String userId = (String)session.getAttribute("userId");
		String SNSCode= (String)session.getAttribute("code");
		logger.info("SNS마이페이지 처리, 파라미터 userId={},SNSCode={}",userId,SNSCode);
		GuestVO searchInfo = new GuestVO();
		searchInfo.setUserId(userId);
		searchInfo.setUserSnsCode(SNSCode);
		GuestVO userInfo = new GuestVO();
		userInfo = guestService.selectSnsUserInfo(searchInfo);
		
		logger.info("마이페이지 유저 정보 불러오기 결과, userInfo={}",userInfo);
		
		model.addAttribute("guestVo",userInfo);
		
		return "guest/myPage/myProfile";
	} 
	
	@PostMapping("/editProfile")
	public String editProfile() {
		return "";
	}
	
	@GetMapping("/checkPwd")
	public String checkPwd_get(HttpSession session) {
		String url="guest/myPage/checkPwd";
		
		String userId=(String)session.getAttribute("userId");
	    int cnt = guestService.checkedUserIdBySnsCode(userId);
	    
	    logger.info("SNS사용자 조회결과, cnt={}",cnt);
	    if(cnt>0) {//SNS유저 일 경우 확인없이 마이프로필
	         url="redirect:/guest/myPage/myProfileSNS";
	    }

		
		logger.info("비밀번호 확인 페이지, [회원정보수정 단계]");
		return url;
	}
	
	@PostMapping("/checkPwd")
	public String checkPwd_post(@RequestParam String userPwd,HttpSession session ,Model model) {
		
		String userId=(String)session.getAttribute("userId");
		logger.info("비밀번호 확인 처리, 파라미터 userId={},userPwd={}",userId,userPwd);
		
		// 2 DB작업
		String userSalt=guestService.selectUserSalt(userId);
		logger.info("사용자 salt 불러오기 결과, userSalt={}",userSalt);
				
		String hex=encryption.getEncryption(userSalt, userPwd);
		logger.info("hex값 변환 결과, hex={}",hex);
				
		int result = guestService.loginCheck(userId, hex);
		logger.info("비밀번호 체크 결과, result={}",result);
		
		String msg="", url="";
		if(result==GuestService.LOGIN_OK) {
			url="/guest/myPage/myProfile";
			msg=userId+"님 환영합니다.";
		}else if(result==GuestService.PWD_DISAGREE) {
			url="/guest/myPage/checkPwd";
			msg="비밀번호가 일치하지 않습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@PostMapping("/editImage")
	public String editImage(HttpSession session,HttpServletRequest request,Model model) {
		String userId = (String)session.getAttribute("userId");
		GuestVO guestVo = new GuestVO();
		String fileName="", originalFileName="";
		long fileSize=0;
		try {
			String uploadPath
			=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_USER_IMAGE_FLAG);
			guestVo=guestService.selectUserInfo(userId);
			logger.info("사용자 정보 조회 결과 guestVo={}",guestVo);
			if(guestVo.getUserProfileImage() !=null) {
				File file = new File(uploadPath,guestVo.getUserProfileImage());
				if(file.exists()) {
					boolean bool=file.delete();
					logger.info("파일 삭제여부: {}",bool);
				}
			}
			
			//2.
			//파일 업로드 처리
			List<Map<String, Object>> list=fileUploadUtil.userProfileupload(request,ConstUtil.UPLOAD_USER_IMAGE_FLAG, userId);
						
			for(Map<String, Object> map : list) {
				fileName=(String)map.get("fileName");
				originalFileName=(String)map.get("originalFileName");
				fileSize=(long)map.get("fileSize");
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		logger.info("파일이름, fileName={}",fileName);
		guestVo.setUserId(userId);
		guestVo.setUserProfileImage(fileName);
		logger.info("VO세팅 결과 userId={},userProfileImage={}",guestVo.getUserId(),guestVo.getUserProfileImage());
		int cnt = guestService.updateUserProfileImage(guestVo);
		logger.info("상품등록 처리 결과, cnt={}",cnt);
		
		model.addAttribute("guestVo",guestVo);
		
		//최근 본 상품 쿠키 불러오기
		Cookie[] cookies=request.getCookies();
		
		List<Map<String, Object>> todaySdList = new ArrayList<Map<String, Object>>();
		if(cookies!=null){
	        for (int i=0; i<cookies.length; i++) {
	            if (cookies[i].getName().startsWith("today")) {
	            	logger.info("cookieName={}",cookies[i].getName());
	            	Map<String,Object> map=spaceService.selectSpaceFileViewBySpaceNum(cookies[i].getValue());
	            	todaySdList.add(map);
	            }
	        }
	        Collections.reverse(todaySdList);//최신 순으로
	        logger.info("쿠키찾기 결과 todaySd={}",todaySdList);
	    }
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int totalRecord=todaySdList.size();
		int pageSize=3;
		int blockSize=1;
		PagingVO pageVo = new PagingVO(currentPage,totalRecord,pageSize,blockSize);
		//최근 본 상품 끝
		
		model.addAttribute("todaySdList",todaySdList);
		model.addAttribute("pageVo",pageVo);
		return "guest/myPage/myProfile";
	}

}
