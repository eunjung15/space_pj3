package com.sc.spaceCollection.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sc.spaceCollection.common.ExcelVO;
import com.sc.spaceCollection.space.model.SpaceService;
import com.sc.spaceCollection.userInfo.model.UserInfoService;
import com.sc.spaceCollection.userInfo.model.UserInfoVO;

import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminExcelController {
	private static final Logger logger = LoggerFactory.getLogger(AdminExcelController.class);
	
	private final UserInfoService userInfoService;
	private final SpaceService spaceService;
	
	@RequestMapping("/member/memberExcelDownload")
	public void memberExcelDownload(@ModelAttribute ExcelVO excelVo, HttpServletResponse response) throws IOException {
		logger.info("멤버 리스트 다운로드, 파라미터 excelVo = {}", excelVo);
		
		XSSFWorkbook wb=null;
		Sheet sheet=null;
		Row row=null;
		Cell cell=null; 
		wb = new XSSFWorkbook();
		sheet = wb.createSheet("freeBoard");
		
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, excelVo.getHeaderListIndex().size()-1));	// 가로병합
		
		XSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);

		XSSFCellStyle cellStyle2 = wb.createCellStyle();
		cellStyle2.setAlignment(HorizontalAlignment.CENTER);
		cellStyle2.setVerticalAlignment(VerticalAlignment.CENTER);
		cellStyle2.setBorderTop(XSSFCellStyle.BORDER_THIN);
		cellStyle2.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		cellStyle2.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		cellStyle2.setBorderRight(XSSFCellStyle.BORDER_THIN);
		
		XSSFCellStyle cellStyle3 = wb.createCellStyle();
		cellStyle3.setBorderTop(XSSFCellStyle.BORDER_THIN);
		cellStyle3.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		cellStyle3.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		cellStyle3.setBorderRight(XSSFCellStyle.BORDER_THIN);
		
		//행 넓이 설정
		
		
		//제목 및 파일 이름 설정을 위한 날짜 받기
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		
		
		//제목 설정
		String excelTitle = "회원리스트 (" + sdf.format(date) + " 기준)";
		row = sheet.createRow(0);
		cell = row.createCell(0);
		cell.setCellValue(excelTitle);
		cell.setCellStyle(cellStyle);
		
		
		String[] headerKor = {"회원번호","이름","아이디","연락처","이메일","가입상태","가입일","탈퇴일","우편번호","주소","상세주소","마케팅 동의(이메일)","마케팅 동의(SMS)"};
		String[] headerEng = {"userNum","userName","userId","userHp","userEmail","userOutType","userRegDate","userOutDate","zipcode","addressDetail","userMarketingEmailOk","userMarketingSmsOk"};
		int[] columnSize = {3300, 2850, 6000, 3600, 6000, 2160, 6000, 6000, 2160, 7890, 7890, 4200, 4200};
		row = sheet.createRow(1);
		int cellCount = 0;
		
		//헤더 설정
		for(int i=0; i<excelVo.getHeaderListIndex().size(); i++) {
			if(excelVo.getHeaderListIndex().get(i) != null) {
				logger.info(excelVo.getHeaderListIndex().get(i)+"");
				
				cell = row.createCell(cellCount);
				cell.setCellValue(headerKor[excelVo.getHeaderListIndex().get(i)]);
				cell.setCellStyle(cellStyle2);
				sheet.setColumnWidth(cellCount, columnSize[i]);
				
				cellCount++;
			}
		}
		
		List<UserInfoVO> userInfoList = userInfoService.selectUserInfoForExcel();
		
		//열 설정
		for(int i=0; i<userInfoList.size(); i++) {
			row = sheet.createRow(i+2);
			UserInfoVO vo = userInfoList.get(i);
			
			List<String> voList = new ArrayList<>();
			voList.add(vo.getUserNum()+"");
			voList.add(vo.getUserName());
			voList.add(vo.getUserId());
			voList.add(vo.getUserHp());
			voList.add(vo.getUserEmail());
//			voList.add(vo.getUserOutType());
			if(vo.getUserOutType()!=null) {
				if(vo.getUserOutType().equalsIgnoreCase("Y")) {
					voList.add("탈퇴");
				}
			}else {
				voList.add("정상");
			}
			
			if(vo.getUserRegDate()==null) {
				voList.add("");
			}else {
				voList.add((vo.getUserRegDate()+"").substring(0, 16));
			}
			
			if(vo.getUserOutDate()==null) {
				voList.add("");
			}else {
				voList.add((vo.getUserOutDate()+"").substring(0, 16));
			}
			
			voList.add(vo.getZipcode());
			voList.add(vo.getAddress());
			voList.add(vo.getAddressDetail());
			voList.add(vo.getUserMarketingEmailOk());
			voList.add(vo.getUserMarketingSmsOk());
			
			cellCount = 0;
			for(int j=0; j<excelVo.getHeaderListIndex().size(); j++) {
				
				if(excelVo.getHeaderListIndex().get(j) != null) {
					cell = row.createCell(cellCount);
					cell.setCellValue(voList.get(excelVo.getHeaderListIndex().get(j)));
					cell.setCellStyle(cellStyle);
					cellCount++;
				}
			}
		}
		
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy_MM_dd");
		String fileName = "회원리스트" + sdf2.format(date) + ".xlsx";
		String outputFileName = new String(fileName.getBytes("KSC5601"), "8859_1");
		
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=\"" + outputFileName + "\"");  //파일이름지정.
		
		wb.write(response.getOutputStream());
	}
	
	@RequestMapping("/space/spaceExcelDownload")
	public void spaceExcelDownload(@ModelAttribute ExcelVO excelVo, HttpServletResponse response) throws IOException {
		logger.info("장소 리스트 다운로드, 파라미터 excelVo = {}", excelVo);
		
		XSSFWorkbook wb=null;
		Sheet sheet=null;
		Row row=null;
		Cell cell=null; 
		wb = new XSSFWorkbook();
		sheet = wb.createSheet("freeBoard");
		
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, excelVo.getHeaderListIndex().size()-1));	// 가로병합
		
		XSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);

		XSSFCellStyle cellStyle2 = wb.createCellStyle();
		cellStyle2.setAlignment(HorizontalAlignment.CENTER);
		cellStyle2.setVerticalAlignment(VerticalAlignment.CENTER);
		cellStyle2.setBorderTop(XSSFCellStyle.BORDER_THIN);
		cellStyle2.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		cellStyle2.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		cellStyle2.setBorderRight(XSSFCellStyle.BORDER_THIN);
		
		XSSFCellStyle cellStyle3 = wb.createCellStyle();
		cellStyle3.setBorderTop(XSSFCellStyle.BORDER_THIN);
		cellStyle3.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		cellStyle3.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		cellStyle3.setBorderRight(XSSFCellStyle.BORDER_THIN);
		
		//행 넓이 설정
		
		
		//제목 및 파일 이름 설정을 위한 날짜 받기
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		
		
		//제목 설정
		String excelTitle = "공간 리스트 (" + sdf.format(date) + " 기준)";
		row = sheet.createRow(0);
		cell = row.createCell(0);
		cell.setCellValue(excelTitle);
		cell.setCellStyle(cellStyle);
		
		
		String[] headerKor = {"공간번호","공간명","사업자번호","공간주소","아이디","이메일","연락처","공간태그","상태","삭제여부","승인일","승인요청일","상세타입","공간타입명","사용인원","가격정보","운영시간","시설"};
		String[] headerEng = {"spaceNum","spaceName","spaceBusinessNum","spaceAddress","userId","userEmail","spacePhoneNum","spaceTag","spaceRequestStatus","delFlag","spaceRegDate","spaceRequestDate","sdType","spaceTypeName","sdpeople","sdPrice","sdTime","facility"};
		row = sheet.createRow(1);
		int cellCount = 0;
		
		//헤더 설정
		for(int i=0; i<excelVo.getHeaderListIndex().size(); i++) {
			if(excelVo.getHeaderListIndex().get(i) != null) {
				logger.info(excelVo.getHeaderListIndex().get(i)+"");
				
				cell = row.createCell(cellCount);
				cell.setCellValue(headerKor[excelVo.getHeaderListIndex().get(i)]);
				cell.setCellStyle(cellStyle2);
				cellCount++;
			}
		}
		logger.info("헤더 설정 끝");
		List<Map<String, Object>> spaceConfirmList = spaceService.selectSpaceForExcel();
		logger.info("list.size = {}", spaceConfirmList.size());
		
		//열 설정
		for(int i=0; i<spaceConfirmList.size(); i++) {
			row = sheet.createRow(i+2);
			Map<String, Object> map = spaceConfirmList.get(i);
			
			List<String> voList = new ArrayList<>();
			voList.add(map.get("SPACE_NUM")+"");
			voList.add(map.get("SPACE_NAME")+"");
			voList.add(map.get("SPACE_BUSINESS_NUM")+"");
			voList.add(map.get("SPACE_ADDRESS")+"");
			voList.add(map.get("USER_ID")+"");
			voList.add(map.get("USER_EMAIL")+"");
			voList.add(map.get("SPACE_PHONE_NUM")+"");
			voList.add(map.get("SPACE_TAG")+"");
			voList.add(map.get("SPACE_REQUEST_STATUS")+"");
			voList.add(map.get("DEL_FLAG")+"");
			voList.add(map.get("SPACE_REG_DATE")+"");
			voList.add(map.get("SPACE_REQUEST_DATE")+"");
			voList.add(map.get("SD_TYPE")+"");
			voList.add(map.get("SPACE_TYPE_NAME")+"");
			voList.add(map.get("SD_PEOPLE")+"");
			voList.add(map.get("SD_PRICE")+"");
			voList.add(map.get("SD_TIME")+"");
			voList.add(map.get("FACILITY")+"");

			cellCount = 0;
			
			for(int j=0; j<excelVo.getHeaderListIndex().size(); j++) {
				
				if(excelVo.getHeaderListIndex().get(j) != null) {
					cell = row.createCell(cellCount);
					cell.setCellValue(voList.get(excelVo.getHeaderListIndex().get(j)));
					cell.setCellStyle(cellStyle);
					sheet.autoSizeColumn(i);
					sheet.setColumnWidth(i, (sheet.getColumnWidth(i))+(short)1024 );
					
					cellCount++;
				}
			}
		}
		
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy_MM_dd");
		String fileName = "공간 리스트" + sdf2.format(date) + ".xlsx";
		String outputFileName = new String(fileName.getBytes("KSC5601"), "8859_1");
		
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=\"" + outputFileName + "\"");  //파일이름지정.
		
		wb.write(response.getOutputStream());
	}
}
