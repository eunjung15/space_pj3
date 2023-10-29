package com.sc.spaceCollection.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.collection.model.CollectionService;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class collectionController {
	private final CollectionService collectionService;
	private final SpaceDetailService sdService;
	private static final Logger logger = LoggerFactory.getLogger(collectionController.class);
	
	
	@GetMapping("/collection")
	public String collection(@RequestParam int scCode, Model model) {
		logger.info("기획전 조회, 파라미터 scNum = {}",scCode);
		
		Map<String, String> collectionName = collectionService.selectCollectionName(scCode);
		
		model.addAttribute("collectionName", collectionName);
		logger.info("기획전 이름 = {}", collectionName);
		return "collection/collection";
	}
	
	
	@GetMapping("/getCollection")
	@ResponseBody
	public List<Map<Map<String, Object>,List<String>>> collectionList(@RequestParam int scCode) {
		logger.info("기획전 데이터 가져오기, 파라미터 scNum = {}",scCode);
		
		List<Map<Map<String, Object>,List<String>>> resultList = new ArrayList<>();
		List<Map<String, Object>> list = collectionService.showCollectionList(scCode);
		
		for(int i = 0; i < list.size(); i++) {
			  Map<Map<String, Object>, List<String>> tempMap = new HashMap<>();
			  String imgStr = "S" + String.valueOf(list.get(i).get("SPACE_NUM")) + "Sub";
			  List<String> imgList = sdService.selectSpaceImg(imgStr);
			  
			  
			  tempMap.put(list.get(i), imgList);
			  resultList.add(tempMap);
		  }
		logger.info("resultList.size = {}", resultList.size());
		for(Map<String, Object> map : list) {
			  map.put("SPACE_REG_DATE", map.get("SPACE_REG_DATE")+"");
		}//timestamp 오류나서 String으로 변환
		return resultList;
	}
}
