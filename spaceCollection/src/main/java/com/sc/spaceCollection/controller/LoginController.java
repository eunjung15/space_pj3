package com.sc.spaceCollection.controller;

import java.io.IOException;

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

import com.sc.spaceCollection.common.Encryption;
import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.guest.model.GuestVO;

import jakarta.mail.Session;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/login")
@RequiredArgsConstructor
public class LoginController {
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
	
	private final GuestService guestService;
	private final Encryption encryption;
	@GetMapping("/login")
	public String Login_get() {
		logger.info("로그인 화면 처리");
		
		return "login/login";
	}
	
	@PostMapping("/login")
	public String Login_post(@RequestParam String userId, @RequestParam String userPwd,
			@RequestParam(required = false) String chkSave, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		
		logger.info("사용자 로그인 처리, 파라미터 userId={}, userPwd={}, chkSave={}",userId, userPwd, chkSave);
		
		// 2 DB작업
		String userSalt=guestService.selectUserSalt(userId);
		logger.info("사용자 salt 불러오기 결과, userSalt={}",userSalt);
		
		String hex=encryption.getEncryption(userSalt, userPwd);
		logger.info("hex값 변환 결과, hex={}",hex);
		
		String msg = "로그인 처리 실패", url = "/login/login";
		int result = guestService.loginCheck(userId, hex);
		logger.info("로그인 처리 결과, result={}", result);

		if (result == GuestService.LOGIN_OK) {
			msg = userId + "님 로그인되었습니다.";
			url = "/";

			// session
			HttpSession session = request.getSession();
			session.setAttribute("userId", userId);

			// cookie
			Cookie ck = new Cookie("ck_userId", userId);
			ck.setPath("/");
			if (chkSave != null) { // 저장하기 체크한 경우
				ck.setMaxAge(1000 * 24 * 60 * 60); // 1000일
				response.addCookie(ck);
			} else {
				ck.setMaxAge(0); // 쿠키 제거
				response.addCookie(ck);
			}
		} else if (result == GuestService.PWD_DISAGREE) {
			msg = "비밀번호가 일치하지 않습니다.";
		} else if (result == GuestService.USERID_NONE) {
			msg = "해당 아이디가 존재하지 않습니다.";
		}

		// 3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		// 4
		return "common/message";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		session.removeAttribute("userId");
		session.removeAttribute("code");
		
		return "login/login";
	}
	
	
	/**
     * 카카오 callback
     * [GET] /oauth/kakao/callback
     */
    @ResponseBody
    @GetMapping("/kakao")
    public void kakaoCallback(@RequestParam String code) {
        System.out.println(code);
    }
	

}
