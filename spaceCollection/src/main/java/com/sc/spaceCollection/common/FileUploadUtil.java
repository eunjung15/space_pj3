package com.sc.spaceCollection.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Component
public class FileUploadUtil {
	private static final Logger logger = LoggerFactory.getLogger(FileUploadUtil.class);

	public List<Map<String, Object>> fileupload(HttpServletRequest request,
			int pathFlag) throws IllegalStateException, IOException {
		//파일 업로드 처리
		MultipartHttpServletRequest multiRequest 
		= (MultipartHttpServletRequest) request;

		Map<String, MultipartFile> fileMap=multiRequest.getFileMap();
		//List<MultipartFile> files =multiRequest.getFiles("upfile");

		//여러개 업로드된 파일의 정보를 저장할 리스트
		List<Map<String, Object>> resultList = new ArrayList<>();

		Iterator<String> iter = fileMap.keySet().iterator();
		while(iter.hasNext()) {
			String key=iter.next();
			MultipartFile tempFile = fileMap.get(key);//업로드된 파일을 임시파일 형태로 제공
			if(!tempFile.isEmpty()) { //파일이 업로드된 경우
				long fileSize=tempFile.getSize(); //파일 크기
				String originName=tempFile.getOriginalFilename(); //변경전 파일명

				//변경된 파일 이름
				String fileName = getUniqueFileName(originName);

				//파일 업로드 처리
				String uploadPath = getUploadPath(request, pathFlag);
				File file = new File(uploadPath, fileName);
				tempFile.transferTo(file);

				//업로드 파일 정보 저장
				Map<String, Object> resultMap = new HashMap<>();
				resultMap.put("fileName", fileName);
				resultMap.put("originalFileName", originName);
				resultMap.put("fileSize", fileSize);

				resultList.add(resultMap);
			}//if			
		}//while

		return resultList;
	}
	
	public List<Map<String, Object>> userProfileupload(HttpServletRequest request,
			int pathFlag, String userId) throws IllegalStateException, IOException {
		//파일 업로드 처리
		MultipartHttpServletRequest multiRequest 
		= (MultipartHttpServletRequest) request;
		
		Map<String, MultipartFile> fileMap=multiRequest.getFileMap();
		//List<MultipartFile> files =multiRequest.getFiles("upfile");
		
		//여러개 업로드된 파일의 정보를 저장할 리스트
		List<Map<String, Object>> resultList = new ArrayList<>();
		
		Iterator<String> iter = fileMap.keySet().iterator();
		while(iter.hasNext()) {
			String key=iter.next();
			MultipartFile tempFile = fileMap.get(key);//업로드된 파일을 임시파일 형태로 제공
			if(!tempFile.isEmpty()) { //파일이 업로드된 경우
				long fileSize=tempFile.getSize(); //파일 크기
				String originName=tempFile.getOriginalFilename(); //변경전 파일명
				
				//변경된 파일 이름
				String fileName = getUserIdFileName(originName,userId);
				
				//파일 업로드 처리
				String uploadPath = getUploadPath(request, pathFlag);
				File file = new File(uploadPath, fileName);
				tempFile.transferTo(file);
				
				//업로드 파일 정보 저장
				Map<String, Object> resultMap = new HashMap<>();
				resultMap.put("fileName", fileName);
				resultMap.put("originalFileName", originName);
				resultMap.put("fileSize", fileSize);
				
				resultList.add(resultMap);
			}//if			
		}//while
		
		return resultList;
	}
	
	public List<Map<String, Object>> spaceImageUpload(HttpServletRequest request,
			int pathFlag, int spaceNum) throws IllegalStateException, IOException {
		//파일 업로드 처리
		MultipartHttpServletRequest multiRequest 
		= (MultipartHttpServletRequest) request;
		
		//Map<String, MultipartFile> fileMap=multiRequest.getFileMap();
		MultipartFile license =multiRequest.getFile("license");
		MultipartFile spaceMain =multiRequest.getFile("spaceMain");
		List<MultipartFile> spaceSub =multiRequest.getFiles("spaceSub");
		
		//여러개 업로드된 파일의 정보를 저장할 리스트
		List<Map<String, Object>> resultList = new ArrayList<>();
		logger.info("1. license = {}, empty= {}", license, license.isEmpty() );
		logger.info("1. spaceMain = {}, empty= {}", spaceMain, spaceMain.isEmpty() );
		logger.info("1. spaceSub = {}, empty= {}", spaceSub, spaceSub.isEmpty() );
		//license
		if (!license.isEmpty()) { // 파일이 업로드된 경우
			long fileSize = license.getSize(); // 파일 크기
			String originName = license.getOriginalFilename(); // 변경전 파일명

			// 변경된 파일 이름
			String fileName = getLicenseFileName(originName, spaceNum);

			// 파일 업로드 처리
			String uploadPath = getUploadPath(request, pathFlag);
			File file = new File(uploadPath, fileName);
			license.transferTo(file);

			// 업로드 파일 정보 저장
			Map<String, Object> resultMap = new HashMap<>();
			resultMap.put("fileName", fileName);
			resultMap.put("originalFileName", originName);
			resultMap.put("fileSize", fileSize);

			resultList.add(resultMap);
			logger.info("license = ", resultList);
		} // if	
		
		//spaceMain
		if (!spaceMain.isEmpty()) { // 파일이 업로드된 경우
			long fileSize = spaceMain.getSize(); // 파일 크기
			String originName = spaceMain.getOriginalFilename(); // 변경전 파일명

			// 변경된 파일 이름
			String fileName = getSpaceMainFileName(originName, spaceNum);

			// 파일 업로드 처리
			String uploadPath = getUploadPath(request, pathFlag);
			File file = new File(uploadPath, fileName);
			spaceMain.transferTo(file);

			// 업로드 파일 정보 저장
			Map<String, Object> resultMap = new HashMap<>();
			resultMap.put("fileName", fileName);
			resultMap.put("originalFileName", originName);
			resultMap.put("fileSize", fileSize);

			resultList.add(resultMap);
			logger.info("spaceMain = {}", resultList);
		} // if
		
		//spaceSub
		for(int i = 0; i < spaceSub.size(); i++) {
			MultipartFile tempFile = spaceSub.get(i);//업로드된 파일을 임시파일 형태로 제공
			if(!tempFile.isEmpty()) { //파일이 업로드된 경우
				long fileSize=tempFile.getSize(); //파일 크기
				String originName=tempFile.getOriginalFilename(); //변경전 파일명
				
				//변경된 파일 이름
				String fileName = getSpaceSubFileName(originName, spaceNum, i);
				
				//파일 업로드 처리
				String uploadPath = getUploadPath(request, pathFlag);
				File file = new File(uploadPath, fileName);
				tempFile.transferTo(file);
				
				//업로드 파일 정보 저장
				Map<String, Object> resultMap = new HashMap<>();
				resultMap.put("fileName", fileName);
				resultMap.put("originalFileName", originName);
				resultMap.put("fileSize", fileSize);
				
				resultList.add(resultMap);
				logger.info("spaceSub = {}", resultList);
			}//if			
		}//while
		
		logger.info("전체 = {}", resultList );
		return resultList;
	}
	


