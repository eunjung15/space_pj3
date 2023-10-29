package com.sc.spaceCollection.controller;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//컨트롤러가 수행하기 전 수행돼서 사용자의 요청을 컨트롤러에게 전달하기 전에 호출된다.
		
		//세션에 저장된 아이디 받아오기
		String userId = (String) request.getSession().getAttribute("userId");
		logger.info("preHandler 호출, userId = {}", userId);
		
		//로그인 안한 경우
		if (userId == null || userId.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");	//text/html;charset=utf-8 타입의 문서로 보낸다고 설정
			PrintWriter out = response.getWriter();	//문자 형태로 응답한다고 설정
			
			out.print("<script>");
			out.print("alert('로그인 후 이용이 가능합니다.');");
			out.print("location.href='" + request.getContextPath() + "/login/login';");
			out.print("</script>");
			
			return false;
		} else {
			
			return true;	//다음 컨트롤러 수행
		}
		
	}//

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("postHandle 호출");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("afterCompletion 호출");
	}
	
}
