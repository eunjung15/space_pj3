package com.sc.spaceCollection.email;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sc.spaceCollection.guest.model.GuestService;

import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	private final EmailSender emailSender;
	private final GuestService guestService;
	
	@RequestMapping("/emailCheck")
	public String emailCheck() {
		logger.info("이메일 인증 화면 처리");
		
		return "email/emailCheck";
	}
	
	@Transactional
	@RequestMapping("/sendEmail")
	public String sendeMail(@RequestParam(required = false) String userEmail,@RequestParam(required = false)String userId
			,@RequestParam(required = false)String type, Model model) {
		
		logger.info("이메일 인증 처리, 파라미터 userEmail={},type={},userId={}",userEmail,type,userId);
		String msg="등록된 이메일이 없습니다.", url="/email/emailCheck?type="+type;
		
		if(type.equals("findId")) { //아이디 찾기인 경우
			int cnt = guestService.selectCountEmail(userEmail);
			logger.info("이메일로 아이디 조회결과, cnt={}",cnt);
			if(cnt<1) {
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
				return "common/message";
			}
		}else if(type.equals("register")){ //회원가입 인 경우
			int cnt = guestService.selectCountEmail(userEmail);
			logger.info("이메일로 아이디 조회결과, cnt={}",cnt);
			if(cnt>0) {
				msg="이미 가입된 이메일입니다.";
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
				return "common/message";
			}
		}else if(type.equals("findPwd")) {
			int cnt=guestService.countByUserIdUserEmail(userId, userEmail);
			logger.info("비밀번호 찾기 아이디,이메일 일치조회 결과, cnt={}",cnt);
			if(cnt<1) {
				msg="일치하는 회원정보가 없습니다.";
				url="/guest/findPwd";
				model.addAttribute("msg",msg);
				model.addAttribute("url",url);
				return "common/message";
			}
		}
		
		
		
		int authCode=(int)(Math.random() * 899999) + 100000;//100000~999999 난수 생성
		logger.info("난수 생성처리, authCode={}",authCode);
		String receiver = userEmail; //받는사람 이메일 주소
		String subject = "스페이크 컬렉션 인증메일 입니다.";
		String content = "인증번호는 : "+authCode+" 입니다";
		String sender = "pcdno3@naver.com"; //보내는 사람의 이메일 주소
							//앞서 설정한 본인의 Naver Email
		logger.info("메일 발송처리, 파라미터 receiver={},content={}",receiver,content);
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("메일 발송 성공!");
			
		} catch (MessagingException e) {
			e.printStackTrace();
			logger.info("메일 발송 실패 : " + e.getMessage());
		}
		
		model.addAttribute("authCode",authCode);
		model.addAttribute("acEamil",userEmail);
		return "email/emailCheck";
		
	}
	
	
}
