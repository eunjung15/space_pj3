package com.sc.spaceCollection.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.common.Encryption;
import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.guest.model.GuestVO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/guest")
public class GuestController {
	private static final Logger logger = LoggerFactory.getLogger(GuestController.class);
	
	private final GuestService guestService;
	
	private final Encryption encryption;
	
	@GetMapping("/register")
	public void register_get() {
		logger.info("회원가입 페이지");
	}
	
	@PostMapping("/register")
	public String register_post(@ModelAttribute GuestVO guestVo,Model model) {
		logger.info("회원가입 처리, 파라미터 GuestVO={}",guestVo);
		
		String salt=encryption.getSalt();
		guestVo.setSalt(salt);
		logger.info("salt 불러오기 salt={}",salt);
		
		String hex=encryption.getEncryption(salt,guestVo.getUserPwd());
		guestVo.setUserPwd(hex);
		logger.info("userPwd=>hex변환 hex={}",hex);
		
		int cnt = guestService.insertGuest(guestVo);
		
		String msg="회원가입의 실패하셨습니다.", url="guest/register";
		if(cnt>0) {
			msg=guestVo.getUserId()+"님 가입을 추카드려요.";
			url="/login/login";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@ResponseBody
	@RequestMapping("/ajaxCheckId")
	public boolean ajaxCheckId(@RequestParam(required = false) String userId) {
		//1
		logger.info("ajax 이용 - 아이디 중복확인, 파라미터 userid={}", userId);
		
		//2
		int result=guestService.guestCheckId(userId);
		logger.info("아이디 중복확인 결과, result={}", result);
		
		boolean bool=false;
		if(result==GuestService.EXIST_ID) {
			bool=true;  //이미 존재
		}else if(result==GuestService.NONE_EXIST_ID) {
			bool=false; //존재하지 않음
		}
		
		return bool;
		//http://localhost:9091/herb/member/ajaxCheckId?userid=hong7
	}
	
	
	@ResponseBody
	@GetMapping("/getUserInfo")
	public GuestVO getUserInfo(@RequestParam String userId) {
		//1
		logger.info("ajax 이용 - 회원정보 조회, 파라미터 userid={}", userId);
		
		//2
		GuestVO vo = new GuestVO();
		vo =guestService.selectUserInfo(userId);
		logger.info("회원정보 조회 결과, vo={}", vo);
		
		return vo;
	}
	

	
	@GetMapping("/findPwd")
	public String findPwd() {
		logger.info("비밀번호 찾기 페이지, 파라미터");
		return "find/findPwd";
	}
	
	@PostMapping("/findPwd")
	public String findPwd(@RequestParam String userId,Model model) {
		logger.info("비밀번호 찾기 처리, 파라미터 userId={}",userId);
		
		int cnt=guestService.guestCheckId(userId);
		logger.info("회원 조회 결과, cnt={}",cnt);
		if(cnt<1) {
			model.addAttribute("msg","등록된 회원정보가 없습니다");
			model.addAttribute("url","/find/findPwd");
			return "common/message";
		}
		
		return "redirect:/email/emailCheck?type=findPwd&userId="+userId;
	}
	
	@RequestMapping("/findId")
	public String findId() {
		logger.info("비밀번호 찾기 페이지, 파라미터");
		return "find/findId";
	}
	
	@RequestMapping("/completeFindId")
	public String completeFindId(@RequestParam String userEmail,Model model) {
		logger.info("아이디 찾기 성공, 파라미터 userEmail={}",userEmail);
		
		if(userEmail==null || userEmail.isEmpty()) {
			String msg="잘못된 url입니다.", url="/";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "common/message";
		}
		
		List<GuestVO> guestVo = guestService.selectUserIdByEmail(userEmail);
		logger.info("아이디 찾기 성공, 유저 정보 guestVo={}",guestVo);
		
		model.addAttribute("guestVo",guestVo);
		
		return "find/completeFindId";
	}
	
	@GetMapping("/completeFindPwd")
	public String completeFindPwd(@RequestParam String userId,@RequestParam(required = false) String complete,Model model) {
		logger.info("비밀번호 찾기 재설정페이지, 파라미터 userId={}",userId);
		
		model.addAttribute("userId",userId);
		
		return "find/completeFindPwd";
	}
	
	@GetMapping("/editInfo")
	public void editInfo_get(HttpSession session, Model model) {
		String userId=(String)session.getAttribute("userId");
		logger.info("회원정보 수정 처리 페이지, 파라미터 userId={}",userId);
		
		GuestVO guestVo=guestService.selectUserInfo(userId);
		logger.info("회원정보 불러오기 결과, guestVo={}",guestVo);
		
		model.addAttribute("guestVo",guestVo);
		
	}
	
	@GetMapping("/deleteGuest")
	public String deleteGuest(HttpSession session,HttpServletResponse response,Model model) {
		String userId=(String)session.getAttribute("userId");
		logger.info("사용자 회원 탈퇴 처리 파라미터 userId={}",userId);
		int cnt = guestService.deleteUser(userId);
		logger.info("회원 탈퇴 결과 cnt={}",cnt);
		
		String msg="회원 탈퇴를 실패했습니다.", url="/guest/myPage/myProfile";
		if(cnt>0) { //회원탈퇴 성공했을경우
			session.invalidate(); //세션 삭제
			Cookie ck = new Cookie("ck_userid", userId);
			ck.setPath("/");
			ck.setMaxAge(0); //쿠키 삭제
			response.addCookie(ck);
			
			msg="회원탈퇴가 성공적으로 완료되었습니다!";
			url="/";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@ResponseBody
	@PostMapping("/editName")
	public boolean editName(@RequestParam String userName,HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		logger.info("ajax이용 - editName, 파라미터 userName={}, userId={}"
				, userName, userId);
		GuestVO guestVo = new GuestVO();
		guestVo.setUserName(userName);
		guestVo.setUserId(userId);
		int cnt = guestService.updateUserName(guestVo);
		logger.info("사용자 닉네임 변경 결과, cnt={}",cnt);
		boolean bool=false;
		if(cnt>0) {
			bool=true;
		}
		return bool;
	}
	
	@ResponseBody
	@PostMapping("/editHp")
	public boolean editHp(@RequestParam String userHp, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		logger.info("ajax이용 - editHp, 파라미터 userHp={}, userId={}",userHp,userId);
		GuestVO guestVo = new GuestVO();
		guestVo.setUserHp(userHp);
		guestVo.setUserId(userId);
		int cnt = guestService.updateUserHp(guestVo);
		logger.info("사용자 번호 변경 결과, cnt={}",cnt);
		boolean bool=false;
		if(cnt>0) {
			bool=true;
		}
		return bool;
	}
	
	@ResponseBody
	@GetMapping("/agreementSms")
	public String agreementSms(@RequestParam String userMarketingSmsOk, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		logger.info("이용자 SMS 동의여부 변경처리 파라미터, userId={},userMarketingSmsOk={}"
													,userId,userMarketingSmsOk);
		GuestVO vo = new GuestVO();
		vo.setUserId(userId);
		vo.setUserMarketingSmsOk(userMarketingSmsOk);
		
		int cnt = guestService.updateAgreementSms(vo);
		String result="failUpdate";
		if(cnt>0) {
			result = vo.getUserMarketingSmsOk();
		}
		return result;
		
	}
	
	@ResponseBody
	@GetMapping("/agreementEmail")
	public String agreementEmail(@RequestParam String userMarketingEmailOk, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		logger.info("이용자 Email 동의여부 변경처리 파라미터, userId={},userMarketingEmailOk={}"
				,userId,userMarketingEmailOk);
		GuestVO vo = new GuestVO();
		vo.setUserId(userId);
		vo.setUserMarketingEmailOk(userMarketingEmailOk);
		
		int cnt = guestService.updateAgreementEmail(vo);
		String result="failUpdate";
		if(cnt>0) {
			result = vo.getUserMarketingEmailOk();
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/editPwd")
	public boolean editPwd(@RequestParam String userPwd,HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		logger.info("이용자 비밀번호 변경처리 파라미터, userId={},userPwd={}",userId,userPwd);

		//salt추출
		GuestVO vo = new GuestVO();
		String salt=encryption.getSalt();
		logger.info("salt 불러오기 salt={}",salt);
		//hex변환
		String hex=encryption.getEncryption(salt,userPwd);
		logger.info("userPwd=>hex변환 hex={}",hex);
		vo.setUserId(userId);
		vo.setSalt(salt);
		vo.setUserPwd(hex);
		int cnt = guestService.updateUserPwd(vo);
		logger.info("비밀번호 재설정 결과 cnt={}",cnt);
		boolean bool=false;
		if(cnt>0) {
			bool = true;
		}
		return bool;
	}
	
	@ResponseBody
	@RequestMapping("/resetPwd")
	public boolean resetPwd(@RequestParam String userId, @RequestParam String userPwd, Model model) {
		logger.info("Ajax-비밀번호 재설정 처리, 파라미터 userId={}, userPwd={}",userId,userPwd);
		//salt추출
		GuestVO vo = new GuestVO();
		String salt=encryption.getSalt();
		logger.info("salt 불러오기 salt={}",salt);
		//hex변환
		String hex=encryption.getEncryption(salt,userPwd);
		logger.info("userPwd=>hex변환 hex={}",hex);
		vo.setUserId(userId);
		vo.setSalt(salt);
		vo.setUserPwd(hex);
		int cnt = guestService.updateUserPwd(vo);
		logger.info("비밀번호 재설정 결과 cnt={}",cnt);
		boolean bool=false;
		if(cnt>0) {
			bool=true;
		}
		
		return bool;
	}
	
	
}
