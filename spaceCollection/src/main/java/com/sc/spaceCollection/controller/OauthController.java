package com.sc.spaceCollection.controller;

import java.util.HashMap;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sc.spaceCollection.common.Utility;
import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.guest.model.GuestVO;
import com.sc.spaceCollection.oauth.model.OauthService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/oauth")
@RequiredArgsConstructor
public class OauthController {
	private static final Logger logger = LoggerFactory.getLogger(OauthController.class);
	
	private final OauthService oauthService;
	private final GuestService guestService;
	
	@RequestMapping("/kakao")
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request) {
		/*
		 * if(!error.isEmpty() || error!=null) {
		 * logger.info("kakao 로그인 실패 error={}",error); }
		 */
		
		logger.info("카카오 로그인 처리, 파라미터 code={}",code);
		
		String access_Token=oauthService.getKakaoAccessToken(code);
		logger.info("토큰 불러오기 결과 access_Token={}",access_Token);
		
		HashMap<String, Object> userInfo = oauthService.getKakaoUserInfo(access_Token);
		logger.info("카카오 회원정보 불러오기 결과 userInfo={}",userInfo);
		
		GuestVO guestVo = new GuestVO();
		
		//keySet().iterator()
		Iterator<String> keys = userInfo.keySet().iterator();
		while(keys.hasNext()){
		    String key = keys.next();
		    System.out.println("[Key]:" + key + " [Value]:" +  userInfo.get(key));
		    String id=(String) userInfo.get("id");
		    String nickname=(String) userInfo.get("nickname");
		    String image=(String) userInfo.get("profile_image");
		    guestVo.setUserName(nickname); //VO에 받아온 kakao정보 넣기
		    guestVo.setUserId("kakao_"+id);
		    guestVo.setUserProfileImage(image);
		    guestVo.setUserSnsCode("kakao");
		    logger.info("카카오 정보 처리, KakaoVO=[UserName={},UserId={}, UserProfileImage={}, UserSnsCode={}]"
		    		,guestVo.getUserName(),guestVo.getUserId(),guestVo.getUserProfileImage(),guestVo.getUserSnsCode());
		    
		    int cnt = guestService.selectKakaoUser(guestVo); //이미 카카오로 등록된 계정이 있는지 확인
		    logger.info("카카오 회원 조회 결과, cnt={}",cnt);
		    int result=0;
		    if(cnt<1) { //카카오로 저장된 정보가 DB에 없을 경우 회원가입처리
		    	result=guestService.insertKakaoUser(guestVo);
		    }else if(cnt>0) { //만약 회원정보 있을경우 업데이트
				result=guestService.updateKakaoUser(guestVo);
		    }
		    logger.info("카카오 회원 DB처리 결과, result={}",result);
		    
		 // session
		 HttpSession session = request.getSession();
		 session.setAttribute("userId", guestVo.getUserId());
		 session.setAttribute("code", "kakao");
		}
		return "redirect:/";
	}
	
	@RequestMapping("/naver")
	public String naverLogin(@RequestParam("code") String code,	HttpServletRequest request) {
		
		/*
		 * if(!error.isEmpty() || error!=null) {
		 * logger.info("네이버 로그인 실패 error={}",error); }
		 */
		
		logger.info("네이버 로그인 처리, 파라미터 code={}",code);
		
		String access_Token=oauthService.getNaverAccessToken(code);
		logger.info("네이버 access_Token 불러오기 결과={}",access_Token);
		
		HashMap<String, Object> userInfo = oauthService.getNaverUserInfo(access_Token);
		logger.info("네이버 회원정보 불러오기 결과 userInfo={}",userInfo);
		
		GuestVO guestVo = new GuestVO();
		
		//keySet().iterator()
		Iterator<String> keys = userInfo.keySet().iterator();
		while(keys.hasNext()){
		    String key = keys.next();
		    System.out.println("[Key]:" + key + " [Value]:" +  userInfo.get(key));
		    String nickname=(String) userInfo.get("nickname");
		    String email=(String) userInfo.get("email");
		    String image=(String) userInfo.get("profile_image");
		    String mobile=(String) userInfo.get("mobile");
		    guestVo.setUserId("naver_"+nickname); //VO에 받아온 네이버정보 넣기
		    guestVo.setUserName(nickname); 
		    guestVo.setUserEmail(email);
		    guestVo.setUserProfileImage(image);
		    guestVo.setUserHp(mobile);
		    guestVo.setUserSnsCode("naver");
		    logger.info("네이버 정보 처리, naverVO=[UserName={},UserId={}, UserEmail={}, UserProfileImage={}, UserSnsCode={}, UserHp={},]"
		    		,guestVo.getUserName(),guestVo.getUserId(),guestVo.getUserEmail()
		    		,guestVo.getUserProfileImage(),guestVo.getUserSnsCode(),guestVo.getUserHp());
		    
		    int cnt = guestService.selectNaverUser(guestVo); //이미 네이버로 등록된 계정이 있는지 확인
		    logger.info("네이버 회원 조회 결과, cnt={}",cnt);
		    int result=0;
		    if(cnt<1) { //네이버로 저장된 정보가 DB에 없을 경우 회원가입처리
		    	result=guestService.insertNaverUser(guestVo);
		    	logger.info("네이버 회원 등록 결과, result={}",result);
		    }else if(cnt>0) { //만약 회원정보 있을경우 업데이트
		    	result=guestService.updateNaverUser(guestVo);
		    }
		    
		    logger.info("네이버 DB저장 결과, result={}",result);
		    
		 // session
		 HttpSession session = request.getSession();
		 session.setAttribute("userId", guestVo.getUserId());
		 session.setAttribute("code", "naver");
		}
		
		return "redirect:/";
		
	}
}
