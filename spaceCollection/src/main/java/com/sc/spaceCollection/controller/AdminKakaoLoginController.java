package com.sc.spaceCollection.controller;


import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminKakaoLoginController {
	
	@RequestMapping("/admin/adminKakaoLogin")
	public String adminKakaoLogin(@RequestParam("code") String code) {
		String client_id = "15dc3b6f1122f8cd6e57caf12231842b";
		String redirect_uri = "http://59.6.102.18:9091/spaceCollection/admin/adminKakaoLogin";
		
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add(httpHeaders.CONTENT_TYPE, "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", client_id);
		params.add("redirect_uri", redirect_uri);
		params.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(params, httpHeaders);
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<Object> response = restTemplate.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, httpEntity, Object.class);
		
		System.out.println(response);
		
		return "admin/adminMain";
	}
}
