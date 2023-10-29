package com.sc.spaceCollection.controller;

import java.io.PrintWriter;

import java.util.ArrayList;



import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.review.model.ReviewService;
import com.sc.spaceCollection.space.model.SpaceService;
import com.sc.spaceCollection.space.model.SpaceVO;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailService;
import com.sc.spaceCollection.spaceDetail.model.SpaceDetailVO;
import com.sc.spaceCollection.usermain.model.ApiExamCaptchaNkeyResult;
import com.sc.spaceCollection.usermain.model.Coupon;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserMainController {
   private static final Logger logger = LoggerFactory.getLogger(UserMainController.class);
   private final SpaceService spaceService;
   private final SpaceDetailService sdService;
   private final ReviewService reviewService;
   private final Coupon coupon;
   
   //사용자메인화면
   @RequestMapping("/")
   public String home(Model model) {
	   List<String> nullList = null; 
	   
       List<Map<String,Object>> list = spaceService.selectAll(1, 9,"",0,0,0,nullList,"SPACE_REG_DATE desc");
       logger.info("새로운 공간 보여주기, list.size={}", list.size());
       
       
     Map<String, String> mainImgList = new HashMap<>();
       for(int i = 0; i < list.size(); i ++) {
    	   String imgName = "S" + list.get(i).get("SPACE_NUM") + "Main";
    	   String mainImg = sdService.selectSpaceMainImg(imgName);
    	   
    	   mainImgList.put(list.get(i).get("SPACE_NUM")+"", mainImg);
       }
       
       
       
       List<Map<String, Object>> map = reviewService.selectNewReview();
       logger.info("리뷰, reviewlist={}", map.size());
       
       Map<String, Object> usercount = spaceService.usercount();
       logger.info("카운팅, userCounts={}", usercount);

       model.addAttribute("list", list);
       model.addAttribute("imgList", mainImgList);
       model.addAttribute("map", map);
       model.addAttribute("usercount", usercount);
       
       
       return "index";
   }
   
   
   //서비스약관
   @RequestMapping("/service")
   public String userChek() {
      return "userMain/service";
   }
   
   
   //회사소개
   @RequestMapping("/about")
   public String about() {
      return "userMain/about";
   }
   
   @RequestMapping("/captcha")
	public String captcha() {
		return "/userMain/captcha";
	}
   
   //사업자
   @RequestMapping("/Certificate")
   public String Certificate(Model model) {
	   return "userMain/Certificate";
   }
   
   //사업자
   @RequestMapping("/Certificate2")
   public String Certificate2() {
	   return "userMain/Certificate2";
   }
   
   @RequestMapping("/search")
   public String search_request() {
	   logger.info("검색창");
	   return "userMain/search";
   }
   
   @GetMapping("/getSearchData")
   @ResponseBody
   public List<Map<Map<String, Object>,List<String>>> search_get( 
		 @RequestParam int page, @RequestParam int size,
		 @RequestParam(required = false) String spaceName,
         @RequestParam(defaultValue = "0") int spaceTypeNo,
         @RequestParam(required = false) String region,
         @RequestParam(defaultValue = "0") int maxPeople,
         @RequestParam(defaultValue = "0") int minPrice,
         @RequestParam(defaultValue = "21000000") int maxPrice,
         @RequestParam(required = false) String filterList,
         @RequestParam(required = false) String order,
         Model model) {
	   
	   List<String> filterItem = null;
	  
	  if(filterList != null && !filterList.isEmpty()) {
		  filterItem = Arrays.asList(filterList.split(","));
	  }
	  
	  logger.info("변환 전 oredr = {}", order);
	  if(order != null && !order.isEmpty()) {
		  if(order.equals("spaceRegDate_desc")) {
			  order = "space_reg_date desc";
		  }else{
			  order = order.replace("_", " ");
		  }
	  }
	  logger.info("변환 후 oredr = {}", order);
	   
	  logger.info("filterList = {}", filterList); 
	  logger.info("spaceRegion = {}, maxPeople = {}", region,maxPeople); 
	  logger.info("minPrice = {}, maxPrice = {}", minPrice,maxPrice); 
	   
	  List<Map<Map<String, Object>,List<String>>> resultList = new ArrayList<>();
	  
	  
	  if((spaceName == null || spaceName.isEmpty()) && spaceTypeNo == 0) {
		 
		  List<Map<String, Object>> list = spaceService.selectAll(page, size,region,maxPeople,minPrice,maxPrice,filterItem,order);
	      
		  for(int i = 0; i < list.size(); i++) {
			  Map<Map<String, Object>, List<String>> tempMap = new HashMap<>();
			  String imgStr = "S" + String.valueOf(list.get(i).get("SPACE_NUM")) + "Sub";
			  List<String> imgList = sdService.selectSpaceImg(imgStr);
			  
			  
			  tempMap.put(list.get(i), imgList);
			  resultList.add(tempMap);
		  }
		  
         logger.info("공간 검색 리스트 조회, 결과 resultMap = {}", resultList);
         model.addAttribute("totalRecord", list.size());
	  }else if(spaceName != null && !spaceName.isEmpty()) {
         logger.info("검색창 공간 검색, 파라미터 spaceName = {}", spaceName);
         List<Map<String, Object>> list = spaceService.selectBySpaceName(page, size, spaceName,
        		 region,maxPeople,minPrice,maxPrice,filterItem,order);
            
		  for(int i = 0; i < list.size(); i++) {
			  Map<Map<String, Object>, List<String>> tempMap = new HashMap<>();
			  String imgStr = "S" + String.valueOf(list.get(i).get("SPACE_NUM")) + "Sub";
			  List<String> imgList = sdService.selectSpaceImg(imgStr);
			  
			  tempMap.put(list.get(i), imgList);
			  resultList.add(tempMap);
		  }
         
         logger.info("공간 검색 리스트 조회, 결과 resultMap = {}", resultList.size());
         
         model.addAttribute("totalRecord", resultList.size());
         
      }else if(spaceTypeNo != 0) {
		  logger.info("타입별 공간 리스트 조회, 파라미터 spaceTypeNo = {}, page = {}, size = {}", spaceTypeNo,page, size);
		  List<Map<String, Object>> list = spaceService.selectBySpaceType(page, size, spaceTypeNo,
	        		 region,maxPeople,minPrice,maxPrice,filterItem,order);
		  logger.info("타입별 공간 리스트 조회, 파라미터 list.size = {}", list.size());
		  
		  for(int i = 0; i < list.size(); i++) {
			  Map<Map<String, Object>, List<String>> tempMap = new HashMap<>();
			  String imgStr = "S" + String.valueOf(list.get(i).get("SPACE_NUM")) + "Sub";
			  List<String> imgList = sdService.selectSpaceImg(imgStr);
			  
			  tempMap.put(list.get(i), imgList);
			  resultList.add(tempMap);
		  }
      
      }
	  
	  for(Map<Map<String, Object>,List<String>> map : resultList) {
		  for (Entry<Map<String, Object>, List<String>> entry : map.entrySet()) {
			  entry.getKey().put("SPACE_REG_DATE", map.get("SPACE_REG_DATE")+"");
			}
	  }//timestamp 오류나서 String으로 변환*/
	  
	  model.addAttribute("list", resultList);
	  logger.info("공간 검색 리스트 조회, 결과 resultMap = {}", resultList.size());
      return resultList;
   }
   
   @GetMapping("/search/map")
   public String map(@RequestParam(required = false) String spaceName,
         @RequestParam(defaultValue = "0") int spaceTypeNo, Model model) {
	  List<String> imgList = new ArrayList<>();
	  List<Integer> priceList = new ArrayList();
	  List<SpaceDetailVO> sdList = new ArrayList<>();
	  Map<Map<SpaceVO, Integer>,List<String>> resultMap = new HashMap<>();
      if(spaceName != null && !spaceName.isEmpty()) {
         logger.info("검색창 공간 검색, 파라미터 spaceName = {}", spaceName);
         List<SpaceVO> list = spaceService.selectBySpaceNameMap(spaceName);
        
         for(int i = 0; i < list.size(); i++) {
           	Map<SpaceVO, Integer> tempMap = new HashMap<>();
           	Map<Map<SpaceVO, Integer>, List<String>> tempMap2 = new HashMap<>();
           	
           	
               sdList = sdService.selectBySpaceNo(list.get(i).getSpaceNum());
               imgList = sdService.selectSpaceImg("S" + list.get(i).getSpaceNum() + "Sub");
               list.get(i).setSpaceInfo(null);
               list.get(i).setSpaceWarn(null);
               list.get(i).setSpaceFacility(null);
               list.get(i).setSpaceIntro(null);
               
               int size= sdList.size();
               int averagePrice = 0;
               for(int j = 0; j < sdList.size(); j++) {
               	averagePrice += sdList.get(j).getSdPrice(); 
               }
               if(size == 0) {
            	   size = 1;
               }
               
               tempMap.put(list.get(i),averagePrice/size);
               resultMap.put(tempMap, imgList);
           }
         
         logger.info("공간 검색 리스트 조회, 결과 resultMap = {}", resultMap.size());
         model.addAttribute("title", spaceName);
         model.addAttribute("spaceMap", resultMap);
         model.addAttribute("totalRecord", resultMap.size());
         
      }else if(spaceTypeNo != 0 ) {
         logger.info("타입별 공간 리스트 조회, 파라미터 spaceType = {}", spaceTypeNo);
         List<SpaceVO> list = spaceService.selectBySpaceTypeMap(spaceTypeNo);
         
         logger.info("list.size = {}", list.size());
         for(int i = 0; i < list.size(); i++) {
           	Map<SpaceVO, Integer> tempMap = new HashMap<>();
           	Map<Map<SpaceVO, Integer>, List<String>> tempMap2 = new HashMap<>();
           	
           	
               sdList = sdService.selectBySpaceNo(list.get(i).getSpaceNum());
               imgList = sdService.selectSpaceImg("S" + list.get(i).getSpaceNum() + "Sub");
               list.get(i).setSpaceInfo(null);
               list.get(i).setSpaceWarn(null);
               list.get(i).setSpaceFacility(null);
               list.get(i).setSpaceIntro(null);
               
               int size= sdList.size();
               int averagePrice = 0;
               for(int j = 0; j < sdList.size(); j++) {
               	averagePrice += sdList.get(j).getSdPrice(); 
               }
               if(size == 0) {
            	   size = 1;
               }
               
               tempMap.put(list.get(i),averagePrice/size);
               resultMap.put(tempMap, imgList);
            }
         
         String typeName = spaceService.selectSpaceTypeName(spaceTypeNo);
         model.addAttribute("title", typeName);
         logger.info("타입별 공간 리스트 조회, 결과 resultMap = {}", resultMap.size());
         
         model.addAttribute("spaceMap", resultMap);
      }else if((spaceName == null || spaceName.isEmpty()) && spaceTypeNo == 0){
    	  logger.info("타입별 공간 리스트 조회, 파라미터 spaceType = {}", spaceTypeNo);
          List<SpaceVO> list = spaceService.selectAllMap();
          
          for(int i = 0; i < list.size(); i++) {
          	Map<SpaceVO, Integer> tempMap = new HashMap<>();
          	Map<Map<SpaceVO, Integer>, List<String>> tempMap2 = new HashMap<>();
          	
          	
              sdList = sdService.selectBySpaceNo(list.get(i).getSpaceNum());
              imgList = sdService.selectSpaceImg("S" + list.get(i).getSpaceNum() + "Sub");
              list.get(i).setSpaceInfo(null);
              list.get(i).setSpaceWarn(null);
              list.get(i).setSpaceFacility(null);
              list.get(i).setSpaceIntro(null);
              
              
              int size= sdList.size();
              int averagePrice = 0;
              for(int j = 0; j < sdList.size(); j++) {
              	averagePrice += sdList.get(j).getSdPrice(); 
              }
              if(size == 0) {
           	   size = 1;
              }
              
              tempMap.put(list.get(i),averagePrice/size);
              resultMap.put(tempMap, imgList);
           }
          
          logger.info("타입별 공간 리스트 조회, 결과 resultMap = {}", resultMap.size());
          model.addAttribute("title", "전체");
          model.addAttribute("spaceMap", resultMap);
      }
      
      return "userMain/map";
   }
   
   @GetMapping("/mapSideMenu")
   public String mapSideMenu(@RequestParam(defaultValue = "0") int spaceTypeNo
		   						,@RequestParam(required = false)String spaceName,
		   						@RequestParam(required = false)String order,
		   						@RequestParam(defaultValue = "0")int page, Model model) {
	   logger.info("map 사이드바, 파라미터 spaceTypeNo = {}, spaceName = {}, order = {}, page = {}",spaceTypeNo, spaceName, order, page);
	   
	   String title = "";
	   if(spaceTypeNo != 0) {
         List<SpaceVO> list = spaceService.selectBySpaceTypeMap(spaceTypeNo);
         List<Integer> priceList = new ArrayList();
         Map<SpaceVO, Integer> resultMap = new HashMap<>(); 
         
         for(int i = 0; i < list.size(); i++) {
            List<SpaceDetailVO> sdList = new ArrayList<>();
            sdList = sdService.selectBySpaceNo(list.get(i).getSpaceNum());
            
            int size= sdList.size();
            int averagePrice = 0;
            for(int j = 0; j < sdList.size(); j++) {
            	averagePrice += sdList.get(j).getSdPrice(); 
            }
            if(size == 0) {
            	   size = 1;
            }
            
            priceList.add(averagePrice/size);
            
            resultMap.put(list.get(i), priceList.get(i));
            
         }
         String typeName = spaceService.selectSpaceTypeName(spaceTypeNo);
         model.addAttribute("title", typeName);
         logger.info("타입별 공간 리스트 조회, 결과 resultMap = {}", resultMap.size());
         
         model.addAttribute("spaceMap", resultMap);
		 title = "공간타입 : " + spaceService.selectSpaceTypeName(spaceTypeNo);;
		  
	   }else if(spaceName != null && !spaceName.isEmpty()) {
	   logger.info("검색창 공간 검색, 파라미터 spaceName = {}", spaceName);
         List<SpaceVO> list = spaceService.selectBySpaceNameMap(spaceName);
         List<Integer> priceList = new ArrayList();
         Map<SpaceVO, Integer> resultMap = new HashMap<>(); 
         
         List<SpaceDetailVO> sdList = new ArrayList<>();
         
         for(int i = 0; i < list.size(); i++) {
            sdList = sdService.selectBySpaceNo(list.get(i).getSpaceNum());
            int size= sdList.size();
            int averagePrice = 0;
            for(int j = 0; j < sdList.size(); j++) {
            	averagePrice += sdList.get(j).getSdPrice(); 
            }
            if(size == 0) {
            	   size = 1;
            }
            
            priceList.add(averagePrice/size);
            
            
            resultMap.put(list.get(i), priceList.get(i));
         }
         logger.info("공간 검색 리스트 조회, 결과 resultMap = {}", resultMap.size());
         model.addAttribute("title", spaceName);
         model.addAttribute("spaceMap", resultMap);
         model.addAttribute("totalRecord", resultMap.size());
	         
		  title = "검색어 : " + spaceName;
		  
	   }else{
		  List<SpaceVO> list = spaceService.selectAllMap();
          List<Integer> priceList = new ArrayList();
          Map<SpaceVO, Integer> resultMap = new HashMap<>(); 
          
          for(int i = 0; i < list.size(); i++) {
             List<SpaceDetailVO> sdList = new ArrayList<>();
             sdList = sdService.selectBySpaceNo(list.get(i).getSpaceNum());
             int size= sdList.size();
             int averagePrice = 0;
             for(int j = 0; j < sdList.size(); j++) {
             	averagePrice += sdList.get(j).getSdPrice(); 
             }
             if(size == 0) {
             	   size = 1;
             }
             
             priceList.add(averagePrice/size);
             
             resultMap.put(list.get(i), priceList.get(i));
             
          }
          logger.info("타입별 공간 리스트 조회, 결과 resultMap = {}", resultMap.size());
          model.addAttribute("title", "전체");
          model.addAttribute("spaceMap", resultMap);
		  title = "전체";
	   }
	   model.addAttribute("title", title);
	   return "userMain/mapSideMenu";
   }
   
   
}