	public String getUploadPath(HttpServletRequest request, int pathFlag) {
		//업로드 경로 구하기
		String path="";

		if(ConstUtil.FILE_UPLOAD_TYPE.equals("test")) {
			if(pathFlag== ConstUtil.UPLOAD_FILE_FLAG) {  //자료실
				//path=request.getContextPath() + ConstUtil.FILE_UPLOAD_PATH_TEST;
				path=request.getSession().getServletContext().getRealPath(ConstUtil.FILE_UPLOAD_PATH_TEST);
			}else if(pathFlag==ConstUtil.UPLOAD_IMAGE_FLAG) { //상품 이미지 업로드
				path=request.getSession().getServletContext().getRealPath(ConstUtil.IMAGE_FILE_UPLOAD_PATH_TEST);				
			}else if(pathFlag==ConstUtil.UPLOAD_USER_IMAGE_FLAG) { //유저 프로필 이미지 업로드
				path=request.getSession().getServletContext().getRealPath(ConstUtil.USER_IMAGE_FILE_UPLOAD_PATH_TEST);
			} else if (pathFlag == ConstUtil.UPLOAD_SPACE_IMAGE_FLAG) {	//공간 이미지 업로드
				path = request.getSession().getServletContext().getRealPath(ConstUtil.SPACE_IMAGE_FILE_UPLOAD_PATH_TEST);
			}
		}else {  //deploy
			if(pathFlag== ConstUtil.UPLOAD_FILE_FLAG) {  //자료실
				path=ConstUtil.FILE_UPLOAD_PATH;  //pds_upload
			}else if(pathFlag==ConstUtil.UPLOAD_IMAGE_FLAG) { //상품 이미지 업로드
				path=ConstUtil.IMAGE_FILE_UPLOAD_PATH;//pd_images				
			}

			//실제 물리적인 경로 구하기
			//path=request.getSession().getServletContext().getRealPath(path);
		}

		logger.info("업로드 경로 : {}", path);

		return path;
	}

	public String getDateTimeStamp() {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String result = sdf.format(d);
		logger.info("날짜 밀리초 : {}", result);

		return result;
	}

	public String getUniqueFileName(String originName) {
		//ab.txt => ab_밀리초.txt
		int idx = originName.lastIndexOf(".");
		String fName = originName.substring(0,idx); //ab
		String ext = originName.substring(idx); //.txt

		String result = fName+"_"+getDateTimeStamp()+ ext;
		logger.info("변경된 파일명 : {}", result);

		return result;
	}
	
	public String getUserIdFileName(String originName,String userId) {
		int idx = originName.lastIndexOf(".");
		String ext = originName.substring(idx); //.txt
		String result= userId+ext;
		logger.info("변경된 파일명 : {}", result);
		
		return result;
	}
	
	//사업자 등록증
	public String getLicenseFileName(String originName, int spaceNum) {
		int idx = originName.lastIndexOf(".");
		String ext = originName.substring(idx); //.txt
		
		String result= "S" + spaceNum + "license" + ext;
		logger.info("변경된 파일명(license) : {}", result);
		
		return result;
	}
	
	//공간 대표사진
	public String getSpaceMainFileName(String originName, int spaceNum) {
		int idx = originName.lastIndexOf(".");
		String ext = originName.substring(idx); //.txt
		
		String result= "S" + spaceNum + "Main" + ext;
		logger.info("변경된 파일명(Main) : {}", result);
		
		return result;
	}
	
	//공간 사진
	public String getSpaceSubFileName(String originName, int spaceNum, int num) {
		int idx = originName.lastIndexOf(".");
		String ext = originName.substring(idx); //.txt
		
		String result= "S" + spaceNum + "Sub" + (num + 1) + ext;
		logger.info("변경된 파일명(Sub) : {}", result);
		
		return result;
	}
}







